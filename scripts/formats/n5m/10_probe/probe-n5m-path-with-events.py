"""
probe-n5m-path-with-events.py

Parse the post-group section of N5M blocks, now correctly including
events and objects PER path layer (not just nodes).

Corrected per-path-layer structure (from CMap_J::LoadMap disasm):
    u16  node_count
    node_count * (u8 dir, i16 x, i16 y, u16 angle_raw)  -- 7 bytes each
    u16  event_count
    event_count *:
        u8  raw_type
        6 * i16  rect[0..5]   -> EventRect+0xd4..0xde
        i16  field_0x20
        i16  field_0x22
        i16  field_0xea
        i16  field_0xec
        u8  text_len
        if text_len > 0: text_len bytes (EUC-KR text)
    u16  obj_count
    obj_count *:
        7 * u8   (f0..f6)
        i16  init_x    -> CObject+0xd4
        i16  init_y    -> CObject+0xd6
        i16  field_d8  -> CObject+0xd8
        i16  field_da  -> CObject+0xda
        i16  spawn_x
        i16  spawn_y
        u8  text_len
        if text_len > 0: text_len bytes

Usage:
    python probe-n5m-path-with-events.py <stage_N_m.n5m> [block_index]
    python probe-n5m-path-with-events.py stage_17_m.n5m        # block 0
    python probe-n5m-path-with-events.py stage_17_m.n5m 2      # block 2
    python probe-n5m-path-with-events.py stage_17_m.n5m all    # all blocks
"""

from __future__ import annotations

import importlib.util
import pathlib
import struct
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

PROBE_PATH = pathlib.Path(__file__).with_name("probe-n5m-layer-groups.py")
PROBE_SPEC = importlib.util.spec_from_file_location("probe_n5m_layer_groups", PROBE_PATH)
if PROBE_SPEC is None or PROBE_SPEC.loader is None:
    raise RuntimeError(f"failed to load helper module from {PROBE_PATH}")
PROBE = importlib.util.module_from_spec(PROBE_SPEC)
PROBE_SPEC.loader.exec_module(PROBE)  # type: ignore[attr-defined]

parse_block_layer_groups = PROBE.parse_block_layer_groups
sibling_n5s_for = PROBE.sibling_n5s_for

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def i16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<h", data, off)[0]


class ParseError(Exception):
    pass


def parse_events(data: bytes, pos: int, end: int, event_count: int) -> tuple[list[dict], int]:
    """Parse event_count event records. Returns (events, new_pos)."""
    events = []
    for ei in range(event_count):
        if pos >= end:
            raise ParseError(f"event[{ei}]: overrun at {pos:#06x} (end={end:#06x})")
        raw_type = data[pos]; pos += 1
        type_idx = (raw_type - 0x5f) & 0xFF
        if pos + 12 > end:
            raise ParseError(f"event[{ei}]: rect overrun at {pos:#06x}")
        rect = [i16le(data, pos + k * 2) for k in range(6)]
        pos += 12
        if pos + 8 > end:
            raise ParseError(f"event[{ei}]: extra fields overrun at {pos:#06x}")
        f20 = i16le(data, pos); pos += 2
        f22 = i16le(data, pos); pos += 2
        fea = i16le(data, pos); pos += 2
        fec = i16le(data, pos); pos += 2
        if pos >= end:
            raise ParseError(f"event[{ei}]: text_len overrun at {pos:#06x}")
        text_len = data[pos]; pos += 1
        text = b""
        if text_len > 0:
            if pos + text_len > end:
                raise ParseError(f"event[{ei}]: text overrun at {pos:#06x} len={text_len}")
            text = data[pos:pos + text_len]
            pos += text_len
        events.append({
            "raw_type": raw_type,
            "type_idx": type_idx,
            "rect": rect,
            "f20": f20, "f22": f22, "fea": fea, "fec": fec,
            "text_len": text_len,
            "text": text,
        })
    return events, pos


def parse_objects(data: bytes, pos: int, end: int, obj_count: int) -> tuple[list[dict], int]:
    """Parse obj_count object records. Returns (objects, new_pos)."""
    objects = []
    for oi in range(obj_count):
        if pos + 7 > end:
            raise ParseError(f"obj[{oi}]: u8 fields overrun at {pos:#06x}")
        f0, f1, f2, f3, f4, f5, f6 = data[pos:pos + 7]
        pos += 7
        if pos + 12 > end:
            raise ParseError(f"obj[{oi}]: i16 fields overrun at {pos:#06x}")
        init_x = i16le(data, pos); pos += 2
        init_y = i16le(data, pos); pos += 2
        d8 = i16le(data, pos); pos += 2
        da = i16le(data, pos); pos += 2
        spawn_x = i16le(data, pos); pos += 2
        spawn_y = i16le(data, pos); pos += 2
        if pos >= end:
            raise ParseError(f"obj[{oi}]: text_len overrun at {pos:#06x}")
        text_len = data[pos]; pos += 1
        text = b""
        if text_len > 0:
            if pos + text_len > end:
                raise ParseError(f"obj[{oi}]: text overrun at {pos:#06x} len={text_len}")
            text = data[pos:pos + text_len]
            pos += text_len
        objects.append({
            "f0": f0, "f1": f1, "f2": f2, "f3": f3, "f4": f4, "f5": f5, "f6": f6,
            "init_x": init_x, "init_y": init_y,
            "d8": d8, "da": da,
            "spawn_x": spawn_x, "spawn_y": spawn_y,
            "text_len": text_len, "text": text,
        })
    return objects, pos


def parse_path_layer(data: bytes, pos: int, end: int, pi: int) -> tuple[dict, int]:
    """Parse one path layer: nodes + events + objects."""
    if pos + 2 > end:
        raise ParseError(f"path[{pi}]: nc overrun at {pos:#06x}")
    nc = u16le(data, pos); pos += 2
    if pos + nc * 7 > end:
        raise ParseError(f"path[{pi}]: nodes overrun: nc={nc} at {pos:#06x}")
    nodes = []
    for ni in range(nc):
        d = data[pos]
        x = i16le(data, pos + 1)
        y = i16le(data, pos + 3)
        a = u16le(data, pos + 5) % 360
        nodes.append({"dir": d, "x": x, "y": y, "angle": a})
        pos += 7
    if pos + 2 > end:
        raise ParseError(f"path[{pi}]: event_count overrun at {pos:#06x}")
    event_count = u16le(data, pos); pos += 2
    events, pos = parse_events(data, pos, end, event_count)
    if pos + 2 > end:
        raise ParseError(f"path[{pi}]: obj_count overrun at {pos:#06x}")
    obj_count = u16le(data, pos); pos += 2
    objects, pos = parse_objects(data, pos, end, obj_count)
    return {
        "nc": nc, "nodes": nodes,
        "event_count": event_count, "events": events,
        "obj_count": obj_count, "objects": objects,
    }, pos


def parse_post_group_section(data: bytes, pos: int, end: int, verbose: bool = True) -> tuple[dict, int]:
    """Parse the full post-group section: land layers with patterns and path layers."""
    if pos >= end:
        raise ParseError(f"post-group section empty at {pos:#06x}")
    land_count = data[pos]; pos += 1
    layers = []
    for li in range(land_count):
        if pos >= end:
            raise ParseError(f"land[{li}]: overrun at {pos:#06x}")
        # Pattern group A
        ca = data[pos]; pos += 1
        patt_a = []
        for pi in range(ca):
            if pos + 6 > end:
                raise ParseError(f"land[{li}] patt_a[{pi}]: overrun")
            patt_a.append({
                "pzx": data[pos], "frame": data[pos+1],
                "x": i16le(data, pos+2), "y": i16le(data, pos+4),
            })
            pos += 6
        # Pattern group B
        cb = data[pos]; pos += 1
        patt_b = []
        for pi in range(cb):
            if pos + 6 > end:
                raise ParseError(f"land[{li}] patt_b[{pi}]: overrun")
            patt_b.append({
                "pzx": data[pos], "frame": data[pos+1],
                "x": i16le(data, pos+2), "y": i16le(data, pos+4),
            })
            pos += 6
        # Path layers
        path_count = data[pos]; pos += 1
        paths = []
        for pi in range(path_count):
            path, pos = parse_path_layer(data, pos, end, pi)
            paths.append(path)
        layers.append({
            "ca": ca, "patt_a": patt_a,
            "cb": cb, "patt_b": patt_b,
            "path_count": path_count, "paths": paths,
        })
    return {"land_count": land_count, "layers": layers}, pos


def resolve_path(arg: str) -> pathlib.Path:
    p = pathlib.Path(arg)
    if p.exists():
        return p
    c = MAP_DIR / arg
    if c.exists():
        return c
    raise SystemExit(f"file not found: {arg}")


def print_block_result(n5m_name: str, blk_idx: int, start: int, end: int,
                       section: dict, pos: int, verbose: bool = True) -> bool:
    remaining = end - pos
    ok = remaining == 0
    status = "OK" if ok else f"FAIL remaining={remaining}"
    print(f"  blk {blk_idx}: start={start:#06x} end={end:#06x} [{status}]")
    if verbose:
        lc = section["land_count"]
        for li, layer in enumerate(section["layers"]):
            paths = layer["paths"]
            path_summary = " ".join(
                f"p{pi}(nc={p['nc']},ev={p['event_count']},obj={p['obj_count']})"
                for pi, p in enumerate(paths)
            )
            print(f"    land[{li}] ca={layer['ca']} cb={layer['cb']} "
                  f"path_count={layer['path_count']}  {path_summary}")
    return ok


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(
            "usage: probe-n5m-path-with-events.py <file.n5m> [block_index|all]"
        )
    n5m_path = resolve_path(sys.argv[1])
    block_arg = sys.argv[2] if len(sys.argv) > 2 else "0"

    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]

    if block_arg == "all":
        block_indices = range(len(tail))
        verbose = False
    else:
        block_indices = [int(block_arg)]
        verbose = True

    print(f"=== {n5m_path.name} ({len(tail)} blocks) ===")
    ok_count = 0
    fail_count = 0
    for blk_idx in block_indices:
        start = tail[blk_idx]
        end = tail[blk_idx + 1] if blk_idx + 1 < len(tail) else len(data)
        info = parse_block_layer_groups(data, start, end)
        pos = info["post_groups_start"]
        try:
            section, pos = parse_post_group_section(data, pos, end, verbose=verbose)
            ok = print_block_result(n5m_path.name, blk_idx, start, end, section, pos, verbose)
            if ok:
                ok_count += 1
            else:
                fail_count += 1
                if verbose:
                    # Show next 16 bytes for diagnosis
                    print(f"    next16@{pos:#06x}: {data[pos:pos+16].hex(' ')}")
        except ParseError as e:
            fail_count += 1
            print(f"  blk {blk_idx}: PARSE ERROR: {e}")

    total = ok_count + fail_count
    print(f"\nResult: {ok_count}/{total} blocks parsed to EOF")


if __name__ == "__main__":
    main()

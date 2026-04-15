"""
probe-n5m-layer-groups.py

Alternative early-body model for N5M repeated blocks:

- u16 header_a
- u16 header_b
- u8 flags[7]
- u8 layer_group_count
- for each group:
  - u8 element_count
  - element_count * (u8 a, u8 b, int16 x, int16 y)

This tests whether the previously assumed counted-pair groups are actually the
first portion of `LoadMap` layer records.
"""

from __future__ import annotations

import pathlib
import struct
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def u8(data: bytes, off: int) -> int:
    return data[off]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def i16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<h", data, off)[0]


def sibling_n5s_for(n5m_path: pathlib.Path) -> pathlib.Path | None:
    stem = n5m_path.stem
    if not stem.endswith("_m"):
        return None
    n5s_name = stem[:-2] + ".n5s"
    path = n5m_path.with_name(n5s_name)
    return path if path.exists() else None


def parse_block_layer_groups(data: bytes, start: int, block_end: int) -> dict:
    pos = start
    header_a = u16le(data, pos)
    pos += 2
    header_b = u16le(data, pos)
    pos += 2
    flags = [u8(data, pos + i) for i in range(7)]
    pos += 7
    layer_group_count = u8(data, pos)
    pos += 1

    groups = []
    truncated = False
    for _ in range(layer_group_count):
        if pos >= block_end:
            truncated = True
            break
        element_count = u8(data, pos)
        pos += 1
        elements = []
        need = element_count * 6
        if pos + need > block_end:
            truncated = True
            break
        for _ in range(element_count):
            a = u8(data, pos)
            b = u8(data, pos + 1)
            x = i16le(data, pos + 2)
            y = i16le(data, pos + 4)
            elements.append({"a": a, "b": b, "x": x, "y": y})
            pos += 6
        groups.append({"element_count": element_count, "elements": elements})

    return {
        "header_a": header_a,
        "header_b": header_b,
        "flags": flags,
        "layer_group_count": layer_group_count,
        "groups": groups,
        "post_groups_start": pos,
        "prefix_size": pos - start,
        "truncated": truncated,
    }


def inspect_one(n5m_path: pathlib.Path) -> None:
    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")
    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    print(f"=== {n5m_path.name} ===")
    for i, (start, end) in enumerate(zip(tail, ends)):
        info = parse_block_layer_groups(data, start, end)
        print(
            f"[{i}] start={start:#06x} end={end:#06x} "
            f"a={info['header_a']:#06x} b={info['header_b']:#06x} "
            f"flags={info['flags']} groups={info['layer_group_count']} "
            f"prefix_size={info['prefix_size']:#04x} post={info['post_groups_start']:#06x}"
        )
        if info["truncated"]:
            print("    WARNING: truncated")
        for gi, group in enumerate(info["groups"]):
            print(f"    g{gi}: count={group['element_count']} elems={group['elements']}")
        preview = data[info["post_groups_start"]:info["post_groups_start"] + 16].hex(" ")
        print(f"    post_preview={preview}")


def summarize_all() -> None:
    print(f"{'file':<16} {'lgc':<8} {'prefix_sizes':<14} {'trunc':>6}")
    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        ends = tail[1:] + [len(data)]
        infos = [parse_block_layer_groups(data, start, end) for start, end in zip(tail, ends)]
        lgc = sorted({info["layer_group_count"] for info in infos})
        prefix_sizes = sorted({info["prefix_size"] for info in infos})
        trunc = any(info["truncated"] for info in infos)
        print(f"{n5m_path.name:<16} {str(lgc):<8} {str(prefix_sizes):<14} {str(trunc):>6}")


def main() -> None:
    if len(sys.argv) > 1:
        inspect_one(pathlib.Path(sys.argv[1]))
        return
    summarize_all()


if __name__ == "__main__":
    main()

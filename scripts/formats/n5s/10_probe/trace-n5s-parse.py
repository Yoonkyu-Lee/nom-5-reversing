"""
trace-n5s-parse.py
Trace an N5S binary section using the current best-effort structural guess.

This is intentionally a probe, not an exact parser. When assumptions break,
the script reports the last successful reads instead of crashing.
"""

from __future__ import annotations

import pathlib
import struct
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._common import find_binary_start

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")


class TraceReader:
    def __init__(self, data: bytes, pos: int):
        self.data = data
        self.pos = pos
        self.reads: list[tuple[int, str, int]] = []

    def u8(self, label: str = "") -> int:
        if self.pos >= len(self.data):
            raise EOFError(f"need u8 for {label} at {self.pos:#06x}, size={len(self.data):#06x}")
        v = self.data[self.pos]
        self.reads.append((self.pos, f"u8 {label}", v))
        self.pos += 1
        return v

    def u16(self, label: str = "") -> int:
        if self.pos + 2 > len(self.data):
            raise EOFError(f"need u16 for {label} at {self.pos:#06x}, size={len(self.data):#06x}")
        v = struct.unpack_from("<H", self.data, self.pos)[0]
        self.reads.append((self.pos, f"u16 {label}", v))
        self.pos += 2
        return v

    def s16(self, label: str = "") -> int:
        if self.pos + 2 > len(self.data):
            raise EOFError(f"need s16 for {label} at {self.pos:#06x}, size={len(self.data):#06x}")
        v = struct.unpack_from("<h", self.data, self.pos)[0]
        self.reads.append((self.pos, f"s16 {label}", v))
        self.pos += 2
        return v

    def string(self, n: int, label: str = "") -> bytes:
        if self.pos + n > len(self.data):
            raise EOFError(f"need str[{n}] for {label} at {self.pos:#06x}, size={len(self.data):#06x}")
        v = self.data[self.pos:self.pos + n]
        self.reads.append((self.pos, f"str[{n}] {label}", 0))
        self.pos += n
        return v

    def remaining(self) -> int:
        return len(self.data) - self.pos

    def dump_last(self, n: int = 8) -> None:
        for off, lbl, val in self.reads[-n:]:
            print(f"    @{off:#06x}: {lbl} = {val} ({val:#04x})")


def probe_flag_count(data: bytes, body_start: int, flag_count: int) -> tuple[bool, str]:
    r = TraceReader(data, body_start)
    tile_w = r.u16("tile_w")
    tile_h = r.u16("tile_h")

    if not (50 <= tile_w <= 500 and 50 <= tile_h <= 500):
        return False, f"Bad tile dims: {tile_w}x{tile_h}"

    _flags = [r.u8(f"flag[{i}]") for i in range(flag_count)]
    outer = r.u8("back_group_count")
    next_count = r.u8("next_count")

    msg = (
        f"flags={flag_count} -> tile={tile_w}x{tile_h} "
        f"back_group={outer} next_count={next_count}"
    )

    if outer == 0 and next_count == 0 and r.remaining() > 10:
        return False, msg + " (both zero but substantial data remains)"
    return True, msg


def parse_full(path: pathlib.Path, body_start: int, flag_count: int, verbose: bool = True) -> bool:
    data = path.read_bytes()
    r = TraceReader(data, body_start)

    try:
        tile_w = r.u16("tile_w")
        tile_h = r.u16("tile_h")
        flags = [r.u8(f"flag[{i}]") for i in range(flag_count)]

        if verbose:
            print(f"  tile_w={tile_w} tile_h={tile_h} flags={[hex(f) for f in flags]}")

        back_group_count = r.u8("back_group_count")
        if verbose:
            print(f"  back_group_count={back_group_count}")

        for gi in range(back_group_count):
            back_item_count = r.u8(f"  back_item_count[{gi}]")
            for bi in range(back_item_count):
                r.u8(f"    bl[{gi}][{bi}].pzx_id")
                r.u8(f"    bl[{gi}][{bi}].frame_id")
                r.s16(f"    bl[{gi}][{bi}].offset_x")
                r.s16(f"    bl[{gi}][{bi}].offset_y")

        # The next u8 after back groups is not fully named yet.
        # In many runs it behaves like a section count for the next outer layer.
        next_section_count = r.u8("next_section_count")
        if verbose:
            print(f"  next_section_count={next_section_count}")

        if next_section_count == 0 and r.remaining() > 5:
            if verbose:
                print(f"  !! next_section_count=0 but {r.remaining()} bytes remain")
            return False

        for li in range(next_section_count):
            if verbose:
                print(f"  -- section[{li}] @{r.pos:#06x}")

            pat1_count = r.u8(f"  sec[{li}].pat1_count")
            for pi in range(pat1_count):
                r.u8(f"    pat1[{pi}].pzx_id")
                r.u8(f"    pat1[{pi}].frame_id")
                r.s16(f"    pat1[{pi}].x")
                r.s16(f"    pat1[{pi}].y")

            pat2_count = r.u8(f"  sec[{li}].pat2_count")
            for pi in range(pat2_count):
                r.u8(f"    pat2[{pi}].pzx_id")
                r.u8(f"    pat2[{pi}].frame_id")
                r.s16(f"    pat2[{pi}].x")
                r.s16(f"    pat2[{pi}].y")

            path_layer_count = r.u8(f"  sec[{li}].path_layer_count")
            if verbose:
                print(f"    path_layer_count={path_layer_count}")

            for pli in range(path_layer_count):
                if verbose:
                    print(f"    -- path_layer[{pli}] @{r.pos:#06x}")
                node_count = r.u16(f"      pl[{pli}].node_count")
                for ni in range(node_count):
                    r.u8(f"        node[{ni}].type")
                    r.s16(f"        node[{ni}].x")
                    r.s16(f"        node[{ni}].y")
                    r.u16(f"        node[{ni}].angle_raw")

                event_count = r.u16(f"      pl[{pli}].event_count")
                if verbose:
                    print(f"      event_count={event_count} @{r.pos:#06x}")
                for ei in range(event_count):
                    r.u8(f"        ev[{ei}].raw_type")
                    for k in range(6):
                        r.s16(f"        ev[{ei}].rect[{k}]")
                    r.s16(f"        ev[{ei}].+0x20")
                    r.s16(f"        ev[{ei}].+0x22")
                    r.s16(f"        ev[{ei}].+0xea")
                    r.s16(f"        ev[{ei}].+0xec")
                    text_len = r.u8(f"        ev[{ei}].text_len")
                    if text_len > 0:
                        r.string(text_len, f"        ev[{ei}].text")

                obj_count = r.u16(f"      pl[{pli}].obj_count")
                if verbose:
                    print(f"      obj_count={obj_count} @{r.pos:#06x}")
                for oi in range(obj_count):
                    for k in range(7):
                        r.u8(f"        obj[{oi}].u8[{k}]")
                    for label in ("ix", "iy", "d8", "da", "x", "y"):
                        r.s16(f"        obj[{oi}].{label}")
                    text_len = r.u8(f"        obj[{oi}].text_len")
                    if text_len > 0:
                        r.string(text_len, f"        obj[{oi}].text")

        remaining = r.remaining()
        if verbose:
            print(f"  Parse done. @{r.pos:#06x} remaining={remaining} / total_binary={len(data) - body_start}")
        return remaining == 0
    except EOFError as exc:
        if verbose:
            print(f"  !! EOF while tracing: {exc}")
            r.dump_last(8)
        return False


def main() -> None:
    if len(sys.argv) > 1:
        path = pathlib.Path(sys.argv[1])
    else:
        path = ASSETS / "map" / "stage_0.n5s"

    data = path.read_bytes()
    body_start, score = find_binary_start(data)

    print(f"\n{path.name} ({len(data)} bytes, binary section ~= {len(data) - body_start} bytes)")
    print(f"Estimated body start: {body_start} (score={score:.1f})")
    print("\nProbing flag counts:")
    for fc in range(5, 13):
        ok, msg = probe_flag_count(data, body_start, fc)
        marker = " OK" if ok else ""
        print(f"  flags={fc}: {msg}{marker}")

    print("\n--- Full parse with flag_count=7 ---")
    parse_full(path, body_start, 7, verbose=True)

    print("\n--- Full parse with flag_count=9 ---")
    parse_full(path, body_start, 9, verbose=True)


if __name__ == "__main__":
    main()

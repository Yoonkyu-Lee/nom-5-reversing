"""
parse-n5s.py
Parse NOM5 .n5s stage definition files.

Current understanding:
- There is a string-heavy front matter near the start of the file.
- Runtime does not use a hardcoded skip(96). CMap_J::LoadMap calls
  CMapMgr::GetMapOffset(stage_id), then skips that returned value.
- Offline parsing therefore uses a heuristic binary-start estimate.

Binary section structure (from CMap_J::LoadMap read sequence + field stores):
  readUint16()  -> CMap+0x6e  (tile_w)
  readUint16()  -> CMap+0x70  (tile_h)
  readUint8()   -> CMap+0x66  (flag 0)
  ... x7 direct flag stores confirmed to CMap+0x66..0x6c
"""

from __future__ import annotations

import pathlib
import struct
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._common import find_binary_start, marker_at

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
MAP_DIR = ASSETS / "map"
OUT_DIR = pathlib.Path("out/n5s-analysis")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def u16le(data: bytes, pos: int) -> int:
    return struct.unpack_from("<H", data, pos)[0]


def hexrow(data: bytes, start: int, length: int = 16) -> str:
    chunk = data[start:start + length]
    hex_part = " ".join(f"{b:02x}" for b in chunk)
    asc_part = "".join(chr(b) if 0x20 <= b < 0x7F else "." for b in chunk)
    return f"{start:#06x}: {hex_part:<{length * 3}}  {asc_part}"


class BinReader:
    def __init__(self, data: bytes, pos: int = 0):
        self.data = data
        self.pos = pos

    def u8(self) -> int:
        v = self.data[self.pos]
        self.pos += 1
        return v

    def u16(self) -> int:
        v = struct.unpack_from("<H", self.data, self.pos)[0]
        self.pos += 2
        return v

    def remaining(self) -> int:
        return len(self.data) - self.pos


def parse_header(data: bytes) -> dict:
    """Parse the front matter preceding the binary section."""
    marker = marker_at(data)
    str_group_count = data[11] if len(data) > 11 else 0
    bin_start, _ = find_binary_start(data)

    strings: list[str] = []
    pos = 12
    while pos < bin_start:
        while pos < bin_start and data[pos] in (0x00, 0xCD):
            pos += 1
        if pos >= bin_start:
            break
        end = pos
        while end < bin_start and data[end] not in (0x00, 0xCD):
            end += 1
        if end > pos:
            try:
                s = data[pos:end].decode("ascii")
                if len(s) >= 2:
                    strings.append(s)
            except UnicodeDecodeError:
                pass
        pos = end + 1

    return {
        "meta": data[:9].hex(" "),
        "marker": marker,
        "str_group_count": str_group_count,
        "binary_start_guess": bin_start,
        "strings": strings,
    }


def parse_binary_section(data: bytes, path: pathlib.Path) -> dict:
    """Parse the binary map data section starting at the estimated body offset."""
    bin_start, score = find_binary_start(data)
    r = BinReader(data, bin_start)
    result: dict = {"path": str(path), "size": len(data)}

    result["tile_w"] = r.u16()
    result["tile_h"] = r.u16()
    result["flags7"] = [r.u8() for _ in range(7)]
    result["marker"] = marker_at(data)
    result["binary_offset"] = bin_start
    result["binary_offset_score"] = score
    result["bin_remaining"] = r.remaining()

    result["hexdump"] = []
    for off in range(0, min(128, len(data) - bin_start), 16):
        result["hexdump"].append(hexrow(data, bin_start + off, 16))
    return result


def analyze_all() -> None:
    n5s_files = sorted(MAP_DIR.glob("*.n5s"))
    print(f"Analyzing {len(n5s_files)} N5S files")
    print()

    summary_lines = []

    for path in n5s_files:
        data = path.read_bytes()
        hdr = parse_header(data)
        bin_info = parse_binary_section(data, path)

        print(f"=== {path.name} ({len(data)} bytes) ===")
        print(
            f"  Marker: {hdr['marker']:#06x}  str_groups: {hdr['str_group_count']}  "
            f"body_start~{hdr['binary_start_guess']}"
        )
        print(f"  Strings: {hdr['strings']}")
        print(
            f"  Binary: start={bin_info['binary_offset']} score={bin_info['binary_offset_score']:.1f} "
            f"tile_w={bin_info['tile_w']} tile_h={bin_info['tile_h']} "
            f"flags7={[hex(f) for f in bin_info['flags7']]}"
        )
        print("  Binary hexdump (first 4 rows):")
        for row in bin_info["hexdump"][:4]:
            print(f"    {row}")
        print()

        summary_lines.append(
            f"{path.name:<25} {bin_info['tile_w']:>5} {bin_info['tile_h']:>5}  "
            f"start={bin_info['binary_offset']:>3} flags7={[hex(f) for f in bin_info['flags7'][:4]]} "
            f"strings={hdr['strings'][:3]}"
        )

    print("=" * 70)
    print("SUMMARY TABLE")
    print(f"{'file':<25} {'tile_w':>7} {'tile_h':>7}  body  flags7[:4]  strings[:3]")
    for line in summary_lines:
        print(f"  {line}")

    out = OUT_DIR / "n5s-parse-summary.txt"
    out.write_text("\n".join(summary_lines), encoding="utf-8")
    print(f"\nSaved to {out}")


def analyze_one(path: pathlib.Path) -> None:
    data = path.read_bytes()
    hdr = parse_header(data)
    bin_info = parse_binary_section(data, path)

    print(f"\n{'=' * 70}")
    print(f"FILE: {path.name} ({len(data)} bytes)")
    print(f"{'=' * 70}")

    print("\nHEADER / FRONT MATTER:")
    print(f"  Metadata bytes [0..8]: {hdr['meta']}")
    print(f"  Section marker [9..10]: {hdr['marker']:#06x}")
    print(f"  String group count [11]: {hdr['str_group_count']}")
    print(f"  Estimated binary start: {hdr['binary_start_guess']}")
    print(f"  Strings found: {hdr['strings']}")

    print("\nBINARY SECTION (estimated):")
    print(f"  start = {bin_info['binary_offset']}  score = {bin_info['binary_offset_score']:.1f}")
    print(f"  tile_w = {bin_info['tile_w']} ({bin_info['tile_w']:#06x})")
    print(f"  tile_h = {bin_info['tile_h']} ({bin_info['tile_h']:#06x})")
    print(f"  flags7[0..6] = {[hex(f) for f in bin_info['flags7']]}")
    print(f"  Remaining bytes: {bin_info['bin_remaining']}")

    print("\nBINARY HEXDUMP:")
    for row in bin_info["hexdump"]:
        print(f"  {row}")


def main() -> None:
    if len(sys.argv) > 1:
        analyze_one(pathlib.Path(sys.argv[1]))
        return
    analyze_all()


if __name__ == "__main__":
    main()

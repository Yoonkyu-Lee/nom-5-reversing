"""
inspect-n5m.py

Initial structural inspection for NOM5 `.n5m` files.

This script optionally loads the sibling `.n5s` front-matter and prints the
trailing u16 table as candidate offsets into `.n5m`.
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
OUT_DIR = pathlib.Path("out/n5m-analysis")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def u32le(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def hexdump_row(data: bytes, off: int, length: int = 16) -> str:
    chunk = data[off:off + length]
    return f"{off:#06x}: " + " ".join(f"{b:02x}" for b in chunk)


def sibling_n5s_for(n5m_path: pathlib.Path) -> pathlib.Path | None:
    stem = n5m_path.stem
    if not stem.endswith("_m"):
        return None
    n5s_name = stem[:-2] + ".n5s"
    path = n5m_path.with_name(n5s_name)
    return path if path.exists() else None


def inspect_one(path: pathlib.Path) -> None:
    data = path.read_bytes()
    sib = sibling_n5s_for(path)
    tail = []
    if sib is not None:
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]

    print(f"\n=== {path.name} ({len(data)} bytes) ===")
    print("header:")
    print(f"  u16[0] = {u16le(data, 0):#06x}")
    print(f"  u16[1] = {u16le(data, 2):#06x}")
    print(f"  u32[0] = {u32le(data, 0):#010x}")
    print(f"  u32[1] = {u32le(data, 4):#010x}")
    print(f"  first 64 bytes = {data[:64].hex(' ')}")

    print("\nfirst rows:")
    for off in range(0, min(128, len(data)), 16):
        print(f"  {hexdump_row(data, off)}")

    if tail:
        print("\nsibling N5S tail_u16 candidates:")
        for off in tail:
            if off >= len(data):
                print(f"  {off:#06x}: OOB")
                continue
            print(f"  {hexdump_row(data, off)}")


def inspect_all() -> None:
    rows: list[str] = []
    print(f"{'file':<18} {'size':>6} {'u16_0':>8} {'u16_1':>8} {'sib_tail':>8}")
    for path in sorted(MAP_DIR.glob("*.n5m")):
        data = path.read_bytes()
        sib = sibling_n5s_for(path)
        tail_count = 0
        if sib is not None:
            tail_count = len(parse_frontmatter(sib.read_bytes())["tail_u16"])
        row = (
            f"{path.name:<18} {len(data):>6} {u16le(data, 0):>8} "
            f"{u16le(data, 2):>8} {tail_count:>8}"
        )
        print(row)
        rows.append(row)
    (OUT_DIR / "n5m-summary.txt").write_text("\n".join(rows), encoding="utf-8")


def main() -> None:
    if len(sys.argv) > 1:
        inspect_one(pathlib.Path(sys.argv[1]))
        return
    inspect_all()


if __name__ == "__main__":
    main()

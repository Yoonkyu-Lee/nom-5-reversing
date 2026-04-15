"""
analyze-n5s-record-fields.py

Summarize the fixed 0x34 record table inside N5S front matter.
"""

from __future__ import annotations

import collections
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def summarize_counter(counter: collections.Counter, limit: int = 8) -> str:
    items = counter.most_common(limit)
    return ", ".join(f"{value:#x}:{count}" for value, count in items)


def main() -> None:
    all_u8 = [collections.Counter() for _ in range(16)]
    all_u16 = [collections.Counter() for _ in range(18)]
    files = sorted(MAP_DIR.glob("*.n5s"))

    total_records = 0
    for path in files:
        info = parse_frontmatter(path.read_bytes())
        for rec in info["records"]:
            total_records += 1
            for idx, value in enumerate(rec["u8"]):
                all_u8[idx][value] += 1
            for idx, value in enumerate(rec["u16"]):
                all_u16[idx][value] += 1

    print(f"files={len(files)} total_records={total_records}")
    print("\nU8 field distributions")
    for idx, counter in enumerate(all_u8):
        unique = len(counter)
        print(f"  u8[{idx:02d}] unique={unique:>3}  {summarize_counter(counter)}")

    print("\nU16 field distributions")
    for idx, counter in enumerate(all_u16):
        unique = len(counter)
        print(f"  u16[{idx:02d}] unique={unique:>3}  {summarize_counter(counter)}")


if __name__ == "__main__":
    main()

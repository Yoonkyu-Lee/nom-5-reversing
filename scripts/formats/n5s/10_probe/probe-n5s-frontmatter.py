"""
probe-n5s-frontmatter.py

Best-effort parser for the `CMapMgr_J::Init` front matter inside `.n5s`.

Current model from native disassembly:
- u8
- u16 * 5  (the 5th field is the normal/boss marker in observed samples)
- five counted string groups, each entry read via readString(buf, 10)
- one counted fixed-record table of 0x34-byte entries:
    - u8  * 16
    - u16 * 18
- one trailing counted u16 table

This script is intentionally structural. It does not yet assign strong
semantics to the record fields or the trailing u16 table.
"""

from __future__ import annotations

import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
MAP_DIR = ASSETS / "map"
OUT_DIR = pathlib.Path("out/n5s-analysis")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def fmt_group(groups: list[list[str]]) -> str:
    parts = []
    for idx, group in enumerate(groups):
        parts.append(f"G{idx}={group}")
    return " | ".join(parts)


def analyze_one(path: pathlib.Path) -> None:
    data = path.read_bytes()
    info = parse_frontmatter(data)

    print(f"\n=== {path.name} ({len(data)} bytes) ===")
    print(f"lead_u8        = {info['lead_u8']} ({info['lead_u8']:#04x})")
    print(
        "header_u16     = "
        + ", ".join(f"{v:#06x}" for v in info["header_u16"])
    )
    print(f"string_counts   = {info['string_counts']}")
    print(f"strings         = {fmt_group(info['string_groups'])}")
    print(
        f"record_count    = {info['record_count']} @ {info['record_count_off']:#06x}"
    )
    if info["records"]:
        first = info["records"][0]
        print(f"record[0].u8    = {[hex(v) for v in first['u8']]}")
        print(f"record[0].u16   = {[hex(v) for v in first['u16']]}")
    print(
        f"tail_count      = {info['tail_count']} @ {info['tail_count_off']:#06x}"
    )
    print(f"tail_u16        = {[hex(v) for v in info['tail_u16']]}")
    print(f"final_pos       = {info['final_pos']:#06x}")
    print(f"remaining       = {info['remaining']}")


def analyze_all() -> None:
    rows: list[str] = []
    print(
        f"{'file':<16} {'h0':>4} {'sumg':>4} {'mark':>6} {'gcounts':<15} "
        f"{'recs':>4} {'tail':>4} {'tail_max':>8} {'end':>6} {'rem':>4}"
    )
    for path in sorted(MAP_DIR.glob("*.n5s")):
        data = path.read_bytes()
        info = parse_frontmatter(data)
        marker = info["header_u16"][4]
        h0 = info["header_u16"][0]
        sumg = sum(info["string_counts"])
        tail_max = max(info["tail_u16"]) if info["tail_u16"] else -1
        row = (
            f"{path.name:<16} {h0:>4} {sumg:>4} {marker:#06x} "
            f"{str(info['string_counts']):<15} {info['record_count']:>4} "
            f"{str(info['tail_count']):>4} {tail_max:>8} "
            f"{info['final_pos']:>6} {info['remaining']:>4}"
        )
        print(row)
        rows.append(row)

    out = OUT_DIR / "n5s-frontmatter-summary.txt"
    out.write_text("\n".join(rows), encoding="utf-8")
    print(f"\nSaved to {out}")


def main() -> None:
    if len(sys.argv) > 1:
        analyze_one(pathlib.Path(sys.argv[1]))
        return
    analyze_all()


if __name__ == "__main__":
    main()

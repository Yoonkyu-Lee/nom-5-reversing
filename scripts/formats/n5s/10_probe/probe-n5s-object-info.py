"""
probe-n5s-object-info.py

Maps N5S 0x34 records to tagSObjectInfo fields.

Confirmed:
- N5S records ARE the per-stage tagSObjectInfo table loaded by CMapMgr_J::Init.
- Stage_12 has 29 records matching f3 range 0..28 exactly.
- Each record is 0x34 bytes: u8[16] + u16[18].
- u8[12] = eMonsterType (searched by FindObjectInfo)
- u16[0] = pzx1 index (GetPzxMgr arg1) — indexes into flattened string list
- u16[6] = pzx2 index (GetPzxMgr arg2) — indexes into flattened string list

String groups G0..G4 are PZX file name lists. pzx1/pzx2 are flat indices
into the concatenation of all 5 groups.

This script prints:
  f3 | eMonsterType | pzx1_name | pzx2_name | u8[0..3] flags | u8[13..15]

for each stage given as argument (default: stage_0, stage_12, stage_17).
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

DEFAULT_STAGES = ["stage_0", "stage_12", "stage_17", "stage_9", "stage_26_s"]


def flat_strings(string_groups: list[list[str]]) -> list[str]:
    """Flatten all 5 string groups into a single indexed list."""
    out: list[str] = []
    for g in string_groups:
        out.extend(g)
    return out


def pzx_name(flat: list[str], idx: int) -> str:
    if idx == 0xFFFF:
        return "-"
    if idx < len(flat):
        return flat[idx]
    return f"?[{idx}]"


def analyze_stage(name: str) -> None:
    path = MAP_DIR / f"{name}.n5s"
    if not path.exists():
        print(f"[SKIP] {name}.n5s not found")
        return

    data = path.read_bytes()
    fm = parse_frontmatter(data)

    groups = fm["string_groups"]
    flat = flat_strings(groups)
    records = fm["records"]

    print(f"\n=== {name}.n5s  ({len(records)} records) ===")
    print(f"  string groups: {groups}")
    print(f"  flat: {flat}")
    print()
    print(f"  {'f3':>3}  {'eMonType':>8}  {'pzx1':>3}  {'pzx1_name':<16}  {'pzx2':>3}  {'pzx2_name':<16}  u8[0..3]  u8[13..15]")
    print(f"  {'---':>3}  {'--------':>8}  {'---':>3}  {'-'*16}  {'---':>3}  {'-'*16}  --------  ----------")

    for f3, rec in enumerate(records):
        u8s = rec["u8"]
        u16s = rec["u16"]
        # eMonsterType = u8[12]
        emon = u8s[12]
        # pzx1 at u16[0] (offset 0x10 in record), pzx2 at u16[6] (offset 0x1c)
        p1 = u16s[0]
        p2 = u16s[6]
        p1n = pzx_name(flat, p1)
        p2n = pzx_name(flat, p2)
        flags_lo = " ".join(f"{b:02x}" for b in u8s[0:4])
        flags_hi = " ".join(f"{b:02x}" for b in u8s[13:16])
        print(f"  {f3:>3}  {emon:>8}  {p1:>3}  {p1n:<16}  {p2:>3}  {p2n:<16}  {flags_lo}  {flags_hi}")


def main() -> None:
    stages = sys.argv[1:] if len(sys.argv) > 1 else DEFAULT_STAGES
    for s in stages:
        analyze_stage(s)


if __name__ == "__main__":
    main()

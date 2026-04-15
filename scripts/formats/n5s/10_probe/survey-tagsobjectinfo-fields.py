"""
survey-tagsobjectinfo-fields.py

Empirical distribution of every field in tagSObjectInfo (u8[16] + u16[18])
across all N5S files.

For each field, prints:
  - distinct value count
  - top values (with counts)
  - whether it ever differs from 0 / 0xFFFF
  - correlation hints with u8[13] dispatch category

Goal: narrow down which fields are sentinels, which carry per-record data,
and which look like additional pzx indices vs game params.
"""

from __future__ import annotations

import collections
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets/map")


def all_records() -> list[tuple[str, int, dict, list[str]]]:
    """Return list of (stage_name, f3, record, flat_string_list)."""
    out: list[tuple[str, int, dict, list[str]]] = []
    for p in sorted(ASSETS.glob("*.n5s")):
        data = p.read_bytes()
        fm = parse_frontmatter(data)
        flat: list[str] = []
        for g in fm["string_groups"]:
            flat.extend(g)
        for f3, rec in enumerate(fm["records"]):
            out.append((p.stem, f3, rec, flat))
    return out


def field_summary(name: str, values: list[int], top_n: int = 8) -> None:
    counter = collections.Counter(values)
    distinct = len(counter)
    nonzero = sum(1 for v in values if v != 0)
    nonffff = sum(1 for v in values if v != 0xFFFF)
    minv = min(values)
    maxv = max(values)
    top = counter.most_common(top_n)
    top_str = ", ".join(f"{v}×{c}" for v, c in top)
    print(f"  {name:<10}  distinct={distinct:>3}  range=[{minv},{maxv}]  nonzero={nonzero:>3}/{len(values)}  non0xFFFF={nonffff:>3}/{len(values)}")
    print(f"             top: {top_str}")


def main() -> None:
    records = all_records()
    print(f"loaded {len(records)} records from {len(set(r[0] for r in records))} stages\n")

    print("=== u8[i] distributions ===")
    for i in range(16):
        vals = [rec["u8"][i] for _, _, rec, _ in records]
        field_summary(f"u8[{i}]", vals)

    print("\n=== u16[i] distributions ===")
    for i in range(18):
        vals = [rec["u16"][i] for _, _, rec, _ in records]
        field_summary(f"u16[{i}]", vals)

    # Cross-check: do u16[1..5] and u16[7..11] ever look like valid pzx indices
    # (i.e., < flat_string_count for their stage)?
    print("\n=== u16[1..5] / u16[7..11] : look like flat-string indices? ===")
    for slot in [1, 2, 3, 4, 5, 7, 8, 9, 10, 11]:
        looks_idx = 0
        ffff = 0
        zero = 0
        other = 0
        examples: list[str] = []
        for stage, f3, rec, flat in records:
            v = rec["u16"][slot]
            if v == 0xFFFF:
                ffff += 1
            elif v == 0:
                zero += 1
            elif v < len(flat):
                looks_idx += 1
                if len(examples) < 4:
                    examples.append(f"{stage}/f3={f3} u16[{slot}]={v}->{flat[v]}")
            else:
                other += 1
        print(f"  u16[{slot}]: 0xFFFF={ffff}  zero={zero}  inrange_idx={looks_idx}  out_of_range={other}")
        for e in examples:
            print(f"      {e}")

    # Cross-check by u8[13] dispatch
    print("\n=== u16[12..17] grouped by u8[13] dispatch category ===")
    by_disp: dict[int, list[dict]] = collections.defaultdict(list)
    for _, _, rec, _ in records:
        by_disp[rec["u8"][13]].append(rec)
    for disp in sorted(by_disp):
        recs = by_disp[disp]
        print(f"\n  u8[13]={disp}  ({len(recs)} records)")
        for slot in range(12, 18):
            vals = [r["u16"][slot] for r in recs]
            counter = collections.Counter(vals)
            top = counter.most_common(6)
            top_str = ", ".join(f"{v}×{c}" for v, c in top)
            print(f"    u16[{slot}]: distinct={len(counter):>3}  top: {top_str}")

    # u8[6..11] grouped by u8[13]
    print("\n=== u8[6..11] grouped by u8[13] dispatch category ===")
    for disp in sorted(by_disp):
        recs = by_disp[disp]
        print(f"\n  u8[13]={disp}  ({len(recs)} records)")
        for slot in range(6, 12):
            vals = [r["u8"][slot] for r in recs]
            counter = collections.Counter(vals)
            top = counter.most_common(6)
            top_str = ", ".join(f"{v}×{c}" for v, c in top)
            print(f"    u8[{slot}]: distinct={len(counter):>3}  top: {top_str}")

    # u8[1..5], u8[14..15] grouped by u8[13]
    print("\n=== u8[1..5] / u8[14..15] grouped by u8[13] dispatch category ===")
    for disp in sorted(by_disp):
        recs = by_disp[disp]
        print(f"\n  u8[13]={disp}  ({len(recs)} records)")
        for slot in [1, 2, 3, 4, 5, 14, 15]:
            vals = [r["u8"][slot] for r in recs]
            counter = collections.Counter(vals)
            top = counter.most_common(6)
            top_str = ", ".join(f"{v}×{c}" for v, c in top)
            print(f"    u8[{slot}]: distinct={len(counter):>3}  top: {top_str}")


if __name__ == "__main__":
    main()

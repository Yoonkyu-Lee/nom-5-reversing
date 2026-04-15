"""
probe-n5m-flags.py

Survey flags[0..6] across all N5M blocks to understand what each flag controls.

From disasm (CMap_J::LoadMap):
  flags[0] -> CMap+0x66: used in CBackLayer init (scroll phase; bit0 tested)
  flags[2] -> CMap+0x68: checked during path-layer construction (if==1 -> different branch)
  flags[1,3..6] -> CMap+0x67,0x69..0x6c: stored but use not yet identified

Usage:
    python probe-n5m-flags.py              # summary across all files
    python probe-n5m-flags.py <file.n5m>   # per-block dump for one file
"""

from __future__ import annotations

import importlib.util
import pathlib
import sys
from collections import Counter, defaultdict

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


def collect_all() -> list[dict]:
    """Collect per-block flag data from all N5M files."""
    rows: list[dict] = []
    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        ends = tail[1:] + [len(data)]
        for blk_idx, (start, end) in enumerate(zip(tail, ends)):
            info = parse_block_layer_groups(data, start, end)
            rows.append({
                "file": n5m_path.name,
                "blk": blk_idx,
                "flags": tuple(info["flags"]),
                "header_a": info["header_a"],
                "header_b": info["header_b"],
                "layer_group_count": info["layer_group_count"],
                "groups": info["groups"],
            })
    return rows


def dump_one(n5m_path: pathlib.Path) -> None:
    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")
    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    print(f"=== {n5m_path.name} ===")
    print(f"{'blk':<5} {'ha':>6} {'hb':>6}  {'flags[0..6]':<30}  group_counts")
    for blk_idx, (start, end) in enumerate(zip(tail, ends)):
        info = parse_block_layer_groups(data, start, end)
        flags = info["flags"]
        gc = [g["element_count"] for g in info["groups"]]
        print(f"{blk_idx:<5} {info['header_a']:>6} {info['header_b']:>6}  "
              f"{str(flags):<30}  {gc}")


def summarize_all(rows: list[dict]) -> None:
    # 1. Per-flag value frequency
    print("=== Per-flag value distributions ===")
    for fi in range(7):
        vals = Counter(r["flags"][fi] for r in rows)
        print(f"  flags[{fi}]: {dict(sorted(vals.items()))}")

    # 2. Unique flag tuples
    tuples = Counter(r["flags"] for r in rows)
    print(f"\n=== Unique flags[0..6] tuples ({len(tuples)} distinct across {len(rows)} blocks) ===")
    for t, cnt in sorted(tuples.items(), key=lambda x: -x[1]):
        print(f"  {str(t):<40} count={cnt}")

    # 3. flags[0] vs header_b correlation
    print("\n=== flags[0] vs header_b ===")
    fb = defaultdict(set)
    for r in rows:
        fb[r["flags"][0]].add(r["header_b"])
    for k, vs in sorted(fb.items()):
        print(f"  flags[0]={k}: header_b in {sorted(vs)}")

    # 4. flags[2] vs block structure
    print("\n=== flags[2] values ===")
    f2 = Counter(r["flags"][2] for r in rows)
    print(f"  distribution: {dict(sorted(f2.items()))}")
    # Show which files have flags[2] != 0
    nonzero_f2 = [(r["file"], r["blk"], r["flags"]) for r in rows if r["flags"][2] != 0]
    if nonzero_f2:
        print(f"  non-zero occurrences ({len(nonzero_f2)}):")
        for f, b, fl in nonzero_f2[:20]:
            print(f"    {f} blk={b} flags={list(fl)}")

    # 5. flags[1,3..6] zero check
    print("\n=== Non-zero occurrences for flags[1,3,4,5,6] ===")
    for fi in [1, 3, 4, 5, 6]:
        nonzero = [(r["file"], r["blk"], r["flags"][fi]) for r in rows if r["flags"][fi] != 0]
        print(f"  flags[{fi}]: {len(nonzero)} non-zero")
        for f, b, v in nonzero[:10]:
            print(f"    {f} blk={b} value={v}")


def main() -> None:
    if len(sys.argv) > 1:
        dump_one(pathlib.Path(sys.argv[1]))
        return
    rows = collect_all()
    print(f"Loaded {len(rows)} blocks from {len(set(r['file'] for r in rows))} files\n")
    summarize_all(rows)


if __name__ == "__main__":
    main()

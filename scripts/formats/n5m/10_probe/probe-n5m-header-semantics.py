"""
probe-n5m-header-semantics.py

Verify what header_a and header_b represent by cross-referencing them with
the spatial extent of pattern placements and path nodes inside each block.

Hypothesis under test:
  header_a = block width in game units
  header_b = block height in game units

Evidence so far:
  stage_17 block 0: header_a=6000, patterns at x=0,600,...,5400 (10 * 600, max=5400, 5400+600=6000)
  stage_10: header_a varies per block as 600,1200,1800,2400 (all multiples of 600)

For each block this script reports:
  header_a  max_patt_x  max_node_x  diff_a_patt  diff_a_node
  header_b  min_node_y  max_node_y  min_patt_y   max_patt_y

Usage:
    python probe-n5m-header-semantics.py                    # all stages
    python probe-n5m-header-semantics.py stage_17_m.n5m    # one stage
    python probe-n5m-header-semantics.py stage_17_m.n5m -v # verbose per-block
"""

from __future__ import annotations

import importlib.util
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

# Load probe-n5m-path-with-events as helper
EVENTS_PATH = pathlib.Path(__file__).with_name("probe-n5m-path-with-events.py")
EVENTS_SPEC = importlib.util.spec_from_file_location("probe_events", EVENTS_PATH)
if EVENTS_SPEC is None or EVENTS_SPEC.loader is None:
    raise RuntimeError(f"failed to load {EVENTS_PATH}")
EVENTS = importlib.util.module_from_spec(EVENTS_SPEC)
EVENTS_SPEC.loader.exec_module(EVENTS)  # type: ignore[attr-defined]

parse_post_group_section = EVENTS.parse_post_group_section
ParseError = EVENTS.ParseError

PROBE_PATH = pathlib.Path(__file__).with_name("probe-n5m-layer-groups.py")
PROBE_SPEC = importlib.util.spec_from_file_location("probe_layer_groups", PROBE_PATH)
if PROBE_SPEC is None or PROBE_SPEC.loader is None:
    raise RuntimeError(f"failed to load {PROBE_PATH}")
PROBE = importlib.util.module_from_spec(PROBE_SPEC)
PROBE_SPEC.loader.exec_module(PROBE)  # type: ignore[attr-defined]

parse_block_layer_groups = PROBE.parse_block_layer_groups
sibling_n5s_for = PROBE.sibling_n5s_for

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def collect_xy(section: dict) -> tuple[list[int], list[int], list[int], list[int]]:
    """Return (patt_xs, patt_ys, node_xs, node_ys) from a parsed post-group section."""
    patt_xs: list[int] = []
    patt_ys: list[int] = []
    node_xs: list[int] = []
    node_ys: list[int] = []
    for layer in section["layers"]:
        for p in layer["patt_a"] + layer["patt_b"]:
            patt_xs.append(p["x"])
            patt_ys.append(p["y"])
        for path in layer["paths"]:
            for node in path["nodes"]:
                node_xs.append(node["x"])
                node_ys.append(node["y"])
    return patt_xs, patt_ys, node_xs, node_ys


def analyze_stage(n5m_path: pathlib.Path, verbose: bool) -> None:
    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        return
    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]

    print(f"\n=== {n5m_path.name} ===")
    if verbose:
        print(f"  {'blk':>3}  {'ha':>6}  {'hb':>6}  "
              f"{'mx_px':>7}  {'mx_nx':>7}  {'ha-mx_px':>9}  {'ha-mx_nx':>9}  "
              f"{'py_rng':>12}  {'ny_rng':>12}")

    # Accumulate per-file stats
    all_ha: list[int] = []
    all_hb: list[int] = []
    discrepancies_a: list[str] = []
    hb_vs_y: list[str] = []

    for blk_idx in range(len(tail)):
        start = tail[blk_idx]
        end = tail[blk_idx + 1] if blk_idx + 1 < len(tail) else len(data)
        try:
            info = parse_block_layer_groups(data, start, end)
        except Exception as e:
            print(f"  blk {blk_idx}: layer_groups error: {e}")
            continue
        ha = info["header_a"]
        hb = info["header_b"]
        pos = info["post_groups_start"]
        all_ha.append(ha)
        all_hb.append(hb)
        try:
            section, _ = parse_post_group_section(data, pos, end, verbose=False)
        except ParseError as e:
            print(f"  blk {blk_idx}: parse error: {e}")
            continue

        pxs, pys, nxs, nys = collect_xy(section)

        mx_px = max(pxs) if pxs else None
        mx_nx = max(nxs) if nxs else None
        min_py = min(pys) if pys else None
        max_py = max(pys) if pys else None
        min_ny = min(nys) if nys else None
        max_ny = max(nys) if nys else None

        diff_a_px = (ha - mx_px) if mx_px is not None else None
        diff_a_nx = (ha - mx_nx) if mx_nx is not None else None

        if verbose:
            py_rng = f"[{min_py},{max_py}]" if min_py is not None else "none"
            ny_rng = f"[{min_ny},{max_ny}]" if min_ny is not None else "none"
            print(f"  {blk_idx:>3}  {ha:>6}  {hb:>6}  "
                  f"{str(mx_px) if mx_px is not None else '-':>7}  "
                  f"{str(mx_nx) if mx_nx is not None else '-':>7}  "
                  f"{str(diff_a_px) if diff_a_px is not None else '-':>9}  "
                  f"{str(diff_a_nx) if diff_a_nx is not None else '-':>9}  "
                  f"{py_rng:>12}  {ny_rng:>12}")

        # Flag if diff_a_px is not a clean unit (not a divisor of header_a)
        if mx_px is not None and diff_a_px is not None:
            if diff_a_px < 0:
                discrepancies_a.append(f"blk{blk_idx}: ha={ha} mx_px={mx_px} OVER")
            elif diff_a_px > 0 and ha > 0:
                # Check if diff is a clean fraction of ha
                pass  # collect for summary

        # hb vs y-range
        if min_ny is not None and max_ny is not None:
            ny_span = max_ny - min_ny
            hb_vs_y.append(f"blk{blk_idx}: hb={hb} ny=[{min_ny},{max_ny}] span={ny_span}")

    # Summary
    unique_ha = sorted(set(all_ha))
    unique_hb = sorted(set(all_hb))
    print(f"  header_a values: {[hex(v) for v in unique_ha]}")
    print(f"  header_b values: {[hex(v) for v in unique_hb]}")
    if discrepancies_a:
        for d in discrepancies_a:
            print(f"  WARN {d}")
    if not verbose and hb_vs_y:
        # Print a few hb vs y examples
        for line in hb_vs_y[:4]:
            print(f"  hb/y: {line}")


def main() -> None:
    verbose = "-v" in sys.argv
    args = [a for a in sys.argv[1:] if not a.startswith("-")]

    if args:
        paths = []
        for arg in args:
            p = pathlib.Path(arg)
            if p.exists():
                paths.append(p)
            else:
                c = MAP_DIR / arg
                if c.exists():
                    paths.append(c)
                else:
                    print(f"not found: {arg}")
    else:
        paths = sorted(MAP_DIR.glob("*.n5m"))

    for p in paths:
        analyze_stage(p, verbose)


if __name__ == "__main__":
    main()

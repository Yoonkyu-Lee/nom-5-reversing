"""
summarize-n5m-header-fields.py

Summarize per-file N5M block header fields using sibling N5S tail offsets.
This helps classify which fields are file-global, which vary per block, and how
`g0` pairs correlate with block order.
"""

from __future__ import annotations

import pathlib
import sys
import importlib.util

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

PROBE_PATH = pathlib.Path(__file__).with_name("probe-n5m-block-header.py")
PROBE_SPEC = importlib.util.spec_from_file_location("probe_n5m_block_header", PROBE_PATH)
if PROBE_SPEC is None or PROBE_SPEC.loader is None:
    raise RuntimeError(f"failed to load helper module from {PROBE_PATH}")
PROBE = importlib.util.module_from_spec(PROBE_SPEC)
PROBE_SPEC.loader.exec_module(PROBE)

parse_block_header = PROBE.parse_block_header
sibling_n5s_for = PROBE.sibling_n5s_for

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def main() -> None:
    print(
        f"{'file':<16} {'a_vals':<18} {'b_vals':<12} {'g0_pairs':<28} {'flag_variants':>13}"
    )
    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        ends = tail[1:] + [len(data)]
        infos = [parse_block_header(data, start, end) for start, end in zip(tail, ends)]

        a_vals = sorted({info["header_a"] for info in infos})
        b_vals = sorted({info["header_b"] for info in infos})
        g0_pairs = []
        for info in infos:
            if info["groups"] and info["groups"][0]["pairs"]:
                g0_pairs.append(info["groups"][0]["pairs"][0])
            else:
                g0_pairs.append(None)
        pair_set = []
        for pair in g0_pairs:
            if pair not in pair_set:
                pair_set.append(pair)
        flag_variants = len({tuple(info["flags"]) for info in infos})
        print(
            f"{n5m_path.name:<16} "
            f"{str([hex(v) for v in a_vals]):<18} "
            f"{str([hex(v) for v in b_vals]):<12} "
            f"{str(pair_set):<28} "
            f"{flag_variants:>13}"
        )


if __name__ == "__main__":
    main()

"""
probe-n5m-body-prefixes.py

Summarize the first body bytes at `post_groups_start` for tail-indexed N5M
blocks.
This uses the current variable early-prefix probe, not the older fixed `0x11`
header model.
"""

from __future__ import annotations

import collections
import importlib.util
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

PROBE_PATH = pathlib.Path(__file__).with_name("probe-n5m-layer-groups.py")
PROBE_SPEC = importlib.util.spec_from_file_location("probe_n5m_layer_groups", PROBE_PATH)
if PROBE_SPEC is None or PROBE_SPEC.loader is None:
    raise RuntimeError(f"failed to load helper module from {PROBE_PATH}")
PROBE = importlib.util.module_from_spec(PROBE_SPEC)
PROBE_SPEC.loader.exec_module(PROBE)

parse_block_layer_groups = PROBE.parse_block_layer_groups
sibling_n5s_for = PROBE.sibling_n5s_for

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def main() -> None:
    counter = collections.Counter()
    examples: dict[str, list[str]] = {}

    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        ends = tail[1:] + [len(data)]
        previews = []
        for start, end in zip(tail, ends):
            info = parse_block_layer_groups(data, start, end)
            body_start = info["post_groups_start"]
            prefix = data[body_start:body_start + 16].hex(" ")
            counter[prefix] += 1
            previews.append(f"{body_start:#06x}:{prefix}")
        examples[n5m_path.name] = previews[:4]

    print("Top repeated body prefixes at post_groups_start")
    for prefix, count in counter.most_common(16):
        print(f"  {count:>3}x  {prefix}")

    print("\nSample files")
    for name, previews in list(examples.items())[:8]:
        print(f"  {name}")
        for line in previews:
            print(f"    {line}")


if __name__ == "__main__":
    main()

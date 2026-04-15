"""
probe-n5m-block-prefixes.py

Summarize repeated block prefixes at offsets supplied by sibling N5S tail_u16.
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


def sibling_n5s_for(n5m_path: pathlib.Path) -> pathlib.Path | None:
    stem = n5m_path.stem
    if not stem.endswith("_m"):
        return None
    n5s_name = stem[:-2] + ".n5s"
    path = n5m_path.with_name(n5s_name)
    return path if path.exists() else None


def main() -> None:
    counter = collections.Counter()
    samples: dict[str, list[str]] = {}

    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        data = n5m_path.read_bytes()
        previews = []
        for off in tail:
            if off + 16 > len(data):
                continue
            prefix = data[off:off + 16].hex(" ")
            counter[prefix] += 1
            previews.append(f"{off:#06x}:{prefix}")
        samples[n5m_path.name] = previews[:4]

    print("Top repeated 16-byte prefixes")
    for prefix, count in counter.most_common(12):
        print(f"  {count:>3}x  {prefix}")

    print("\nSample files")
    for name, previews in list(samples.items())[:8]:
        print(f"  {name}")
        for line in previews:
            print(f"    {line}")


if __name__ == "__main__":
    main()

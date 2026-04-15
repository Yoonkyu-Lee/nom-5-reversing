"""
compare-n5s-tail-to-n5m.py

Check whether the trailing u16 table from `stage_X.n5s` fits the size range of
the sibling `stage_X_m.n5m`.
"""

from __future__ import annotations

import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def main() -> None:
    print(f"{'n5s':<16} {'tail_max':>8} {'n5m_size':>9} {'fits':>6}")
    for n5s_path in sorted(MAP_DIR.glob("*.n5s")):
        stem = n5s_path.stem
        n5m_path = MAP_DIR / f"{stem}_m.n5m"
        info = parse_frontmatter(n5s_path.read_bytes())
        tail_max = max(info["tail_u16"]) if info["tail_u16"] else -1
        n5m_size = n5m_path.stat().st_size if n5m_path.exists() else -1
        fits = n5m_size >= 0 and 0 <= tail_max < n5m_size
        print(f"{n5s_path.name:<16} {tail_max:>8} {n5m_size:>9} {str(fits):>6}")


if __name__ == "__main__":
    main()

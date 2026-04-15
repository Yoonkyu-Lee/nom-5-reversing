"""
compare-n5m-family-pair.py

Compare two sibling N5M files at the current parser boundary (`post_groups_start`)
to estimate how stable a shared body grammar really is.
"""

from __future__ import annotations

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


def load_blocks(n5m_path: pathlib.Path) -> list[dict]:
    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")
    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    rows = []
    for block_index, (start, end) in enumerate(zip(tail, ends)):
        info = parse_block_layer_groups(data, start, end)
        post = info["post_groups_start"]
        rows.append(
            {
                "block_index": block_index,
                "start": start,
                "end": end,
                "post": post,
                "prefix": data[post:post + 32],
                "body": data[post:end],
            }
        )
    return rows


def common_prefix_len(a: bytes, b: bytes) -> int:
    n = min(len(a), len(b))
    i = 0
    while i < n and a[i] == b[i]:
        i += 1
    return i


def resolve_path(arg: str) -> pathlib.Path:
    path = pathlib.Path(arg)
    if path.exists():
        return path
    candidate = MAP_DIR / arg
    if candidate.exists():
        return candidate
    raise SystemExit(f"file not found: {arg}")


def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit(
            "usage: compare-n5m-family-pair.py <left.n5m> <right.n5m>"
        )

    left_path = resolve_path(sys.argv[1])
    right_path = resolve_path(sys.argv[2])
    left = load_blocks(left_path)
    right = load_blocks(right_path)

    count = min(len(left), len(right))
    print(f"=== {left_path.name} vs {right_path.name} ===")
    print(f"blocks compared: {count}")
    for i in range(count):
        la = left[i]
        rb = right[i]
        prefix_match = common_prefix_len(la["prefix"], rb["prefix"])
        body_match = common_prefix_len(la["body"], rb["body"])
        print(
            f"[{i}] "
            f"L(start={la['start']:#06x}, post={la['post']:#06x}) "
            f"R(start={rb['start']:#06x}, post={rb['post']:#06x}) "
            f"prefix_match={prefix_match} body_match={body_match}"
        )
        print(f"    L32={la['prefix'].hex(' ')}")
        print(f"    R32={rb['prefix'].hex(' ')}")


if __name__ == "__main__":
    main()

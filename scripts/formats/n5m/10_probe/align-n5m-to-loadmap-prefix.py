"""
align-n5m-to-loadmap-prefix.py

Show how the current N5M block-start bytes line up with the early
`CMap_J::LoadMap` read sequence:

- readUint16()
- readUint16()
- readUint8()
- readUint8() * 7
- outer_count
- repeated per-group:
  - group_element_count
  - repeated elements

This helps test whether `GetMapOffset(stage_id)` lands on block start rather
than `post_groups_start`.
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


def resolve_path(arg: str) -> pathlib.Path:
    path = pathlib.Path(arg)
    if path.exists():
        return path
    candidate = pathlib.Path("jadx-out/nom5/resources/assets/map") / arg
    if candidate.exists():
        return candidate
    raise SystemExit(f"file not found: {arg}")


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(
            "usage: align-n5m-to-loadmap-prefix.py <file.n5m> [block_index]"
        )

    n5m_path = resolve_path(sys.argv[1])
    block_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0

    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    if not (0 <= block_index < len(tail)):
        raise SystemExit(f"block_index out of range: {block_index}")

    start = tail[block_index]
    end = ends[block_index]
    info = parse_block_layer_groups(data, start, end)

    print(f"=== {n5m_path.name} block {block_index} ===")
    print(f"start={start:#06x} end={end:#06x} size={end - start:#06x}")
    print(f"raw[0:16]={data[start:start + 16].hex(' ')}")
    print()
    print("LoadMap-aligned reads from block start")
    print(f"  readUint16 -> header_a = {info['header_a']:#06x}")
    print(f"  readUint16 -> header_b = {info['header_b']:#06x}")
    print(f"  readUint8  -> flag0    = {info['flags'][0]}")
    for i, value in enumerate(info["flags"][1:], start=1):
        print(f"  readUint8  -> flag{i}    = {value}")
    print(f"  readUint8  -> outer_count(group_count) = {info['layer_group_count']}")
    print()
    for gi, group in enumerate(info["groups"]):
        print(f"  group[{gi}] count = {group['element_count']}")
        for ei, elem in enumerate(group["elements"]):
            print(
                f"    elem[{ei}] "
                f"(u8,u8,i16,i16)=({elem['a']}, {elem['b']}, {elem['x']}, {elem['y']})"
            )
    print()
    print(f"post_groups_start={info['post_groups_start']:#06x}")
    print(
        f"post_preview={data[info['post_groups_start']:info['post_groups_start'] + 32].hex(' ')}"
    )


if __name__ == "__main__":
    main()

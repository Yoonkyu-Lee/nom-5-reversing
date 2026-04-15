"""
probe-n5m-strong-family-next-section.py

After the recovered strong-family land/path section, probe the next section with
the current `LoadMap`-guided candidate grammar:

- u16 object_count
- object_count *:
  - u8 kind
  - i16 a
  - i16 b
  - i16 c
  - i16 d
  - i16 e
  - u8 tail
"""

from __future__ import annotations

import importlib.util
import pathlib
import struct
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


def i16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<h", data, off)[0]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def resolve_path(arg: str) -> pathlib.Path:
    path = pathlib.Path(arg)
    if path.exists():
        return path
    candidate = MAP_DIR / arg
    if candidate.exists():
        return candidate
    raise SystemExit(f"file not found: {arg}")


def parse_land_path_section(data: bytes, pos: int, end: int) -> int:
    land_layer_count = data[pos]
    pos += 1
    for _ in range(land_layer_count):
        count_a = data[pos]
        pos += 1 + count_a * 6
        count_b = data[pos]
        pos += 1 + count_b * 6
        path_count = data[pos]
        pos += 1
        for _ in range(path_count):
            node_count = u16le(data, pos)
            pos += 2 + node_count * 7
        if pos > end:
            raise ValueError("land/path section overrun")
    return pos


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(
            "usage: probe-n5m-strong-family-next-section.py <file.n5m> [block_index] [show_count]"
        )

    n5m_path = resolve_path(sys.argv[1])
    block_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    show_count = int(sys.argv[3]) if len(sys.argv) > 3 else 8

    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    start = tail[block_index]
    end = ends[block_index]
    info = parse_block_layer_groups(data, start, end)
    pos = parse_land_path_section(data, info["post_groups_start"], end)

    object_count = u16le(data, pos)
    cur = pos + 2
    print(f"=== {n5m_path.name} block {block_index} ===")
    print(f"start={start:#06x} next_section={pos:#06x} end={end:#06x}")
    print(f"object_count={object_count}")
    for i in range(min(object_count, show_count)):
        if cur + 12 > end:
            print(f"  stop at object {i}: overrun")
            break
        row = {
            "kind": data[cur],
            "a": i16le(data, cur + 1),
            "b": i16le(data, cur + 3),
            "c": i16le(data, cur + 5),
            "d": i16le(data, cur + 7),
            "e": i16le(data, cur + 9),
            "tail": data[cur + 11],
        }
        print(
            f"  obj[{i}] "
            f"(kind,a,b,c,d,e,tail)=("
            f"{row['kind']}, {row['a']}, {row['b']}, {row['c']}, {row['d']}, {row['e']}, {row['tail']})"
        )
        cur += 12
    print(f"after_preview={data[cur:cur + 16].hex(' ')}")


if __name__ == "__main__":
    main()

"""
probe-n5m-strong-family-record0.py

Probe a family-specific first record grammar at `post_groups_start`:

- u8 record_kind
- u8 record_count
- record_count * (u8 a, u8 b, i16 x, i16 y)

This is currently aimed at strong shared families such as:
- stage_17 / stage_6
- stage_20 / stage_4
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


def resolve_path(arg: str) -> pathlib.Path:
    path = pathlib.Path(arg)
    if path.exists():
        return path
    candidate = MAP_DIR / arg
    if candidate.exists():
        return candidate
    raise SystemExit(f"file not found: {arg}")


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(
            "usage: probe-n5m-strong-family-record0.py <file.n5m> [block_index]"
        )

    n5m_path = resolve_path(sys.argv[1])
    block_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0

    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    start = tail[block_index]
    end = ends[block_index]
    info = parse_block_layer_groups(data, start, end)
    post = info["post_groups_start"]

    record_kind = data[post]
    record_count = data[post + 1]
    pos = post + 2
    elems = []
    for _ in range(record_count):
        if pos + 6 > end:
            break
        elems.append(
            {
                "a": data[pos],
                "b": data[pos + 1],
                "x": i16le(data, pos + 2),
                "y": i16le(data, pos + 4),
            }
        )
        pos += 6

    print(f"=== {n5m_path.name} block {block_index} ===")
    print(f"start={start:#06x} post={post:#06x} end={end:#06x}")
    print(f"record_kind={record_kind} record_count={record_count}")
    for i, elem in enumerate(elems):
        print(
            f"  elem[{i}] "
            f"(u8,u8,i16,i16)=({elem['a']}, {elem['b']}, {elem['x']}, {elem['y']})"
        )
    print(f"consumed={pos - post} bytes")
    print(f"next16={data[pos:pos + 16].hex(' ')}")


if __name__ == "__main__":
    main()

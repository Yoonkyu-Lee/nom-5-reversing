"""
probe-n5m-strong-family-records.py

Parse several consecutive records from `post_groups_start` using the current
strong-family candidate grammar:

- u8 record_kind
- u8 record_count
- record_count * (u8 a, u8 b, i16 x, i16 y)

This is a probe only. It helps test whether strong families keep repeating the
same 6-byte tuple record grammar beyond the first recovered record.
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


def parse_record(data: bytes, pos: int, end: int) -> tuple[dict | None, int]:
    if pos + 2 > end:
        return None, pos
    kind = data[pos]
    count = data[pos + 1]
    cur = pos + 2
    need = count * 6
    if cur + need > end:
        return None, pos
    elems = []
    for _ in range(count):
        elems.append(
            {
                "a": data[cur],
                "b": data[cur + 1],
                "x": i16le(data, cur + 2),
                "y": i16le(data, cur + 4),
            }
        )
        cur += 6
    return {"kind": kind, "count": count, "elems": elems, "start": pos, "end": cur}, cur


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(
            "usage: probe-n5m-strong-family-records.py <file.n5m> [block_index] [max_records]"
        )

    n5m_path = resolve_path(sys.argv[1])
    block_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    max_records = int(sys.argv[3]) if len(sys.argv) > 3 else 4

    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    start = tail[block_index]
    end = ends[block_index]
    info = parse_block_layer_groups(data, start, end)
    pos = info["post_groups_start"]

    print(f"=== {n5m_path.name} block {block_index} ===")
    print(f"start={start:#06x} post={pos:#06x} end={end:#06x}")
    for ri in range(max_records):
        rec, next_pos = parse_record(data, pos, end)
        if rec is None:
            print(f"[{ri}] parse stop at {pos:#06x}")
            print(f"     next16={data[pos:pos + 16].hex(' ')}")
            break
        print(
            f"[{ri}] kind={rec['kind']} count={rec['count']} "
            f"start={rec['start']:#06x} end={rec['end']:#06x}"
        )
        for i, elem in enumerate(rec["elems"][:12]):
            print(
                f"     elem[{i}] "
                f"(u8,u8,i16,i16)=({elem['a']}, {elem['b']}, {elem['x']}, {elem['y']})"
            )
        pos = next_pos
        print(f"     next16={data[pos:pos + 16].hex(' ')}")


if __name__ == "__main__":
    main()

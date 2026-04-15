"""
probe-n5m-block-header.py

Parse the repeated N5M block header using the current `LoadMap`-guided model:

- u16 header_a
- u16 header_b
- u8 flags[7]
- u8 group_count
- repeated groups:
  - u8 pair_count
  - pair_count * (u8 kind, u8 value)

The repeated block start offsets are taken from the sibling N5S trailing u16
table. This is a probe, not a full parser.
"""

from __future__ import annotations

import pathlib
import struct
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def u8(data: bytes, off: int) -> int:
    return data[off]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def sibling_n5s_for(n5m_path: pathlib.Path) -> pathlib.Path | None:
    stem = n5m_path.stem
    if not stem.endswith("_m"):
        return None
    n5s_name = stem[:-2] + ".n5s"
    path = n5m_path.with_name(n5s_name)
    return path if path.exists() else None


def parse_block_header(data: bytes, start: int, block_end: int) -> dict:
    pos = start
    header_a = u16le(data, pos)
    pos += 2
    header_b = u16le(data, pos)
    pos += 2
    flags = [u8(data, pos + i) for i in range(7)]
    pos += 7
    group_count = u8(data, pos)
    pos += 1

    groups = []
    truncated = False
    for _ in range(group_count):
        if pos >= block_end:
            truncated = True
            break
        pair_count = u8(data, pos)
        pos += 1
        pairs = []
        if pos + pair_count * 2 > block_end:
            truncated = True
            pairs = [
                (u8(data, p), u8(data, p + 1))
                for p in range(pos, max(pos, block_end - 1), 2)
                if p + 1 < block_end
            ]
            pos = block_end
        else:
            for _ in range(pair_count):
                pairs.append((u8(data, pos), u8(data, pos + 1)))
                pos += 2
        groups.append({"pair_count": pair_count, "pairs": pairs})

    return {
        "header_a": header_a,
        "header_b": header_b,
        "flags": flags,
        "group_count": group_count,
        "groups": groups,
        "body_start": pos,
        "header_size": pos - start,
        "truncated": truncated,
    }


def inspect_one(n5m_path: pathlib.Path) -> None:
    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]

    print(f"=== {n5m_path.name} ===")
    for i, (start, end) in enumerate(zip(tail, ends)):
        info = parse_block_header(data, start, end)
        print(
            f"[{i}] start={start:#06x} end={end:#06x} size={end-start:#06x} "
            f"a={info['header_a']:#06x} b={info['header_b']:#06x} "
            f"flags={info['flags']} groups={info['group_count']} "
            f"header_size={info['header_size']:#04x} body_start={info['body_start']:#06x}"
        )
        if info["truncated"]:
            print("    WARNING: header parse hit block boundary")
        for gi, group in enumerate(info["groups"]):
            print(f"    g{gi}: count={group['pair_count']} pairs={group['pairs']}")
        body_preview = data[info["body_start"]:info["body_start"] + 16].hex(" ")
        print(f"    body_preview={body_preview}")


def summarize_all() -> None:
    print(
        f"{'file':<16} {'blocks':>6} {'gcounts':<20} {'common_flags':<24} "
        f"{'hdr_sizes':<16}"
    )
    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        ends = tail[1:] + [len(data)]
        infos = [parse_block_header(data, start, end) for start, end in zip(tail, ends)]
        gcounts = sorted({info["group_count"] for info in infos})
        flags = sorted({tuple(info["flags"]) for info in infos})
        hdr_sizes = sorted({info["header_size"] for info in infos})
        print(
            f"{n5m_path.name:<16} {len(infos):>6} {str(gcounts):<20} "
            f"{str(flags[:2]):<24} {str(hdr_sizes):<16}"
        )


def main() -> None:
    if len(sys.argv) > 1:
        inspect_one(pathlib.Path(sys.argv[1]))
        return
    summarize_all()


if __name__ == "__main__":
    main()

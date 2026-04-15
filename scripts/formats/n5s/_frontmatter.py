"""
Shared front-matter parser for NOM5 N5S files.
"""

from __future__ import annotations

import struct


def u8(data: bytes, off: int) -> int:
    return data[off]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def decode_fixed_string(raw: bytes) -> str:
    trimmed = raw.split(b"\x00", 1)[0]
    if not trimmed:
        return ""
    try:
        return trimmed.decode("ascii")
    except UnicodeDecodeError:
        return trimmed.hex(" ")


def parse_frontmatter(data: bytes) -> dict:
    pos = 0
    lead_u8 = u8(data, pos)
    pos += 1

    header_u16 = [u16le(data, pos + i * 2) for i in range(5)]
    pos += 10

    string_groups: list[list[str]] = []
    string_counts: list[int] = []
    for _ in range(5):
        count = u8(data, pos)
        pos += 1
        string_counts.append(count)
        group: list[str] = []
        for _j in range(count):
            raw = data[pos:pos + 10]
            group.append(decode_fixed_string(raw))
            pos += 10
        string_groups.append(group)

    record_count_off = pos
    record_count = u8(data, pos)
    pos += 1

    records = []
    for _ in range(record_count):
        u8s = list(data[pos:pos + 16])
        pos += 16
        u16s = [u16le(data, pos + i * 2) for i in range(18)]
        pos += 36
        records.append({"u8": u8s, "u16": u16s})

    tail_count_off = pos
    if pos >= len(data):
        tail_count = None
        tail_u16 = []
    else:
        tail_count = u8(data, pos)
        pos += 1
        tail_u16 = []
        if pos + tail_count * 2 <= len(data):
            for _ in range(tail_count):
                tail_u16.append(u16le(data, pos))
                pos += 2

    return {
        "lead_u8": lead_u8,
        "header_u16": header_u16,
        "string_counts": string_counts,
        "string_groups": string_groups,
        "record_count_off": record_count_off,
        "record_count": record_count,
        "records": records,
        "tail_count_off": tail_count_off,
        "tail_count": tail_count,
        "tail_u16": tail_u16,
        "final_pos": pos,
        "remaining": len(data) - pos,
    }

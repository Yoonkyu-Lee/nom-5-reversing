"""
probe-pzx-token-modes.py
Probe alternate token-stream interpretations for PZX frames.

Variants:
- 16-bit token stream (HookUncompressImageCB-like)
- 8-bit token stream (HookSingleImageCB special path)
- start offset relative to frame start: 16, 18, 20, 22, 24
- separator handling:
  - noop
  - align_to_next_row
"""

from __future__ import annotations

import pathlib
import struct
import sys
import zlib


def u32le(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def find_zlib_blocks(data: bytes) -> list[bytes]:
    blocks: list[bytes] = []
    seen: set[int] = set()
    for off in range(0, len(data) - 2):
        if data[off] != 0x78 or data[off + 1] not in (0x01, 0x5E, 0x9C, 0xDA):
            continue
        try:
            dec = zlib.decompress(data[off:])
        except zlib.error:
            continue
        if off not in seen:
            blocks.append(dec)
            seen.add(off)
    return blocks


def score_frame_block(dec: bytes) -> int:
    if len(dec) < 16:
        return 0
    table_bytes = u32le(dec, 0)
    if table_bytes < 8 or table_bytes % 4 != 0 or table_bytes >= len(dec):
        return 0
    entry_count = table_bytes // 4
    if entry_count < 2:
        return 0
    offsets = [u32le(dec, i * 4) for i in range(entry_count)]
    if offsets[0] != table_bytes:
        return 0
    if any(o >= len(dec) for o in offsets):
        return 0
    if any(offsets[i] >= offsets[i + 1] for i in range(entry_count - 1)):
        return 0
    return entry_count + 100


def decode_probe_u16(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    while pos + 1 < len(stream):
        tok = u16le(stream, pos)
        pos += 2
        if tok == 0xFFFF:
            return produced, pos, "end"
        if tok == 0xFFFE:
            if mode == "align":
                rem = produced % width
                if rem:
                    produced += width - rem
            continue
        if tok & 0x8000:
            ncopy = tok & 0x7FFF
            if pos + ncopy > len(stream):
                return produced, pos, f"copy_overrun:{ncopy}"
            pos += ncopy
            produced += ncopy
        else:
            produced += tok
        if produced > expected:
            return produced, pos, "too_many_pixels"
    return produced, pos, "stream_exhausted"


def decode_probe_u8(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    while pos < len(stream):
        tok = stream[pos]
        pos += 1
        if tok == 0xFF:
            return produced, pos, "end"
        if tok == 0xFE:
            if mode == "align":
                rem = produced % width
                if rem:
                    produced += width - rem
            continue
        if tok & 0x80:
            ncopy = tok & 0x7F
            if ncopy == 0:
                continue
            if pos >= len(stream):
                return produced, pos, "repeat_overrun"
            pos += 1
            produced += ncopy
        else:
            produced += tok
        if produced > expected:
            return produced, pos, "too_many_pixels"
    return produced, pos, "stream_exhausted"


def decode_probe_u8_rowpair(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    while pos < len(stream):
        tok = stream[pos]
        pos += 1
        if tok == 0xFE and pos < len(stream) and stream[pos] == 0xFF:
            pos += 1
            rem = produced % width
            if rem:
                produced += width - rem
            continue
        if tok == 0xFF:
            return produced, pos, "end"
        if tok == 0xFE:
            if mode == "align":
                rem = produced % width
                if rem:
                    produced += width - rem
            continue
        if tok & 0x80:
            ncopy = tok & 0x7F
            if ncopy == 0:
                continue
            if pos >= len(stream):
                return produced, pos, "repeat_overrun"
            pos += 1
            produced += ncopy
        else:
            produced += tok
        if produced > expected:
            return produced, pos, "too_many_pixels"
    return produced, pos, "stream_exhausted"


def decode_probe_u8_plus1(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    while pos < len(stream):
        tok = stream[pos]
        pos += 1
        if tok == 0xFF:
            return produced, pos, "end"
        if tok == 0xFE:
            if mode == "align":
                rem = produced % width
                if rem:
                    produced += width - rem
            continue
        if tok & 0x80:
            ncopy = (tok & 0x7F) + 1
            if pos >= len(stream):
                return produced, pos, "repeat_overrun"
            pos += 1
            produced += ncopy
        else:
            produced += tok
        if produced > expected:
            return produced, pos, "too_many_pixels"
    return produced, pos, "stream_exhausted"


def decode_probe_u8_rowpair_plus1(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    while pos < len(stream):
        tok = stream[pos]
        pos += 1
        if tok == 0xFE and pos < len(stream) and stream[pos] == 0xFF:
            pos += 1
            rem = produced % width
            if rem:
                produced += width - rem
            continue
        if tok == 0xFF:
            return produced, pos, "end"
        if tok == 0xFE:
            if mode == "align":
                rem = produced % width
                if rem:
                    produced += width - rem
            continue
        if tok & 0x80:
            ncopy = (tok & 0x7F) + 1
            if pos >= len(stream):
                return produced, pos, "repeat_overrun"
            pos += 1
            produced += ncopy
        else:
            produced += tok
        if produced > expected:
            return produced, pos, "too_many_pixels"
    return produced, pos, "stream_exhausted"


def decode_probe_u8_sparse(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    rows = expected // width
    for _ in range(rows):
        col = 0
        while True:
            if pos >= len(stream):
                return produced, pos, "stream_exhausted"
            skip = stream[pos]
            pos += 1
            col += skip
            produced += skip
            if produced > expected or col > width:
                return produced, pos, "too_many_pixels"

            if pos + 1 < len(stream) and stream[pos] == 0xFE and stream[pos + 1] == 0xFF:
                pos += 2
                if mode == "align" and col < width:
                    produced += width - col
                    col = width
                if col != width:
                    return produced, pos, f"row_incomplete:{col}"
                break

            if pos >= len(stream):
                return produced, pos, "stream_exhausted"
            if stream[pos] != 0x00:
                return produced, pos, f"missing_zero_sep:{stream[pos]:02x}"
            pos += 1

            if pos + 1 < len(stream) and stream[pos] == 0xFE and stream[pos + 1] == 0xFF:
                pos += 2
                if mode == "align" and col < width:
                    produced += width - col
                    col = width
                if col != width:
                    return produced, pos, f"row_incomplete:{col}"
                break

            if pos + 2 >= len(stream):
                return produced, pos, "stream_exhausted"
            run_len = stream[pos]
            pos += 1
            if stream[pos] != 0x80:
                return produced, pos, f"missing_run_marker:{stream[pos]:02x}"
            pos += 1
            pos += 1  # color value
            col += run_len
            produced += run_len
            if produced > expected or col > width:
                return produced, pos, "too_many_pixels"

    return produced, pos, "done"


def decode_probe_u16_fill_rows(stream: bytes, expected: int, width: int, mode: str) -> tuple[int, int, str]:
    produced = 0
    pos = 0
    while pos + 1 < len(stream):
        tok = u16le(stream, pos)
        pos += 2
        if tok == 0xFFFF:
            return produced, pos, "end"
        if tok == 0xFFFE:
            if mode == "align":
                rem = produced % width
                if rem:
                    produced += width - rem
            continue
        if tok & 0x8000:
            nfill = tok & 0x7FFF
            if pos >= len(stream):
                return produced, pos, "fill_overrun"
            pos += 1
            produced += nfill
        else:
            produced += tok
        if produced > expected:
            return produced, pos, "too_many_pixels"
    return produced, pos, "stream_exhausted"


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/formats/pzx/10_probe/probe-pzx-token-modes.py path/to/file.pzx [frame_index]")
        raise SystemExit(2)

    path = pathlib.Path(sys.argv[1])
    frame_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0
    data = path.read_bytes()
    blocks = find_zlib_blocks(data)
    frame_block = max(blocks, key=score_frame_block)

    table_bytes = u32le(frame_block, 0)
    entry_count = table_bytes // 4
    offsets = [u32le(frame_block, i * 4) for i in range(entry_count)]

    start = offsets[frame_index]
    end = offsets[frame_index + 1]
    width = u16le(frame_block, start)
    height = u16le(frame_block, start + 2)
    comp_type = u16le(frame_block, start + 4)
    marker = u16le(frame_block, start + 6)
    stream_size = u32le(frame_block, start + 8)

    print(f"file={path}")
    print(
        f"frame[{frame_index}] start={start} end={end} size={end-start} "
        f"wxh={width}x{height} comp={hex(comp_type)} marker={hex(marker)} stream_size={stream_size}"
    )

    expected = width * height
    for rel in range(16, 33):
        stream = frame_block[start + rel:start + 16 + stream_size]
        for parser_name, parser in (
            ("u16", decode_probe_u16),
            ("u8", decode_probe_u8),
            ("u8p", decode_probe_u8_rowpair),
            ("u8+", decode_probe_u8_plus1),
            ("u8p+", decode_probe_u8_rowpair_plus1),
            ("u8s", decode_probe_u8_sparse),
            ("u16f", decode_probe_u16_fill_rows),
        ):
            for mode in ("noop", "align"):
                produced, pos, reason = parser(stream, expected, width, mode)
                print(
                    f"  rel={rel:2d} parser={parser_name:3s} mode={mode:5s} produced={produced:6d} "
                    f"expected={expected:6d} pos={pos:6d} reason={reason}"
                )


if __name__ == "__main__":
    main()

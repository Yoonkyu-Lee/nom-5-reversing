"""
dump-pzx-frame-prefix.py
Dump frame header and the first token candidates for a chosen PZX frame.
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
    out: list[bytes] = []
    seen: set[int] = set()
    for off in range(0, len(data) - 2):
        if data[off] != 0x78 or data[off + 1] not in (0x01, 0x5E, 0x9C, 0xDA):
            continue
        try:
            dec = zlib.decompress(data[off:])
        except zlib.error:
            continue
        if off not in seen:
            out.append(dec)
            seen.add(off)
    return out


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
    return 100 + entry_count


def hexdump(data: bytes, start: int = 0, length: int = 64, width: int = 16) -> str:
    lines = []
    for i in range(0, min(length, len(data) - start), width):
        off = start + i
        chunk = data[off:off + width]
        hex_part = " ".join(f"{b:02x}" for b in chunk)
        asc_part = "".join(chr(b) if 0x20 <= b < 0x7F else "." for b in chunk)
        lines.append(f"  {off:06x}: {hex_part:<{width*3}}  {asc_part}")
    return "\n".join(lines)


def token_summary(stream: bytes, count: int = 12) -> list[str]:
    out: list[str] = []
    pos = 0
    while pos + 1 < len(stream) and len(out) < count:
        tok = u16le(stream, pos)
        pos += 2
        if tok == 0xFFFF:
            out.append("END")
            break
        if tok == 0xFFFE:
            out.append("SEP")
            continue
        if tok & 0x8000:
            ncopy = tok & 0x7FFF
            out.append(f"COPY({ncopy})")
            pos += min(ncopy, max(0, len(stream) - pos))
        else:
            out.append(f"SKIP({tok})")
    return out


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/formats/pzx/00_inspect/dump-pzx-frame-prefix.py path/to/file.pzx [frame_index]")
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
    comp = u16le(frame_block, start + 4)
    marker = u16le(frame_block, start + 6)
    stream_size = u32le(frame_block, start + 8)
    reserved = u32le(frame_block, start + 12)
    stream = frame_block[start + 16:start + 16 + stream_size]

    print(f"file={path}")
    print(
        f"frame[{frame_index}] start={start} end={end} size={end-start} "
        f"wxh={width}x{height} comp={hex(comp)} marker={hex(marker)} stream={stream_size} reserved={reserved}"
    )
    print("header+prefix:")
    print(hexdump(frame_block, start, 80))
    print("token_summary:")
    for tok in token_summary(stream):
        print(f"  {tok}")


if __name__ == "__main__":
    main()

"""
inspect-pzx-block-candidates.py
Inspect zlib block candidates inside a PZX file and summarize frame-like blocks.
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


def find_zlib_blocks(data: bytes) -> list[tuple[int, bytes]]:
    out: list[tuple[int, bytes]] = []
    seen: set[int] = set()
    for off in range(0, len(data) - 2):
        if data[off] != 0x78 or data[off + 1] not in (0x01, 0x5E, 0x9C, 0xDA):
            continue
        try:
            dec = zlib.decompress(data[off:])
        except zlib.error:
            continue
        if off not in seen:
            out.append((off, dec))
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


def summarize_block(dec: bytes) -> str:
    score = score_frame_block(dec)
    if score == 0:
        return "not frame-like"
    table_bytes = u32le(dec, 0)
    entry_count = table_bytes // 4
    offsets = [u32le(dec, i * 4) for i in range(entry_count)]
    start = offsets[0]
    next_off = offsets[1]
    width = u16le(dec, start)
    height = u16le(dec, start + 2)
    comp = u16le(dec, start + 4)
    marker = u16le(dec, start + 6)
    stream = u32le(dec, start + 8)
    reserved = u32le(dec, start + 12)
    return (
        f"score={score} table={table_bytes} entries={entry_count} "
        f"frame0_size={next_off - start} frame0={width}x{height} "
        f"comp={hex(comp)} marker={hex(marker)} stream={stream} reserved={reserved}"
    )


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/formats/pzx/10_probe/inspect-pzx-block-candidates.py path/to/file.pzx")
        raise SystemExit(2)

    path = pathlib.Path(sys.argv[1])
    data = path.read_bytes()
    print(f"file={path} size={len(data)}")
    print(f"header={data[:16].hex()}")
    print(f"fields: a={u32le(data,4)} b={u32le(data,8)} c={u32le(data,12)}")

    blocks = find_zlib_blocks(data)
    print(f"zlib_blocks={len(blocks)}")
    for i, (off, dec) in enumerate(blocks):
        print(f"  block[{i}] off={off:6d} dec_size={len(dec):6d} preview={dec[:16].hex()}")
        print(f"    {summarize_block(dec)}")


if __name__ == "__main__":
    main()

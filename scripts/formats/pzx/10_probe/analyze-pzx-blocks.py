"""
analyze-pzx-blocks.py
Generate a human-readable report for the current PZX findings.

Focus:
- locate zlib blocks
- identify the frame block
- confirm the 16-byte frame header
- dump the first few frame headers
"""

from __future__ import annotations

import pathlib
import struct
import zlib

PZX = pathlib.Path("jadx-out/nom5/resources/assets/figure_icon.pzx")
OUT = pathlib.Path("out/pzx-analysis")
OUT.mkdir(parents=True, exist_ok=True)


def u32(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def u16(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def hexdump(data: bytes, start: int = 0, length: int = 128, width: int = 16) -> str:
    lines = []
    for i in range(0, min(length, len(data) - start), width):
        off = start + i
        chunk = data[off:off + width]
        hex_part = " ".join(f"{b:02x}" for b in chunk)
        asc_part = "".join(chr(b) if 0x20 <= b < 0x7F else "." for b in chunk)
        lines.append(f"  {off:06x}: {hex_part:<{width * 3}}  {asc_part}")
    return "\n".join(lines)


def find_zlib_blocks(data: bytes) -> list[tuple[int, bytes]]:
    results: list[tuple[int, bytes]] = []
    seen: set[int] = set()
    for off in range(0, len(data) - 2):
        if data[off] != 0x78 or data[off + 1] not in (0x01, 0x5E, 0x9C, 0xDA):
            continue
        try:
            dec = zlib.decompress(data[off:])
        except zlib.error:
            continue
        if off not in seen:
            results.append((off, dec))
            seen.add(off)
    return results


def score_frame_block(dec: bytes) -> int:
    if len(dec) < 16:
        return 0
    table_bytes = u32(dec, 0)
    if table_bytes < 8 or table_bytes % 4 != 0 or table_bytes >= len(dec):
        return 0
    entry_count = table_bytes // 4
    if entry_count < 2:
        return 0
    offsets = [u32(dec, i * 4) for i in range(entry_count)]
    if offsets[0] != table_bytes:
        return 0
    if any(o >= len(dec) for o in offsets):
        return 0
    if any(offsets[i] >= offsets[i + 1] for i in range(entry_count - 1)):
        return 0
    return entry_count + 100


def decode_token_stream(stream: bytes, expected_pixels: int) -> int:
    produced = 0
    pos = 0
    while pos + 1 < len(stream):
        tok = u16(stream, pos)
        pos += 2
        if tok == 0xFFFF:
            break
        if tok == 0xFFFE:
            continue
        if tok & 0x8000:
            ncopy = tok & 0x7FFF
            pos += ncopy
            produced += ncopy
        else:
            produced += tok
        if produced > expected_pixels:
            break
    return produced


def main() -> None:
    data = PZX.read_bytes()
    print(f"=== {PZX.name} ({len(data)} bytes) ===")
    print(f"Header: {data[:16].hex()}")
    print(f"  field_a={u32(data, 4)} field_b={u32(data, 8)} field_c={u32(data, 12)}")

    blocks = find_zlib_blocks(data)
    print(f"\nFound {len(blocks)} zlib blocks:")
    for off, dec in blocks:
        print(f"  offset={off:4d} decompressed={len(dec):6d} preview={dec[:8].hex()}")

    best_off, best_dec = max(blocks, key=lambda item: score_frame_block(item[1]))
    print(f"\nFrame block selected: offset={best_off} size={len(best_dec)}")
    OUT.joinpath("largest_block_raw.bin").write_bytes(best_dec)

    table_bytes = u32(best_dec, 0)
    entry_count = table_bytes // 4
    offsets = [u32(best_dec, i * 4) for i in range(entry_count)]

    print(f"  table_bytes={table_bytes} entry_count={entry_count} frame_count={entry_count - 1}")
    for i, off in enumerate(offsets[:12]):
        print(f"  entry[{i:2d}] = {off:6d} (0x{off:04x})")

    print("\nFirst 256 bytes of frame block:")
    print(hexdump(best_dec, 0, 256))

    print("\nFirst 5 frame headers:")
    for i in range(min(5, entry_count - 1)):
        start = offsets[i]
        end = offsets[i + 1]
        width = u16(best_dec, start)
        height = u16(best_dec, start + 2)
        comp_type = u16(best_dec, start + 4)
        marker = u16(best_dec, start + 6)
        stream_size = u32(best_dec, start + 8)
        reserved = u32(best_dec, start + 12)
        produced = decode_token_stream(best_dec[start + 16:start + 16 + stream_size], width * height)
        print(
            f"  frame[{i}] start={start:6d} end={end:6d} size={end - start:4d} "
            f"wxh={width}x{height} comp={hex(comp_type)} marker={hex(marker)} "
            f"stream_size={stream_size} reserved={reserved} decoded_pixels={produced}"
        )

    print("\nFirst frame token stream preview (offset = frame_start + 16):")
    first_stream = offsets[0] + 16
    print(hexdump(best_dec, first_stream, 96))

    palette_blocks = [(off, dec) for off, dec in blocks if len(dec) == 1020]
    if palette_blocks:
        pal_off, pal = palette_blocks[0]
        OUT.joinpath("palette_block_1020.bin").write_bytes(pal)
        print(f"\nPalette-like block: offset={pal_off} size={len(pal)}")
        print(hexdump(pal, 0, 64))


if __name__ == "__main__":
    main()

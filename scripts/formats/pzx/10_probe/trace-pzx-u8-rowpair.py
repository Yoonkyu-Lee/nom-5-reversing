"""
trace-pzx-u8-rowpair.py
Trace the near-match u8 row-pair decoder on a chosen PZX frame.
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


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/formats/pzx/10_probe/trace-pzx-u8-rowpair.py path/to/file.pzx [frame_index]")
        raise SystemExit(2)

    path = pathlib.Path(sys.argv[1])
    frame_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0

    data = path.read_bytes()
    frame_block = max(find_zlib_blocks(data), key=score_frame_block)
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
    stream = frame_block[start + 16:start + 16 + stream_size]

    print(f"file={path}")
    print(
        f"frame[{frame_index}] start={start} end={end} size={end-start} "
        f"wxh={width}x{height} comp={hex(comp)} marker={hex(marker)} stream={stream_size}"
    )

    out_pos = 0
    pos = 0
    step = 0
    while pos < len(stream):
        tok = stream[pos]
        row = out_pos // width
        col = out_pos % width
        pos += 1

        if tok == 0xFE and pos < len(stream) and stream[pos] == 0xFF:
            pos += 1
            rem = out_pos % width
            pad = 0 if rem == 0 else width - rem
            print(
                f"{step:03d}: pos={pos:03d} op=ROWPAIR row={row} col={col} "
                f"pad={pad} out:{out_pos}->{out_pos + pad}"
            )
            out_pos += pad
            step += 1
            continue

        if tok == 0xFF:
            print(f"{step:03d}: pos={pos:03d} op=END row={row} col={col} out={out_pos}")
            break

        if tok == 0xFE:
            print(f"{step:03d}: pos={pos:03d} op=SEP row={row} col={col} out={out_pos}")
            step += 1
            continue

        if tok & 0x80:
            n = tok & 0x7F
            if pos >= len(stream):
                print(f"{step:03d}: pos={pos:03d} op=FILL({n}) ERROR repeat_overrun")
                break
            value = stream[pos]
            pos += 1
            print(
                f"{step:03d}: pos={pos:03d} op=FILL({n}) value={value:02x} "
                f"row={row} col={col} out:{out_pos}->{out_pos + n}"
            )
            out_pos += n
        else:
            print(
                f"{step:03d}: pos={pos:03d} op=SKIP({tok}) "
                f"row={row} col={col} out:{out_pos}->{out_pos + tok}"
            )
            out_pos += tok

        if out_pos > width * height:
            print(f"STOP: overshoot {out_pos} > {width * height}")
            break
        step += 1

    print(f"final_out={out_pos} expected={width * height}")


if __name__ == "__main__":
    main()

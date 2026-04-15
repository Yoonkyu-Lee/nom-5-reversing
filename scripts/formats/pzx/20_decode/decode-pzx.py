"""
decode-pzx.py
Decode NOM5 PZX sprite containers into indexed PNG frames.

Confirmed structure:
- top-level file contains one or more zlib blocks
- one zlib block contains a frame-offset table followed by frame blobs
- frame block starts with u32 offset table where entry[0] == table byte size
- each frame blob uses a 16-byte header:
    [0..1]   u16 width
    [2..3]   u16 height
    [4..5]   u16 comp_type (confirmed: 0xcd02)
    [6..7]   u16 marker (confirmed: 0xcdcd)
    [8..11]  u32 compressed/token-stream size
    [12..15] u32 reserved (observed 0)
    [16..]   token stream

Pixel token stream:
- 0xffff: end
- 0xfffe: no-op / row separator
- 0x8000..0xfffd: copy N literal bytes where N = tok & 0x7fff
- 0x0000..0x7fff: skip N transparent pixels

Additional confirmed variant:
- some files use an 8-bit token stream:
  - 0xff: end
  - 0xfe: separator
  - 0x80..0xfd: repeat next byte N times, N = tok & 0x7f
  - 0x00..0x7f: skip N transparent pixels

Additional confirmed sparse-row variant:
- some files use a 16-bit row-oriented stream:
  - 0xffff: end
  - 0xfffe: row separator
  - 0x8000..0xfffd: repeat next byte N times, N = tok & 0x7fff
  - 0x0000..0x7fff: skip N transparent pixels

Current palette support:
- exact 1020-byte zlib block is treated as 255 RGBA entries
- PNG output prepends implicit palette index 0 = transparent black
"""

from __future__ import annotations

import pathlib
import struct
import sys
import zlib
from dataclasses import dataclass

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
OUT_DIR = pathlib.Path("out/pzx")


def u32le(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def crc32_bytes(chunk_type: bytes, payload: bytes) -> bytes:
    crc = zlib.crc32(chunk_type)
    crc = zlib.crc32(payload, crc)
    return struct.pack(">I", crc & 0xFFFFFFFF)


def png_chunk(chunk_type: bytes, payload: bytes) -> bytes:
    return struct.pack(">I", len(payload)) + chunk_type + payload + crc32_bytes(chunk_type, payload)


def write_indexed_png(
    path: pathlib.Path,
    width: int,
    height: int,
    pixels: bytes,
    palette_rgba: list[tuple[int, int, int, int]],
) -> None:
    if len(pixels) != width * height:
        raise ValueError(f"pixel count mismatch: expected {width * height}, got {len(pixels)}")

    if not palette_rgba:
        palette_rgba = [(i, i, i, 255) for i in range(256)]

    if len(palette_rgba) > 256:
        raise ValueError(f"palette too large: {len(palette_rgba)} entries")

    while len(palette_rgba) < 256:
        palette_rgba.append((0, 0, 0, 255))

    raw_rows = []
    for y in range(height):
        row = pixels[y * width:(y + 1) * width]
        raw_rows.append(b"\x00" + row)
    image_data = zlib.compress(b"".join(raw_rows), level=9)

    ihdr = struct.pack(">IIBBBBB", width, height, 8, 3, 0, 0, 0)
    plte = b"".join(struct.pack("BBB", r, g, b) for r, g, b, _ in palette_rgba)
    trns = bytes(a for _, _, _, a in palette_rgba)

    png = b"\x89PNG\r\n\x1a\n"
    png += png_chunk(b"IHDR", ihdr)
    png += png_chunk(b"PLTE", plte)
    png += png_chunk(b"tRNS", trns)
    png += png_chunk(b"IDAT", image_data)
    png += png_chunk(b"IEND", b"")
    path.write_bytes(png)


@dataclass
class ZlibBlock:
    file_offset: int
    decompressed: bytes


@dataclass
class PZXFrame:
    index: int
    offset: int
    end_offset: int
    width: int
    height: int
    comp_type: int
    marker: int
    compressed_size: int
    reserved: int
    decode_mode: str
    pixels: bytes


def find_zlib_blocks(data: bytes) -> list[ZlibBlock]:
    blocks: list[ZlibBlock] = []
    seen: set[int] = set()
    for off in range(0, len(data) - 2):
        if data[off] != 0x78 or data[off + 1] not in (0x01, 0x5E, 0x9C, 0xDA):
            continue
        try:
            dec = zlib.decompress(data[off:])
        except zlib.error:
            continue
        if off not in seen:
            blocks.append(ZlibBlock(off, dec))
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


def find_frame_block(blocks: list[ZlibBlock]) -> ZlibBlock | None:
    scored = [(score_frame_block(block.decompressed), block) for block in blocks]
    scored = [pair for pair in scored if pair[0] > 0]
    if not scored:
        return None
    scored.sort(key=lambda pair: pair[0], reverse=True)
    return scored[0][1]


def find_palette(blocks: list[ZlibBlock]) -> list[tuple[int, int, int, int]] | None:
    for block in blocks:
        dec = block.decompressed
        if len(dec) != 1020:
            continue
        rgba = [(0, 0, 0, 0)]
        for i in range(0, len(dec), 4):
            rgba.append((dec[i], dec[i + 1], dec[i + 2], dec[i + 3]))
        return rgba
    return None


def decode_token_stream(stream: bytes, expected_pixels: int) -> bytes:
    out = bytearray()
    pos = 0
    while pos + 1 < len(stream):
        tok = u16le(stream, pos)
        pos += 2
        if tok == 0xFFFF:
            break
        if tok == 0xFFFE:
            continue
        if tok & 0x8000:
            ncopy = tok & 0x7FFF
            if pos + ncopy > len(stream):
                raise ValueError(f"copy token overruns stream: pos={pos} ncopy={ncopy} len={len(stream)}")
            out.extend(stream[pos:pos + ncopy])
            pos += ncopy
        else:
            out.extend(b"\x00" * tok)
        if len(out) > expected_pixels:
            raise ValueError(f"decoded too many pixels: {len(out)} > {expected_pixels}")
    if len(out) != expected_pixels:
        raise ValueError(f"decoded {len(out)} pixels, expected {expected_pixels}")
    return bytes(out)


def decode_token_stream_u8(stream: bytes, expected_pixels: int) -> bytes:
    out = bytearray()
    pos = 0
    while pos < len(stream):
        tok = stream[pos]
        pos += 1
        if tok == 0xFF:
            break
        if tok == 0xFE:
            continue
        if tok & 0x80:
            ncopy = tok & 0x7F
            if ncopy == 0:
                continue
            if pos >= len(stream):
                raise ValueError("u8 repeat token overruns stream")
            value = stream[pos]
            pos += 1
            out.extend(bytes([value]) * ncopy)
        else:
            out.extend(b"\x00" * tok)
        if len(out) > expected_pixels:
            raise ValueError(f"decoded too many pixels: {len(out)} > {expected_pixels}")
    if len(out) != expected_pixels:
        raise ValueError(f"decoded {len(out)} pixels, expected {expected_pixels}")
    return bytes(out)


def decode_token_stream_u8_rowpair(stream: bytes, expected_pixels: int, width: int) -> bytes:
    out = bytearray()
    pos = 0
    while pos < len(stream):
        tok = stream[pos]
        pos += 1
        if tok == 0xFE and pos < len(stream) and stream[pos] == 0xFF:
            pos += 1
            rem = len(out) % width
            if rem:
                out.extend(b"\x00" * (width - rem))
            continue
        if tok == 0xFF:
            break
        if tok == 0xFE:
            continue
        if tok & 0x80:
            ncopy = tok & 0x7F
            if ncopy == 0:
                continue
            if pos >= len(stream):
                raise ValueError("u8 rowpair repeat token overruns stream")
            value = stream[pos]
            pos += 1
            out.extend(bytes([value]) * ncopy)
        else:
            out.extend(b"\x00" * tok)
        if len(out) > expected_pixels:
            raise ValueError(f"decoded too many pixels: {len(out)} > {expected_pixels}")
    if len(out) != expected_pixels:
        raise ValueError(f"decoded {len(out)} pixels, expected {expected_pixels}")
    return bytes(out)


def decode_token_stream_u16_fill_rows(stream: bytes, expected_pixels: int, width: int) -> bytes:
    out = bytearray()
    pos = 0
    while pos + 1 < len(stream):
        tok = u16le(stream, pos)
        pos += 2
        if tok == 0xFFFF:
            break
        if tok == 0xFFFE:
            rem = len(out) % width
            if rem:
                out.extend(b"\x00" * (width - rem))
            continue
        if tok & 0x8000:
            nfill = tok & 0x7FFF
            if pos >= len(stream):
                raise ValueError("u16 fill token overruns stream")
            value = stream[pos]
            pos += 1
            out.extend(bytes([value]) * nfill)
        else:
            out.extend(b"\x00" * tok)
        if len(out) > expected_pixels:
            raise ValueError(f"decoded too many pixels: {len(out)} > {expected_pixels}")
    if len(out) != expected_pixels:
        raise ValueError(f"decoded {len(out)} pixels, expected {expected_pixels}")
    return bytes(out)


def try_decode_stream(stream: bytes, width: int, height: int) -> tuple[str, bytes]:
    expected = width * height
    errors: list[str] = []
    for mode in ("u16", "u8", "u8-rowpair", "u16-fill-rows"):
        try:
            if mode == "u16":
                return mode, decode_token_stream(stream, expected)
            if mode == "u8":
                return mode, decode_token_stream_u8(stream, expected)
            if mode == "u8-rowpair":
                return mode, decode_token_stream_u8_rowpair(stream, expected, width)
            return mode, decode_token_stream_u16_fill_rows(stream, expected, width)
        except ValueError as exc:
            errors.append(f"{mode}: {exc}")
    raise ValueError("; ".join(errors))


def parse_frame_block(dec: bytes) -> list[PZXFrame]:
    table_bytes = u32le(dec, 0)
    entry_count = table_bytes // 4
    offsets = [u32le(dec, i * 4) for i in range(entry_count)]
    frames: list[PZXFrame] = []
    for idx in range(entry_count - 1):
        off = offsets[idx]
        next_off = offsets[idx + 1]
        width = u16le(dec, off)
        height = u16le(dec, off + 2)
        comp_type = u16le(dec, off + 4)
        marker = u16le(dec, off + 6)
        compressed_size = u32le(dec, off + 8)
        reserved = u32le(dec, off + 12)
        stream = dec[off + 16:off + 16 + compressed_size]
        decode_mode, pixels = try_decode_stream(stream, width, height)
        frames.append(
            PZXFrame(
                index=idx,
                offset=off,
                end_offset=next_off,
                width=width,
                height=height,
                comp_type=comp_type,
                marker=marker,
                compressed_size=compressed_size,
                reserved=reserved,
                decode_mode=decode_mode,
                pixels=pixels,
            )
        )
    return frames


def decode_pzx(path: pathlib.Path, verbose: bool = True) -> tuple[list[PZXFrame], list[tuple[int, int, int, int]] | None]:
    data = path.read_bytes()
    if data[:4] != b"PZX\x01":
        raise ValueError(f"bad PZX magic: {path}")

    blocks = find_zlib_blocks(data)
    frame_block = find_frame_block(blocks)
    if frame_block is None:
        raise ValueError(f"could not identify frame block in {path}")
    palette = find_palette(blocks)
    frames = parse_frame_block(frame_block.decompressed)

    if verbose:
        print(f"\n=== {path.name} ===")
        print(f"file_size={len(data)} zlib_blocks={len(blocks)} frame_block_off={frame_block.file_offset}")
        if palette:
            print(f"palette_entries={len(palette)}")
        else:
            print("palette_entries=none (using fallback grayscale)")
        print(f"frames={len(frames)}")
        for frame in frames[:5]:
            print(
                f"  frame[{frame.index}] off={frame.offset} size={frame.end_offset - frame.offset} "
                f"{frame.width}x{frame.height} comp={hex(frame.comp_type)} marker={hex(frame.marker)} "
                f"stream={frame.compressed_size} mode={frame.decode_mode}"
            )

    return frames, palette


def decode_one(path: pathlib.Path) -> None:
    frames, palette = decode_pzx(path, verbose=True)
    out_dir = OUT_DIR / path.relative_to(ASSETS)
    out_dir = out_dir.with_suffix("")
    out_dir.mkdir(parents=True, exist_ok=True)

    if palette is None:
        palette = [(0, 0, 0, 0)] + [(i, i, i, 255) for i in range(1, 256)]

    for frame in frames:
        out_path = out_dir / f"frame_{frame.index:04d}.png"
        write_indexed_png(out_path, frame.width, frame.height, frame.pixels, palette.copy())

    print(f"wrote {len(frames)} frames to {out_dir}")


def decode_all(limit: int | None = None) -> None:
    targets = sorted(ASSETS.rglob("*.pzx"))
    if limit is not None:
        targets = targets[:limit]
    print(f"Found {len(targets)} PZX files")
    for path in targets:
        try:
            decode_one(path)
        except Exception as exc:
            print(f"FAILED {path}: {exc}")


def main() -> None:
    if len(sys.argv) > 1:
        arg = sys.argv[1]
        if arg == "--all":
            limit = None
            if len(sys.argv) > 2:
                limit = int(sys.argv[2])
            decode_all(limit=limit)
            return
        decode_one(pathlib.Path(arg))
        return
    decode_one(ASSETS / "figure_icon.pzx")


if __name__ == "__main__":
    main()

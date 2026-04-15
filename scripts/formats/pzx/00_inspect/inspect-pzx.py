"""
inspect-pzx.py
Reverse-engineer the PZX sprite container format used in nom5 assets.
Usage: python scripts/formats/pzx/00_inspect/inspect-pzx.py
"""

import struct
import zlib
import pathlib

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")


def hexrow(data: bytes, offset: int, length: int = 16) -> str:
    chunk = data[offset:offset + length]
    hex_part = " ".join(f"{b:02x}" for b in chunk)
    asc_part = "".join(chr(b) if 0x20 <= b < 0x7f else "." for b in chunk)
    return f"  {offset:06x}: {hex_part:<48}  {asc_part}"


def dump_hex(data: bytes, start: int, rows: int = 8) -> None:
    for i in range(rows):
        off = start + i * 16
        if off >= len(data):
            break
        print(hexrow(data, off))


def inspect_pzx(path: pathlib.Path) -> None:
    data = path.read_bytes()
    print(f"\n=== {path.name}  ({len(data)} bytes) ===")

    # Header
    magic = data[:3]
    version = data[3]
    f4 = struct.unpack_from("<I", data, 4)[0]
    f8 = struct.unpack_from("<I", data, 8)[0]
    f12 = struct.unpack_from("<I", data, 12)[0]
    print(f"  magic={magic!r} ver={version}  [4]={f4}  [8]={f8}  [12]={f12}")

    print("  -- first 64 bytes --")
    dump_hex(data, 0, 4)

    # If f8 looks like a count (1–200) and f12 looks like an entry size, try directory
    if 1 <= f8 <= 200 and 4 <= f12 <= 64:
        count = f8
        entry_sz = f12
        dir_start = 16
        dir_end = dir_start + count * entry_sz
        print(f"\n  Trying: {count} entries x {entry_sz} bytes starting at {dir_start}")
        print(f"  -- directory ({dir_end - dir_start} bytes) --")
        dump_hex(data, dir_start, min(count, 8))

        # Try treating each entry as: compressed_offset(4), compressed_len(4), ...
        print(f"\n  -- entry[0] detail --")
        for i in range(min(count, 3)):
            base = dir_start + i * entry_sz
            fields = [struct.unpack_from("<I", data, base + j * 4)[0]
                      for j in range(entry_sz // 4)]
            print(f"  entry[{i}]: {fields}")

        # Try data section after directory
        data_start = dir_end
        print(f"\n  -- data section from offset {data_start} --")
        dump_hex(data, data_start, 4)

        # Try decompressing first chunk using entry[0] fields
        if entry_sz >= 8:
            e0 = dir_start
            coff = struct.unpack_from("<I", data, e0)[0]
            clen = struct.unpack_from("<I", data, e0 + 4)[0]
            print(f"\n  entry[0] as (offset={coff}, len={clen})")
            # try absolute offset
            if coff + clen <= len(data):
                try:
                    raw = zlib.decompress(data[coff:coff + clen])
                    print(f"  zlib OK (absolute offset): {len(raw)} bytes")
                    dump_hex(raw, 0, 2)
                except zlib.error:
                    pass
            # try relative (data_start + offset)
            abs_off = data_start + coff
            if abs_off + clen <= len(data):
                try:
                    raw = zlib.decompress(data[abs_off:abs_off + clen])
                    print(f"  zlib OK (relative offset): {len(raw)} bytes")
                    dump_hex(raw, 0, 2)
                except zlib.error:
                    pass
            # try just from data_start
            try:
                raw = zlib.decompress(data[data_start:])
                print(f"  zlib OK (from data_start): {len(raw)} bytes")
                dump_hex(raw, 0, 2)
            except zlib.error:
                pass


def main() -> None:
    targets = [
        ASSETS / "figure_icon.pzx",
        ASSETS / "stage" / "map_0.pzx",
        ASSETS / "food.pzx",
    ]
    for t in targets:
        if t.exists():
            inspect_pzx(t)
        else:
            print(f"\nNOT FOUND: {t}")


if __name__ == "__main__":
    main()

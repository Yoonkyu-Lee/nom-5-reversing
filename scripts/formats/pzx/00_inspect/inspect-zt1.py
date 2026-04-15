"""
inspect-zt1.py
Inspect the binary format of .zt1 table files in nom5 assets.
Usage: python scripts/formats/pzx/00_inspect/inspect-zt1.py
"""

import zlib
import struct
import pathlib

ASSETS_TABLE = pathlib.Path("jadx-out/nom5/resources/assets/table")


def try_decompress(data: bytes, offset: int):
    try:
        return zlib.decompress(data[offset:])
    except zlib.error:
        return None


def inspect_file(path: pathlib.Path) -> None:
    data = path.read_bytes()
    print(f"\n=== {path.name} ({len(data)} bytes) ===")
    print(f"  header hex: {data[:16].hex()}")

    # Try known offsets for zlib magic (78 9c / 78 da / 78 01)
    for off in (0, 2, 4, 8):
        if len(data) > off + 2 and data[off] == 0x78 and data[off + 1] in (0x9c, 0xda, 0x01, 0x5e):
            result = try_decompress(data, off)
            if result is not None:
                print(f"  zlib decompress OK from offset {off}: {len(result)} bytes decompressed")
                print(f"  decompressed hex[0:64]: {result[:64].hex()}")
                print(f"  decompressed ascii[0:64]: {repr(result[:64])}")
                # Print header fields for context
                if off >= 8:
                    f0 = struct.unpack_from("<I", data, 0)[0]
                    f1 = struct.unpack_from("<I", data, 4)[0]
                    print(f"  header u32[0]={f0}  u32[1]={f1}  file_size={len(data)}")
                return

    print("  could not decompress — raw bytes only")


def main() -> None:
    files = sorted(ASSETS_TABLE.glob("*.zt1"))
    print(f"Found {len(files)} .zt1 files in {ASSETS_TABLE}")
    for f in files[:5]:
        inspect_file(f)


if __name__ == "__main__":
    main()

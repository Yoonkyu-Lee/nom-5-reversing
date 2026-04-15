"""
inspect-mpl.py

Dump MPL file structure for every .mpl in assets/{boss,stage}.

Format (initial):
  u8   magic = 0x30
  u8   record_count
  u32 × record_count   record_offset[i]
  records           (variable, typically uniform within a file)

Reports per file:
  - magic + count
  - record offsets and computed record sizes
  - first 24 bytes of record 0 in hex
  - whether all records share the same size
"""

from __future__ import annotations

import pathlib
import struct

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
DIRS = [ASSETS / "boss", ASSETS / "stage"]


def parse_mpl(data: bytes) -> dict:
    if len(data) < 2:
        return {"error": f"too short ({len(data)} bytes)"}
    magic = data[0]
    if magic != 0x30:
        return {"error": f"bad magic 0x{magic:02x}"}
    count = data[1]
    table_end = 2 + count * 4
    if table_end > len(data):
        return {"error": "offset table overruns file"}
    offsets = list(struct.unpack_from(f"<{count}I", data, 2))
    record_sizes: list[int] = []
    for i, off in enumerate(offsets):
        end = offsets[i + 1] if i + 1 < count else len(data)
        record_sizes.append(end - off)
    leading_bytes = []
    for off in offsets:
        if off < len(data):
            leading_bytes.append(data[off])
    first_record_hex = (
        data[offsets[0] : offsets[0] + min(24, record_sizes[0])].hex(" ")
        if offsets
        else ""
    )
    uniform = len(set(record_sizes)) <= 1
    return {
        "magic": magic,
        "count": count,
        "offsets": offsets,
        "record_sizes": record_sizes,
        "leading_bytes": leading_bytes,
        "first_record_hex": first_record_hex,
        "uniform_size": uniform,
        "total_size": len(data),
    }


def main() -> None:
    files = []
    for d in DIRS:
        files.extend(sorted(d.glob("*.mpl")))
    print(f"found {len(files)} MPL files\n")
    print(f"{'file':<40} {'sz':>5} {'cnt':>4} {'rsz':>5} {'lead':>6} signature")
    print("-" * 100)
    for p in files:
        info = parse_mpl(p.read_bytes())
        if "error" in info:
            print(f"{p.name:<40} ERROR: {info['error']}")
            continue
        rsz = info["record_sizes"][0] if info["record_sizes"] else 0
        u = "U" if info["uniform_size"] else "V"
        leads = " ".join(f"{b:02x}" for b in set(info["leading_bytes"]))
        print(f"{p.name:<40} {info['total_size']:>5} {info['count']:>4} {rsz:>4}{u} {leads:>6} {info['first_record_hex'][:40]}")


if __name__ == "__main__":
    main()

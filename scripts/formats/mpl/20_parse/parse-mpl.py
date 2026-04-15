"""
parse-mpl.py

Parse NOM5 MPL (Modify Palette List) files.

Format (magic 0x30, 49/50 files):
  u8   magic = 0x30
  u8   record_count
  u32 × record_count   record_offset[i]
  records:
    u8                  entry_count
    u16 × entry_count   RGB565 colors

Each record = one palette variant (e.g. damage flash, team color).
Each u16 entry = one RGB565 color in the variant's palette.

Variant 0x40 (1 file: stage/fiver.mpl): different layout — u16 count, then u16 index
table, then u32 offset table. Not parsed by this script (separate analysis needed).
"""

from __future__ import annotations

import pathlib
import struct


def rgb565_to_rgb888(c: int) -> tuple[int, int, int]:
    r5 = (c >> 11) & 0x1F
    g6 = (c >> 5) & 0x3F
    b5 = c & 0x1F
    r = (r5 << 3) | (r5 >> 2)
    g = (g6 << 2) | (g6 >> 4)
    b = (b5 << 3) | (b5 >> 2)
    return r, g, b


class MPLParseError(Exception):
    pass


def parse_mpl(data: bytes) -> dict:
    if len(data) < 2:
        raise MPLParseError(f"too short ({len(data)} bytes)")
    magic = data[0]
    if magic not in (0x30, 0x40, 0x50):
        raise MPLParseError(f"unknown magic 0x{magic:02x}")

    keys: list[int] | None = None
    if magic == 0x30:
        # standard: u8 count, u32 × count offsets, then records
        count = data[1]
        offset_table_start = 2
    else:  # magic == 0x40 or 0x50 — keyed variant
        # u16 count, u16 × count key_table, u32 × count offsets, then records
        count = struct.unpack_from("<H", data, 1)[0]
        keys = list(struct.unpack_from(f"<{count}H", data, 3))
        offset_table_start = 3 + count * 2

    table_end = offset_table_start + count * 4
    if table_end > len(data):
        raise MPLParseError("offset table overruns file")
    offsets = list(struct.unpack_from(f"<{count}I", data, offset_table_start))

    records = []
    for i, off in enumerate(offsets):
        end = offsets[i + 1] if i + 1 < count else len(data)
        if off >= len(data):
            raise MPLParseError(f"record[{i}] offset {off:#x} >= len {len(data):#x}")
        entry_count = data[off]
        if magic == 0x30:
            expected_size = 1 + entry_count * 2
            if (end - off) != expected_size:
                raise MPLParseError(
                    f"record[{i}] size mismatch: span={end-off} expected={expected_size}"
                )
            entries_raw = data[off + 1 : off + 1 + entry_count * 2]
            entries = list(struct.unpack(f"<{entry_count}H", entries_raw))
        else:
            # 0x40/0x50 keyed records: per-record layout still TBD; store raw payload.
            payload = data[off:end]
            entries = []
        rec = {
            "record_index": i,
            "file_offset": off,
            "entry_count": entry_count,
            "rgb565": entries,
        }
        if keys is not None:
            rec["key"] = keys[i]
        if magic in (0x40, 0x50):
            rec["raw_hex"] = payload.hex()
            rec["size"] = len(payload)
        records.append(rec)

    variant_name = {0x30: "0x30_standard", 0x40: "0x40_keyed", 0x50: "0x50_keyed"}[magic]
    return {
        "magic": magic,
        "variant": variant_name,
        "record_count": count,
        "keys": keys,
        "offsets": offsets,
        "records": records,
        "skipped": False,
    }


def main() -> None:
    import sys
    if len(sys.argv) < 2:
        raise SystemExit("usage: parse-mpl.py <file.mpl>")
    data = pathlib.Path(sys.argv[1]).read_bytes()
    result = parse_mpl(data)
    print(f"magic=0x{result['magic']:02x}  variant={result['variant']}")
    if result["skipped"]:
        print("  (skipped — extended variant)")
        return
    print(f"record_count={result['record_count']}")
    for rec in result["records"]:
        ec = rec["entry_count"]
        print(f"  record[{rec['record_index']}] @{rec['file_offset']:#x}  entries={ec}")
        for j, c in enumerate(rec["rgb565"]):
            r, g, b = rgb565_to_rgb888(c)
            tag = "  (key=transparent)" if c == 0xF81F else ""
            print(f"    [{j:>2}] 0x{c:04x}  RGB({r:>3},{g:>3},{b:>3}){tag}")


if __name__ == "__main__":
    main()

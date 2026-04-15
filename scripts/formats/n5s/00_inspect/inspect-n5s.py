"""
inspect-n5s.py
Initial structural analysis of NOM5 .n5s stage definition files.

Goals:
- Identify header structure
- Extract null-terminated string table (asset name references)
- Identify binary record section after strings
- Find repeating record patterns
- Compare across multiple stage files to find fixed-size record candidates
"""

from __future__ import annotations

import pathlib
import struct
import sys

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
MAP_DIR = ASSETS / "map"
OUT_DIR = pathlib.Path("out/n5s-analysis")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def u8(data: bytes, off: int) -> int:
    return data[off]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def u32le(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def s16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<h", data, off)[0]


def hexdump(data: bytes, start: int = 0, length: int = 128, width: int = 16) -> str:
    lines = []
    for i in range(0, min(length, len(data) - start), width):
        off = start + i
        chunk = data[off : off + width]
        hex_part = " ".join(f"{b:02x}" for b in chunk)
        asc_part = "".join(chr(b) if 0x20 <= b < 0x7F else "." for b in chunk)
        lines.append(f"  {off:06x}: {hex_part:<{width * 3}}  {asc_part}")
    return "\n".join(lines)


def read_cstrings(data: bytes, start: int) -> tuple[list[str], int]:
    """Read consecutive null-terminated strings until a non-printable/empty boundary.
    Returns (strings, end_offset).
    """
    strings: list[str] = []
    pos = start
    while pos < len(data):
        end = data.find(b"\x00", pos)
        if end == -1 or end == pos:
            # empty string terminates the table
            pos = end + 1 if end != -1 else len(data)
            break
        raw = data[pos:end]
        # only ASCII printable counts
        if all(0x20 <= b < 0x7F for b in raw):
            strings.append(raw.decode("ascii"))
            pos = end + 1
        else:
            break
    return strings, pos


def analyze_n5s(path: pathlib.Path, verbose: bool = True) -> dict:
    data = path.read_bytes()
    size = len(data)

    if verbose:
        print(f"\n=== {path.name} ({size} bytes) ===")

    # --- Header bytes ---
    header_raw = data[:12]
    if verbose:
        print(f"Header (12 bytes): {header_raw.hex(' ')}")
        print(f"  as u8:  {list(header_raw)}")
        if size >= 4:
            print(f"  [0..3] u32le = {u32le(data, 0):#010x}  ({u32le(data, 0)})")
        if size >= 8:
            print(f"  [4..7] u32le = {u32le(data, 4):#010x}  ({u32le(data, 4)})")
        if size >= 12:
            print(f"  [8..11] u32le = {u32le(data, 8):#010x}  ({u32le(data, 8)})")

    # --- Scan for string table ---
    # Find first printable-ASCII run >= 3 chars after the header
    string_start = None
    for i in range(4, min(32, size)):
        if 0x20 <= data[i] < 0x7F:
            string_start = i
            break

    strings: list[str] = []
    string_end = size
    if string_start is not None:
        strings, string_end = read_cstrings(data, string_start)

    if verbose:
        print(f"String table: start={string_start} end={string_end} count={len(strings)}")
        for s in strings:
            print(f"  '{s}'")

    # --- Binary section after strings ---
    bin_start = string_end
    bin_data = data[bin_start:]

    if verbose:
        print(f"\nBinary section: offset={bin_start:#x} ({len(bin_data)} bytes)")
        print(hexdump(data, bin_start, min(256, len(bin_data))))

    # --- Scan for repeating record size ---
    # Look for 0xfffe / 0xffff sentinel patterns
    sentinels = []
    for i in range(0, len(bin_data) - 1, 2):
        w = u16le(bin_data, i)
        if w in (0xFFFE, 0xFFFF):
            sentinels.append((i, w))

    if verbose and sentinels:
        print(f"\nSentinel u16 positions in binary section ({len(sentinels)} total):")
        for pos, val in sentinels[:20]:
            print(f"  bin[{pos:#06x}] = {val:#06x}")

    return {
        "path": path,
        "size": size,
        "string_start": string_start,
        "string_end": string_end,
        "strings": strings,
        "bin_start": bin_start,
        "bin_size": len(bin_data),
        "sentinels": sentinels,
    }


def compare_headers(results: list[dict]) -> None:
    print("\n=== Header comparison across all N5S files ===")
    print(f"{'file':<30} {'size':>6} {'h[0]':>4} {'h[1]':>4} {'[0..3]':>12} {'[4..7]':>12} {'strcount':>8} {'strend':>7} {'binsize':>8}")
    for r in sorted(results, key=lambda x: x["path"].name):
        d = r["path"].read_bytes()
        h0 = d[0] if len(d) > 0 else -1
        h1 = d[1] if len(d) > 1 else -1
        w0 = u32le(d, 0) if len(d) >= 4 else -1
        w1 = u32le(d, 4) if len(d) >= 8 else -1
        print(
            f"{r['path'].name:<30} {r['size']:>6} {h0:>4} {h1:>4} "
            f"{w0:#012x} {w1:#012x} {len(r['strings']):>8} {r['string_end']:>7} {r['bin_size']:>8}"
        )


def main() -> None:
    if len(sys.argv) > 1:
        path = pathlib.Path(sys.argv[1])
        analyze_n5s(path, verbose=True)
        return

    n5s_files = sorted(MAP_DIR.glob("*.n5s"))
    print(f"Found {len(n5s_files)} .n5s files")

    results = []
    for path in n5s_files:
        r = analyze_n5s(path, verbose=False)
        results.append(r)

    # Verbose dump of first file only
    print("\n--- Detailed analysis of stage_0.n5s ---")
    analyze_n5s(MAP_DIR / "stage_0.n5s", verbose=True)

    compare_headers(results)

    # Save summary
    out = OUT_DIR / "n5s-summary.txt"
    lines = ["N5S file summary\n", "=" * 60 + "\n"]
    for r in sorted(results, key=lambda x: x["path"].name):
        lines.append(f"\n{r['path'].name} ({r['size']} bytes)\n")
        lines.append(f"  strings ({len(r['strings'])}): {r['strings']}\n")
        lines.append(f"  bin_start={r['bin_start']:#x}  bin_size={r['bin_size']}\n")
        lines.append(f"  sentinels: {len(r['sentinels'])}\n")
    out.write_text("".join(lines), encoding="utf-8")
    print(f"\nSaved summary to {out}")


if __name__ == "__main__":
    main()

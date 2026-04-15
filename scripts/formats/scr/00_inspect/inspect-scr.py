"""
inspect-scr.py
Inspect NOM5 .scr files.

Current heuristics:
- string-table SCR:
  - [0..1]   u16 BE string_count
  - [2..]    (string_count + 1) * u16 LE offsets
  - payloads are EUC-KR strings between offsets
- generic script SCR:
  - scan for inline EUC-KR string candidates prefixed by a u16 LE length
"""

from __future__ import annotations

import pathlib
import struct
import sys


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def u16be(data: bytes, off: int) -> int:
    return struct.unpack_from(">H", data, off)[0]


def is_printable_text(raw: bytes) -> bool:
    if not raw:
        return False
    try:
        text = raw.decode("euc_kr")
    except UnicodeDecodeError:
        return False
    printable = 0
    for ch in text:
        if ch in "\r\n\t":
            printable += 1
        elif 0x20 <= ord(ch) <= 0x7E:
            printable += 1
        elif ord(ch) >= 0xA1:
            printable += 1
    return printable >= max(1, int(len(text) * 0.85))


def parse_string_table(data: bytes) -> list[tuple[int, int, str]] | None:
    if len(data) < 4:
        return None
    count = u16be(data, 0)
    if count == 0 or count > 4096:
        return None
    table_bytes = 2 + (count + 1) * 2
    if table_bytes > len(data):
        return None

    offsets = [u16le(data, 2 + i * 2) for i in range(count + 1)]
    if offsets[0] != table_bytes:
        return None
    if offsets[-1] > len(data):
        return None
    if any(offsets[i] > offsets[i + 1] for i in range(count)):
        return None

    out: list[tuple[int, int, str]] = []
    for idx in range(count):
        start = offsets[idx]
        end = offsets[idx + 1]
        chunk = data[start:end]
        try:
            text = chunk.decode("euc_kr")
        except UnicodeDecodeError:
            return None
        out.append((idx, start, text))
    return out


def scan_inline_strings(data: bytes) -> list[tuple[int, int, str]]:
    out: list[tuple[int, int, str]] = []
    seen: set[tuple[int, int]] = set()
    for off in range(0, len(data) - 3):
        length = u16le(data, off)
        if length < 2 or length > 512:
            continue
        start = off + 2
        end = start + length
        if end > len(data):
            continue
        chunk = data[start:end]
        if not is_printable_text(chunk):
            continue
        key = (start, end)
        if key in seen:
            continue
        seen.add(key)
        out.append((off, length, chunk.decode("euc_kr")))
    return out


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/formats/scr/00_inspect/inspect-scr.py path/to/file.scr")
        raise SystemExit(2)

    path = pathlib.Path(sys.argv[1])
    data = path.read_bytes()
    print(f"file={path}")
    print(f"size={len(data)}")

    table = parse_string_table(data)
    if table is not None:
        print(f"type=string-table count={len(table)}")
        for idx, start, text in table[:16]:
            safe = text.replace("\n", "\\n").encode("unicode_escape").decode("ascii")
            print(f"  [{idx:03d}] off=0x{start:04x} {safe}")
        return

    command_count = data[0] if data else 0
    print(f"type=generic-script command_count={command_count}")
    if len(data) == 3 and data == b"\x02\x00\x01":
        print("  stub_pattern=02 00 01")
        print("  likely means: command_count=2, opcode stream=[0x00, 0x01]")
        return
    matches = scan_inline_strings(data)
    if not matches:
        print("  no inline string candidates found")
        return
    for off, length, text in matches[:24]:
        safe = text.replace("\n", "\\n").encode("unicode_escape").decode("ascii")
        print(f"  len_off=0x{off:04x} len={length:3d} text={safe}")


if __name__ == "__main__":
    main()

"""
dump-so-strings.py
Extract printable strings and ELF section info from libgameDSO.so.
Usage: python scripts/engine/dump-so-strings.py
"""

import re
import struct
import pathlib
import sys

SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")
MIN_LEN = 5


def extract_strings(data: bytes, min_len: int = MIN_LEN):
    """Extract ASCII printable strings of at least min_len characters."""
    pattern = re.compile(rb"[ -~]{" + str(min_len).encode() + rb",}")
    for m in pattern.finditer(data):
        yield m.start(), m.group().decode("ascii", errors="replace")


def parse_elf_header(data: bytes) -> dict:
    if data[:4] != b"\x7fELF":
        return {}
    ei_class = data[4]    # 1=32bit, 2=64bit
    ei_data = data[5]     # 1=LE, 2=BE
    e_type = struct.unpack_from("<H", data, 0x10)[0]
    e_machine = struct.unpack_from("<H", data, 0x12)[0]
    e_entry = struct.unpack_from("<I", data, 0x18)[0]
    e_shoff = struct.unpack_from("<I", data, 0x20)[0]
    e_shnum = struct.unpack_from("<H", data, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", data, 0x32)[0]
    return {
        "class": "32-bit" if ei_class == 1 else "64-bit",
        "endian": "LE" if ei_data == 1 else "BE",
        "type": e_type,
        "machine": hex(e_machine),
        "entry": hex(e_entry),
        "shoff": e_shoff,
        "shnum": e_shnum,
        "shstrndx": e_shstrndx,
    }


def read_section_names(data: bytes, shoff: int, shnum: int, shstrndx: int) -> list[str]:
    shentsize = 40  # 32-bit ELF section header size
    # Read string table section header
    str_sh_off = shoff + shstrndx * shentsize
    str_sh_offset = struct.unpack_from("<I", data, str_sh_off + 16)[0]
    str_sh_size = struct.unpack_from("<I", data, str_sh_off + 20)[0]
    strtab = data[str_sh_offset:str_sh_offset + str_sh_size]

    names = []
    for i in range(shnum):
        sh_off = shoff + i * shentsize
        sh_name_idx = struct.unpack_from("<I", data, sh_off)[0]
        sh_type = struct.unpack_from("<I", data, sh_off + 4)[0]
        sh_size = struct.unpack_from("<I", data, sh_off + 20)[0]
        null_pos = strtab.find(b"\x00", sh_name_idx)
        name = strtab[sh_name_idx:null_pos].decode("ascii", errors="replace")
        names.append((name, sh_type, sh_size))
    return names


def categorize_strings(strings: list[tuple[int, str]]) -> dict[str, list]:
    categories = {
        "jni_functions": [],
        "file_paths_assets": [],
        "network": [],
        "korean_latin_mix": [],
        "format_strings": [],
        "other": [],
    }
    for off, s in strings:
        if s.startswith("Java_"):
            categories["jni_functions"].append((off, s))
        elif any(x in s for x in [".pzx", ".mpl", ".zt1", ".n5s", ".n5m", ".scr", ".ft2", "assets/"]):
            categories["file_paths_assets"].append((off, s))
        elif any(x in s for x in ["http", "://"," ip", "port", "socket", "connect", "server"]):
            categories["network"].append((off, s))
        elif "%" in s and any(c in s for c in "sdif"):
            categories["format_strings"].append((off, s))
        else:
            categories["other"].append((off, s))
    return categories


def main() -> None:
    if not SO_PATH.exists():
        print(f"ERROR: {SO_PATH} not found")
        sys.exit(1)

    data = SO_PATH.read_bytes()
    print(f"File: {SO_PATH}  ({len(data):,} bytes)")

    # ELF header
    elf = parse_elf_header(data)
    if elf:
        print(f"\nELF header:")
        for k, v in elf.items():
            print(f"  {k}: {v}")

        # Section names
        try:
            sections = read_section_names(data, elf["shoff"], elf["shnum"], elf["shstrndx"])
            print(f"\nELF sections ({len(sections)}):")
            for name, stype, size in sections:
                if name:
                    print(f"  {name:<24} type={stype:<3} size={size:,}")
        except Exception as e:
            print(f"  (section parse error: {e})")

    # String extraction
    all_strings = list(extract_strings(data))
    print(f"\nTotal strings (len>={MIN_LEN}): {len(all_strings)}")

    cats = categorize_strings(all_strings)

    print(f"\n=== JNI Functions ({len(cats['jni_functions'])}) ===")
    for off, s in cats["jni_functions"]:
        print(f"  {hex(off):>10}  {s}")

    print(f"\n=== Asset/File Paths ({len(cats['file_paths_assets'])}) ===")
    for off, s in cats["file_paths_assets"][:40]:
        print(f"  {hex(off):>10}  {s}")

    print(f"\n=== Network-related ({len(cats['network'])}) ===")
    for off, s in cats["network"][:30]:
        print(f"  {hex(off):>10}  {s}")

    print(f"\n=== Format Strings (sample 30) ===")
    for off, s in cats["format_strings"][:30]:
        print(f"  {hex(off):>10}  {s}")

    print(f"\n=== Other strings (first 60) ===")
    for off, s in cats["other"][:60]:
        print(f"  {hex(off):>10}  {s}")

    # Write full dump
    out_path = pathlib.Path("logs/libgameDSO-strings.txt")
    out_path.parent.mkdir(exist_ok=True)
    with out_path.open("w", encoding="utf-8") as f:
        for off, s in all_strings:
            f.write(f"{hex(off)}\t{s}\n")
    print(f"\nFull dump written to {out_path}  ({len(all_strings)} entries)")


if __name__ == "__main__":
    main()

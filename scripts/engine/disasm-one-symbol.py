"""
disasm-one-symbol.py
Disassemble one ELF symbol from libgameDSO.so with full instruction output.
"""

from __future__ import annotations

import pathlib
import re
import struct
import sys

from capstone import Cs, CS_ARCH_ARM, CS_MODE_ARM, CS_MODE_THUMB

SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")


def r32(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def r16(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def parse_load_segments(data: bytes):
    e_phoff = r32(data, 0x1C)
    e_phnum = r16(data, 0x2C)
    segments = []
    for i in range(e_phnum):
        ph = e_phoff + i * 32
        if r32(data, ph) != 1:
            continue
        p_offset = r32(data, ph + 4)
        p_vaddr = r32(data, ph + 8)
        p_filesz = r32(data, ph + 16)
        segments.append((p_vaddr, p_offset, p_filesz))
    return segments


def vaddr_to_file_offset(vaddr: int, segments) -> int | None:
    for va, fo, sz in segments:
        if va <= vaddr < va + sz:
            return fo + (vaddr - va)
    return None


def parse_sections(data: bytes):
    e_shoff = r32(data, 0x20)
    e_shnum = r16(data, 0x30)
    e_shstrndx = r16(data, 0x32)
    shent = 40
    str_sh = e_shoff + e_shstrndx * shent
    str_off = r32(data, str_sh + 16)
    str_sz = r32(data, str_sh + 20)
    strtab = data[str_off:str_off + str_sz]
    out = {}
    for i in range(e_shnum):
        sh = e_shoff + i * shent
        ni = r32(data, sh)
        end = strtab.find(b"\x00", ni)
        name = strtab[ni:end].decode("ascii", errors="replace")
        out[name] = {"offset": r32(data, sh + 16), "size": r32(data, sh + 20)}
    return out


def parse_symtab(data: bytes, sections):
    sym_sec = sections[".symtab"]
    str_sec = sections[".strtab"]
    strtab = data[str_sec["offset"]:str_sec["offset"] + str_sec["size"]]
    out = {}
    for i in range(sym_sec["size"] // 16):
        base = sym_sec["offset"] + i * 16
        st_name = r32(data, base)
        st_value = r32(data, base + 4)
        st_size = r32(data, base + 8)
        if st_name == 0 or st_value == 0:
            continue
        end = strtab.find(b"\x00", st_name)
        name = strtab[st_name:end].decode("ascii", errors="replace")
        out[name] = (st_value, st_size)
    return out


def simple_demangle(sym: str) -> str:
    if not sym.startswith("_Z"):
        return sym
    try:
        s = sym[2:]
        parts = []
        if s.startswith("N"):
            s = s[1:]
            while s and s[0] != "E":
                m = re.match(r"(\d+)(.*)", s)
                if not m:
                    break
                n = int(m.group(1))
                s = m.group(2)
                parts.append(s[:n])
                s = s[n:]
            return "::".join(parts)
    except Exception:
        return sym
    return sym


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/engine/disasm-one-symbol.py SYMBOL_SUBSTRING")
        raise SystemExit(2)

    needle = sys.argv[1]
    data = SO_PATH.read_bytes()
    sections = parse_sections(data)
    syms = parse_symtab(data, sections)
    segments = parse_load_segments(data)

    matches = []
    for raw, (value, size) in syms.items():
        dem = simple_demangle(raw)
        if needle in raw or needle in dem:
            matches.append((raw, dem, value, size))
    matches.sort(key=lambda item: item[2])

    if not matches:
        print("no matches")
        return

    raw, dem, value, size = matches[0]
    is_thumb = bool(value & 1)
    real_vaddr = value & ~1
    file_off = vaddr_to_file_offset(real_vaddr, segments)
    if file_off is None:
        print("symbol not mapped to file offset")
        return

    print(f"raw={raw}")
    print(f"demangled={dem}")
    print(f"vaddr={hex(value)} size={size} thumb={is_thumb} file_off={hex(file_off)}")

    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB if is_thumb else CS_MODE_ARM)
    md.skipdata = True
    code = data[file_off:file_off + size]
    for insn in md.disasm(code, real_vaddr):
        print(f"{insn.address:#010x}  {insn.mnemonic:<8} {insn.op_str}")


if __name__ == "__main__":
    main()

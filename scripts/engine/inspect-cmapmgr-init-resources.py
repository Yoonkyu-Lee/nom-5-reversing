"""
inspect-cmapmgr-init-resources.py

Resolve likely PC-relative string references inside CMapMgr_J::Init / CMapMgr_T::Init.
This is a lightweight helper for figuring out which metadata resources those
initializers load before they populate map-related tables such as GetMapOffset().
"""

from __future__ import annotations

import pathlib
import re
import struct
import sys

from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB

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


def get_symbol(data: bytes, needle: str):
    sections = parse_sections(data)
    syms = parse_symtab(data, sections)
    segments = parse_load_segments(data)
    for raw, (value, size) in syms.items():
        if needle in raw:
            real = value & ~1
            return real, size, vaddr_to_file_offset(real, segments), segments
    raise KeyError(needle)


def read_cstring(data: bytes, file_off: int, limit: int = 128) -> str | None:
    if file_off is None or file_off < 0 or file_off >= len(data):
        return None
    end = file_off
    out = []
    while end < len(data) and len(out) < limit:
        b = data[end]
        if b == 0:
            break
        if not (0x20 <= b <= 0x7E):
            return None
        out.append(chr(b))
        end += 1
    if not out:
        return None
    return "".join(out)


def read_nearby_cstring(data: bytes, file_off: int) -> tuple[int, str] | None:
    if file_off is None:
        return None
    for delta in range(0, 4):
        s = read_cstring(data, file_off + delta)
        if s:
            return delta, s
    return None


def literal_word(data: bytes, insn_addr: int, insn_size: int, imm: int, segments) -> int:
    pc = (insn_addr + 4) & ~3
    lit_addr = pc + imm
    file_off = vaddr_to_file_offset(lit_addr, segments)
    if file_off is None:
        raise ValueError(f"literal pool miss @{insn_addr:#x}")
    return r32(data, file_off)


def as_signed32(v: int) -> int:
    return v - 0x100000000 if v & 0x80000000 else v


def inspect_symbol(needle: str) -> None:
    data = SO_PATH.read_bytes()
    real_vaddr, size, file_off, segments = get_symbol(data, needle)
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    md.skipdata = True
    code = data[file_off:file_off + size]
    insns = list(md.disasm(code, real_vaddr))

    print(f"\n== {needle} ==")
    print(f"vaddr={real_vaddr:#x} size={size} file_off={file_off:#x}")

    base_regs: dict[str, int] = {}
    reg_literals: dict[str, tuple[int, int]] = {}

    for i, insn in enumerate(insns):
        text = f"{insn.mnemonic} {insn.op_str}".strip()

        m = re.match(r"ldr\s+(r\d+),\s+\[pc, #0x([0-9a-f]+)\]$", text)
        if m:
            reg = m.group(1)
            imm = int(m.group(2), 16)
            word = literal_word(data, insn.address, insn.size, imm, segments)
            reg_literals[reg] = (word, insn.address)
            continue

        m = re.match(r"add[s]?\s+(r\d+),\s*pc$", text)
        if m:
            reg = m.group(1)
            if reg in reg_literals:
                word, _ = reg_literals[reg]
                base_pc = (insn.address + 4) & ~3
                base_regs[reg] = base_pc + as_signed32(word)
                print(f"{insn.address:#010x}  base-reg {reg} = {base_regs[reg]:#x}")
            continue

        m = re.match(r"add[s]?\s+(r\d+),\s+(r\d+),\s+(r\d+)$", text)
        if m:
            dst, src1, src2 = m.groups()
            if src1 in base_regs and src2 in reg_literals:
                off_word, from_addr = reg_literals[src2]
                target_vaddr = base_regs[src1] + as_signed32(off_word)
                file_target = vaddr_to_file_offset(target_vaddr, segments)
                near = read_nearby_cstring(data, file_target)
                if near:
                    delta, s = near
                    real_vaddr = target_vaddr + delta
                    print(f"{insn.address:#010x}  {dst} = {src1} + {src2} -> {real_vaddr:#x} '{s}'")
                else:
                    preview = ""
                    if file_target is not None:
                        chunk = data[file_target:file_target + 16]
                        preview = chunk.hex(" ")
                    print(
                        f"{insn.address:#010x}  {dst} = {src1} + {src2} -> "
                        f"{target_vaddr:#x} [non-string] {preview}"
                    )


def main() -> None:
    if len(sys.argv) > 1:
        for needle in sys.argv[1:]:
            inspect_symbol(needle)
        return

    inspect_symbol("_ZN9CMapMgr_J4InitEb")
    inspect_symbol("_ZN9CMapMgr_T4InitEb")


if __name__ == "__main__":
    main()

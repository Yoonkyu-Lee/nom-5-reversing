"""
annotate-loadmap.py
Annotate CMap_J::LoadMap and CMap_T::LoadMap disassembly with CInputStream
reader function names, then emit an ordered read-sequence to identify the
N5S/N5M binary format layout.

CInputStream reader addresses (real addr = symbol_value & ~1):
  0x8fc4c  readInt8()
  0x8fc64  readBoolean()
  0x8fc78  readUint8()
  0x8fc84  readInt16()
  0x8fca4  readUint16()
  0x8fcb0  readInt32()
  0x8fce0  readUint32()
  0x8fce8  readInt64()
  0x8fd00  readUint64()
  0x8fd08  skip(int)
  0x8fd10  readData(ptr, n)
  0x8fd30  readString(buf, n)
"""

from __future__ import annotations

import pathlib
import re
import struct
import sys

from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB

SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")

READER_MAP: dict[int, str] = {
    0x8fc4c: "readInt8()",
    0x8fc64: "readBoolean()",
    0x8fc78: "readUint8()",
    0x8fc84: "readInt16()",
    0x8fca4: "readUint16()",
    0x8fcb0: "readInt32()",
    0x8fce0: "readUint32()",
    0x8fce8: "readInt64()",
    0x8fd00: "readUint64()",
    0x8fd08: "skip(int)",
    0x8fd10: "readData(ptr,n)",
    0x8fd30: "readString(buf,n)",
}

# Other interesting call targets (resolved from symbol table)
OTHER_MAP: dict[int, str] = {
    0x8fbfc: "CInputStream::CInputStream(buf)",
    0x8fc18: "CInputStream::~CInputStream()",
    0xa7c14: "?",  # will be resolved below
}


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


def parse_symtab(data: bytes, sections) -> dict[int, str]:
    """Return {real_addr: demangled_name}."""
    sym_sec = sections[".symtab"]
    str_sec = sections[".strtab"]
    strtab = data[str_sec["offset"]:str_sec["offset"] + str_sec["size"]]
    out: dict[int, str] = {}
    for i in range(sym_sec["size"] // 16):
        base = sym_sec["offset"] + i * 16
        st_name = r32(data, base)
        st_value = r32(data, base + 4)
        st_size = r32(data, base + 8)
        if st_name == 0 or st_value == 0:
            continue
        end = strtab.find(b"\x00", st_name)
        name = strtab[st_name:end].decode("ascii", errors="replace")
        real = st_value & ~1
        out[real] = name
    return out


def get_func_code(data: bytes, sym_name_substr: str, sections, symtab_by_addr, segments):
    """Find symbol by name substring, return (real_vaddr, size, file_off)."""
    sym_sec = sections[".symtab"]
    str_sec = sections[".strtab"]
    strtab = data[str_sec["offset"]:str_sec["offset"] + str_sec["size"]]
    for i in range(sym_sec["size"] // 16):
        base = sym_sec["offset"] + i * 16
        st_name = r32(data, base)
        st_value = r32(data, base + 4)
        st_size = r32(data, base + 8)
        if st_name == 0 or st_value == 0:
            continue
        end = strtab.find(b"\x00", st_name)
        raw = strtab[st_name:end].decode("ascii", errors="replace")
        if sym_name_substr in raw:
            real = st_value & ~1
            fo = vaddr_to_file_offset(real, segments)
            return real, st_size, fo, raw
    return None, 0, None, ""


def extract_bl_targets(data: bytes, real_vaddr: int, size: int, file_off: int) -> list[tuple[int, int]]:
    """Return list of (call_site_addr, target_addr) from BL/BLX instructions."""
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    code = data[file_off:file_off + size]
    results = []
    for insn in md.disasm(code, real_vaddr):
        if insn.mnemonic in ("bl", "blx") and insn.op_str.startswith("#"):
            try:
                target = int(insn.op_str.lstrip("#"), 0)
                results.append((insn.address, target))
            except ValueError:
                pass
    return results


def annotate_disasm(data: bytes, real_vaddr: int, size: int, file_off: int,
                    sym_by_addr: dict[int, str], label: str) -> list[str]:
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    code = data[file_off:file_off + size]
    lines = [f"\n{'=' * 70}", f"{label}", f"{'=' * 70}"]
    read_seq: list[str] = []

    for insn in md.disasm(code, real_vaddr):
        annotation = ""
        if insn.mnemonic in ("bl", "blx") and insn.op_str.startswith("#"):
            try:
                target = int(insn.op_str.lstrip("#"), 0)
            except ValueError:
                target = -1
            reader = READER_MAP.get(target)
            if reader:
                annotation = f"  <<< {reader}"
                read_seq.append(reader)
            elif target in sym_by_addr:
                raw = sym_by_addr[target]
                # simplify
                short = raw.split("::")[-1] if "::" in raw else raw
                annotation = f"  <<< {short}"
        line = f"  {insn.address:#010x}  {insn.mnemonic:<8} {insn.op_str:<30}{annotation}"
        lines.append(line)

    lines.append(f"\nRead sequence ({len(read_seq)} calls):")
    for i, r in enumerate(read_seq):
        lines.append(f"  [{i:02d}] {r}")

    return lines, read_seq


def main() -> None:
    data = SO_PATH.read_bytes()
    sections = parse_sections(data)
    segments = parse_load_segments(data)
    sym_by_addr = parse_symtab(data, sections)

    targets = [
        ("CMap_J::LoadMap", "_ZN6CMap_J7LoadMapEhl"),
        ("CMap_T::LoadMap", "_ZN6CMap_T7LoadMapEhl"),
    ]

    out_lines: list[str] = []
    summaries: list[tuple[str, list[str]]] = []

    for label, substr in targets:
        real_vaddr, size, file_off, raw = get_func_code(data, substr, sections, sym_by_addr, segments)
        if file_off is None:
            print(f"[!] {label}: not found")
            continue
        print(f"[+] {label}: vaddr={real_vaddr:#x} size={size} file_off={file_off:#x}")
        lines, read_seq = annotate_disasm(data, real_vaddr, size, file_off, sym_by_addr, label)
        out_lines.extend(lines)
        summaries.append((label, read_seq))

    out_path = pathlib.Path("logs/loadmap-annotated.txt")
    out_path.write_text("\n".join(out_lines), encoding="utf-8")
    print(f"\nFull annotated disasm -> {out_path}")

    print("\n" + "=" * 70)
    print("READ SEQUENCE SUMMARY")
    print("=" * 70)
    for label, seq in summaries:
        print(f"\n{label}:")
        for i, r in enumerate(seq):
            print(f"  [{i:02d}] {r}")


if __name__ == "__main__":
    main()

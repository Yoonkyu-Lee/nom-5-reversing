"""
disasm-pzx-parser.py
Disassemble the PZX parser functions from libgameDSO.so using capstone.
We target CGxPZxParserBase and CGxPZxMgr methods to understand the PZX format.
Usage: python scripts/formats/pzx/90_native-support/disasm-pzx-parser.py
"""

import struct
import pathlib
import re
from capstone import *

SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")
OUT_PATH = pathlib.Path("logs/pzx-parser-disasm.txt")

# ── ELF helpers ────────────────────────────────────────────────────────────────

def r32(data, off): return struct.unpack_from("<I", data, off)[0]
def r16(data, off): return struct.unpack_from("<H", data, off)[0]


def parse_load_segments(data):
    """Return list of (vaddr, file_offset, size) for LOAD segments."""
    e_phoff = r32(data, 0x1c)
    e_phnum = r16(data, 0x2c)
    segments = []
    for i in range(e_phnum):
        ph = e_phoff + i * 32
        p_type = r32(data, ph)
        if p_type != 1:  # PT_LOAD
            continue
        p_offset = r32(data, ph + 4)
        p_vaddr  = r32(data, ph + 8)
        p_filesz = r32(data, ph + 16)
        segments.append((p_vaddr, p_offset, p_filesz))
    return segments


def vaddr_to_file_offset(vaddr, segments):
    for va, fo, sz in segments:
        if va <= vaddr < va + sz:
            return fo + (vaddr - va)
    return None


def parse_elf_sections(data):
    e_shoff = r32(data, 0x20)
    e_shnum = r16(data, 0x30)
    e_shstrndx = r16(data, 0x32)
    SHENT = 40
    str_sh = e_shoff + e_shstrndx * SHENT
    str_off = r32(data, str_sh + 16)
    str_sz  = r32(data, str_sh + 20)
    strtab  = data[str_off:str_off + str_sz]

    secs = {}
    for i in range(e_shnum):
        sh = e_shoff + i * SHENT
        ni = r32(data, sh)
        end = strtab.find(b"\x00", ni)
        name = strtab[ni:end].decode("ascii", errors="replace")
        secs[name] = {
            "offset": r32(data, sh + 16),
            "size":   r32(data, sh + 20),
            "addr":   r32(data, sh + 8),
        }
    return secs


def parse_symtab(data, sections):
    """Return dict name→{value, size} for .symtab."""
    if ".symtab" not in sections or ".strtab" not in sections:
        return {}
    sym_sec = sections[".symtab"]
    str_sec = sections[".strtab"]
    strtab  = data[str_sec["offset"]:str_sec["offset"] + str_sec["size"]]

    syms = {}
    SYMSIZE = 16
    for i in range(sym_sec["size"] // SYMSIZE):
        base = sym_sec["offset"] + i * SYMSIZE
        st_name  = r32(data, base)
        st_value = r32(data, base + 4)
        st_size  = r32(data, base + 8)
        st_info  = data[base + 12]
        st_shndx = r16(data, base + 14)
        if st_name == 0 or st_value == 0:
            continue
        end = strtab.find(b"\x00", st_name)
        name = strtab[st_name:end].decode("ascii", errors="replace")
        if name:
            syms[name] = {"value": st_value, "size": st_size}
    return syms


# ── Disassembly ─────────────────────────────────────────────────────────────────

def disasm_function(data, vaddr, size, segments, is_thumb=False):
    """Disassemble one function; returns list of (addr, mnemonic, op_str)."""
    file_off = vaddr_to_file_offset(vaddr, segments)
    if file_off is None:
        return []
    if is_thumb:
        md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
        raw_addr = vaddr & ~1  # clear Thumb bit
    else:
        md = Cs(CS_ARCH_ARM, CS_MODE_ARM)
        raw_addr = vaddr
    md.detail = False
    code = data[file_off:file_off + max(size, 4)]
    return list(md.disasm(code, raw_addr))


def format_insns(insns, limit=60):
    lines = []
    for i in insns[:limit]:
        lines.append(f"  {i.address:#010x}  {i.mnemonic:<8} {i.op_str}")
    if len(insns) > limit:
        lines.append(f"  ... ({len(insns) - limit} more instructions)")
    return "\n".join(lines)


# ── Target functions ────────────────────────────────────────────────────────────

# We want to find the constructor / Init / Parse functions of:
#   CGxPZxParserBase, CGxPZxMgr, CPzxMgr, CGxPZxFrame
TARGET_PATTERNS = [
    "CGxPZxParserBase",
    "CGxPZxMgr",
    "CPzxMgr",
    "CGxPZxFrame",
    "CGxPZxAni",
    "CGxPZxBitmap",
    "CGxPZxDIB",
    "CPzxSingleBitmap",
    "CPzxDoubleBitmap",
    "CGxMPL",
    "CGxMPLParser",
]


def simple_demangle(sym):
    if not sym.startswith("_Z"):
        return sym
    try:
        s = sym[2:]
        parts = []
        if s.startswith("N"):
            s = s[1:]
            while s and not s[0] in "E":
                m = re.match(r"(\d+)(.*)", s)
                if not m:
                    break
                n = int(m.group(1))
                s = m.group(2)
                parts.append(s[:n])
                s = s[n:]
            return "::".join(parts)
        elif re.match(r"\d", s):
            m = re.match(r"(\d+)(.*)", s)
            if m:
                return m.group(2)[:int(m.group(1))]
    except Exception:
        pass
    return sym


def main():
    data = SO_PATH.read_bytes()
    sections = parse_elf_sections(data)
    segments = parse_load_segments(data)
    syms = parse_symtab(data, sections)

    print(f"Loaded {len(syms)} symbols from {SO_PATH.name}")

    # Filter target symbols
    targets = {}
    for raw_name, info in syms.items():
        demangled = simple_demangle(raw_name)
        for pat in TARGET_PATTERNS:
            if pat in demangled and info["size"] > 4:
                targets[raw_name] = (demangled, info["value"], info["size"])

    print(f"Target functions matching patterns: {len(targets)}")

    lines = [f"# PZX Parser Disassembly\n# Source: {SO_PATH}\n"]

    # Sort by address
    for raw_name, (demangled, vaddr, sz) in sorted(targets.items(), key=lambda x: x[1][1]):
        # ARM Thumb: odd address means Thumb mode
        is_thumb = bool(vaddr & 1)
        real_vaddr = vaddr & ~1

        lines.append(f"\n## {demangled}")
        lines.append(f"#  raw={raw_name}")
        lines.append(f"#  vaddr={hex(vaddr)}  size={sz}  thumb={is_thumb}\n")

        insns = disasm_function(data, real_vaddr, sz, segments, is_thumb=is_thumb)
        if insns:
            lines.append(format_insns(insns, limit=80))
        else:
            lines.append("  (disasm failed)")

    OUT_PATH.parent.mkdir(exist_ok=True)
    OUT_PATH.write_text("\n".join(lines), encoding="utf-8")
    print(f"Disassembly written to {OUT_PATH}")

    # Also print a quick summary to stdout
    print("\n=== Functions found ===")
    for raw_name, (demangled, vaddr, sz) in sorted(targets.items(), key=lambda x: x[1][1]):
        print(f"  {hex(vaddr & ~1):<12} sz={sz:<6}  {demangled}")


if __name__ == "__main__":
    main()

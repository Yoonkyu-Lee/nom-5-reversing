"""
analyze-so-symbols.py
Parse the ELF .dynsym + .symtab from libgameDSO.so to extract all C++ symbols
and demangle them for class/function mapping.
Usage: python scripts/engine/analyze-so-symbols.py
"""

import struct
import re
import pathlib
import sys

SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")

# ── ELF parsing ────────────────────────────────────────────────────────────────

def read_u32(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]

def read_u16(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def parse_elf_sections(data: bytes) -> dict:
    """Return dict of section_name -> (offset, size)."""
    e_shoff  = read_u32(data, 0x20)
    e_shnum  = read_u16(data, 0x30)
    e_shstrndx = read_u16(data, 0x32)

    SHENTSIZE = 40
    # string table
    ss_off = e_shoff + e_shstrndx * SHENTSIZE
    str_data_off = read_u32(data, ss_off + 16)
    str_data_sz  = read_u32(data, ss_off + 20)
    strtab_data  = data[str_data_off : str_data_off + str_data_sz]

    sections = {}
    for i in range(e_shnum):
        sh = e_shoff + i * SHENTSIZE
        name_idx = read_u32(data, sh)
        sh_type  = read_u32(data, sh + 4)
        sh_off   = read_u32(data, sh + 16)
        sh_size  = read_u32(data, sh + 20)
        link     = read_u32(data, sh + 24)
        null_pos = strtab_data.find(b"\x00", name_idx)
        name = strtab_data[name_idx:null_pos].decode("ascii", errors="replace")
        sections[name] = {"offset": sh_off, "size": sh_size,
                          "type": sh_type, "link": link, "index": i}
    return sections


def parse_symtab(data: bytes, symtab_name: str, sections: dict) -> list[dict]:
    """Parse .symtab or .dynsym section."""
    if symtab_name not in sections:
        return []
    sym_sec  = sections[symtab_name]
    str_sec  = sections[".strtab" if symtab_name == ".symtab" else ".dynstr"]

    sym_off   = sym_sec["offset"]
    sym_size  = sym_sec["size"]
    str_off   = str_sec["offset"]
    str_size  = str_sec["size"]
    strtab    = data[str_off : str_off + str_size]

    SYMSIZE = 16  # 32-bit ELF symbol entry
    symbols = []
    for i in range(sym_size // SYMSIZE):
        base   = sym_off + i * SYMSIZE
        st_name  = read_u32(data, base)
        st_value = read_u32(data, base + 4)
        st_size  = read_u32(data, base + 8)
        st_info  = data[base + 12]
        st_other = data[base + 13]
        st_shndx = read_u16(data, base + 14)

        null_pos = strtab.find(b"\x00", st_name)
        name = strtab[st_name:null_pos].decode("ascii", errors="replace")
        stype = st_info & 0xF
        sbind = (st_info >> 4) & 0xF
        symbols.append({
            "name": name, "value": st_value, "size": st_size,
            "type": stype, "bind": sbind, "shndx": st_shndx
        })
    return symbols


# ── Simple C++ demangler for _ZN... ────────────────────────────────────────────

def simple_demangle(sym: str) -> str:
    """Minimal Itanium C++ name demangling for _ZN* symbols."""
    if not sym.startswith("_Z"):
        return sym
    try:
        s = sym[2:]
        parts = []

        def read_len_name(s):
            m = re.match(r"(\d+)(.*)", s)
            if not m:
                return None, s
            n = int(m.group(1))
            rest = m.group(2)
            return rest[:n], rest[n:]

        if s.startswith("N"):      # nested name
            s = s[1:]
            while s and not s.startswith("E"):
                part, s = read_len_name(s)
                if part is None:
                    break
                parts.append(part)
            return "::".join(parts) + ("()" if s else "")
        elif re.match(r"\d", s):   # single name
            part, _ = read_len_name(s)
            return part + "()" if part else sym
        else:
            return sym
    except Exception:
        return sym


# ── Main ───────────────────────────────────────────────────────────────────────

def main() -> None:
    if not SO_PATH.exists():
        print(f"ERROR: {SO_PATH} not found"); sys.exit(1)

    data = SO_PATH.read_bytes()
    sections = parse_elf_sections(data)

    print(f"File: {SO_PATH}  ({len(data):,} bytes)")
    print(f"Sections found: {list(sections.keys())}\n")

    # Parse both symbol tables
    dynsyms = parse_symtab(data, ".dynsym", sections)
    symtab  = parse_symtab(data, ".symtab",  sections)

    print(f".dynsym entries: {len(dynsyms)}")
    print(f".symtab entries: {len(symtab)}")

    # Filter: functions with names
    def is_func(s): return s["name"] and s["type"] in (2, 0) and s["value"] > 0

    funcs_dyn = [s for s in dynsyms if is_func(s)]
    funcs_sym = [s for s in symtab  if is_func(s)]

    # Dedup by name
    all_funcs = {s["name"]: s for s in funcs_dyn}
    all_funcs.update({s["name"]: s for s in funcs_sym})

    print(f"Unique named functions: {len(all_funcs)}\n")

    # Bucket by class prefix
    classes: dict[str, list] = {}
    jni_funcs = []
    c_funcs = []
    for name, sym in sorted(all_funcs.items()):
        demangled = simple_demangle(name)
        if name.startswith("Java_"):
            jni_funcs.append((name, sym["value"], sym["size"]))
        elif "::" in demangled:
            cls = demangled.split("::")[0]
            classes.setdefault(cls, []).append((demangled, sym["value"], sym["size"]))
        else:
            c_funcs.append((demangled, sym["value"], sym["size"]))

    # Print JNI
    print("=== JNI Exports ===")
    for name, addr, sz in sorted(jni_funcs):
        print(f"  {hex(addr):<12} sz={sz:<6} {name}")

    # Print C++ classes
    print(f"\n=== C++ Classes ({len(classes)}) ===")
    for cls in sorted(classes.keys()):
        methods = classes[cls]
        print(f"\n  class {cls}  ({len(methods)} methods)")
        for demangled, addr, sz in sorted(methods, key=lambda x: x[1]):
            print(f"    {hex(addr):<12} sz={sz:<6} {demangled}")

    # Print plain C functions
    print(f"\n=== C / Global Functions ({len(c_funcs)}) ===")
    for demangled, addr, sz in sorted(c_funcs, key=lambda x: x[1])[:80]:
        print(f"  {hex(addr):<12} sz={sz:<6} {demangled}")

    # Write full report
    out_path = pathlib.Path("logs/libgameDSO-symbols.txt")
    out_path.parent.mkdir(exist_ok=True)
    with out_path.open("w", encoding="utf-8") as f:
        for name, sym in sorted(all_funcs.items(), key=lambda x: x[1]["value"]):
            demangled = simple_demangle(name)
            f.write(f"{hex(sym['value'])}\t{sym['size']}\t{name}\t{demangled}\n")
    print(f"\nFull symbol table → {out_path}  ({len(all_funcs)} entries)")


if __name__ == "__main__":
    main()

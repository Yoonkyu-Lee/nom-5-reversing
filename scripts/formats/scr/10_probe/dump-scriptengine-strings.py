"""
dump-scriptengine-strings.py
Resolve the fixed strings used by CScriptEngine constructor and LoadScriptFile.
"""

from __future__ import annotations

import pathlib
import struct


SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")


def r32(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def s32(data: bytes, off: int) -> int:
    return struct.unpack_from("<i", data, off)[0]


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


def thumb_add_pc_base(addr: int) -> int:
    return addr + 4


def thumb_ldr_lit_addr(addr: int, imm: int) -> int:
    return ((addr + 4) & ~0x3) + imm


def read_c_string(data: bytes, segments, vaddr: int) -> str:
    off = vaddr_to_file_offset(vaddr, segments)
    if off is None:
        return f"<unmapped {hex(vaddr)}>"
    end = data.find(b"\x00", off)
    if end == -1:
        end = min(off + 128, len(data))
    return data[off:end].decode("ascii", errors="replace")


def main() -> None:
    data = SO_PATH.read_bytes()
    segments = parse_load_segments(data)

    ctor_base = thumb_add_pc_base(0x000FF480) + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FF474, 0x108), segments)
    )
    ctor_script = ctor_base + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FF47E, 0x104), segments)
    )
    ctor_name = ctor_base + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FF48A, 0x0FC), segments)
    )
    ctor_ext = ctor_base + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FF492, 0x0F8), segments)
    )

    load_base = thumb_add_pc_base(0x000FE87A) + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FE874, 0x200), segments)
    )
    load_script = load_base + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FE8A8, 0x1D4), segments)
    )
    load_ext = load_base + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FE8BA, 0x1C8), segments)
    )
    load_type_table = load_base + s32(
        data, vaddr_to_file_offset(thumb_ldr_lit_addr(0x000FE904, 0x180), segments)
    )

    print("== CScriptEngine constructor ==")
    print(f"rodata_base={ctor_base:#010x}")
    print(f"path0={ctor_script:#010x} text={read_c_string(data, segments, ctor_script)!r}")
    print(f"path1={ctor_name:#010x} text={read_c_string(data, segments, ctor_name)!r}")
    print(f"path2={ctor_ext:#010x} text={read_c_string(data, segments, ctor_ext)!r}")
    print()
    print("== CScriptEngine::LoadScriptFile ==")
    print(f"rodata_base={load_base:#010x}")
    print(f"path0={load_script:#010x} text={read_c_string(data, segments, load_script)!r}")
    print(f"path1=<user-supplied script stem>")
    print(f"path2={load_ext:#010x} text={read_c_string(data, segments, load_ext)!r}")
    print(f"type_table={load_type_table:#010x}")


if __name__ == "__main__":
    main()

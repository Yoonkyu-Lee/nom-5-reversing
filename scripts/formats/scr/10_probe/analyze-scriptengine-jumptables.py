"""
analyze-scriptengine-jumptables.py
Decode selected Thumb switch/jump tables inside CScriptEngine.

This version fixes the PC-relative base math:
- `ldr Rt, [pc, #imm]` uses aligned `(addr + 4) & ~3`
- `add Rd, pc` uses plain `addr + 4`
"""

from __future__ import annotations

import pathlib
import struct


SO_PATH = pathlib.Path("apktool-out/nom5/lib/armeabi/libgameDSO.so")
SYMBOLS_PATH = pathlib.Path("logs/libgameDSO-symbols.txt")


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


def parse_symbols() -> list[tuple[int, int, str]]:
    out = []
    for line in SYMBOLS_PATH.read_text(encoding="utf-8", errors="replace").splitlines():
        parts = line.split("\t")
        if len(parts) < 4:
            continue
        try:
            addr = int(parts[0], 16)
            size = int(parts[1])
        except ValueError:
            continue
        name = parts[3].strip()
        out.append((addr, size, name))
    out.sort()
    return out


def thumb_add_pc_base(addr: int) -> int:
    return addr + 4


def thumb_ldr_lit_addr(addr: int, imm: int) -> int:
    return ((addr + 4) & ~0x3) + imm


def read_s32_at_vaddr(data: bytes, segments, vaddr: int) -> int:
    file_off = vaddr_to_file_offset(vaddr, segments)
    if file_off is None:
        raise RuntimeError(f"vaddr not mapped: {hex(vaddr)}")
    return s32(data, file_off)


def lookup_symbol(vaddr: int, symbols: list[tuple[int, int, str]]) -> str:
    best = "?"
    best_start = -1
    for start, size, name in symbols:
        real = start & ~1
        if real <= vaddr < real + size and real >= best_start:
            best = name
            best_start = real
    return best


INIT_INTERNAL_LABELS = {
    0x000FFB12: "init/no-op -> NextCommand(0)",
    0x000FFB22: "init/internal object field write",
    0x000FFB3E: "Init_SCRIPTCMD_OBJ_MOVE_POS",
    0x000FFB46: "Init_SCRIPTCMD_OBJ_SET_FLIP_LR",
    0x000FFB4E: "Init_SCRIPTCMD_OBJ_SET_POS",
    0x000FFB56: "Init_SCRIPTCMD_OBJ_CHANGE_ANI_INIT",
    0x000FFB5E: "Init_SCRIPTCMD_OBJ_CHANGE_ANI",
    0x000FFB66: "Init_SCRIPTCMD_OBJ_TALKBOX_POS",
    0x000FFB6E: "Init_SCRIPTCMD_OBJ_TALKBOX",
    0x000FFB76: "Init_SCRIPTCMD_OBJ_ENLARGE",
    0x000FFB7E: "init/internal object flag set",
    0x000FFB9C: "Init_SCRIPTCMD_OBJ_CREATE",
    0x000FFBA4: "Init_SCRIPTCMD_RESULT_POPUP",
    0x000FFBAC: "init/internal popup compare/call",
    0x000FFBC2: "init/internal clear popup byte",
    0x000FFBD0: "init/internal popup call",
    0x000FFBDE: "Init_SCRIPTCMD_OBJ_SET_FLIP_UD",
    0x000FFBE6: "init/internal popup method(3,8)",
    0x000FFBFA: "init/internal popup virtual",
    0x000FFC0A: "Init_SCRIPTCMD_SOUND",
    0x000FFC12: "init/internal snprintf-like text copy",
    0x000FFC2A: "init/internal countdown seed",
    0x000FFC30: "Init_SCRIPTCMD_SOUND_EFFECT",
    0x000FFC38: "init/set wait byte 0x78 and NextCommand",
    0x000FFC3C: "Init_SCRIPTCMD_COMMAND_PUSH_END",
    0x000FFC44: "Init_SCRIPTCMD_COMMAND_PUSH_START",
    0x000FFC4C: "Init_SCRIPTCMD_LOAD_RES",
    0x000FFC54: "init/internal virtual + reset",
    0x000FFC64: "init/clear wait byte 0x76 and NextCommand",
}


DO_INTERNAL_LABELS = {
    0x000FEC1C: "do/SOUND_EFFECT pre-handle",
    0x000FEC62: "Do_SCRIPTCMD_FADE_ON",
    0x000FEC6C: "do/countdown tick at recCommand+0x20",
    0x000FEC82: "do/wait until all popup objects settle",
    0x000FECB6: "do/check current object readiness",
    0x000FECD6: "Do_SCRIPTCMD_OBJ_CHANGE_ANI",
    0x000FECE0: "do/clear byte 0x76 and NextCommand",
    0x000FECF2: "do/check object field 0x90",
    0x000FED08: "Do_SCRIPTCMD_SCREEN_SCROLL",
    0x000FED12: "Do_SCRIPTCMD_OBJ_MOVE_POS",
}


LOAD_TYPE_LABELS = {
    0x000FE9F6: "readInt8 -> sign-extend store",
    0x000FE9EE: "readUint8 -> store at arg slot",
    0x000FE988: "readInt16 -> sign-extend store",
    0x000FE980: "readUint16 -> store at arg slot",
    0x000FE978: "readInt32 -> store at arg slot",
    0x000FE956: "readUint32 -> store at arg slot",
    0x000FE9C4: "readUint16 length + readString -> recCommand+0x24",
}


def format_target(vaddr: int, symbols: list[tuple[int, int, str]], labels: dict[int, str]) -> str:
    if vaddr in labels:
        return labels[vaddr]
    return lookup_symbol(vaddr, symbols)


def decode_rel_table(
    data: bytes,
    segments,
    table_base_vaddr: int,
    count: int,
    symbols: list[tuple[int, int, str]],
    labels: dict[int, str],
):
    table_file = vaddr_to_file_offset(table_base_vaddr, segments)
    if table_file is None:
        raise RuntimeError(f"table base not mapped: {hex(table_base_vaddr)}")
    rows = []
    for idx in range(count):
        rel = s32(data, table_file + idx * 4)
        target = (table_base_vaddr + rel) & 0xFFFFFFFF
        rows.append((idx, rel, target, format_target(target, symbols, labels)))
    return rows


def print_rows(rows, prefix: str) -> None:
    for idx, rel, target, name in rows:
        print(f"{prefix}={idx:02d} rel={rel:8d} target={target:#010x} {name}")


def main() -> None:
    data = SO_PATH.read_bytes()
    segments = parse_load_segments(data)
    symbols = parse_symbols()

    init_base0 = thumb_add_pc_base(0x000FFAFC) + read_s32_at_vaddr(
        data, segments, thumb_ldr_lit_addr(0x000FFAF0, 0x184)
    )
    init_table_base = init_base0 + read_s32_at_vaddr(
        data, segments, thumb_ldr_lit_addr(0x000FFB06, 0x174)
    )
    print("== InitScriptEngine opcode jump table ==")
    print(f"rodata_base={init_base0:#010x}")
    print(f"table_base={init_table_base:#010x}")
    print_rows(
        decode_rel_table(data, segments, init_table_base, 0x1F, symbols, INIT_INTERNAL_LABELS),
        "opcode",
    )

    do_base0 = thumb_add_pc_base(0x000FEBDE) + read_s32_at_vaddr(
        data, segments, thumb_ldr_lit_addr(0x000FEBD8, 0x180)
    )
    do_table_base = do_base0 + read_s32_at_vaddr(
        data, segments, thumb_ldr_lit_addr(0x000FEC06, 0x158)
    )
    print()
    print("== DoScriptEngine opcode jump table ==")
    print(f"rodata_base={do_base0:#010x}")
    print(f"table_base={do_table_base:#010x}")
    print_rows(
        decode_rel_table(data, segments, do_table_base, 0x1F, symbols, DO_INTERNAL_LABELS),
        "opcode",
    )

    load_base0 = thumb_add_pc_base(0x000FE87A) + read_s32_at_vaddr(
        data, segments, thumb_ldr_lit_addr(0x000FE874, 0x200)
    )
    load_table_base = load_base0 + read_s32_at_vaddr(
        data, segments, thumb_ldr_lit_addr(0x000FE904, 0x180)
    )
    print()
    print("== LoadScriptFile type-code jump table ==")
    print(f"rodata_base={load_base0:#010x}")
    print(f"table_base={load_table_base:#010x}")
    print_rows(
        decode_rel_table(data, segments, load_table_base, 7, symbols, LOAD_TYPE_LABELS),
        "type",
    )


if __name__ == "__main__":
    main()

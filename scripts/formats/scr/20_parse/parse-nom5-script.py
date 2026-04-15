"""
parse-nom5-script.py
Parse a NOM5 assets/script/*.scr file using assets/script/sFormat.tbl.
"""

from __future__ import annotations

import pathlib
import struct
import sys


TYPE_NAMES = {
    0: "i8",
    1: "u8",
    2: "i16",
    3: "u16",
    4: "i32",
    5: "u32",
    6: "str",
}

OPCODE_NAMES = {
    0: "CLEAR_WAIT_FLAG",
    1: "END_SCRIPT_FINALIZE",
    2: "LOAD_RES",
    3: "COMMAND_PUSH_START",
    4: "COMMAND_PUSH_END",
    5: "ENABLE_SKIP",
    6: "NOOP_ADVANCE",
    7: "WAIT_OBJECTS_SETTLE",
    8: "WAIT_FRAMES",
    9: "VIBRATE",
    10: "SOUND",
    11: "SOUND_STOP",
    12: "SHAKE_SCREEN",
    13: "SCREEN_SCROLL",
    14: "FADE",
    15: "CLEAR_FADE_FLAG",
    16: "END_SCRIPT_NOW",
    17: "RESULT_POPUP",
    18: "OBJ_CREATE",
    19: "OBJ_SET_TALKBOX_MODE",
    20: "OBJ_ENLARGE_SCREEN",
    21: "OBJ_TALKBOX",
    22: "OBJ_TALKBOX_POS",
    23: "OBJ_CHANGE_ANI",
    24: "OBJ_CHANGE_ANI_INIT",
    25: "OBJ_SET_POS",
    26: "OBJ_SET_FLIP_LR",
    27: "OBJ_MOVE_POS",
    28: "OBJ_SET_FSM_DELAY",
    29: "OBJ_SET_FLIP_UD",
    30: "SOUND_EFFECT",
}


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def i16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<h", data, off)[0]


def u32le(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]


def i32le(data: bytes, off: int) -> int:
    return struct.unpack_from("<i", data, off)[0]


def load_schema(path: pathlib.Path) -> list[list[int]]:
    data = path.read_bytes()
    count = data[0]
    off = 1
    out: list[list[int]] = []
    for _ in range(count):
        argc = data[off]
        off += 1
        out.append(list(data[off:off + argc]))
        off += argc
    return out


def decode_euc_kr(raw: bytes) -> str:
    return raw.decode("euc_kr").replace("\n", "\\n")


def safe_text(text: str) -> str:
    return text.encode("unicode_escape").decode("ascii")


def parse_script(data: bytes, schema: list[list[int]]):
    cmd_count = data[0]
    off = 1
    commands = []
    for idx in range(cmd_count):
        if off >= len(data):
            raise ValueError(f"unexpected EOF before command {idx}")
        opcode = data[off]
        off += 1
        if opcode >= len(schema):
            raise ValueError(f"opcode {opcode} out of schema range at command {idx}")
        args = []
        for type_code in schema[opcode]:
            if type_code == 0:
                val = struct.unpack_from("<b", data, off)[0]
                off += 1
            elif type_code == 1:
                val = data[off]
                off += 1
            elif type_code == 2:
                val = i16le(data, off)
                off += 2
            elif type_code == 3:
                val = u16le(data, off)
                off += 2
            elif type_code == 4:
                val = i32le(data, off)
                off += 4
            elif type_code == 5:
                val = u32le(data, off)
                off += 4
            elif type_code == 6:
                length = u16le(data, off)
                off += 2
                raw = data[off:off + length]
                off += length
                val = decode_euc_kr(raw)
            else:
                raise ValueError(f"unknown type code {type_code}")
            args.append((type_code, val))
        commands.append((idx, opcode, args))
    return cmd_count, off, commands


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/formats/scr/20_parse/parse-nom5-script.py path/to/script.scr")
        print("   or: python scripts/formats/scr/20_parse/parse-nom5-script.py --check-all")
        raise SystemExit(2)

    schema_path = pathlib.Path("jadx-out/nom5/resources/assets/script/sFormat.tbl")
    schema = load_schema(schema_path)

    if sys.argv[1] == "--check-all":
        root = pathlib.Path("jadx-out/nom5/resources/assets/script")
        ok = 0
        bad = 0
        for script_path in sorted(root.glob("*.scr")):
            try:
                data = script_path.read_bytes()
                cmd_count, end_off, _commands = parse_script(data, schema)
                full = end_off == len(data)
                print(
                    f"{script_path.name}: commands={cmd_count:3d} end_off=0x{end_off:04x} "
                    f"size=0x{len(data):04x} full={full}"
                )
                if full:
                    ok += 1
                else:
                    bad += 1
            except Exception as exc:
                print(f"{script_path.name}: ERROR {exc}")
                bad += 1
        print(f"summary ok={ok} bad={bad}")
        return

    script_path = pathlib.Path(sys.argv[1])
    data = script_path.read_bytes()
    cmd_count, end_off, commands = parse_script(data, schema)

    print(f"file={script_path}")
    print(f"size={len(data)}")
    print(f"command_count={cmd_count}")
    print(f"end_off=0x{end_off:x}")
    print(f"fully_consumed={end_off == len(data)}")

    for idx, opcode, args in commands:
        name = OPCODE_NAMES.get(opcode, f"OP_{opcode:02d}")
        flat = []
        for type_code, value in args:
            if isinstance(value, str):
                value_repr = safe_text(value)
            else:
                value_repr = str(value)
            flat.append(f"{TYPE_NAMES.get(type_code, '?')}={value_repr}")
        print(f"[{idx:02d}] opcode={opcode:02d} {name} args=[{', '.join(flat)}]")


if __name__ == "__main__":
    main()

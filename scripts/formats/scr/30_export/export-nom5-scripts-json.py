"""
export-nom5-scripts-json.py
Export all NOM5 script/*.scr files into JSON using sFormat.tbl.
"""

from __future__ import annotations

import json
import pathlib
import struct


ROOT = pathlib.Path("jadx-out/nom5/resources/assets/script")
SCHEMA_PATH = ROOT / "sFormat.tbl"
OUT_DIR = pathlib.Path("out/script-json")

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


def parse_script(data: bytes, schema: list[list[int]]):
    cmd_count = data[0]
    off = 1
    commands = []
    for idx in range(cmd_count):
        opcode = data[off]
        off += 1
        args = []
        for type_code in schema[opcode]:
            if type_code == 0:
                value = struct.unpack_from("<b", data, off)[0]
                off += 1
            elif type_code == 1:
                value = data[off]
                off += 1
            elif type_code == 2:
                value = i16le(data, off)
                off += 2
            elif type_code == 3:
                value = u16le(data, off)
                off += 2
            elif type_code == 4:
                value = i32le(data, off)
                off += 4
            elif type_code == 5:
                value = u32le(data, off)
                off += 4
            elif type_code == 6:
                length = u16le(data, off)
                off += 2
                value = data[off:off + length].decode("euc_kr")
                off += length
            else:
                raise ValueError(f"unknown type code {type_code}")
            args.append(
                {
                    "type_code": type_code,
                    "type_name": TYPE_NAMES.get(type_code, f"?{type_code}"),
                    "value": value,
                }
            )
        commands.append(
            {
                "index": idx,
                "opcode": opcode,
                "opcode_name": OPCODE_NAMES.get(opcode, f"OP_{opcode:02d}"),
                "args": args,
            }
        )
    return {"command_count": cmd_count, "end_off": off, "commands": commands}


def main() -> None:
    schema = load_schema(SCHEMA_PATH)
    OUT_DIR.mkdir(parents=True, exist_ok=True)

    exported = 0
    for path in sorted(ROOT.glob("*.scr")):
        data = path.read_bytes()
        parsed = parse_script(data, schema)
        doc = {
            "source_file": path.name,
            "size": len(data),
            "fully_consumed": parsed["end_off"] == len(data),
            "command_count": parsed["command_count"],
            "end_off": parsed["end_off"],
            "commands": parsed["commands"],
        }
        out_path = OUT_DIR / f"{path.stem}.json"
        out_path.write_text(
            json.dumps(doc, ensure_ascii=False, indent=2),
            encoding="utf-8",
        )
        exported += 1

    print(f"exported={exported} out_dir={OUT_DIR}")


if __name__ == "__main__":
    main()

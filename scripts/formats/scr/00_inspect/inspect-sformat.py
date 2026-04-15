"""
inspect-sformat.py
Parse the CScriptEngine schema table in assets/script/sFormat.tbl.
"""

from __future__ import annotations

import pathlib
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


def main() -> None:
    if len(sys.argv) > 1:
        path = pathlib.Path(sys.argv[1])
    else:
        path = pathlib.Path("jadx-out/nom5/resources/assets/script/sFormat.tbl")
    data = path.read_bytes()
    count = data[0]
    off = 1
    print(f"file={path}")
    print(f"size={len(data)}")
    print(f"opcode_count={count}")
    for opcode in range(count):
        argc = data[off]
        off += 1
        raw = list(data[off:off + argc])
        off += argc
        names = [TYPE_NAMES.get(v, f"?{v}") for v in raw]
        print(f"opcode={opcode:02d} argc={argc} types={raw} names={names}")
    print(f"end_off=0x{off:x}")


if __name__ == "__main__":
    main()

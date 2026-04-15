"""
find-opcode-contexts.py
Show surrounding command context for selected opcodes from exported JSON scripts.
"""

from __future__ import annotations

import json
import pathlib
import sys


ROOT = pathlib.Path("out/script-json")


def safe(v):
    if isinstance(v, str):
        return v.encode("unicode_escape").decode("ascii")
    return str(v)


def main() -> None:
    if len(sys.argv) < 2:
        print("usage: python scripts/engine/find-opcode-contexts.py OPCODE [OPCODE ...]")
        raise SystemExit(2)

    wanted = {int(x) for x in sys.argv[1:]}

    for path in sorted(ROOT.glob("*.json")):
        doc = json.loads(path.read_text(encoding="utf-8"))
        cmds = doc["commands"]
        for i, cmd in enumerate(cmds):
            if cmd["opcode"] not in wanted:
                continue
            print(f"== {path.name} idx={i} opcode={cmd['opcode']:02d} {cmd['opcode_name']} ==")
            start = max(0, i - 3)
            end = min(len(cmds), i + 4)
            for j in range(start, end):
                c = cmds[j]
                prefix = "->" if j == i else "  "
                parts = []
                for arg in c["args"]:
                    parts.append(f"{arg['type_name']}={safe(arg['value'])}")
                print(
                    f"{prefix} [{j:02d}] op={c['opcode']:02d} {c['opcode_name']}"
                    f" args=[{', '.join(parts)}]"
                )
            print()


if __name__ == "__main__":
    main()

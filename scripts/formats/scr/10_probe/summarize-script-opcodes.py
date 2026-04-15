"""
summarize-script-opcodes.py
Summarize opcode usage across all exported NOM5 scripts.
"""

from __future__ import annotations

import collections
import json
import pathlib


ROOT = pathlib.Path("out/script-json")


def main() -> None:
    counts = collections.Counter()
    neighbors_prev: dict[int, collections.Counter[int]] = collections.defaultdict(collections.Counter)
    neighbors_next: dict[int, collections.Counter[int]] = collections.defaultdict(collections.Counter)
    arg_values: dict[int, list[list[object]]] = collections.defaultdict(list)
    text_counts = collections.Counter()

    for path in sorted(ROOT.glob("*.json")):
        doc = json.loads(path.read_text(encoding="utf-8"))
        cmds = doc["commands"]
        for i, cmd in enumerate(cmds):
            op = cmd["opcode"]
            counts[op] += 1
            if i > 0:
                neighbors_prev[op][cmds[i - 1]["opcode"]] += 1
            if i + 1 < len(cmds):
                neighbors_next[op][cmds[i + 1]["opcode"]] += 1
            values = [arg["value"] for arg in cmd["args"]]
            if values:
                arg_values[op].append(values)
            if any(arg["type_name"] == "str" for arg in cmd["args"]):
                text_counts[op] += 1

    for op in sorted(counts):
        print(f"opcode={op:02d} count={counts[op]} text_count={text_counts[op]}")
        if arg_values[op]:
            unique = []
            seen = set()
            for vals in arg_values[op]:
                key = tuple(v if not isinstance(v, str) else ("str", v) for v in vals)
                if key in seen:
                    continue
                seen.add(key)
                unique.append(vals)
                if len(unique) >= 8:
                    break
            safe = []
            for row in unique:
                safe.append([v if not isinstance(v, str) else v.encode("unicode_escape").decode("ascii") for v in row])
            print(f"  sample_args={safe}")
        if neighbors_prev[op]:
            prev = ", ".join(f"{k:02d}:{v}" for k, v in neighbors_prev[op].most_common(5))
            print(f"  prev={prev}")
        if neighbors_next[op]:
            nxt = ", ".join(f"{k:02d}:{v}" for k, v in neighbors_next[op].most_common(5))
            print(f"  next={nxt}")


if __name__ == "__main__":
    main()

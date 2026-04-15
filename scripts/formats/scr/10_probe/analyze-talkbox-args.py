from __future__ import annotations

import collections
import json
import pathlib


ROOT = pathlib.Path("out/script-json")


def safe_text(text: str) -> str:
    return text.encode("unicode_escape").decode("ascii")


def main() -> None:
    op21_a1 = collections.Counter()
    op21_a2 = collections.Counter()
    op21_a4 = collections.Counter()
    op21_a5 = collections.Counter()
    op21_a6 = collections.Counter()
    op22_a1 = collections.Counter()
    op22_a2 = collections.Counter()
    op22_a4 = collections.Counter()
    op22_pos = collections.Counter()

    samples21: dict[tuple[int, int, int, int, int], list[tuple[str, str]]] = collections.defaultdict(list)
    samples22: dict[tuple[int, int, int], list[tuple[str, str]]] = collections.defaultdict(list)

    for path in sorted(ROOT.glob("*.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        for cmd in data["commands"]:
            name = cmd["opcode_name"]
            args = cmd["args"]
            if name == "OBJ_TALKBOX":
                a1 = args[1]["value"]
                a2 = args[2]["value"]
                a4 = args[4]["value"]
                a5 = args[5]["value"]
                a6 = args[6]["value"]
                op21_a1[a1] += 1
                op21_a2[a2] += 1
                op21_a4[a4] += 1
                op21_a5[a5] += 1
                op21_a6[a6] += 1
                key = (a1, a2, a4, a5, a6)
                if len(samples21[key]) < 3:
                    samples21[key].append((path.name, args[3]["value"]))
            elif name == "OBJ_TALKBOX_POS":
                a1 = args[1]["value"]
                a2 = args[2]["value"]
                a4 = args[4]["value"]
                x = args[5]["value"]
                y = args[6]["value"]
                op22_a1[a1] += 1
                op22_a2[a2] += 1
                op22_a4[a4] += 1
                op22_pos[(x, y)] += 1
                key = (a1, a2, a4)
                if len(samples22[key]) < 3:
                    samples22[key].append((path.name, args[3]["value"]))

    def dump_counter(title: str, counter: collections.Counter[int | tuple[int, int]]) -> None:
        print(f"== {title} ==")
        for value, count in counter.most_common():
            print(f"{value}: {count}")
        print()

    dump_counter("OBJ_TALKBOX arg1 (talkbox type?)", op21_a1)
    dump_counter("OBJ_TALKBOX arg2 (branch/emotion hint?)", op21_a2)
    dump_counter("OBJ_TALKBOX arg4 (motion id?)", op21_a4)
    dump_counter("OBJ_TALKBOX arg5 (motion option?)", op21_a5)
    dump_counter("OBJ_TALKBOX arg6 (extra int arg)", op21_a6)
    dump_counter("OBJ_TALKBOX_POS arg1 (talkbox type?)", op22_a1)
    dump_counter("OBJ_TALKBOX_POS arg2 (emotion?)", op22_a2)
    dump_counter("OBJ_TALKBOX_POS arg4 (extra int arg)", op22_a4)
    dump_counter("OBJ_TALKBOX_POS positions", op22_pos)

    print("== OBJ_TALKBOX sample combos ==")
    combo21_counts = collections.Counter()
    for path in sorted(ROOT.glob("*.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        for cmd in data["commands"]:
            if cmd["opcode_name"] == "OBJ_TALKBOX":
                args = cmd["args"]
                combo21_counts[
                    (
                        args[1]["value"],
                        args[2]["value"],
                        args[4]["value"],
                        args[5]["value"],
                        args[6]["value"],
                    )
                ] += 1
    for key, count in combo21_counts.most_common(20):
        print(f"{key}: {count}")
        for script_name, text in samples21[key]:
            print(f"  {script_name}: {safe_text(text)}")
    print()

    print("== OBJ_TALKBOX_POS sample combos ==")
    combo22_counts = collections.Counter()
    for path in sorted(ROOT.glob("*.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        for cmd in data["commands"]:
            if cmd["opcode_name"] == "OBJ_TALKBOX_POS":
                args = cmd["args"]
                combo22_counts[
                    (
                        args[1]["value"],
                        args[2]["value"],
                        args[4]["value"],
                    )
                ] += 1
    for key, count in combo22_counts.most_common(20):
        print(f"{key}: {count}")
        for script_name, text in samples22[key]:
            print(f"  {script_name}: {safe_text(text)}")


if __name__ == "__main__":
    main()

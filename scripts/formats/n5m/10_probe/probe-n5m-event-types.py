"""
probe-n5m-event-types.py

Survey all event types across N5M files.
For each raw_type: count, rect[0..5] sample, f20/f22/fea/fec bounds, text count.

Usage:
    python probe-n5m-event-types.py           # summary table
    python probe-n5m-event-types.py 0x13      # detail for one type
"""

from __future__ import annotations

import collections
import importlib.util
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

PROBE_PATH = ROOT / "scripts/formats/n5m/10_probe/probe-n5m-layer-groups.py"
spec = importlib.util.spec_from_file_location("probe_n5m_layer_groups", PROBE_PATH)
PROBE = importlib.util.module_from_spec(spec)
spec.loader.exec_module(PROBE)

EVT_PATH = ROOT / "scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py"
espec = importlib.util.spec_from_file_location("probe_events", EVT_PATH)
EMOD = importlib.util.module_from_spec(espec)
espec.loader.exec_module(EMOD)

from scripts.formats.n5s._frontmatter import parse_frontmatter

MAP_DIR = ROOT / "jadx-out/nom5/resources/assets/map"


def collect_events() -> dict[int, list[dict]]:
    by_type: dict[int, list[dict]] = collections.defaultdict(list)
    for n5m_path in sorted(MAP_DIR.glob("stage_*_m.n5m")):
        sib = PROBE.sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        for blk_idx in range(len(tail)):
            start = tail[blk_idx]
            end = tail[blk_idx + 1] if blk_idx + 1 < len(tail) else len(data)
            info = PROBE.parse_block_layer_groups(data, start, end)
            pos = info["post_groups_start"]
            try:
                section, _ = EMOD.parse_post_group_section(data, pos, end, verbose=False)
                for ll in section.get("layers", []):
                    for path in ll.get("paths", []):
                        for evt in path.get("events", []):
                            evt["_stage"] = n5m_path.stem
                            evt["_block"] = blk_idx
                            by_type[evt["raw_type"]].append(evt)
            except Exception:
                pass
    return by_type


def print_summary(by_type: dict[int, list[dict]]) -> None:
    # DoLogic dispatch classification from disasm
    dologic_action = {
        0x00: "? (not in DoLogic jump table)",
        0x01: "LoadMap: SetScript(3) auto-trigger",
        0x02: "DoLogic: player-enter -> SetScript(4)",
        0x03: "DoLogic: player-enter -> SetScript(5)",
        0x04: "DoLogic: player-enter -> CTalkBox dialog",
        0x05: "DoLogic: noop (return)",
        0x06: "DoLogic: noop (return)",
        0x07: "DoLogic: player-enter -> SetScroll + SetScrollRate x3",
        0x08: "DoLogic: noop",
        0x09: "DoLogic: noop",
        0x0a: "DoLogic: noop",
        0x0b: "DoLogic: noop",
        0x0c: "DoLogic: noop",
        0x0d: "DoLogic: noop",
        0x0e: "DoLogic: noop",
        0x0f: "DoLogic: noop",
        0x10: "DoLogic: player-enter -> CStageGamePopup",
        0x11: "DoLogic: noop",
        0x12: "DoLogic: noop",
        0x13: "DoLogic: noop",
        0x14: "DoLogic: player-enter -> CMonster_Decal spawn (eMonType=0x7d)",
        0x15: "DoLogic: noop",
        0x16: "DoLogic: noop",
        0x17: "DoLogic: player-enter -> path activation (rect[0..1] bounds)",
        0x18: "DoLogic: noop",
        0x19: "DoLogic: unconditional -> path activation",
        0x1a: "DoLogic: immediate -> write rect[0..4] to player fields",
        0x1b: "? (outside DoLogic jump table)",
    }

    print(f"\n{'raw':>6}  {'cnt':>5}  {'rect[0,1,2]_sample':30}  {'f_bounds_sample':35}  notes")
    print("-"*130)
    for rt in sorted(by_type.keys()):
        evts = by_type[rt]
        r012 = [tuple(e["rect"][:3]) for e in evts[:2]]
        f_sample = (evts[0]["f20"], evts[0]["f22"], evts[0]["fea"], evts[0]["fec"])
        ntxt = sum(1 for e in evts if e.get("text_len", 0) > 0)
        action = dologic_action.get(rt, "")
        print(f"{rt:#8x}  {len(evts):>5}  {str(r012):30}  {str(f_sample):35}  txt={ntxt}  {action}")


def print_detail(by_type: dict[int, list[dict]], rt: int) -> None:
    evts = by_type.get(rt, [])
    print(f"\n=== raw_type={rt:#04x}  ({len(evts)} events) ===")
    print(f"{'stage':20}  {'blk':>4}  {'rect[0..5]':35}  {'f20':>6}  {'f22':>6}  {'fea':>6}  {'fec':>6}  text")
    print("-"*115)
    for e in evts[:40]:
        r = str(e["rect"])
        txt = e.get("text", b"")[:20]
        txt_str = txt.decode("euc-kr", errors="replace") if txt else ""
        print(f"{e['_stage']:20}  {e['_block']:>4}  {r:35}  {e['f20']:>6}  {e['f22']:>6}  {e['fea']:>6}  {e['fec']:>6}  {txt_str}")


def main() -> None:
    by_type = collect_events()
    print(f"Collected {sum(len(v) for v in by_type.values())} events across {len(by_type)} types.")

    if len(sys.argv) > 1:
        rt = int(sys.argv[1], 16) if sys.argv[1].startswith("0x") else int(sys.argv[1])
        print_detail(by_type, rt)
    else:
        print_summary(by_type)


if __name__ == "__main__":
    main()

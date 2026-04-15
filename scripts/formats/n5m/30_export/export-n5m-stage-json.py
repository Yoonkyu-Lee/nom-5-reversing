"""
export-n5m-stage-json.py

Export a fully-decoded NOM5 stage (N5S + N5M sibling) to a single JSON file
suitable as engine input.

The output combines:
- N5S front-matter (header, string groups, tail block-offset table)
- N5S tagSObjectInfo records with semantic labels (motion pairs, rewards, dispatch)
- N5M blocks, each with:
    - geometry (width=header_a, height=header_b)
    - flags[0..6] with semantic tags (scroll_phase, reverse_path, ...)
    - back-layer groups (decoded as CBackLayer placements)
    - per-land path layers: nodes + events + objects, with object f3 cross-referenced
      to the tagSObjectInfo entry

Usage:
    python scripts/formats/n5m/30_export/export-n5m-stage-json.py stage_0
    python scripts/formats/n5m/30_export/export-n5m-stage-json.py all          # all stages
    python scripts/formats/n5m/30_export/export-n5m-stage-json.py stage_0 -o out/stage_0.json
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

# Reuse the path-with-events probe as the structural parser.
_PROBE_PATH = ROOT / "scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py"
_SPEC = importlib.util.spec_from_file_location("_n5m_probe", _PROBE_PATH)
assert _SPEC is not None and _SPEC.loader is not None
_PROBE = importlib.util.module_from_spec(_SPEC)
_SPEC.loader.exec_module(_PROBE)  # type: ignore[attr-defined]
parse_block_layer_groups = _PROBE.parse_block_layer_groups
parse_post_group_section = _PROBE.parse_post_group_section

MAP_DIR = ROOT / "jadx-out/nom5/resources/assets/map"
DEFAULT_OUT = ROOT / "out/n5m-stage-json"

# ── Semantic tables (from N5S 40_semantics.md) ────────────────────────────────

DISPATCH_LABEL = {
    0: "trigger_or_invisible",
    1: "minor_variant_1",
    2: "minor_variant_2",
    3: "rare_variant_3",
    4: "monster_standard",
    5: "terrain_bg_tile",
    6: "explosive_special",
    7: "gate_or_nom",
    8: "minor_variant_8",
    10: "rare_variant_10",
}

FLAG_LABEL = {
    0: "scroll_phase",       # 2-bit back-layer scroll counter
    1: "stage_class_1",
    2: "reverse_path",       # 1 = right-to-left / bottom-to-top
    3: "stage_class_3",
    4: "stage_class_4",
    5: "stage_class_5",
    6: "stage_class_6",
}

EVENT_LABEL = {
    0x01: "loadmap_set_script_3",
    0x02: "set_script_4_or_loadmap_3",
    0x03: "set_script_5",
    0x04: "talkbox_dialog",
    0x07: "set_scroll_camera",
    0x11: "boss_terrain_descriptor",
    0x12: "platform_edge_slope",
    0x13: "ground_surface_offset",
    0x14: "spawn_decal_monster",
    0x17: "path_activation",
    0x18: "slope_ramp",
    0x19: "path_activation_alt",
    0x1a: "write_player_fields",
}

# ── Helpers ───────────────────────────────────────────────────────────────────

def stage_files(stage_name: str) -> tuple[pathlib.Path, pathlib.Path]:
    n5s = MAP_DIR / f"{stage_name}.n5s"
    n5m = MAP_DIR / f"{stage_name}_m.n5m"
    if not n5s.exists():
        raise SystemExit(f"missing N5S: {n5s}")
    if not n5m.exists():
        raise SystemExit(f"missing N5M: {n5m}")
    return n5s, n5m


def flatten_string_groups(groups: list[list[str]]) -> list[str]:
    out: list[str] = []
    for g in groups:
        out.extend(g)
    return out


def pzx_name(flat: list[str], idx: int) -> str | None:
    if idx == 0xFFFF:
        return None
    if 0 <= idx < len(flat):
        return flat[idx]
    return None


def export_object_info(rec: dict, flat: list[str]) -> dict:
    u8s = rec["u8"]
    u16s = rec["u16"]
    motion_pairs = [
        {"flag": u8s[i], "motion_id": u8s[i + 6]}
        for i in range(6)
    ]
    pzx_slots = [
        {"slot": i, "raw": u16s[i], "name": pzx_name(flat, u16s[i])}
        for i in range(10)
    ]
    dispatch = u8s[13]
    return {
        "motion_pairs": motion_pairs,
        "eMonsterType": u8s[12],
        "dispatch": dispatch,
        "dispatch_label": DISPATCH_LABEL.get(dispatch, f"unknown_{dispatch}"),
        "damage_pattern_idx": u8s[14],
        "u8_15_boss_flag": u8s[15],
        "pzx_slots": pzx_slots,
        "pzx1": pzx_name(flat, u16s[0]),
        "pzx2": pzx_name(flat, u16s[6]),
        "u16_10_flag": u16s[10],
        "u16_11_flag": u16s[11],
        "combat_param_u16_12": u16s[12],
        "kill_score": u16s[13],
        "energy_delta": u16s[14] if u16s[14] < 0x8000 else u16s[14] - 0x10000,
        "init_hp": u16s[15],
        "nom_point": u16s[16],
        "fiver_coin": u16s[17],
    }


def export_event(ev: dict) -> dict:
    rt = ev["raw_type"]
    out = {
        "raw_type": rt,
        "type_idx": ev["type_idx"],
        "label": EVENT_LABEL.get(rt, "noop_or_unknown"),
        "rect": ev["rect"],
        "f20": ev["f20"], "f22": ev["f22"],
        "fea": ev["fea"], "fec": ev["fec"],
    }
    if ev["text_len"] > 0:
        try:
            out["text"] = ev["text"].decode("euc-kr")
        except UnicodeDecodeError:
            out["text_hex"] = ev["text"].hex()
    return out


def export_object(obj: dict, object_info_count: int) -> dict:
    f3 = obj["f3"]
    out = {
        "f0": obj["f0"], "f1": obj["f1"], "f2": obj["f2"],
        "f3": f3,
        "f3_in_range": f3 < object_info_count,
        "f4": obj["f4"], "f5": obj["f5"], "f6": obj["f6"],
        "init_x": obj["init_x"], "init_y": obj["init_y"],
        "d8": obj["d8"], "da": obj["da"],
        "spawn_x": obj["spawn_x"], "spawn_y": obj["spawn_y"],
    }
    if obj["text_len"] > 0:
        try:
            out["text"] = obj["text"].decode("euc-kr")
        except UnicodeDecodeError:
            out["text_hex"] = obj["text"].hex()
    return out


def export_block(data: bytes, start: int, end: int, object_info_count: int) -> dict:
    info = parse_block_layer_groups(data, start, end)
    section, pos = parse_post_group_section(data, info["post_groups_start"], end, verbose=False)
    if pos != end:
        raise RuntimeError(f"block parse incomplete: stopped at {pos:#x}, expected {end:#x}")

    flags_labeled = {
        FLAG_LABEL[i]: info["flags"][i] for i in range(7)
    }
    back_layers = []
    for gi, group in enumerate(info["groups"]):
        back_layers.append({
            "group_index": gi,
            "elements": [
                {"pzx_mgr": e["a"], "frame": e["b"], "x": e["x"], "y": e["y"]}
                for e in group["elements"]
            ],
        })
    lands = []
    for li, layer in enumerate(section["layers"]):
        paths = []
        for pi, p in enumerate(layer["paths"]):
            paths.append({
                "path_index": pi,
                "nodes": p["nodes"],
                "events": [export_event(e) for e in p["events"]],
                "objects": [export_object(o, object_info_count) for o in p["objects"]],
            })
        lands.append({
            "land_index": li,
            "patt_a": layer["patt_a"],
            "patt_b": layer["patt_b"],
            "paths": paths,
        })
    return {
        "start_offset": start,
        "end_offset": end,
        "width": info["header_a"],
        "height": info["header_b"],
        "flags_raw": info["flags"],
        "flags": flags_labeled,
        "layer_group_count": info["layer_group_count"],
        "back_layers": back_layers,
        "lands": lands,
    }


def export_stage(stage_name: str) -> dict:
    n5s_path, n5m_path = stage_files(stage_name)
    n5s_data = n5s_path.read_bytes()
    n5m_data = n5m_path.read_bytes()
    fm = parse_frontmatter(n5s_data)
    flat = flatten_string_groups(fm["string_groups"])

    object_info = [export_object_info(r, flat) for r in fm["records"]]

    tail = fm["tail_u16"]
    blocks = []
    for bi, start in enumerate(tail):
        end = tail[bi + 1] if bi + 1 < len(tail) else len(n5m_data)
        blocks.append({
            "block_index": bi,
            **export_block(n5m_data, start, end, len(object_info)),
        })

    return {
        "stage": stage_name,
        "n5s_file": n5s_path.name,
        "n5m_file": n5m_path.name,
        "header": {
            "lead_u8": fm["lead_u8"],
            "header_u16": fm["header_u16"],
            "stage_marker": fm["header_u16"][4],
            "is_boss": fm["header_u16"][4] == 0xFFFF,
        },
        "string_groups": fm["string_groups"],
        "flat_pzx_names": flat,
        "object_info": object_info,
        "block_offset_table": tail,
        "blocks": blocks,
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("stage", help="stage name (e.g. stage_0) or 'all'")
    ap.add_argument("-o", "--out", help="output path (single stage) or directory ('all')")
    args = ap.parse_args()

    if args.stage == "all":
        out_dir = pathlib.Path(args.out) if args.out else DEFAULT_OUT
        out_dir.mkdir(parents=True, exist_ok=True)
        stages = sorted({p.stem for p in MAP_DIR.glob("*.n5s")})
        ok = fail = 0
        for s in stages:
            try:
                doc = export_stage(s)
                (out_dir / f"{s}.json").write_text(json.dumps(doc, ensure_ascii=False, indent=2), encoding="utf-8")
                ok += 1
                print(f"  OK   {s}.json")
            except Exception as e:
                fail += 1
                print(f"  FAIL {s}: {e}")
        print(f"\n{ok}/{ok+fail} stages exported to {out_dir}")
    else:
        doc = export_stage(args.stage)
        out_path = pathlib.Path(args.out) if args.out else DEFAULT_OUT / f"{args.stage}.json"
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(json.dumps(doc, ensure_ascii=False, indent=2), encoding="utf-8")
        print(f"wrote {out_path}  ({out_path.stat().st_size:,} bytes)")


if __name__ == "__main__":
    main()

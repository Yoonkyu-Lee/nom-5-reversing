# NOM5 Active Workboard

- Last updated: 2026-04-14
- Current objective: recover format and engine meaning for faithful recreation
- Session guide: [00_session-start-guide.md](./00_session-start-guide.md)

---

## Current Track

### Primary

- `F3 Map / Stage Formats`
- focus file: [00_status.md](../30_formats/40_n5m/00_status.md)
- focus scripts:
  - `scripts/formats/n5m/00_inspect/inspect-n5m.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-block-prefixes.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-block-header.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-layer-groups.py`
  - `scripts/formats/n5m/10_probe/summarize-n5m-header-fields.py`
  - `scripts/formats/n5s/10_probe/probe-n5s-frontmatter.py`
  - `scripts/formats/n5s/10_probe/compare-n5s-tail-to-n5m.py`

### Secondary

- `F2 Script System`
- focus file: [00_status.md](../30_formats/20_scr/00_status.md)
- focus scripts:
  - `scripts/formats/scr/20_parse/parse-nom5-script.py`
  - `scripts/formats/scr/30_export/export-nom5-scripts-json.py`
  - `scripts/formats/scr/10_probe/analyze-talkbox-args.py`

---

## Session Progress (2026-04-14)

- `header_a/header_b` confirmed: block width × height in game units
- Event types surveyed: 24 types (raw 0x00..0x1b); raw=1/2→SetScript(3/4); raw=4→dialog with text
- Object types surveyed: f3 range 0..28; CMonster_J/Decal/Shoting instantiation paths located
- Group elements decoded: `(pzx_mgr, frame, x, y)` → `CBackLayer` objects — the early groups ARE the back-layer section

---

## Current State Summary

- `PZX`: exact decode available
- `ZT1`: done
- `SCR`: structure parse done, semantics recovery in progress
- `N5S`: front-matter exact parse secured (`u8 + u16*5 + 5 string groups + 0x34 record table + trailing u16 table`)
- `N5S`: trailing `u16` table is better explained as sibling `N5M` block indices than raw `.n5s` body offsets
- `N5M`: `InitMap -> stage_<id>_m.n5m -> constructor -> LoadMap(resource_ptr)` path secured
- `N5M`: `header_a` = **block width** in game units; `header_b` = **block height** in game units (confirmed across all 21 files via max_node_x and y-bounds; exact match in vertical stages)
- `N5M`: the old fixed `0x11` header is no longer the best boundary
- `N5M`: a stronger variable early-body prefix now fits all samples:
  - `u16, u16, flags[7], layer_group_count=3`
  - then counted group elements currently best parsed as `(u8, u8, i16, i16)`
- `N5M`: `LoadMap` read alignment now strongly favors `GetMapOffset(stage_id) -> block_start`
- `N5M`: current `post_groups_start` families are `0x15 / 0x1b / 0x21`
- `N5M`: body prefixes at `post_groups_start` still cluster by stage family, suggesting a small number of recurring body grammars
- `N5M`: several body families are shared across stage pairs, so the next parser should target family-level grammars rather than one stage at a time
- current exact shared-prefix examples:
  - `stage_26_s / stage_9_s`
  - `stage_0 / stage_22`
  - `stage_17 / stage_6`
  - `stage_20 / stage_4`
  - `stage_10 / stage_25`
- `N5M`: strongest current pairwise matches are:
  - `stage_17 / stage_6` with `64-69` matching bytes after `post_groups_start`
  - `stage_20 / stage_4` with `64-80` matching bytes after `post_groups_start`
- `N5M`: first family-specific post-group section is now recovered:
  - `stage_17 / stage_6`:
    - `land_layer_count=1`
    - `pattern_count_a=10`, `pattern_count_b=0`, `path_count=3`
    - confirmed on block 0 and block 1
  - `stage_20 / stage_4`:
    - `land_layer_count=2`
    - layer 0 matches the same section grammar strongly
    - layer 1 still diverges
- `N5M`: early group elements = `CBackLayer` definitions: `(pzx_mgr, frame, x, y)` → back layer tile placements; early groups ARE the back-layer section
- `N5M`: event types surveyed: 24 distinct types (raw 0x00..0x1b); raw=1→SetScript(3), raw=2→SetScript(4), raw=4→dialog (always has text); full classification pending `CEventRect_J` analysis
- `N5M`: object types surveyed: f3 range 0..28; CMonster_J/Decal/Shoting instantiation paths located; full mapping pending `GetObjectInfo(f3)` table
- `N5M`: **BREAKTHROUGH — full block parser complete:**
  - Previous parser only read `nc + nodes` per path layer; events/objects were misread as next path's nc
  - Fixed: each path layer = `nc+nodes + event_count+events + obj_count+objects`
  - Validated: **21/21 N5M files, all blocks parse to EOF**
  - Script: `scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py`
- `MPL`: untouched

---

## Immediate Questions

1. What do `flags[7]` represent per-block?
2. What engine object does the `N5S 0x34` record table describe?
3. Where do `CMap_J::LoadMap` and `CMap_T::LoadMap` diverge?
4. What are the 24 `CEventRect_J` subtypes (raw_type 0x00..0x1b) doing?

---

## Next Concrete Tasks

1. ~~Recover `header_a/header_b` semantics~~ **DONE** — width × height in game units.
2. ~~Event type survey~~ **DONE** — 24 types raw 0..27; dispatch recovered.
3. ~~Object type survey~~ **DONE** — f3 range 0..28; CMonster paths located.
4. ~~Classify early group elements~~ **DONE** — `(pzx_mgr, frame, x, y)` → `CBackLayer` objects.
5. Understand N5S `0x34` record table (secondary track).
6. Recover full event type meanings: `CEventRect_J` vtable / dispatch table analysis.
7. Recover full object type mapping: `GetObjectInfo(f3)` dispatch table analysis.
8. N5M → JSON export (defer until semantics are more complete).

---

## Session Exit Rule

At session end, update at least one of:

1. discovery notes in the active track documents
2. `Current State Summary` or `Next Concrete Tasks` in this workboard

## Script Writing Rule

- Quick inline verification (`python -c "..."`) is fine for one-off checks.
- For any decisive structural parser, validator, or exporter: write a proper script under `scripts/formats/<fmt>/<stage>/` and run it directly via .venv.
- Do not leave important analysis logic only in inline commands.

## Mid-Session Update Rule

Even if work is incomplete, update docs when one of these turning points happens.

Do not log every trial-and-error step. Only write the turning point, the conclusion, and the next action. Keep detailed repeated experiments inside scripts or dedicated analysis outputs only when needed.

- a hypothesis is disproven
- a new variant or exception is found
- the parser boundary changes
- a loader function/path is secured
- a field or opcode meaning is confirmed
- the next session's primary track changes

Minimum update targets:

1. the active track's `90_todo.md`
2. the active track's `00_status.md`

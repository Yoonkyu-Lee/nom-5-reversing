# NOM5 Engine Behavior Reverse-Engineering Track

- Started: 2026-04-15
- Goal: recover runtime behavior (FSM/physics/AI) from `libgameDSO.so` so the
  exported data formats (PZX/N5M/N5S/SCR/MPL) can be turned into a playable engine.

## Relationship to Data-Format Track

Data-format docs (`docs/30_formats/`) describe **what bytes mean on disk**.
This track describes **what the engine does with those bytes at runtime**.

Cross-reference convention: when an engine doc references a data-format field, use
the canonical name from `docs/30_formats/<fmt>/40_semantics.md` (e.g.
`tagSObjectInfo.u16[15] = initial HP`).

## Sub-tracks

| Folder | Scope |
|--------|-------|
| `10_runtime_objects/` | Runtime object layouts (`CMonster`, `CNom`, `CScriptObject`, `CMap_J`) — field offsets and their roles |
| `20_fsm/` | Finite state machines: per-state init/do handlers, transitions, dispatch tables |
| `30_physics/` | Collision detection, terrain physics, camera/scrolling |
| `40_subsystems/` | UI/score/sound/particle systems (`CNomUI`, `CGsSound`, `CGsEmitter`) |
| `50_init_flow/` | Stage load sequences: how data files become runtime objects |

## Each doc follows three sections

1. **Field map** — runtime object offsets touched by this code path
2. **Pseudocode** — decompiled-style flow with disasm anchors (`@0xab1234`)
3. **Call graph** — who calls in, who's called out

## Standard reference

- Disasm helper: `scripts/engine/disasm-one-symbol.py SYMBOL_SUBSTR`
- Symbol log: `logs/libgameDSO-symbols.txt`
- Existing per-function disasm dumps: `logs/*.txt` (cmapmgr-*, map-*, etc.)

## Priority order (current)

1. ✓ Overview (this doc)
2. **`10_runtime_objects/CMonster_fields.md`** — consolidate already-known offsets
3. `20_fsm/CScriptEngine_dispatch.md` — 31 opcode handlers in inline switch
4. `20_fsm/CMonster_ACTIVE.md` — AI behavior, biggest unknown
5. `30_physics/terrain_events.md` — Track A #1 absorbed
6. `50_init_flow/stage_load_flow.md` — CMapMgr_J::Init → LoadMap data flow

# NOM5 Active Workboard

- Last updated: 2026-04-15
- Objective: recover format and engine meaning for faithful recreation
- Session guide: [00_session-start-guide.md](./00_session-start-guide.md)

---

## Format Analysis Status

| Format | % | State |
|--------|---|-------|
| PZX    | ~95% | decoder + rendering verified |
| ZT1    | ~95% | done |
| N5S    | ~95% | front-matter + tagSObjectInfo fully decoded |
| N5M    | ~95% | structure + semantics + JSON export; terrain events clarified (case 24/18/17 decoded, raw 0x11 vestigial) |
| SCR    | ~90% | 31 opcodes decoded; JSON export with arg labels |
| MPL    | ~92% | Modify Palette List; 91/91 exported; keyed 0x40/0x50 headers decoded |

**Overall data-format average: ~94%**

---

## Track B: Engine Behavior RE — COMPREHENSIVE COVERAGE

Folder: `docs/40_engine/`. All core engine systems documented.

**Overall engine-behavior coverage: ~95%**

### Runtime object maps (`10_runtime_objects/`)
- `CMonster_fields.md` — 30+ field offsets; motion pairs, rewards, HP, eMonType
- `CNom_fields.md` — player field map + FSM state list
- `CMap_J_fields.md` — stage map instance + flags[0..5] offset mapping

### FSM documentation (`20_fsm/`)
- `CScriptEngine_dispatch.md` — 31 SCR opcode handlers
- `CMonster_ACTIVE.md` — 12-case subtype dispatch (5 unique) + 7 eMonType special branches
- `CMonster_DAMAGE.md` — 13-case jump table fully decoded
- `CNom_movement.md` — KeyLogic + jump/attack variants
- `CScriptObject_queue.md` — 3-type queue (idle/MOVE_POS/CHANGE_ANI)
- `CBossGameBase.md` — HP-tier balance system + effect API
- `boss_classes.md` — 5 bosses + 11 player variants + 6 scenes, full FSM trees
- `boss_satellite_objects.md` — bullets, segments, projectiles, energy waves
- `monster_bullets.md` — `FireBullet` trajectory system

### Physics (`30_physics/`)
- `collision_player_monster.md` — CheckCrashToNom reward fanout
- `terrain_events.md` — 25-case CEventRect_J dispatch + slope-field mystery
- `camera_scroll.md` — DoMapScroll family + CBackLayer internals
- `path_snap.md` — CPath API + GetCorrectionMovePos skeleton
- `player_physics.md` — CObject::DoPathLogic integrator, gravity=8 for JUMP_HIGH

### Subsystems (`40_subsystems/`)
- `CNomUI_score.md` — full HUD API + stage-number dispatch table (70 funcs, 0..30 mapped)
- `CBossUi.md` — boss-dedicated HP bar (Silkworm) + hard-mode damage scaling

### Init flow (`50_init_flow/`)
- `stage_load_flow.md` — CMapMgr_J::Init → LoadMap pipeline
- `object_spawn.md` — N5M f0..f6 + i16 position + text → runtime CMonster (all fields mapped)

---

## Remaining minor open items

**Low-priority polish** (recreation can proceed without these):

### Data formats
- N5S `header_u16[0..3]` game-semantic labels (layout captured, labels TBD)
- SCR opcode 17 RESULT_POPUP popup-id enum
- MPL keyed (0x40/0x50) per-record internal layout

### Engine track
- Boss per-state body pseudocode (SpaceGod NORMAL/PUNCH/FINGER etc.) — skeleton + BL profile already in docs
- Slope-field (player+0x13c..0x14a) reader location — appears vestigial in plain CNom
- `GetCorrectionMovePos` per-branch decode (1288 B trig-heavy) — skeleton documented
- `CMap::InitScroll` internals (380 B)

### Strategic next step

Data-format and engine-behavior coverage is now sufficient to begin
**faithful-recreation scaffolding** — the remaining opens are polish
and do not block a minimal runtime. Suggested approach:

1. Start recreation in a separate project (e.g. `engine-recreation/`).
2. Use exported JSON (N5M, SCR, MPL) + docs as specification.
3. Implement `DoPathLogic` integrator, CObject base, CNom/CMonster, then
   stage-load flow.
4. Fill in open items as actual recreation exposes gaps.

---

## Quick Reference

- Exported data: `out/n5m-stage-json/`, `out/script-json/`, `out/mpl-json/`, `out/pzx/`
- Disasm helper: `scripts/engine/disasm-one-symbol.py SYMBOL_SUBSTR`
- Symbol log: `logs/libgameDSO-symbols.txt`
- Format docs: `docs/30_formats/<fmt>/00_status.md`
- Engine docs: `docs/40_engine/`

# Stage Load Flow

End-to-end sequence from "user picks stage N" to "stage runtime objects ready
for frame loop". Synthesises information already captured in data-format docs
(`30_formats/30_n5s/`, `30_formats/40_n5m/`).

## Overview

```
GameMode::StartStage(stage_id)
   │
   ├─► CMapMgr_J::Init(boss_flag)               @0xa8745  (2596 B)
   │     parses N5S front-matter, builds tagSObjectInfo vector
   │
   ├─► CMapMgr_J::InitMap(stage_id, boss_flag)  @0xa922d  (1264 B)
   │     loads stage_<N>_m.n5m, allocates CMap_J/T, calls LoadMap
   │
   └─► CMap_J::LoadMap(boss_flag, ?)            @0x9f8a5  (2364 B)
         consumes N5M block stream, spawns CBackLayer/CMonster/CObject
```

For "T" stage variants (boss / horizontal-scroll mini-stages) the parallel
`CMapMgr_T::Init` (`0xa9c59`) / `CMapMgr_T::InitMap` (`0xa991d`) /
`CMap_T::LoadMap` (`0xa4cf5`) chain is used. Branch is selected by stage table
in `CMapMgr` based on `stage_id` and the N5S `header_u16[4]` boss marker.

## Phase 1: CMapMgr_J::Init — parse N5S

Disasm reference: `logs/cmapmgr-j-init-disasm.txt`.

Reads `assets/map/stage_<N>.n5s`:

| Step | Reader call (vaddr) | Field consumed                                    | Stored at        |
|------|---------------------|---------------------------------------------------|------------------|
| 1    | `0x8fc78` (read u8) | `lead_u8`                                         | (validation only)|
| 2    | `0x8fc84` (read u16)| `header_u16[0]`                                   | CMapMgr+0x42 (also as i32 at +0x48) |
| 3    | `0x8fc84`           | `header_u16[1]`                                   | CMapMgr+0x3c     |
| 4    | `0x8fc84`           | `header_u16[2]`                                   | CMapMgr+0x3e     |
| 5    | `0x8fc84`           | `header_u16[3]`                                   | CMapMgr+0x40     |
| 6    | `0x8fc84`           | `header_u16[4]` (stage marker `0xfffe`/`0xffff`)  | CMapMgr+0x44     |
| 7    | loop u8+strings     | string groups G0..G4 (5 × `u8 count + count×10B`) | CMapMgr+strings  |
| 8    | loop u8+records     | tagSObjectInfo records (52 B each)                | CMapMgr::m_objectInfoVec via `CVector::AddElement` |
| 9    | u8 + u16×N          | trailing N5M block-offset table                   | CMapMgr+0x?? (used by GetMapOffset) |

Each tagSObjectInfo record = 52 bytes parsed as `u8[16] + u16[18]`. Field
semantics: see `30_formats/30_n5s/40_semantics.md`.

After Phase 1: `CMapMgr` has the per-stage object catalog and N5M block index.
Sprites referenced by `pzx1`/`pzx2` are NOT loaded yet.

## Phase 2: CMapMgr_J::InitMap — choose block, allocate CMap_J

```
@0xa922d  CMapMgr_J::InitMap(stage_id, boss_flag):
   resource = LoadResource("map/stage_<id>_m.n5m")
   block_index = ChooseBlock(stage_id)        # uses N5S trailing table
   self.m_currentMap = new CMap_J(self, nom, ?, boss_flag, block_index)
   self.m_currentMap->LoadMap(boss_flag, resource_ptr)
```

Disasm reference: `logs/cmapmgr-j-initmap-disasm.txt`.

`CMap_J` constructor (`0xa01e1`, 92 B) initialises map-instance state from
`CMapMgr+0x40`/`+0x48` (the header_u16 fields). Notable reads:

- `CMap_J+0x14` ← parent CMapMgr pointer
- `CMap_J+0x18` ← active CNom (player) pointer
- `CMap_J+0xXX` ← `CMapMgr+0x40` (header_u16[3])

## Phase 3: CMap_J::LoadMap — consume N5M block

Disasm reference: `logs/map-j-loadmap-disasm.txt` and
`logs/loadmap-annotated.txt`.

Reads start at `n5m_data + tail[block_index]` and consume:

| Stream item            | Storage                                  |
|------------------------|------------------------------------------|
| `u16 header_a`         | block width → CMap_J+0x42                |
| `u16 header_b`         | block height                             |
| `u8[7] flags`          | `flags[0..6]` (scroll phase, reverse path, stage classifiers) |
| `u8 layer_group_count` | back-layer group count (=3 in all observed) |
| back-layer groups      | each element `(pzx_mgr, frame, x, y)` → spawn `CBackLayer` (0xa/0xc/0x9 dispatch) |
| land layers            | per-land `pattern_a + pattern_b + path_layers` |
| per path layer:        | nodes (path waypoints), events (CEventRect spawn), objects (CMonster/CObject spawn) |

Each `object` record (7 u8 + 6 i16) maps to a `tagSObjectInfo` entry via `f3`:

```
f3      → tagSObjectInfo[f3]   (= eMonType u8[12], etc.)
f0..f2  → per-instance flags (TBD)
f4..f6  → likely sub-state seeds (e.g. obj+0x40 ACTIVE pattern id)
init_x, init_y → CObject+0xd4, CObject+0xd6 (spawn position)
field_d8, field_da → CObject+0xd8, +0xda
spawn_x, spawn_y → second-pass spawn coordinates
```

Each `event` record (6 i16 rect + 4 i16 extras + optional text) spawns a
`CEventRect_J` and runs its dispatch (see `30_formats/40_n5m/40_semantics.md`).

## Phase 4: per-frame loop kicks in

After LoadMap returns, the active CMap_J and all spawned CMonster/CScriptObject
instances enter the per-frame `DoLogic`/`DoFSMLogic` cycle:

- `CMap_J::DoLogic` — scrolling, event-rect overlap checks (`CEventRect_J::IsInRect`)
- `CMonster::DoLogic` → dispatches to FSM-state's `DoFSM_*` handler
- `CNom::DoLogic` — input, movement, jump, terrain interaction
- `CScriptEngine::InitScriptEngine` — script command tick (when a SCR is active)

## CMap_T::LoadMap — stage-mode dispatch

`CMap_T::LoadMap` (`0xa4cf5`, 5028 B) differs from `CMap_J::LoadMap` by
**dispatching on a stage-mode byte** (stored at local `sp[0x78]`, sourced
from the loaded block's header). The mode selects different CPathLayer /
PathIndexPosX setups, not N5M event handling:

| mode  | branch                                              |
|-------|-----------------------------------------------------|
| 0x06  | triggers CPathLayer creation + `GetPathIndexPosX`   |
| 0x11  | same as 0x06 (aliased)                              |
| 0x03  | skip block                                           |
| 0x13  | skip block (aliased with 0x03)                       |
| other | standard per-node loop                               |

Additionally, inside the object-spawn loop `CObject::IsItem` is called and
the item's eMonType (`sp[0x2c]+0xc`) is compared against `0x18, 0x4b, 0x4c,
0x4d` — these are **special-item eMonTypes** triggering a diverted spawn
path (likely the "decorative/trigger" item variants). Not terrain events.

So the `cmp #0x11/0x13/0x18` hits inside CMap_T::LoadMap that my earlier
scan flagged as "terrain dispatch" are actually **stage-mode dispatch** and
**item eMonType filter** — unrelated to N5M event types.

## Open

- Exact game-semantic of `header_u16[0..3]` (still labelled as `CMapMgr+0x42/3c/3e/40`).
- Source of object record fields `f0..f2`/`f4..f6` mapping into runtime CMonster.
- Whether `block_index` selection considers gameplay state (boss-clear, etc.) or
  is purely scripted by stage_id.
- Stage-mode byte source: confirm it comes from N5M block `flags[0..6]` or a
  separate byte in the per-block header.

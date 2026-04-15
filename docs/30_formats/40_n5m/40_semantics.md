# N5M Semantics

## Block Dimensions

- `header_a` = **block width** in game units
- `header_b` = **block height** in game units

The in-game coordinate system per block:
- x-axis: `[0, header_a]` — path nodes span the full block width
- y-axis: `[-header_b, 0]` — y=0 is the top/ground; negative y goes downward

Confirmed via `probe-n5m-header-semantics.py` across all 21 files:
- `max(node.x) ≈ header_a` in every block (within ±2 units)
- `min(node.y) ≥ -header_b` in every block; exact match in vertical/large stages
- Vertical stages (stage_12, stage_28): width=360, height=3840
- Large/boss stages (stage_1, stage_3, stage_19): height=2000
- Normal stages: height=400 (0x190)
- Stage_9/26: height=440 (0x1b8)

## Early Group Elements — Back Layers

The three groups after the block prefix are **back layer** (CBackLayer) definitions.
Each group is a list of background elements that `LoadMap` constructs before loading
land/path layers.

### Element Format

Each element: `(u8 pzx_mgr, u8 frame, i16 x, i16 y)`

- `pzx_mgr` = PzxMgr index → `CMapMgr::GetMapPzxMgr(pzx_mgr)` → tile-set manager
- `frame` = frame index → `CPzxMgr::GetFrame(frame)` → specific tile/animation frame
- `x, y` = placement position in game units (same coordinate space as path nodes)

Each element becomes a `CBackLayer` object, added to `CMap.backlayers[group_index]`.

### CBackLayer Subtypes (stage-id-dependent)

The `LoadMap` disasm selects different `CBackLayer` subclasses based on stage_id:

| stage_id | subtype              | note                          |
|----------|----------------------|-------------------------------|
| default  | `CBackLayer`         | static background tile        |
| 0xa (10) | `CBackLayer_Decal`   | decal/overlay back layer      |
| 0x19 (25)| `CBackLayer_Shoting` | shooting/moving back layer    |
| 0x9 (9)  | `CBackLayer_Gate`    | gate/door back layer          |
| 0x1a (26)| `CBackLayer_Gate`    | gate/door back layer          |
| 0xc (12) | `CBackLayer_Shoting` | also uses Shoting subtype     |
| 0x1c (28)| `CBackLayer_Shoting` | also uses Shoting subtype     |

### Observed Examples

`stage_0_m.n5m` block 0 (header_a=5000, hb=400):
- Group 0: `(pzx=0, frame=0, x=0, y=-50)` → background sky layer
- Group 1: `(pzx=1, frame=0, x=0, y=69)` → mid-ground layer  
- Group 2: empty

### Relationship to "Back-Layer Section"

The groups at the start of each block ARE the back-layer section.
There is no separate "back-layer section" after the land layers.
The open question about "back-layer section before land layers in LoadMap" is now resolved:
it is the early group section (read immediately after the header fields).

## Event Types

Event types are encoded as `raw_type` (u8) in the file.
Internal type index: `type_idx = (raw_type - 0x5f) & 0xFF`

### Observed raw_type Range

24 distinct types in current N5M data, `raw_type ∈ {0..27}` (some gaps).

| raw_type | type_idx | count | notes                                    |
|----------|----------|-------|------------------------------------------|
| 0x00     | 0xa1     | 1     | unknown                                  |
| 0x01     | 0xa2     | 18    | **script trigger** → `SetScript(3)` (CTalkBox cutscene?) |
| 0x02     | 0xa3     | 10    | **script trigger** → `SetScript(4)`     |
| 0x03     | 0xa4     | 19    | unknown                                  |
| 0x04     | 0xa5     | 175   | **dialog event** — always has text (EUC-KR string) |
| 0x05     | 0xa6     | 6     | unknown                                  |
| 0x06     | 0xa7     | 36    | unknown                                  |
| 0x08     | 0xa9     | 14    | unknown                                  |
| 0x09     | 0xaa     | 30    | unknown                                  |
| 0x0a     | 0xab     | 2     | unknown                                  |
| 0x0c     | 0xad     | 31    | unknown (rect[0] often = damage/amount?) |
| 0x0d     | 0xae     | 8     | unknown                                  |
| 0x11     | 0xb2     | 79    | unknown                                  |
| 0x12     | 0xb3     | 145   | unknown                                  |
| 0x13     | 0xb4     | 223   | most common                              |
| 0x14     | 0xb5     | 58    | unknown                                  |
| 0x15     | 0xb6     | 10    | unknown                                  |
| 0x16     | 0xb7     | 10    | unknown                                  |
| 0x17     | 0xb8     | 15    | unknown (vertical stage only: stage_12)  |
| 0x18     | 0xb9     | 73    | unknown                                  |
| 0x19     | 0xba     | 20    | unknown                                  |
| 0x1a     | 0xbb     | 2     | unknown                                  |
| 0x1b     | 0xbc     | 10    | unknown                                  |

### Dispatch Logic (from `CMap_J::LoadMap` disasm)

All events are constructed as `CEventRect_J(type_idx, CMap*)`, then after
reading all fields:

- `type_idx == 0xa2` → calls `CStageGameScene::SetScript(3)`, then vtable[1]
- `type_idx == 0xa3` → calls `CStageGameScene::SetScript(4)`, then vtable[1]
- other → calls vtable[0xa] (standard rect event handling)

The text reading path (when `text_len > 0`) goes to `[EventRect+0xe4]`.
A `CTalkBox` is stored at `[EventRect+0xd0]` for events with text and vtable
size matching `CTalkBox::vtable`.

### Event Record Fields

```
u8   raw_type
i16  rect[0]   → CEventRect+0xd4
i16  rect[1]   → CEventRect+0xd6
i16  rect[2]   → CEventRect+0xd8
i16  rect[3]   → CEventRect+0xda
i16  rect[4]   → CEventRect+0xdc
i16  rect[5]   → CEventRect+0xde
i16  field_0x20
i16  field_0x22
i16  field_0xea
i16  field_0xec
u8   text_len
[text_len bytes — EUC-KR if text_len > 0]
```

## Object Types

Objects have a 7-byte header `(f0, f1, f2, f3, f4, f5, f6)` followed by
position and spawn fields.

`f3` = **object type index** — passed to `GetObjectInfo(f3)` to look up a
`tagSObjectInfo*` which drives monster construction.

### Observed f3 Range

29 distinct object types observed: `f3 ∈ {0..28}`.

Most common:
- `f3=2`: 1297 objects (most common)
- `f3=1`: 706
- `f3=9`: 444
- `f3=20`: 432

Object classes instantiated by `LoadMap` (from disasm):
- `CMonster_J` — standard monster path (most objects)
- `CMonster_Decal` — monster with decal/particle effect
- `CMonster_Shoting` — shooting/projectile monster

The `IsItem()` check on the constructed object routes items through a
separate initialization path (storing item index at `CObject+0x41`).

### Object Field Notes

- `f0, f1, f2, f5, f6` are usually 0; `f1` and `f2` act as variant/team flags for some types
- `f4` = per-type parameter (variant subtype, frame offset, or similar)
- `init_x, init_y` = secondary init position (→ `CObject+0xd4/0xd6`)
- `spawn_x, spawn_y` = primary spawn position (→ `CObject::SetPosition`)
- `text_len/text` = optional label/name string (EUC-KR)

### Full object-type-to-class mapping

**Resolved via N5S records** — the N5S `0x34` record table IS the per-stage `tagSObjectInfo`
vector. `record[f3]` gives:
- `u8[12]` = `eMonsterType` (used for FindObjectInfo lookup)
- `u16[0]` (at +0x10) = `pzx1` flat string index → first PZX animation file
- `u16[6]` (at +0x1c) = `pzx2` flat string index → second PZX animation file
- PZX file names come from N5S string groups G0..G4 (flat-indexed)

See [N5S semantics](../../30_n5s/40_semantics.md) for the full per-stage table.

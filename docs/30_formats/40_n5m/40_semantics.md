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

## Block Flags (flags[0..6])

The 7 flag bytes after `header_a/header_b` are stored at `CMap+0x66..+0x6c` when the block is loaded.

### flags[0] — Back-layer scroll phase (CMap+0x66)

Values: 0, 1, 2, 3 (2-bit cycle counter).

- Cycles 0→1→2→3→0 per block for **Decal** stages (id=0xa/0x19)
- Fixed at **1** for all blocks in **Shoting** stages (id=0xc/0x1c)
- Level-editor-assigned for other stages (often 0 or cycling)
- **bit0**: if set, triggers `CMap::SetMapBound` (camera scroll boundary) call for this block

In `LoadMap` the helper stubs at the end of the function enforce this:
- `0xa0192`: sets `CMap+0x66 = 1` (for Shoting blocks), then continues
- `0xa019c`: sets `CMap+0x66 = (CMap+0x66 + 1) & 3` (for Decal blocks), then continues

### flags[1] — Stage layer flag (CMap+0x67)

Values: 0 or 1.

- **1** for: large/boss stages (hb≥2000), vertical stages (hb=3840), and stages 0/22
- **0** for: simple horizontal stages (hb=400/440) without special back-layer setup

### flags[2] — Reverse path direction (CMap+0x68)

Values: 0 or 1.

- **1** on a block means the path runs **right-to-left** (or bottom-to-top for vertical stages)
- In `LoadMap` at `0x9ffbc`: if `CMap+0x68 == 1`, branches to alternate path layer loading code at `0xa011e`
- In Decal stages (10/25), flags[2] alternates between consecutive blocks: 0,0,0,0,**0**,**1**,0,**1**,0,**1**,...
  indicating a zigzag layout where every other block traverses the reverse direction

### flags[3] — Stage scale class (CMap+0x69)

Values: 0, 1, 2.

- **0**: simple horizontal stages
- **1**: vertical stages (hb=3840)
- **2**: large/boss stages (hb=2000+) and special stages 0/22

### flags[4] — Path variant indicator (CMap+0x6a)

Values: 0, 1, 2.

- **0**: normal forward path, no special path handling
- **1**: vertical stages and large/boss stages
- **2**: blocks where `flags[2]=1` (reverse path blocks) and some large stages

### flags[5] — Parallax/scroll active (CMap+0x6b)

Values: 0 or 1.

- **1** for Decal stages, most large/boss stages, and some normal stages
- **0** for Shoting stages, Gate stages, and simple stages without parallax scroll

### flags[6] — Rare special flag (CMap+0x6c)

Values: 0 or 1.

- **1** only in stage_0 (blocks 1,4,5) and stage_22 (blocks 2,3,5) — 6 total blocks
- Purpose not yet confirmed; may be a visual/transition effect toggle

### Empirical Correlations (214 blocks, 21 files)

| Stage type          | flags[0] | flags[1] | flags[2] | flags[3] | flags[4] | flags[5] | flags[6] |
|---------------------|----------|----------|----------|----------|----------|----------|----------|
| Vertical (12,28)    | 0        | 1        | 0        | 1        | 1        | 0        | 0        |
| Boss/large (1,3,19) | 0        | 1        | 0        | 2        | 1        | 1        | 0        |
| Decal (10,25)       | cycles   | 0        | alternates| 0       | 0 or 2   | 1        | 0        |
| Shoting (12=same)   | cycles   | 0        | 0        | 0        | 0        | 0        | 0        |
| Simple (7,15,16)    | cycles   | 0        | 0        | 0        | 0        | 0        | 0        |
| Special (0,22)      | 0        | 1        | alternates| 2       | 0 or 2   | 1        | 0 or 1   |

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

| stage_id  | subtype              | note                                              |
|-----------|----------------------|---------------------------------------------------|
| default   | `CBackLayer`         | static background tile (4 bool ctor params)       |
| 0xa (10)  | `CBackLayer_Decal`   | decal/overlay back layer (for group 0)            |
| 0x19 (25) | `CBackLayer_Decal`   | decal back layer (same path as 0xa)               |
| 0x9 (9)   | `CBackLayer_Gate`    | gate/door back layer (group 0); groups 1+ → Decal |
| 0x1a (26) | `CBackLayer_Gate`    | gate/door back layer (group 0); groups 1+ → Decal |
| 0xc (12)  | `CBackLayer_Shoting` | shooting/moving back layer                        |
| 0x1c (28) | `CBackLayer_Shoting` | same as 0xc                                       |

The 4 bool parameters passed to `CBackLayer` constructors encode scroll and rendering flags. For Gate stages, groups 1+ use `CBackLayer` with all bools = 1.

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

### DoLogic Dispatch (from `CEventRect_J::DoLogic` disasm)

`DoLogic` reads `type_idx` from `[EventRect+0x48]`, subtracts `0xa3`, and
dispatches via a 25-entry jump table (cases 0..24 = type_idx 0xa3..0xbb = raw 0x02..0x1a).
Types outside this range (raw 0x00, 0x01, 0x1b) are handled in `LoadMap` or elsewhere.

**Active cases (non-noop):**

| raw_type | action in DoLogic                                                    |
|----------|----------------------------------------------------------------------|
| 0x02     | IsInRect → `SetScript(4)`, set activated flag                       |
| 0x03     | IsInRect → `SetScript(5)`, set activated flag                       |
| 0x04     | IsInRect → spawn `CTalkBox` with event text (dialog display)        |
| 0x07     | IsInRect → `CMapMgr::SetScroll(rect[0])` + `SetScrollRate` ×3       |
| 0x10     | check flag → IsInRect → `CStageGamePopup` + `PushPopUp`             |
| 0x14     | IsInRect → `FindObjectInfo(eMonType=0x7d)` → spawn `CMonster_Decal` |
| 0x17     | IsInRect → path activation (rect[0..1] = bounds)                   |
| 0x19     | unconditional → path activation                                     |
| 0x1a     | unconditional → write rect[0..4] to player object fields            |

**LoadMap-only dispatch (not in DoLogic jump table):**

| raw_type | action in LoadMap                                                    |
|----------|----------------------------------------------------------------------|
| 0x01     | `SetScript(3)` on map load + vtable[1]                              |
| 0x02     | `SetScript(4)` on map load + vtable[1] (AND in DoLogic on enter)    |

All other types: DoLogic returns immediately (noop). These types are processed
elsewhere in the physics/collision pipeline.

**Partial trace (2026-04-15):** `CEventRect_J::IsInRect` (0x82ccd, 214 bytes)
performs player-vs-event-rect overlap, reading CEventRect fields `+0xea` / `+0xec`
(= `fea`/`fec` in N5M parser) as bound deltas and `+0x48` as a type marker (with a
special-case branch for value `0xb8`). Callers iterate path-layer events and
dispatch per-type physics. The exact site that **applies** terrain physics
(e.g. clamps player Y to a slope ramp) has not yet been pinpointed in disasm —
likely inside `CMap_J::DoLogic` or `CNom::DoFSMLogic`.

### Terrain/Physics Event Types (noop in DoLogic)

Four types appear only in specific stage families and carry small structured
parameter values that look like physical surface properties rather than scripted
triggers. They are never paired with dialog text and rect[2..5] are usually zero.

**type 0x18 — slope ramp** (stages 0, 22 only):
- `rect[0]` = surface angle in degrees: ±15, ±20, ±30, ±45, ±60, ±90, ±115, ±145, ±180, ±360
- `rect[1]` = ±5 (surface thickness, sign matches rect[0])
- `rect[2]` = 0 or 1 (special slope flag, purpose unknown)
- Sign of rect[0]/rect[1] flips for reverse-direction blocks (flags[2]=1)
- Negative angle = slope tilts in the opposite direction
- ±360 = "full wrap" variant

**type 0x13 — ground surface** (stages 4, 20 only; most common noop type, 223 instances):
- `rect[0]` = `rect[1]` ∈ {0, −1, −2} — surface offset or friction parameter
- rect[2..5] = 0
- bbox spans wide horizontal platform segments
- Values: 0=flat, −1=slight softening, −2=more softening

**type 0x12 — platform edge / slope tile** (stages 4, 20 only; 145 instances):
- `rect[0..1]` ∈ {[0,0], [2,−1], [−2,1]} — signed slope gradient pair
- Alternating pattern: `[2,−1]` and `[−2,1]` across adjacent platform segments
- `[2,−1]` = gradual rise left-to-right; `[−2,1]` = gradual fall; `[0,0]` = flat end tile
- rect[2..5] = 0

**type 0x11 — boss terrain** (stages 1, 23 only — large 2D arena stages; 79 instances):
- All 6 rect fields carry non-zero values; 4–5 distinct rect patterns
- `rect[0]` ∈ {5,6,7}, `rect[1]` ∈ {2,3,4,5}, `rect[2]` ∈ {6,8,10}, `rect[3]` = ~3×rect[2]
- `rect[4]` ∈ {0,2}, `rect[5]` = ~−rect[1]
- Only found in stages with header_a = header_b = 2000 or 2500 (square arenas)
- Likely encodes complex collision mesh parameters for the 2D arena geometry

### Full Type Table

| raw_type | type_idx | count | DoLogic | notes / hypothesis                               |
|----------|----------|-------|---------|--------------------------------------------------|
| 0x00     | 0xa1     | 1     | —       | not in jump table; unknown                       |
| 0x01     | 0xa2     | 18    | —       | LoadMap: `SetScript(3)` on map load              |
| 0x02     | 0xa3     | 10    | active  | LoadMap+DoLogic: `SetScript(4)` trigger          |
| 0x03     | 0xa4     | 19    | active  | DoLogic: `SetScript(5)` on player enter          |
| 0x04     | 0xa5     | 175   | active  | dialog; always has EUC-KR text; rect[2]=20 const |
| 0x05     | 0xa6     | 6     | noop    | unknown                                          |
| 0x06     | 0xa7     | 36    | noop    | rect[0]=20 const; likely repeat count or timer   |
| 0x07     | 0xa8     | 0     | —       | (0 instances; scroll control from DoLogic)       |
| 0x08     | 0xa9     | 14    | noop    | rect[0]=1–2; unknown                             |
| 0x09     | 0xaa     | 30    | noop    | unknown                                          |
| 0x0a     | 0xab     | 2     | noop    | unknown                                          |
| 0x0c     | 0xad     | 31    | noop    | rect[0]=13–16; possibly damage amount            |
| 0x0d     | 0xae     | 8     | noop    | rect[1]=−16 const; possibly direction/speed      |
| 0x11     | 0xb2     | 79    | noop    | **boss terrain** — 6-param rect; stages 1,23 only |
| 0x12     | 0xb3     | 145   | noop    | **platform edge** — slope gradient pair; stages 4,20 only |
| 0x13     | 0xb4     | 223   | noop    | **ground surface** — rect[0..1] offset; stages 4,20 only |
| 0x14     | 0xb5     | 58    | active  | monster spawn on enter                           |
| 0x15     | 0xb6     | 10    | noop    | rect[1]=50 or 100; possibly spring/bounce height |
| 0x16     | 0xb7     | 10    | noop    | unknown                                          |
| 0x17     | 0xb8     | 15    | active  | path activation; vertical stages only            |
| 0x18     | 0xb9     | 73    | noop    | **slope ramp** — rect[0]=angle°; stages 0,22 only |
| 0x19     | 0xba     | 20    | active  | unconditional path activation; vertical stages   |
| 0x1a     | 0xbb     | 2     | active  | player state/spawn point setter                  |
| 0x1b     | 0xbc     | 10    | —       | outside jump table; unknown                      |

### Collision Rect vs Parameter Fields

Each event record contains two rect-like sections:

**Collision rect** (trigger zone — used by `IsInRect()`):
```
i16  f20   → CEventRect+0x20   left x bound
i16  f22   → CEventRect+0x22   top y bound (less negative = closer to ground)
i16  fea   → CEventRect+0xea   right x bound
i16  fec   → CEventRect+0xec   bottom y bound (more negative = deeper)
```

**Parameter fields** (type-specific data):
```
i16  rect[0]   → CEventRect+0xd4
i16  rect[1]   → CEventRect+0xd6
i16  rect[2]   → CEventRect+0xd8
i16  rect[3]   → CEventRect+0xda
i16  rect[4]   → CEventRect+0xdc
i16  rect[5]   → CEventRect+0xde
```

Known parameter uses:
- `0x04` (dialog): rect[0]=width, rect[1..2] = display position
- `0x07` (scroll): rect[0] → `SetScroll`; rect[1..5] → `SetScrollRate` ×3
- `0x17`/`0x19` (path): rect[0] and rect[1] = path selection bounds
- `0x1a` (player state): rect[0..4] written to player fields +0x13e/+0x13c/+0x148/+0x14a/+0x14c
- `0x18` (slope): rect[0] = angle in degrees (±15..±360), rect[1] = ±5 (thickness), rect[2] = 0 or 1
- `0x13` (ground): rect[0]=rect[1] ∈ {0,−1,−2} (surface offset), rect[2..5]=0
- `0x12` (platform edge): rect[0..1] ∈ {[0,0],[2,−1],[−2,1]} (slope gradient), rect[2..5]=0
- `0x11` (boss terrain): rect[0..5] = complex 6-parameter terrain descriptor (stages 1,23 only)

### Dispatch Logic (from `CMap_J::LoadMap` disasm)

All events are constructed as `CEventRect_J(type_idx, CMap*)`, then after
reading all fields:

- `type_idx == 0xa2` → calls `CStageGameScene::SetScript(3)`, then vtable[1]
- `type_idx == 0xa3` → calls `CStageGameScene::SetScript(4)`, then vtable[1]
- other → calls vtable[0xa] (standard rect event handling)

The text reading path (when `text_len > 0`) goes to `[EventRect+0xe4]`.
A `CTalkBox` is stored at `[EventRect+0xd0]` for events with text and vtable
size matching `CTalkBox::vtable`.

### Event Record Format

```
u8   raw_type
i16  rect[0]   → CEventRect+0xd4   (type-specific parameter)
i16  rect[1]   → CEventRect+0xd6
i16  rect[2]   → CEventRect+0xd8
i16  rect[3]   → CEventRect+0xda
i16  rect[4]   → CEventRect+0xdc
i16  rect[5]   → CEventRect+0xde
i16  f20       → CEventRect+0x20   (collision rect left x)
i16  f22       → CEventRect+0x22   (collision rect top y)
i16  fea       → CEventRect+0xea   (collision rect right x)
i16  fec       → CEventRect+0xec   (collision rect bottom y)
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

# N5S Semantics

## 0x34 Record Table = tagSObjectInfo

**Confirmed**: the N5S fixed-record table IS the per-stage `tagSObjectInfo` table loaded
by `CMapMgr_J::Init` into the `CMapMgr::m_objectInfoVec` vector.

One N5S file → one `tagSObjectInfo` vector for that stage.
`record[f3]` = the info entry for N5M object type `f3`.

Evidence:
- `stage_12.n5s` has exactly **29 records**, matching f3 range 0..28 observed in N5M data
- `CMapMgr_J::Init` disasm: allocates 0x34 bytes per record, reads 16 u8 + 18 i16, calls `CVector::AddElement`
- `GetObjectInfo(f3)` = `return vector[f3]` (8-byte function — simple index)
- `FindObjectInfo(eMonsterType)` = linear search by `tagSObjectInfo[+0x0c]` (= u8[12])

### Record Field Mapping

Each record is 52 bytes (`0x34`): `u8[16]` + `u16[18]`.

**Confirmed from disasm + data:**

| Field         | Offset | Type   | Meaning                                                           |
|---------------|--------|--------|-------------------------------------------------------------------|
| `u8[0..5]`    | +0x00  | u8×6   | per-state motion init flag (paired with `u8[6..11]`) — see below  |
| `u8[6..11]`   | +0x06  | u8×6   | per-state motion id (PZX motion table index) — see below          |
| `u8[12]`      | +0x0c  | u8     | `eMonsterType` — used by `FindObjectInfo` for type lookup         |
| `u8[13]`      | +0x0d  | u8     | type dispatch category (see table below)                          |
| `u16[0]`      | +0x10  | u16    | `pzx1` — flat string index → first PZX animation file            |
| `u16[6]`      | +0x1c  | u16    | `pzx2` — flat string index → second PZX animation file           |
| `u16[12]`     | +0x28  | u16    | **spatial/movement parameter** (pixel distance) — type-specific role: spawn-y offset (Shoting INIT: `y -= u16[12]`), AI movement bound (`CMonster+0xd6 = u16[12]` in J ACTIVE state). Not combat-related (SetDamage doesn't read it). |
| `u16[13]`     | +0x2a  | u16    | **kill score** — `CNomUI::AddMonScore` arg (monster destroy)      |
| `u16[14]`     | +0x2c  | i16    | **energy delta** — `CNomUI::AddItemEnergy` arg; **sign bit = monster/item classifier** (negative ⇒ monster, sets obj+0x3b=1) |
| `u16[15]`     | +0x2e  | u16    | **initial HP** — assigned to `CMonster+0xfc` in `InitFSM_MONSTER_INIT` |
| `u16[16]`     | +0x30  | u16    | **nom point** — `CNomUI::AddNomPoint` arg                         |
| `u16[17]`     | +0x32  | u16    | **fiver coin** — `CNomUI::AddItemFiver` arg                       |

**u8[13] dispatch values** (from `CMap_J::LoadMap` object construction):

| u8[13] | meaning                                            | count |
|--------|----------------------------------------------------|-------|
| 0      | other/invisible trigger                            | 120   |
| 1      | minor variant                                      | 29    |
| 2      | minor variant                                      | 21    |
| 3      | rare variant                                       | 2     |
| 4      | standard monster/item                              | 148   |
| 5      | terrain background tile (`[1, 0, 1, 0]` prefix)   | 189   |
| 6      | explosive/special-damage variant (skips obj+0x5a=4 in SetDamage) | 12 |
| 7      | gate/spawn point → nom (player) entry              | 19    |
| 8      | minor variant                                      | 10    |
| 10     | rare variant                                       | 10    |

Value `9` does not appear; values `0..10` excluding `9` all observed across 21 stages (560 records).

**Special eMonsterType dispatch** (checked before u8[13] in LoadMap):

| eMonType | dispatch                                           |
|----------|----------------------------------------------------|
| 0x70 (112)| copies `CObject+0xd4` → `+0xd6` then normal path |
| 0x7b (123)| zeroes `CObject+0x144` then normal path            |
| 0x09 (9)  | gate type; always has u8[13]=7                    |

`pzx1 = 0xFFFF` / `pzx2 = 0xFFFF` means "no sprite" (e.g. invisible trigger objects).

### PZX File Name Lookup

String groups G0..G4 from the N5S front-matter are PZX file names.
`pzx1` and `pzx2` are **flat indices** into the concatenated list `G0 + G1 + G2 + G3 + G4`.

Example — `stage_0.n5s`:
```
G0 = ['map_0_back', 'map_0']          flat[0], flat[1]
G1 = ['item', 'capsule']              flat[2], flat[3]
G2 = ['ok_key_rot', 'wall_rot', 'mon_0_rot']  flat[4..6]
G3 = []
G4 = ['nom_0_rot']                    flat[7]
```
- `pzx1=0` → `map_0_back`, `pzx2=2` → `item`

### Observed Record Patterns

**Background/tile type** (`u8[0..3] = 01 00 01 00`, `u8[13..15] = 05 06 00`):
- Low f3 indices (0..8) in most stages
- Both pzx1 and pzx2 reference background map files (`map_X_back`, `map_X`)
- eMonsterType = 0..8 (simple sequential assignment for bg types)

**Monster/enemy types** (`u8[0..3] = 01 00 00 00`):
- Higher f3 indices (10+)
- pzx1 = map file, pzx2 = monster/item PZX file
- eMonsterType values are non-sequential (stage-specific IDs)

**No-sprite type** (`pzx1 = pzx2 = 0xFFFF`):
- e.g. stage_0 f3=19 (eMonType=153)
- Invisible or UI-only object

**Gate/nom type** (`u8[0..3] = 00 00 00 00`, `u8[13..15] = 07 00 00`):
- e.g. f3=9 in stage_0 (eMonType=9), f3=28 in stage_9 (eMonType=9)
- pzx2 = `nom_X` or `map_X` — nom (player character) entry point or gate

### Stage Family Sharing

stage_9 and stage_26_s share identical string groups (`map_9` family), with records
in different order — confirming these are sister stages from the same asset family.

## String Groups

5 groups of 10-byte null-terminated ASCII strings, each group started by a `u8 count`.

Roles (inferred from pzx1/pzx2 cross-reference):
- **G0**: background map PZX files (e.g. `map_0_back`, `map_0`)
- **G1**: item/gameplay object PZX files (e.g. `item`, `capsule`, `ok_key`, `wall`, `mon_X`)
- **G2**: monster animation PZX files (e.g. `mon_X_rot`) — may be 0-length for some stages
- **G3**: Nom (player) PZX files (e.g. `nom_X`) — length varies
- **G4**: Nom rotation PZX files (e.g. `nom_X_rot`) — may be 0-length

The distinction between G2/G3/G4 is tentative. The key observation is that all 5
groups form a single flat indexed space for pzx1/pzx2 references.

## Header Fields

Front-matter header (from `CMapMgr_J::Init` 0xa87de..0xa8814):

| Field           | File offset | Stored at        | Notes                                    |
|-----------------|-------------|------------------|------------------------------------------|
| `lead_u8`       | 0x00        | (not directly)   | always 4 in observed corpus              |
| `header_u16[0]` | 0x01        | `CMapMgr+0x42` and as i32 at `+0x48` | stage classifier — values {4, 8, 9, 13} |
| `header_u16[1]` | 0x03        | `CMapMgr+0x3c`   | param A (0/4/10/50)                      |
| `header_u16[2]` | 0x05        | `CMapMgr+0x3e`   | param B (20/25/30/100)                   |
| `header_u16[3]` | 0x07        | `CMapMgr+0x40`   | param C (0/30/50/100/150)                |
| `header_u16[4]` | 0x09        | `CMapMgr+0x44`   | **stage marker**: `0xfffe`=normal, `0xffff`=boss |

Read sites (heavy usage):
- `CMapMgr+0x3c`: read in `CMap_J::Draw`, `CMap_J::DoLogic`, `CMap_J::LoadMap` —
  influences scrolling/rendering
- `CMapMgr+0x40`: read in `CMap_J::LoadMap`, `CMap_J` constructor,
  `CMap_T::LoadMap` — stage-init parameter
- `CMapMgr+0x48` (i32 cast of `header_u16[0]`): read in `CMap_J::LoadMap`,
  `CMap_J::DrawHaze`, `CMap_T::CreateBody`, `CMap_T::LoadMap` — used as a
  stage-class branch parameter

Stage_9 vs stage_9_s: header_u16[1..3] identical, only header_u16[0] differs (9 vs 8) —
confirms header_u16[0] selects a stage variant within the same map family.

Exact game-semantic labels (e.g. "starting energy", "scroll bound", "haze type")
require per-call-site decode of the LoadMap/Draw/DoLogic uses; layout itself is now
fully captured.

## Trailing U16 Table

- Values fit inside the sibling `stage_X_m.n5m` file size (confirmed 21/21)
- Best current interpretation: N5M block start offsets (tail[i] = start of block i)
- These are the values used by `GetMapOffset(stage_id)` to index into N5M blocks

## Empirical Field Distribution (560 records across 21 stages)

Survey script: `scripts/formats/n5s/10_probe/survey-tagsobjectinfo-fields.py`

- `u8[1]`, `u8[3]`, `u8[4]`, `u8[5]`: sparse 0/1 booleans (50/20/28/93 ones)
- `u8[14]`: 13 distinct values, bimodal at 0 (×195) and 6 (×193); other values 2..12 — likely
  a sub-type/variant id paired with `u8[13]` dispatch
- `u8[15]`: post-damage transformation eMonType+1 (554/560 zero = no transformation)
- `u16[1..5]`, `u16[7..9]`: when non-zero/non-0xFFFF, all in flat-string range — **additional
  PZX slots**, not sentinels. Sparse (most records leave them 0).
- `u16[10..11]`: pure 0/0xFFFF (no other values) — 2 boolean flags, NOT pzx slots

This implies the 12 `u16` slots `[0..11]` form an array of **up to 10 PZX references**
(`pzx[0..9]`) plus 2 trailing flags (`u16[10..11]`). `pzx1`/`pzx2` (slots 0 and 6) are
just the two slots `GetPzxMgr` reads.

## Per-dispatch reward profile (from `SetDamage`)

| u8[13] | u16[12] mode | u16[14] sign  | u16[16] | u16[17] | interpretation                |
|--------|--------------|---------------|---------|---------|-------------------------------|
| 4      | 80–200       | negative      | 0       | 0/4     | standard monster (kill score from u16[13]) |
| 5      | 50 (always)  | 0 / +25/+50/+100 | 0/1  | 0/25/50/100 | item drop / terrain pickup |
| 7      | 250          | 0             | 90      | 100     | nom (player) constants        |
| 0      | varies       | mixed         | 0       | 0/1/2   | trigger or generic object     |

## u8[14] = damage-state dispatch index

Confirmed in `CMonster_J::InitFSM_MONSTER_DAMAGE` at `0xab658`:
```
ldrb r3, [objInfo, #0xe]   // u8[14]
cmp  r3, #0xc
bls  jump_table_dispatch   // 13 cases (0..12)
```
The 13 distinct empirical values (0..12) match the jump-table size exactly. This selects
the damage/death animation/behavior pattern. Same dispatch present in
`CMonster_T::InitFSM_MONSTER_DAMAGE` and `CMonster_Shoting::InitFSM_MONSTER_DAMAGE`.

The bimodal distribution (0×195, 6×193) reflects two dominant death patterns
(no-effect default vs. standard-explosion), with 11 niche variants for special enemies.

## u8[0..5] / u8[6..11] = 6 motion-state pairs

Confirmed via call-pair analysis: every (`u8[i]`, `u8[i+6]`) pair is passed together to
`CAniObject::ChangeMotion(motion_id, flag)` or `CAniObject::InitMotion(motion_id, flag)`,
with the flag computed as `(u8[i] == 0)` via the `subs r3, r2, #1; sbcs r2, r3` idiom.

| Pair | flag    | motion id | Read context (CMonster FSM state)                  |
|------|---------|-----------|----------------------------------------------------|
| 0    | u8[0]   | u8[6]     | `InitFSM_MONSTER_INIT` — default/spawn motion       |
| 1    | u8[1]   | u8[7]     | `InitFSM_MONSTER_ACTIVE` — active behavior motion   |
| 2    | u8[2]   | u8[8]     | `InitFSM_MONSTER_DAMAGE` / `DoFSM_MONSTER_DAMAGE`   |
| 3    | u8[3]   | u8[9]     | `InitFSM_MONSTER_DAMAGE` (J alt branch)             |
| 4    | u8[4]   | u8[10]    | `CheckCrashToNom` — collision response motion       |
| 5    | u8[5]   | u8[11]    | `CheckCrashToNom` alt branch                        |

This **supersedes** the prior interpretations of `u8[0]` ("active flag"), `u8[2]`
("terrain tile flag"), and the `u8[1,3,4,5]` "behavior modifier flag" hypothesis. They
are all per-state motion-init flags. The earlier observations are still correct as
*correlations*:
- `u8[0]==0` ⇒ no INIT motion ⇒ gate/trigger object
- `u8[2]==1` ⇒ has DAMAGE motion ⇒ correlates with terrain tiles having both PZX slots
  as bg maps
- u8[4] feeding into `CGsEmitter::UpdateEmitter` is just the same motion-id passed to
  the emitter when collision triggers a particle effect

**`u8[15]` = post-damage transformation eMonsterType + 1** (confirmed via
`CMonster_J::DoFSM_MONSTER_DAMAGE` at 0xb1548):

```
ldrb r1, [objInfo, #0xf]      ; r1 = u8[15]
subs r1, #1                    ; r1 = u8[15] - 1
strh r1, [CMonster, +0x48]     ; CMonster.eMonType = u8[15] - 1
bl   CMapMgr::GetObjectInfo(r1) ; fetch new objInfo for transformed type
str  r0, [CMonster, +0xf4]     ; replace objInfo pointer
```

So `u8[15] = 0` means "no transformation" (554/560 records); a non-zero value transforms
the monster on damage to eMonsterType `u8[15] - 1`. The 6 special records observed:

| u8[15] | transforms to eMonType |
|--------|------------------------|
| 7      | 6                      |
| 12     | 11                     |
| 23     | 22                     |

This is multi-stage boss / armor-shedding behavior.

## Next Open Questions

1. ~~`u8[15]` exact meaning~~ **DONE 2026-04-15** — post-damage transformation eMonType+1.
2. `u16[10..11]` boolean flag meaning (always 0 or 0xFFFF) — **likely unused at runtime**:
   broad disasm scan found no reads of `objInfo+0x24` or `objInfo+0x26`. The clean 0/0xFFFF
   distribution may just be data-author convention (fill with -1 vs 0) for unused slots.
   If reads exist, they happen via memcpy/struct-copy paths not yet traced.
4. ~~`u16[12]` combat parameter~~ **DONE 2026-04-15** — confirmed as spatial parameter
   (spawn-y offset / AI movement bound), not combat.
6. Sparse `u16[1..5,7..9]` PZX slot semantics (variant frames? alt-state sprites?)
7. ~~`header_u16[0..3]` meaning~~ **PARTIAL 2026-04-15** — layout fully captured
   (CMapMgr+0x42/0x3c/0x3e/0x40/0x48), exact game-semantic labels still TBD.
8. Whether G0..G4 roles are exactly as described above

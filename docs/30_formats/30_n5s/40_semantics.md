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

| Field         | Offset | Type   | Meaning                                                     |
|---------------|--------|--------|-------------------------------------------------------------|
| `u8[12]`      | +0x0c  | u8     | `eMonsterType` — used by `FindObjectInfo` for type lookup   |
| `u16[0]`      | +0x10  | u16    | `pzx1` — flat string index → first PZX animation file      |
| `u16[6]`      | +0x1c  | u16    | `pzx2` — flat string index → second PZX animation file     |

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

Front-matter header:
- `lead_u8` — observed values: 4 (normal), possibly other values for boss
- `header_u16[4]` = **stage marker**: `0xfffe` = normal stage, `0xffff` = boss stage
- `header_u16[0..3]` — meaning not yet recovered

## Trailing U16 Table

- Values fit inside the sibling `stage_X_m.n5m` file size (confirmed 21/21)
- Best current interpretation: N5M block start offsets (tail[i] = start of block i)
- These are the values used by `GetMapOffset(stage_id)` to index into N5M blocks

## Next Open Questions

1. Full meaning of `u8[0..15]` in tagSObjectInfo beyond u8[12]
2. `u8[13..15]` pattern (`05 06 00` for bg types, `07 00 00` for nom/gate) — likely frame counts or category IDs
3. `header_u16[0..3]` meaning
4. Whether G0..G4 roles are exactly as described above

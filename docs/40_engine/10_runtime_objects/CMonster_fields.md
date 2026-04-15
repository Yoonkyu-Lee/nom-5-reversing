# CMonster Runtime Field Map

Consolidates field offsets touched in `CMonster` / `CMonster_J` / `CMonster_T` /
`CMonster_Shoting` / `CMonster_Decal` handlers, gathered from disasm during
`tagSObjectInfo` semantics recovery (see
`docs/30_formats/30_n5s/40_semantics.md`).

`CMonster` inherits from `CObject`; offsets below 0xa4 belong to `CObject`'s area
and are largely shared with `CScriptObject` and other CObject subclasses.

## Field table

| Offset | Type | Field name (working)         | Source                                                                                                  |
|--------|------|------------------------------|---------------------------------------------------------------------------------------------------------|
| +0x1c  | u8   | direction flag?              | written `=0` then `=1` in `InitFSM_MONSTER_INIT` (0xaf088, 0xaf0cc)                                     |
| +0x1d  | u8   | secondary direction flag?    | written 0/1 in same paths                                                                              |
| +0x20  | u16  | **current X (game units)**   | written by `OBJ_SET_POS`, read by `MOVE_POS` step (script object); equivalent CMonster runtime X       |
| +0x22  | u16  | **current Y (game units)**   | adjusted in Shoting INIT: `y -= u16[12]`                                                                |
| +0x24  | ptr  | parent CMap_J/T pointer       | dereferenced for objInfo lookup, layer state                                                            |
| +0x2c  | ptr  | active queue record          | OBJ_MOVE_POS queue type=2 record pointer (in CScriptObject; same offset family)                        |
| +0x30  | i32  | active queue type            | 1/2/4 = MOVE_POS / CHANGE_ANI etc. (CScriptObject queue dispatch)                                      |
| +0x34  | u8   | "active" flag                 | checked in `CNom::DoFiverEffect`/`DoEatEffect` paths; set by INIT                                       |
| +0x38  | u8   | active/visible flag          | OBJ_CREATE sets `=1` (script object analog)                                                             |
| +0x3a  | u8   | tested in INIT for terrain → motion 8 | `CMonster_J::InitFSM_MONSTER_INIT` 0xaf03a-0xaf044                                       |
| +0x3b  | u8   | **monster/item classifier**  | `= sign_bit(u16[14])` from objInfo; controls SetDamage reward path (monster vs item)                   |
| +0x40  | u8   | **ACTIVE-state 12-case dispatch subtype** | set from N5M object record's `f4` at spawn (`CMap_J::LoadMap` @0x9fe54). Also used as FSM-local delay (frames) for script objects via `OBJ_SET_FSM_DELAY`; DoFSMLogic decrements. |
| +0x42  | u16  | initial X (block-relative)   | from N5M init_x; preserved as spawn anchor                                                              |
| +0x44  | u16  | initial Y                    | from N5M init_y                                                                                         |
| +0x48  | i16  | **eMonsterType**             | `= tagSObjectInfo.u8[12]`, replaced by `u8[15]-1` on transformation                                     |
| +0x4c  | ptr  | parent script object ref     | OBJ_CREATE arg3 stored here (CScriptObject); -1 = no parent                                             |
| +0x56  | u16  | death/state counter          | INIT sets `=8` when `+0x3a != 0` (terrain monster)                                                      |
| +0x5a  | u16  | "killed" / damage-state code | SetDamage sets `=4` for non-`u8[13]==6` types when classifier=monster                                   |
| +0x5e  | u16  | bullet/AI period             | INIT sets `= [obj+0x22]` (initial Y as period?)                                                         |
| +0x60  | embed | CTalkBox (script object)     | OBJ_TALKBOX activates on `scriptObj+0x60` (CScriptObject layout)                                        |
| +0x80  | i16  | talkbox X (script object)    | OBJ_TALKBOX clears, OBJ_TALKBOX_POS writes                                                              |
| +0x82  | i16  | talkbox Y (script object)    | same                                                                                                    |
| +0x90  | i16  | talkbox-active marker        | OBJ_TALKBOX sets `=-1`                                                                                  |
| +0xcc  | u32  | flags bitfield                | `OR_= 0x8` for eMonType=0x7c special path; status bits                                                  |
| +0xd4  | i16  | **runtime movement state / spawn-X** | repurposed: Init reads as i16 movement counter; LoadMap uses as init_x                       |
| +0xd6  | i16  | **AI movement bound**        | `= u16[12]` written in `InitFSM_MONSTER_ACTIVE` (0xb0f80)                                              |
| +0xd8  | i16  | derived bound                 | `= ([obj+0xd4] + 1) * 2` in same path                                                                   |
| +0xda  | i16  | runtime field from N5M.field_da | LoadMap-side spawn data                                                                              |
| +0xe4  | embed | embedded sub-object/anim ptr table | DoLogic vtable calls dispatch through `[obj+0xe4]`                                                  |
| +0xec  | i16  | shooting period               | various INIT writes                                                                                     |
| +0xf4  | ptr  | **objInfo pointer**          | `= CMapMgr::GetObjectInfo(eMonType)` — replaced on `u8[15]` transformation                              |
| +0xfc  | i32  | **runtime HP**                | initialized from `tagSObjectInfo.u16[15]`; SetDamage decrements                                         |
| +0x144 | u16  | special spawn field           | zeroed for eMonType=0x7b; sub-class-specific                                                             |

## Shorthand for engine docs

When other docs reference these, use:

- `obj.x = obj+0x20`, `obj.y = obj+0x22`
- `obj.spawn_x = obj+0x42`, `obj.spawn_y = obj+0x44`
- `obj.eMonType = obj+0x48`
- `obj.objInfo = obj+0xf4` (pointer to `tagSObjectInfo`)
- `obj.hp = obj+0xfc`
- `obj.classifier = obj+0x3b` (1 = monster, 0 = item)

## Disasm anchors

- `InitFSM_MONSTER_INIT`: `CMonster_J` 0xaeff9, `CMonster_Shoting` 0xaf539
- `InitFSM_MONSTER_ACTIVE`: `CMonster_J` 0xb0de9
- `InitFSM_MONSTER_DAMAGE`: `CMonster_J` 0xab629, `T` 0xb49ea, `Shoting` 0xab214
- `DoFSM_MONSTER_DAMAGE`: `J` 0xb1272, `T` 0xb25f0, `Shoting` 0xb1c5a
- `SetDamage`: `CMonster::SetDamage` 0xaada5
- `CheckCrashToNom`: `CMonster_J` 0xad01d (4018 B), `CMonster_T` 0xb6e16

## Open

- Many fields below 0x1c (vtable, base CObject members) not yet mapped — they're
  stable across CObject subclasses and not currently blocking.
- Sub-class-specific overlays (CMonster_Decal, CMonster_Shoting unique fields)
  not enumerated.

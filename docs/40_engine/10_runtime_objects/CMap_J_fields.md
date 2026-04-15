# CMap_J Runtime Field Map

`CMap_J` is the instance-per-stage-block map object; owns path layers,
spawned objects, scroll state, and a copy of the block-level flags.

Constructed by `CMap_J::CMap_J(CMapMgr*, CNom*, CNom*, u8, i32)` (`0xa01e1`,
92 B) and populated by `CMap_J::LoadMap(u8, i32)` (`0x9f8a5`, 2364 B) from
the active N5M block data.

## Field offsets

| Offset  | Type   | Meaning                                                           |
|---------|--------|-------------------------------------------------------------------|
| +0x14   | ptr    | parent CMapMgr pointer                                            |
| +0x18   | ptr    | active CNom (player) pointer                                      |
| +0x1c   | ptr    | secondary CNom (for 2-player modes; 0 in single-player)           |
| +0x24   | ptr    | (parent/sibling link — read by CMonster via `obj+0x24`)           |
| +0x42   | u16    | block width in game units (N5M `header_a`)                        |
| +0x44   | u16    | block height (N5M `header_b`)                                     |
| +0x67   | u8     | **N5M flags[0]** — scroll_phase (back-layer 2-bit counter)        |
| +0x68   | u8     | **N5M flags[1]** — stage_class_1                                  |
| +0x69   | u8     | **N5M flags[2]** — reverse_path flag                              |
| +0x6a   | u8     | **N5M flags[3]** — stage_class_3                                  |
| +0x6b   | u8     | **N5M flags[4]** — stage_class_4                                  |
| +0x6c   | u8     | **N5M flags[5]** — stage_class_5                                  |

Block flag `flags[6]` is NOT stored on CMap_J. Instead it is read into
`sp[0x44]` during LoadMap and propagated into every spawned `CMonster` as
`obj+0x3e`. See `50_init_flow/object_spawn.md`.

## Back-layer storage

Back-layer group definitions (read as `(pzx_mgr, frame, x, y)` tuples) are
stored via `CBackLayer` instances attached after block-flag parsing. Exact
vector offsets TBD.

## Path layers and events

`CMap_J` owns a vector of `CPathLayer` objects; each `CPathLayer` has its
own node list, event-rect vector, and object vector. `CMap_J::DoLogic`
iterates these each frame and dispatches per-frame logic.

## Open

- `+0x14`/`+0x18`/`+0x1c` offsets are approximated from subclass read sites;
  confirm exact field layout.
- Back-layer vector location and back-layer count storage.

**Resolved 2026-04-15**: `cmp singleton+0x6d, #imm` throughout the engine
reads `CNomUI.ms_pSingleton->+0x6d` (the current stage number, set by
`CNomUI::SetCurStageNum`), NOT CMap_J's `+0x6d`. Those are two separate
fields on two different objects that happen to share the same offset.

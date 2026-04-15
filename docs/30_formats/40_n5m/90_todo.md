# N5M Todo

## Done

- [x] Block prefix parse: `header_a`, `header_b`, `flags[7]`, `group_count`, `groups`
- [x] Post-group section parse: land layers with patterns and path layers
- [x] Per-path-layer events and objects
- [x] Full structural validation: `21/21` `N5M` files parse to EOF
- [x] `header_a` = block width in game units
- [x] `header_b` = block height in game units
- [x] Event type survey: `24` types (`raw 0x00..0x1b`)
- [x] Object type survey: `f3` range `0..28`
- [x] Early group elements: `(pzx_mgr, frame, x, y)` = `CBackLayer` definitions
- [x] Back-layer section = early groups section
- [x] `N5S 0x34` record table = `tagSObjectInfo`
- [x] `pzx1/pzx2` -> PZX file names via N5S string groups
- [x] `eMonsterType = tagSObjectInfo.u8[12]`

## Active

1. Full event type classification: `CEventRect_J::DoLogic` dispatch decoded — 9 active
   cases + LoadMap dispatch recovered. Terrain noop types partially characterized:
   - 0x18 = slope ramp (rect[0]=angle°, stages 0/22 only)
   - 0x13 = ground surface (rect[0..1] offset/friction, stages 4/20)
   - 0x12 = platform edge slope gradient (stages 4/20)
   - 0x11 = boss terrain 6-param descriptor (stages 1/23 only)
   Mechanism (physics system consuming these) not yet confirmed in disasm.
2. ~~Understand `flags[7]` per-block variation.~~ **DONE** — flags[0]=scroll phase, flags[2]=reverse path, flags[1/3/4/5/6]=stage-type classifiers; survey script added.
3. ~~Understand `CBackLayer` subtype dispatch.~~ **DONE** — 0xa/0x19=Decal, 0xc/0x1c=Shoting, 0x9/0x1a=Gate (group 0) + Decal (groups 1+), default=CBackLayer. Previous doc had 0x19 wrong (was Shoting, is Decal). Fixed in semantics.md.
4. Recover remaining `tagSObjectInfo` field meanings beyond monster type and `pzx1/pzx2`.
   - **MAJOR UPDATE (2026-04-15)**: u16[12..17] reward fields confirmed via `CMonster::SetDamage` disasm:
     u16[13]=AddMonScore, u16[14]=AddItemEnergy (sign=monster classifier), u16[15]=initial HP,
     u16[16]=AddNomPoint, u16[17]=AddItemFiver. u8[13] dispatch extended (0..10 minus 9).
   - Empirical survey: u16[1..5,7..9] ARE additional PZX slots (sparse); u16[10..11] = boolean flags;
     u8[15] essentially unused; u8[14] has 13-value variant id; u8[1,3,4,5] sparse booleans.
   - **u8[0..5]/u8[6..11] = 6 motion-state pairs** confirmed via paired `CAniObject::ChangeMotion`
     calls (INIT/ACTIVE/DAMAGE×2/CRASH×2). u8[14] = damage-state 13-case jump table dispatch.
   - Open: u16[12] combat parameter, u8[15] (boss-only flag), u16[10..11] booleans.
   - Survey script: `scripts/formats/n5s/10_probe/survey-tagsobjectinfo-fields.py`

## Lower Priority

5. `CMap_J::LoadMap` vs `CMap_T::LoadMap` differences for boss stages.
6. ~~`N5M -> JSON` export after semantics are more complete.~~ **DONE** —
   `scripts/formats/n5m/30_export/export-n5m-stage-json.py`. 21/21 stages export
   successfully to `out/n5m-stage-json/<stage>.json` with N5S meta + semantic labels
   (dispatch, flags, events, motion pairs, rewards) merged.

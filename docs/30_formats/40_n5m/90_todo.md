# N5M Todo

## Done
- [x] Block prefix parse: `header_a, header_b, flags[7], group_count, groups`
- [x] Post-group section parse: land layers with patterns and path layers
- [x] Per-path-layer events and objects (fixed missing events/objects)
- [x] Full validation: 21/21 N5M files, all blocks to EOF
- [x] `header_a` = block width in game units (confirmed via max_node_x across all stages)
- [x] `header_b` = block height in game units (confirmed via node y-bound [-header_b, 0])
- [x] Event type survey: 24 types (raw 0x00..0x1b); dispatch structure recovered from disasm
- [x] Object type survey: f3 range 0..28; CMonster_J/Decal/Shoting paths identified
- [x] Early group elements: `(pzx_mgr, frame, x, y)` = CBackLayer definitions (back layers)
- [x] Back-layer section: IS the early groups section (no separate section after land layers)

## Active
1. Full event type classification: 24 types surveyed; raw=1/2=script triggers, raw=4=dialog;
   remaining types need `CEventRect_J` vtable/dispatch analysis.
2. Full object type classification: f3 range 0..28; `GetObjectInfo(f3)` dispatch not yet recovered.
3. Understand `flags[7]` per-block variation — likely route/variant bits.
4. Understand CBackLayer subtype dispatch: Decal, Shoting, Gate vs default.

## Lower Priority
5. `CMap_J::LoadMap` vs `CMap_T::LoadMap` differences for boss stages.
6. N5M → JSON export (after semantics are more complete).

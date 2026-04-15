# N5M Todo

## Done
- [x] Block prefix parse: `header_a, header_b, flags[7], group_count, groups`
- [x] Post-group section parse: land layers with patterns and path layers
- [x] Per-path-layer events and objects (fixed missing events/objects)
- [x] Full validation: 21/21 N5M files, all blocks to EOF

## Active
1. Write N5M → JSON export script (`scripts/formats/n5m/30_export/export-n5m-json.py`)
2. Recover `header_a/header_b` semantics (likely world width/height extents).
3. Classify early group elements `(a, b, x, y)` — layer selectors or placement records?
4. Classify event types: `raw_type - 0x5f` → type index dispatch.
5. Classify object types: `f3 → GetObjectInfo(f3)` → monster kind.
6. Understand back-layer section (currently before land layers in `LoadMap`).

## Lower Priority
7. `CMap_J::LoadMap` vs `CMap_T::LoadMap` differences for boss stages.
8. `flags[7]` per-block variation — likely route/variant bits.

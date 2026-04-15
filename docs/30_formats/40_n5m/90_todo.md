# N5M Todo

1. Re-check the exact end of the recovered `stage_17/6` land/path section before proposing the next section grammar.
2. Test whether `header_a/header_b` are width/height or world extents.
3. Classify the early group elements as layer selectors, placement records, or decal/frame references.
4. Treat `GetMapOffset(stage_id)` as `block_start` unless a contradictory family appears.
5. Re-read `CMap_J::LoadMap` and `CMap_T::LoadMap` body loops immediately beyond the recovered strong-family land/path section.

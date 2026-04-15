# N5M Status

- Status: active
- Current stage: **full block parser complete — 21/21 N5M files, all blocks parse to EOF**

## Role In Game

- Strongest interpretation: `N5M` is the actual map body/section stream consumed by `LoadMap`.
- `N5S` looks like top-level stage metadata plus an index table into sibling `N5M`.

## What Is Confirmed

- `CMapMgr_J::InitMap` and `CMapMgr_T::InitMap` both load `map/stage_<id>_m.n5m`.
- The loaded resource pointer is passed directly into `CMap_J::LoadMap(stage_id, resource_ptr)` or `CMap_T::LoadMap(...)`.
- `N5S` trailing `u16` values fit inside sibling `N5M` sizes for `21/21` samples.
- Those trailing values land on repeated block starts inside `N5M`.
- `LoadMap` annotated reads now line up cleanly with `block_start`, not `post_groups_start`:
  - `readUint16()` -> `header_a`
  - `readUint16()` -> `header_b`
  - `readUint8() * 7` -> `flags[7]`
  - `readUint8()` -> `layer_group_count`
- Every tail-indexed block currently observed starts with the same fixed prefix:
  - `u16 header_a`
  - `u16 header_b`
  - `u8 flags[7]`
  - `u8 layer_group_count`
- A stronger early-body model now fits all current samples without truncation:
  - `layer_group_count = 3`
  - each group starts with `u8 element_count`
  - each element is currently best parsed as `(u8 a, u8 b, i16 x, i16 y)`
- Under this model, the old fixed `0x11` header is no longer treated as exact.
- Current observed `post_groups_start` sizes are:
  - `0x15`
  - `0x1b`
  - `0x21`

## Current Observations

- Prefix size families line up with group occupancy:
  - `0x15` for `(1, 0, 0)`
  - `0x1b` for `(1, 1, 0)`
  - `0x21` for `(1, 1, 1)`
- Example families:
  - `stage_10_m.n5m`: `(1, 0, 0)` -> `post_groups_start = block_start + 0x15`
  - `stage_0_m.n5m`: `(1, 1, 0)` -> `post_groups_start = block_start + 0x1b`
  - `stage_12_m.n5m`: `(1, 1, 1)` -> `post_groups_start = block_start + 0x21`
- The old `g0 pair` interpretation was likely over-reading the first layer-group records as metadata.
- Some stages keep `header_a/header_b` constant across all blocks, while others switch between a small set of `header_a` values inside one file.
- `flags[7]` vary between blocks inside the same stage, so they likely encode route/variant bits rather than file-global constants.
- `header_a/header_b` are strong candidates for size/extents fields, but semantics are still open.
- `LoadMap` annotated reads are consistent with this new boundary:
  - after the initial `u16, u16, u8*7, u8`
  - the function enters loops that read `u8`, `u8`, and then `i16/i16` for certain layer cases
- Body bytes at `post_groups_start` still cluster by stage family, so the next parser step should target a small number of recurring body grammars rather than treating every stage as unique.
- Several body families are shared across stage pairs rather than staying unique to one stage:
  - `stage_26_s` / `stage_9_s`
  - `stage_0` / `stage_22`
  - `stage_17` / `stage_6`
  - `stage_20` / `stage_4`
  - `stage_10` / `stage_25`
- Pair comparison now shows that some shared families are much stronger than others:
  - `stage_17` / `stage_6`: first `64-69` bytes after `post_groups_start` match block-by-block
  - `stage_20` / `stage_4`: first `64-80` bytes after `post_groups_start` match block-by-block
  - `stage_0` / `stage_22`: only the first `20-23` bytes match consistently

This makes `stage_17/6` and `stage_20/4` the best next parser targets.

- Strong families now have a recovered post-group section structure:
  - `stage_17` / `stage_6`
    - `u8 land_layer_count = 1`
    - first land layer:
      - `u8 pattern_count_a = 10`
      - `10 * (u8 pzx_mgr, u8 frame, i16 x, i16 y)`
      - tuples are `(1, 0, x, 0)` with `x = 0, 600, ..., 5400`
      - `u8 pattern_count_b = 0`
      - `u8 path_count = 3`
      - currently one populated path plus two zero-node paths
    - confirmed on block `0` and block `1`
  - `stage_20` / `stage_4`
    - `u8 land_layer_count = 2`
    - layer `0` matches the same section grammar strongly:
      - `pattern_count_a = 10`
      - `pattern_count_b = 0`
      - `path_count = 1`
      - path nodes span `x = 0 -> 6000`
    - layer `1` diverges, so this family is only partially recovered so far

- This makes `header_a = 0x1770 = 6000` a strong hint that at least these families encode ten horizontal placements across a 6000-wide span.
- The next-section shortcut hypothesis was tested and rejected:
  - after the recovered `stage_17/6` land/path section, the next bytes do start with a plausible `u16` count
  - but the naive follow-up grammar `u16 count + count * (u8 + i16*5 + u8)` does not stay coherent
  - so the boundary after the recovered section is still unresolved

## Tooling

- inspect:
  - `scripts/formats/n5m/00_inspect/inspect-n5m.py`
- probe:
  - `scripts/formats/n5m/10_probe/probe-n5m-block-prefixes.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-block-header.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-layer-groups.py`
  - `scripts/formats/n5m/10_probe/align-n5m-to-loadmap-prefix.py`
  - `scripts/formats/n5m/10_probe/summarize-n5m-header-fields.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-body-prefixes.py`
  - `scripts/formats/n5m/10_probe/cluster-n5m-body-families.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-strong-family-record0.py`
  - `scripts/formats/n5m/10_probe/compare-n5m-family-pair.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-strong-family-sections.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-strong-family-next-section.py`

## Key Discovery (2026-04-14)

Previous parser only read `nc + nodes` per path layer, leaving events/objects unparsed.
These were being misread as the next path's nc, causing all subsequent offsets to be wrong.

Correct per-path-layer structure (confirmed from `CMap_J::LoadMap` disasm):
```
u16  node_count
node_count * (u8 dir, i16 x, i16 y, u16 angle_raw)
u16  event_count
event_count * (u8 raw_type, 6*i16 rect, 4*i16 extras, u8 text_len, [text])
u16  obj_count
obj_count * (7*u8, 4*i16 init/aux, 2*i16 spawn_xy, u8 text_len, [text])
```

After this fix: **21/21 N5M files, all blocks parse to EOF**.
Script: `scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py`

## Next Step

1. Recover field semantics: header_a/header_b, flags[7], early group elements, event types, object types.
2. Write N5M → JSON/IR export script (next stage after parser validation).
3. Understand back-layer section (currently before land layers in LoadMap).
4. Check stage_20/4 multi-layer parsing (land_layer_count=2) is correct.
5. Understand `CMap_J::LoadMap` vs `CMap_T::LoadMap` differences for boss stages.

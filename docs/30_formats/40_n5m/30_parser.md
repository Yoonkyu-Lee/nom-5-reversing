# N5M Parser

## Current Parser Boundary

There is no full `N5M` body parser yet.

The current best boundary is the variable early-body prefix parser implemented in:

- `scripts/formats/n5m/10_probe/probe-n5m-block-header.py`
- `scripts/formats/n5m/10_probe/probe-n5m-layer-groups.py`

## What The Current Probe Parses

1. Load sibling `N5S`
2. Extract trailing `u16` values
3. Treat each value as a candidate `N5M` block start
4. Parse the block prefix as:
   - `u16 header_a`
   - `u16 header_b`
   - `u8 flags[7]`
   - `u8 layer_group_count`
   - `layer_group_count` counted element groups
   - each element currently best fits `(u8 a, u8 b, i16 x, i16 y)`
5. Report `post_groups_start`

## What Is Exact So Far

- The current layer-group model fits all observed tail-indexed blocks without truncation.
- Current observed constants:
  - `layer_group_count = 3`
- Current observed `post_groups_start` families:
  - `0x15`
  - `0x1b`
  - `0x21`
- The initial `LoadMap` read sequence is now best explained by landing on `block_start`.
- For the strongest shared families, the first post-group section is now largely exact:
  - `u8 land_layer_count`
  - per land layer:
    - `u8 pattern_count_a`
    - `pattern_count_a * (u8, u8, i16, i16)`
    - `u8 pattern_count_b`
    - `pattern_count_b * (u8, u8, i16, i16)`
    - `u8 path_count`
    - `path_count * (u16 node_count + node_count * (u8, i16, i16, u16))`
  - exact on `stage_17/6`
  - exact on layer `0` of `stage_20/4`, but not yet beyond that

## What Was Downgraded

- The older fixed `0x11` header model is no longer treated as exact.
- It is still useful as a byte-history note, but it likely over-consumed the first group records and placed `body_start` too early.

## What Is Still Missing

- Exact body grammar after the recovered strong-family land/path section
- Record counts/sentinels inside body
- Semantic meaning of `header_a/header_b`
- Semantic meaning of `flags[7]`
- Semantic meaning of the early group elements

## Body Family Clustering

`post_groups_start` prefixes are not purely stage-local. Several recurring families are shared across stage pairs, for example:

- `stage_26_s` / `stage_9_s`
- `stage_0` / `stage_22`
- `stage_17` / `stage_6`
- `stage_20` / `stage_4`
- `stage_10` / `stage_25`

This means the next exact parser should target a small number of body families instead of one bespoke parser per stage.

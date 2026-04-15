# N5M Parser

## Current Parser Status

**Full block parser validated: 21/21 N5M files, all blocks parse to EOF.**

Script: `scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py`

## What The Parser Does

1. Load sibling `N5S`, extract trailing `u16` values as block offsets.
2. For each block:
   a. Parse block prefix: `u16 header_a, u16 header_b, u8 flags[7], u8 group_count`
   b. Parse `group_count` counted element groups: `u8 elem_count + elem_count * (u8, u8, i16, i16)`
   c. Parse post-group section:
      - `u8 land_layer_count`
      - per land layer:
        - `u8 count_a` + `count_a * (u8 pzx, u8 frame, i16 x, i16 y)`
        - `u8 count_b` + `count_b * (u8 pzx, u8 frame, i16 x, i16 y)`
        - `u8 path_count`
        - per path layer:
          - `u16 node_count` + `node_count * (u8 dir, i16 x, i16 y, u16 angle_raw)`
          - `u16 event_count` + events (22 bytes + optional text each)
          - `u16 obj_count` + objects (20 bytes + optional text each)

## What Is Exact

- Full parse verified: every byte in every block is accounted for.
- `group_count = 3` in all observed samples.
- `post_groups_start` offset families: `+0x15`, `+0x1b`, `+0x21`.
- Event record: 22 bytes fixed + optional text (`u8 raw_type + 6*i16 + 4*i16 + u8 text_len`).
- Object record: 20 bytes fixed + optional text (`7*u8 + 6*i16 + u8 text_len`).

## What Was Previously Wrong

The older `probe-n5m-strong-family-sections.py` only read `node_count + nodes` per path.
This caused events and objects to be misread as the next path's `nc`, shifting all
subsequent offsets. The fix is in `probe-n5m-path-with-events.py`.

## What Is Still Missing

- Semantic meaning of `header_a/header_b`.
- Semantic meaning of `flags[7]`.
- Semantic meaning of early group elements `(a, b, x, y)`.
- Event type classification: `raw_type - 0x5f` dispatch, types 0xa2/0xa3 special cases.
- Object type classification: `GetObjectInfo(f3)` dispatch to monster types.
- Back-layer section structure (comes before land layers in `LoadMap`).

## Next Parser Step

Write `scripts/formats/n5m/30_export/export-n5m-json.py` to export each block as JSON.

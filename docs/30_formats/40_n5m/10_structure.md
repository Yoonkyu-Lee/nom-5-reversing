# N5M Structure

## Current Structural Hypothesis

`N5M` is the stream that `CMap_J::LoadMap` / `CMap_T::LoadMap` actually consume after `InitMap` loads `stage_<id>_m.n5m`.

## Loader Relation

- `InitMap` builds the path `map/stage_<id>_m.n5m`.
- The resource pointer is stored and forwarded to the map object constructor.
- The constructor immediately calls `LoadMap(stage_id, resource_ptr)`.

This is the main reason the current map/body analysis has moved from `N5S` to `N5M`.

## Repeated Block Layout

Using sibling `N5S` trailing `u16` values as candidate starts, each repeated block begins with a fixed front prefix and a variable-size early group area.

The old `0x11` header model is now downgraded to a provisional stepping stone. It fit byte counts, but it likely consumed the first layer-group records as if they were pure metadata.

## Current Stronger Layout

```text
+0x00  u16  header_a
+0x02  u16  header_b
+0x04  u8   flags[7]
+0x0b  u8   group_count
+0x0c  repeated groups:
       u8   element_count
       repeated element_count times:
            u8   a
            u8   b
            i16  x
            i16  y
...    ...  post_groups_start
```

This prefix now aligns directly with the early `LoadMap` read sequence, so
`GetMapOffset(stage_id)` is currently better explained as landing on
`block_start` than on `post_groups_start`.

Observed invariants across current samples:

- `group_count = 3`
- no truncation across all current `N5M` samples under the variable-size group model
- `post_groups_start` falls into three current families:
  - `block_start + 0x15`
  - `block_start + 0x1b`
  - `block_start + 0x21`

These sizes correspond to current group occupancy patterns:

- `(1, 0, 0)` -> `0x15`
- `(1, 1, 0)` -> `0x1b`
- `(1, 1, 1)` -> `0x21`

## Example

`stage_0_m.n5m` block at `0x0000`:

```text
88 13 90 01  00 01 00 02 00 01 00  03  01 00 00 00 ce ff  01 01 00 00 45 00  00
^a    ^b     ^^^^^^^^^^^^^^^^^^^^  ^   ^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^     ^
             flags[7]              3   g0: 1 elem          g1: 1 elem           g2: 0
```

Interpreted under the current model:

- `g0` element: `(a=0, b=0, x=0, y=-50)`
- `g1` element: `(a=1, b=0, x=0, y=69)`
- `g2` empty
- `post_groups_start = block_start + 0x1b`

`stage_10_m.n5m` block at `0x0220`:

```text
60 09 90 01  01 00 00 00 00 01 00  03  01 00 01 00 00 00  00  00
```

Interpreted under the current model:

- `g0` element: `(a=0, b=1, x=0, y=0)`
- `g1` empty
- `g2` empty
- `post_groups_start = block_start + 0x15`

`stage_15_m.n5m` block at `0x11d1`:

```text
c0 12 90 01  02 00 00 00 00 00 00  03 ...
```

This stage belongs to the `0x21` family and currently behaves like `(1, 1, 1)`.

## Current Interpretation

- `header_a/header_b`: probably dimensions, extents, or camera bounds.
- `flags[7]`: likely per-block route/variant bits.
- early group elements: likely layer selectors, layer-local frame references, or placement records that `LoadMap` consumes before the recurring body grammar.

## First Recovered Post-Group Section

For the strongest shared families, the bytes at `post_groups_start` now parse
cleanly as:

```text
u8 land_layer_count
for each land layer:
  u8 pattern_count_a
  pattern_count_a * (u8 pzx_mgr, u8 frame, i16 x, i16 y)
  u8 pattern_count_b
  pattern_count_b * (u8 pzx_mgr, u8 frame, i16 x, i16 y)
  u8 path_count
  path_count *:
    u16 node_count
    node_count * (u8 dir, i16 x, i16 y, u16 aux)
```

Current confirmed examples:

- `stage_17_m.n5m` / `stage_6_m.n5m`
  - `land_layer_count = 1`
  - the single land layer uses:
    - `pattern_count_a = 10`
    - tuples: `(1, 0, x, 0)` with `x = 0, 600, 1200, ..., 5400`
    - `pattern_count_b = 0`
    - `path_count = 3`
    - currently one populated path plus two zero-node paths
  - confirmed on block `0` and block `1`
- `stage_20_m.n5m` / `stage_4_m.n5m`
  - `land_layer_count = 2`
  - layer `0` uses:
    - `pattern_count_a = 10`
    - tuples: `(1, 0, x, 0)` with the same `600` spacing
    - `pattern_count_b = 0`
    - `path_count = 1`
  - layer `1` diverges and is not yet exact

This is the first family-specific post-group section recovered after the early
group prefix.

## Field Distribution Notes

- Some stages keep one fixed `(header_a, header_b)` across all blocks:
  - `stage_0_m.n5m`: `(0x1388, 0x0190)`
  - `stage_12_m.n5m`: `(0x0168, 0x0f00)`
- Some stages switch `header_a` while keeping `header_b` fixed:
  - `stage_10_m.n5m`: `header_a in {0x0258, 0x04b0, 0x0708, 0x0960}`, `header_b = 0x0190`
  - `stage_15_m.n5m`: `header_a in {0x0258, 0x12c0}`, `header_b = 0x0190`
- The old `g0 pair` split was real at the byte level, but it is now better explained as the first group's first `(a, b)` element:
  - `(0, 0..3)` in some normal stages
  - `(1, 0)` or `(1, 1)` in other stage families

This still suggests route/phase variation, but now inside a richer early-body record.

## Open Questions

1. What do `header_a` and `header_b` represent exactly?
2. What exactly do the early group elements describe?
3. What section grammar comes immediately after the recovered strong-family land/path section?
4. Does `GetMapOffset(stage_id)` ever land on a deeper sub-offset in other families, or is `block_start` universal?

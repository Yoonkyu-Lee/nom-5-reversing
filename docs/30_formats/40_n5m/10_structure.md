# N5M Structure

## Current Structural Model

`N5M` is the stream that `CMap_J::LoadMap` / `CMap_T::LoadMap` actually consume after `InitMap` loads `stage_<id>_m.n5m`.

## Loader Relation

- `InitMap` builds the path `map/stage_<id>_m.n5m`.
- The resource pointer is stored and forwarded to the map object constructor.
- The constructor immediately calls `LoadMap(stage_id, resource_ptr)`.

This is why the active map/body analysis moved from `N5S` to `N5M`.

## Repeated Block Layout

Using sibling `N5S` trailing `u16` values as candidate starts, each repeated block begins with a fixed front prefix and a variable-size early group area.

## Front Prefix

```text
+0x00  u16  header_a
+0x02  u16  header_b
+0x04  u8   flags[7]
+0x0b  u8   group_count
+0x0c  repeated groups:
       u8   element_count
       repeated element_count times:
            u8   pzx_mgr
            u8   frame
            i16  x
            i16  y
...    ...  post_groups_start
```

This prefix aligns directly with the early `LoadMap` read sequence, so `GetMapOffset(stage_id)` is currently best explained as landing on `block_start`.

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

- `g0` element: `(pzx_mgr=0, frame=0, x=0, y=-50)`
- `g1` element: `(pzx_mgr=1, frame=0, x=0, y=69)`
- `g2` empty
- `post_groups_start = block_start + 0x1b`

## Confirmed Field Semantics

### `header_a`

- block width in game units
- supported by `max_node_x ~= header_a` across all currently parsed blocks

### `header_b`

- block height in game units
- supported by node `y` bounds staying within `[-header_b, 0]`

### `flags[7]`

- unresolved
- likely per-block route, variant, or mode bits

### Early groups

- each element is `(u8 pzx_mgr, u8 frame, i16 x, i16 y)`
- `pzx_mgr` selects which `CPzxMgr` tileset to use
- `frame` selects the frame inside that `CPzxMgr`
- `x, y` are placement coordinates in game units
- these elements instantiate `CBackLayer` objects or subtypes
- this is the back-layer section; there is no separate back-layer pass later

## Full Structural Parse

**Status: verified against `21/21` `N5M` files, all blocks to EOF.**

Per-path-layer structure:

```text
u16  node_count
node_count * (u8 dir, i16 x, i16 y, u16 angle_raw)
u16  event_count
event_count *:
    u8   raw_type
    6 * i16   rect[0..5]
    i16  field_0x20
    i16  field_0x22
    i16  field_0xea
    i16  field_0xec
    u8   text_len
    [text_len bytes if text_len > 0]
u16  obj_count
obj_count *:
    u8  f0, f1, f2, f3, f4, f5, f6
    i16 init_x
    i16 init_y
    i16 d8
    i16 da
    i16 spawn_x
    i16 spawn_y
    u8  text_len
    [text_len bytes if text_len > 0]
```

This corrected the older mistake where events and objects were being misread as the next path layer's `node_count`.

## Field Distribution Notes

- Some stages keep one fixed `(header_a, header_b)` across all blocks.
- Some stages switch `header_a` per block while keeping `header_b` fixed.
- `stage_23_m.n5m` varies both `header_a` and `header_b` by block.
- Standard normal stages tend to use `header_b = 400`.
- Vertical stages use `header_b = 3840`.
- Boss or large stages often use `header_b = 2000` or `2500`.

## Open Questions

1. What do `flags[7]` encode per block?
2. What are the exact semantics of each event subtype (`raw_type 0x00..0x1b`)?
3. What are the remaining `tagSObjectInfo` field meanings beyond monster type and PZX references?

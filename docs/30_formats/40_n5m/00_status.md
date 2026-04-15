# N5M Status

- Status: active
- Current stage: **semantics recovery in progress — flags[7] decoded**

## Role In Game

- `N5M` is the actual map body/section stream consumed by `CMap_J::LoadMap` / `CMap_T::LoadMap`.
- `N5S` acts as top-level stage metadata plus an index table into sibling `N5M` blocks.

## What Is Confirmed

- `CMapMgr_J::InitMap` and `CMapMgr_T::InitMap` both load `map/stage_<id>_m.n5m`.
- The loaded resource pointer is passed directly into `CMap_J::LoadMap(stage_id, resource_ptr)` or `CMap_T::LoadMap(...)`.
- `N5S` trailing `u16` values fit inside sibling `N5M` sizes for `21/21` samples.
- Those trailing values land on repeated block starts inside `N5M`.
- `LoadMap` annotated reads line up with `block_start`, not `post_groups_start`:
  - `readUint16()` -> `header_a`
  - `readUint16()` -> `header_b`
  - `readUint8() * 7` -> `flags[7]`
  - `readUint8()` -> `layer_group_count`
- Every tail-indexed block currently observed starts with the same fixed front prefix:
  - `u16 header_a`
  - `u16 header_b`
  - `u8 flags[7]`
  - `u8 layer_group_count`
- The early-body model fits all current samples without truncation:
  - `layer_group_count = 3`
  - each group starts with `u8 element_count`
  - each element is parsed as `(u8 pzx_mgr, u8 frame, i16 x, i16 y)`
- Under this model, the old fixed `0x11` header is no longer treated as exact.
- Current observed `post_groups_start` sizes are:
  - `0x15`
  - `0x1b`
  - `0x21`
- `header_a` is block width in game units.
- `header_b` is block height in game units.
- Early group elements are back-layer placements:
  - `(pzx_mgr, frame, x, y)` -> `CBackLayer` objects
  - the early groups are the back-layer section
- Full structural parse now reaches EOF on all sampled files:
  - each path layer = `node_count + nodes + event_count + events + obj_count + objects`
  - validated on `21/21` `N5M` files
  - script: `scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py`

## Current Observations

- Prefix size families line up with group occupancy:
  - `0x15` for `(1, 0, 0)`
  - `0x1b` for `(1, 1, 0)`
  - `0x21` for `(1, 1, 1)`
- Some stages keep `header_a/header_b` constant across all blocks, while others switch between a small set of `header_a` values inside one file.
- `flags[7]` vary between blocks inside the same stage, so they likely encode route or variant bits rather than file-global constants.
- Standard horizontal stages usually use `header_b = 400`.
- Vertical stages use larger heights such as `3840`.
- Large or boss-like stages use larger heights such as `2000` or `2500`.
- `flags[0]`: 2-bit back-layer scroll phase counter (0-3); cycles per Decal block; bit0 triggers `SetMapBound`
- `flags[2]`: reverse path direction flag (1 = path traverses right-to-left / bottom-to-top)
- `flags[1,3,4,5,6]`: stage-type classification flags; correlate with stage dimensions and CBackLayer subtype
- Survey script: `scripts/formats/n5m/10_probe/probe-n5m-flags.py`
- `CEventRect_J::DoLogic` dispatch fully decoded — 25-entry jump table, 9 active cases;
  terrain noop types characterized empirically:
  - `0x18` = slope ramp: `rect[0]`=angle°, `rect[1]`=±5 thickness (stages 0/22 only)
  - `0x13` = ground surface: `rect[0..1]` offset ∈{0,−1,−2} (stages 4/20 only)
  - `0x12` = platform edge: `rect[0..1]` slope gradient (stages 4/20 only)
  - `0x11` = boss terrain descriptor: 6 non-zero rect params (stages 1/23 only)
- `CEventRect_J::DoLogic` active cases:
  - raw `0x02` → `SetScript(4)` on player enter
  - raw `0x03` → `SetScript(5)` on player enter
  - raw `0x04` → CTalkBox dialog (always has text)
  - raw `0x07` → `SetScroll` + `SetScrollRate` (camera scroll control)
  - raw `0x14` → CMonster_Decal spawn on enter (eMonType=0x7d)
  - raw `0x17`/`0x19` → path activation (route control)
  - raw `0x1a` → write rect[0..4] to player object fields
  - LoadMap dispatch: raw `0x01` → `SetScript(3)` on map load; raw `0x02` also
- Most common noop types (0x11/0x12/0x13/0x18) have no DoLogic action;
  likely terrain/collision events processed by a separate physics system path
- Object type selector `f3` currently spans `0..28`.
- Full per-`f3` mapping is partly recovered through `N5S tagSObjectInfo`.

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
  - `scripts/formats/n5m/10_probe/probe-n5m-header-semantics.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-path-with-events.py`
  - `scripts/formats/n5m/10_probe/probe-n5m-flags.py`

## Next Step

1. Recover full event type meanings via `CEventRect_J` dispatch.
2. Recover remaining `tagSObjectInfo` field meanings beyond `u8[12]`, `u16[0]`, and `u16[6]`.
3. Understand `flags[7]` per-block variation.
4. ~~Understand `CBackLayer` subtype dispatch.~~ **DONE** — 0xa/0x19=Decal, 0xc/0x1c=Shoting, 0x9/0x1a=Gate/Decal-per-group.
5. ~~Write `N5M -> JSON/IR` export after semantics are more complete.~~ **DONE 2026-04-15** — `scripts/formats/n5m/30_export/export-n5m-stage-json.py`, all 21 stages → `out/n5m-stage-json/`.
6. Understand `CMap_J::LoadMap` vs `CMap_T::LoadMap` differences for boss stages.

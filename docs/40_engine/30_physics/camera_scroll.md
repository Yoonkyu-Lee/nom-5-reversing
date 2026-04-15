# Camera & Scrolling

Map camera position is tracked as scroll offsets in `CMap`/`CMapMgr`. The
back-layer parallax system in `CBackLayer` derives its own scroll from the main
camera, scaled by per-layer factors stored in N5M flags.

## Key entry points

| Symbol                                 | Vaddr     | Size  | Role                                          |
|----------------------------------------|-----------|-------|-----------------------------------------------|
| `CMap::DoMapScroll(s, s)`              | `0x9b7b5` | 2 B   | base nop (subclass overrides)                 |
| `CMap_J::DoMapScroll(i, i)`            | `0x9e83d` | 264 B | per-frame scroll for J-mode (vertical)        |
| `CMap_T::DoMapScroll(i, i)`            | `0xa1371` | 324 B | per-frame scroll for T-mode (horizontal/boss) |
| `CMap_Bridle::DoMapScroll(i, i)`       | `0xa150d` | 66 B  | bridle-stage scroll                           |
| `CMap_Gravity::DoMapScroll(i, i)`      | `0xa1605` | 214 B | gravity-stage scroll                          |
| `CMap::InitScroll()`                   | `0x9bf0d` | 380 B | scroll initialisation                         |
| `CMap_Earth::InitScroll()`             | `0xa17c1` | 212 B | earth-stage scroll init                       |
| `CMap::SetMapBound(s, s, s, s)`        | `0x9bef5` | 24 B  | set scroll-clamp rectangle (left/top/right/bottom) |
| `CMapMgr::SetScroll(i)`                | `0xa7c61` | 50 B  | high-level scroll mode setter (script-driven) |
| `CMapMgr::SetScrollRate(h, s)`         | `0xa7c95` | 10 B  | scroll-rate setter (script-driven)            |
| `CBackLayer::CalculateScroll()`        | `0x9b7fd` | 340 B | back-layer parallax scroll calculation        |
| `CBackLayer_Shoting::CalculateScroll()`| `0x9e6a9` | 272 B | parallax for shooting-stage variant            |

## Driver chain

```
CMap_J::DoLogic
  └─ DoMapScroll(target_x, target_y)         # 264 B
       ├─ clamp to map bound (set by SetMapBound)
       ├─ apply scroll rate (set by SetScrollRate)
       └─ update CMap+0xXX scroll offset

per back layer:
  CBackLayer::CalculateScroll()              # 340 B
       └─ scaled offset based on N5M flags[0] (scroll phase)
```

## Script integration

The script system can drive scroll directly (cutscene panning):

| SCR opcode | Action                                                     |
|------------|------------------------------------------------------------|
| `13` SCREEN_SCROLL | `Do_SCRIPTCMD_SCREEN_SCROLL` (`0xfe3e9`, 106 B) per-frame interpolation |
| (camera writes via SCR `07` event handler) | calls `SetScroll` + `SetScrollRate` (see N5M event_07_set_scroll_camera) |

## N5M flag involvement

From `30_formats/40_n5m/40_semantics.md`:

- `flags[0]` = **scroll phase** (2-bit back-layer counter, cycles per Decal block,
  bit0 triggers `SetMapBound`)
- `flags[2]` = reverse-path direction (1 = right-to-left or bottom-to-top)

So scroll behaviour is partly data-driven by the per-block flags. `CMap_J`
constructor (called during LoadMap) reads these into runtime fields used by
`DoMapScroll`.

## Boss-stage scroll variants

Boss scenes have their own scroll handlers:

- `CBossScene_Plate::DoScrollScreen` (`0x69f2d`, 140 B)
- `CBossScene_Silkworm::DoScrollScreen` (`0x6f639`, 320 B)

These override the generic `CMap_T` scroll for the specific boss arena layouts.

## CBackLayer internals

`CBackLayer::DoLogic` (`0x9b951`, 484 B) and `CalculateScroll` (`0x9b7fd`,
340 B) are **purely inline** — DoLogic has zero BL calls, CalculateScroll
only uses `__aeabi_idivmod` × 2 + `__divsi3` × 2 (modular arithmetic for
infinite-looping background wrap).

So back-layer scrolling is a self-contained state machine with no
cross-class dependencies: each frame DoLogic advances internal position
counters; CalculateScroll applies per-layer parallax factors via division
and modular wrap. Exact constants live inline.

`CBossScene_Rival::DoLogicBack` (documented separately in
`20_fsm/boss_classes.md`) is the boss-scene-specific variant that applies
hit-impact deltas to back-layer positions for camera-sway effects.

## Open

- Decode `CMap_J::DoMapScroll` (264 B) for the exact scroll clamp + rate
  application formulas.
- Decode `CMap::InitScroll` (380 B) for initial-state setup.
- Identify the runtime field offsets in `CMap` that hold:
  - current scroll x/y
  - target scroll x/y
  - scroll bound rectangle
  - scroll rate

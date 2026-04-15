# Terrain Event Physics

Covers how the noop event types `0x11/0x12/0x13/0x18` (defined in
`30_formats/40_n5m/40_semantics.md`) influence player position at runtime.
These event types have **empty `DoLogic` cases**, so their effect must come
through a different code path — the physics/collision layer.

## Type recap (from N5M semantics)

| raw_type | Stage usage     | Per-record params                                       |
|----------|-----------------|---------------------------------------------------------|
| `0x18`   | stages 0, 22    | `rect[0]` = surface angle (deg), `rect[1]` = ±5 thickness |
| `0x13`   | stages 4, 20    | `rect[0..1]` = ground offset (0/-1/-2)                   |
| `0x12`   | stages 4, 20    | `rect[0..1]` = platform-edge slope gradient              |
| `0x11`   | stages 1, 23    | 6 nonzero rect params — boss terrain descriptor          |

Each spawned `CEventRect_J` carries `rect[0..5]` at offsets +0xd4..+0xde and the
extra `f20`/`f22`/`fea`/`fec` fields at +0x20/+0x22/+0xea/+0xec.

## Established collision primitive

`CEventRect_J::IsInRect` (`0x82ccd`, 214 B) — **virtual** method on the rect
object. Body: tests rectangular overlap between an external `CObject` and the
rect's bound, with a special-case branch when `[event+0x48] == 0xb8`.

```
@0x82ccc  IsInRect():
   if no associated object exists: return 0
   read event[+0x37] (orientation flag) — controls horizontal vs vertical test
   if event.eMonType == 0xb8: take alt branch (special boss-terrain test)
   compute overlap of (player.bbox) vs (rect bound at +0xea/+0xec offsets from origin)
   return 1 if inside else 0
```

This is called via vtable from per-frame iteration (no exposed BL caller —
direct grep of branch-link targets returns empty).

## Apply-site (CORRECTED 2026-04-15)

Previous claim that slopes are "baked into path nodes" was **wrong**. The
correct flow:

1. `CEventRect_J::DoLogic` (`0x82f01`, 2198 B) has a 25-case jump table
   indexed by `(eMonType - 0xa3)`, where `eMonType = raw_type + 0xa3` set in
   the CEventRect_J constructor.
2. When the player overlaps a slope event rect, **case 24 (raw_type `0x18`)
   fires and writes the angle/thickness directly into player runtime fields**.
3. The player's per-frame physics reads those fields and applies the slope.

### Decoded event cases

| raw | idx | label              | target    | behaviour                           |
|-----|-----|--------------------|-----------|-------------------------------------|
| 0x00| 0   | set_script_4_alt   | `0x8326a` | `IsInRect` → if overlap, `CStageGameScene::SetScript(4)` + `eventRect+0x38=1` (one-shot flag) |
| 0x01| 1   | loadmap_script_3   | `0x83288` | `SetScript(3)` (LoadMap dispatch)   |
| 0x02| 2   | set_script_4       | `0x832b4` | `SetScript(4)` on enter              |
| 0x05| 5   | (multi-scroll)     | `0x83320` | `SetScript(...)` + 4× `SetScrollRate(rect[0..3])` |
| 0x0e| 14  | (unknown)          | `0x8335a` | (unique handler)                    |
| 0x11| 17  | boss_terrain       | `0x8321a` | **true NO-OP** (return)             |
| 0x12| 18  | platform_edge      | `0x82f30` | **spawn `CMonster_Decal` decoration** at rect coords |
| 0x15| 21  | (unknown)          | `0x833a6` | (unique handler)                    |
| 0x17| 23  | path_activation    | `0x8358c` | activate path layer                  |
| 0x18| 24  | **slope_ramp**     | `0x8322a` | **write slope angle to player fields** (see below) |

All other indices in 0..24 jump to `0x8321a` (return).

### Case 24 — slope_ramp decoded

```
@0x8322a  player = obj+0x28                        # the player CNom
          player+0x13e = -obj+0xd4 (= -rect[0])    # negated slope angle (degrees)
          player+0x13c = obj+0xd6 as byte           # rect[1] — thickness
          player+0x148 = obj+0xd8                   # rect[2]
          player+0x14a = obj+0xda                   # rect[3]
          ...
```

So the slope event **transfers its rect parameters into player runtime
fields** (`player+0x13c..0x14a`). The player's per-frame physics code reads
these fields after `DoPathLogic` integration to apply the slope correction.

### Case 12 — platform_edge spawns CMonster_Decal

```
@0x82f30  if vtable+0x2c check fails: return
          info = FindObjectInfo(0x7d)               # eMonType 0x7d lookup
          pzx = GetPzxMgr(info+0x10, info+0x1c)
          decal = new CMonster_Decal(parent, info, pzx, 0)
          decal.AttachPZX(pzx, 0)
          decal.InitMotion(info.u8[0], info.u8[6], ...) # motion pair 0
          ...
```

So `0x12` events are **decorative spawn triggers** (e.g. dust clouds at
platform edges), not collision modifiers as I previously assumed.

### Open

- Locate the player-side code that reads `player+0x13c..0x14a` and applies
  the slope to `vy`/`y` — likely in `CNom::DoFSMLogic` or `CNom::DoLogic`
  after the integrator runs.
- ~~Decode case 0~~ **DONE** — raw 0x00 = SetScript(4) on overlap, one-shot via `+0x38=1` flag.
- Case 5 multi-scroll trigger: confirm the 4 SetScrollRate calls are for
  4 sub-scroll layers.

## Engine-side requirements

Whatever the exact site, recreation must:

1. For type `0x18` (slope ramp): clamp player Y to `slope_y(player_x, angle)`
   while inside the rect; angle ranges `±15..±360°` already empirically
   catalogued. The `±5` thickness on `rect[1]` is a tolerance band.
2. For type `0x13` (ground surface): apply a constant Y offset (0/−1/−2) when
   player walks across the rect.
3. For type `0x12` (platform edge): apply a gradient (e.g. ramp at platform
   edges to prevent harsh transitions).
4. For type `0x11` (boss terrain): 6-parameter custom collision shape used in
   boss arenas — likely curved or multi-segment.

## Slope-field reader hunt (2026-04-15 follow-up)

Searched every function for reads of `obj+0x13c/0x13e/0x148/0x14a` (the offsets
written by case 24). Results:

- **Plain `CNom` has NO readers** of these offsets.
- Readers identified (non-coincidental):
  - `CNom_Gate::KeyPress`, `DoFSM_NOM_MOVE_LAYER`, `DoFSM_NOM_DAMAGE`, `DoFSM_NOM_GATE_OUT` — boss-gate player variant
  - `CNom_Shoting::FireBullet` — shooting-stage variant
  - `CNom_Gravity::DoFSM_NOM_DAMAGE` — gravity-stage variant
  - `CMonster_Shoting::DoFSM_MONSTER_ACTIVE` — boss-stage monster
  - `CBackLayer_Shoting::CalculateScroll` — parallax
  - `CMap_Bridle::DoLogic` — bridle stage

But slope event 0x18 is only in stages `0` and `22`, which are **plain
non-boss stages** (confirmed via `out/n5m-stage-json/stage_{0,22}.json`:
standard `header_u16=[8,0,100,0,0xfffe]`, `is_boss=false`). These stages use
base `CNom`, not the subclasses that read slope fields.

**Conclusion**: slope event 0x18's field writes appear to be **vestigial** in
the shipped codebase for stages 0/22 — the written fields are not consumed
by the plain `CNom` runtime. Possible explanations:

1. Earlier engine version had slope-ramp physics in plain CNom that was
   later moved or removed.
2. Fields are read via a code path my scan missed (non-standard offset
   loading like `adds r, #0xXX` chains through multiple intermediates).
3. Fields are written to an OBJECT OTHER than the player (e.g. a
   CMonster_Decal spawned nearby, where +0x13c..+0x14a have different
   per-subclass meaning).

For faithful recreation: implementing slope as a visual/geometric effect
through N5M node angles (already in path data) + ignoring the event 0x18
field writes will likely produce correct behaviour for stages 0/22. Verify
by in-game observation once a minimal runtime exists.

## Open (updated)
- ~~Decode case 0~~ **DONE** — raw 0x00 = SetScript(4) on overlap, one-shot via `+0x38=1` flag.
- Boss terrain (raw_type 0x11): confirmed true no-op in `CEventRect_J::DoLogic`
  dispatch. Stages 1 and 23 contain 34 + 45 of these events, but those stages
  are NOT marked boss (`stage_marker=0xfffe`) and use plain `CMap_J`. Search
  for `cmp #0x11` engine-wide: all matches are reading **`CNomUI+0x6d` (stage
  number)** — they fire when `stage_num == 17`, unrelated to event type 0x11.
  No code path consumes the 6 rect params of boss_terrain events.

  **Conclusion**: raw_type 0x11 events are likely **vestigial data** in
  shipped N5M files for stages 1/23 — preserved on disk but not consumed by
  the runtime. For faithful recreation, ignore them (no observable effect).
- `event+0x48 == 0xb8` (= 0xa3 + 0x15 = case 21) special branch in IsInRect:
  this is raw_type 0x15, the unique-handler index above. Its purpose is
  related to the IsInRect alt-path.
- `CPath::GetCorrectionPosY` slope formula `dx*tan(angle)+dy` IS valid for
  the path-snap correction (CMonster path-following uses it), but it's
  **separate from terrain event 0x18**. Path angles come from path nodes,
  not events.

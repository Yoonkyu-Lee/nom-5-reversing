# CMonster ACTIVE FSM

The largest unknown for engine recreation. This doc captures the **structure** of
the ACTIVE-state init/do handlers; per-case AI behaviour bodies are filled in
incrementally.

## Symbols

| Class               | InitFSM_ACTIVE      | DoFSM_ACTIVE         |
|---------------------|---------------------|----------------------|
| `CMonster_J`        | `0xb0de9` (972 B)   | `0xae59d` (2652 B)   |
| `CMonster_T`        | `0xb395d` (1004 B)  | `0xb51c1` (6714 B)   |
| `CMonster_Shoting`  | `0xabe25` (1488 B)  | `0xafbb9` (4360 B)   |
| `CMonster` (base)   | `0xaa821` (2 B nop) | `0xaa825` (2 B nop)  |

The base class is a stub; behaviour lives entirely in the `_J`/`_T`/`_Shoting`
overrides.

## CMonster_J::InitFSM_MONSTER_ACTIVE — top-level dispatch

```
@0xb0df0  eMonType = obj+0x48 (i16)
          if eMonType == 0x70 (112)  goto special_70   @0xb0f70
          if eMonType == 0x80 (128)  goto special_80   @0xb0fd4
          if eMonType == 0x82 (130)  goto special_82   @0xb0f88
          if eMonType == 0x09        goto special_09   @0xb1130

          # default path
          subtype = obj+0x40 (u8)
          if subtype > 11: goto post_dispatch   @0xb0e44
          jump_table[subtype]                    # 12 cases @0xb0e2c..
```

So ACTIVE behaviour selection has two layers:
1. **Boss-like eMonTypes** (`0x70`, `0x80`, `0x82`, `0x09`) get bespoke setup paths.
2. Everything else uses **`obj+0x40` as a 12-case sub-dispatch** to choose among
   movement/AI patterns.

### Default sub-case 0 (jump-table entry 0, `@0xb0e2c`)

```
obj+0x4c = obj+0xd6        # save current AI bound (= u16[12]) into "anchor A"
obj+0x52 = obj+0xda        # save +0xda field into "anchor B"
obj+0xd6 = obj.x           # repurpose AI bound = current X
obj+0xda = obj.y           # repurpose +0xda = current Y
fall through to validation
```

This pattern (save → repurpose) marks the start of a "patrol around current
position" behaviour: the bounds become anchors for oscillation.

### Validation gate (`@0xb0e44`)

```
objInfo = obj+0xf4
if objInfo.u8[0] != 0
  and (i16)objInfo.u16[9] >= 0      # offset 0x12 = u16[1]
  and (i16)objInfo.u16[15] >= 0     # offset 0x1e = u16[7]
:
  goto extended_setup @0xb0f92      # reads more PZX slots
else:
  obj+0x1d = 1
  return
```

The validation reads `u16[1]` and `u16[7]` — the "additional PZX slot" entries
established empirically (see `30_n5s/40_semantics.md`). If both are valid, the
extended setup loads alt-frame sprites; otherwise the monster spawns with just
the primary PZX.

### Special eMonType paths (skeleton)

| eMonType | Path entry | Notes (TBD)                                                     |
|----------|------------|-----------------------------------------------------------------|
| `0x70`   | `@0xb0f70` | reads obj+0xd4; multiplies; touches obj+0xd6 (movement bound)   |
| `0x80`   | `@0xb0fd4` | TBD — likely large boss                                         |
| `0x82`   | `@0xb0f88` | TBD                                                             |
| `0x09`   | `@0xb1130` | TBD — gate-class object (matches u8[13]=7 + eMonType=9 records) |

### 12-case jump table (DECODED)

Same GOT-relative dispatch as DAMAGE. Resolved table base: `0x12a8b0` in
`.rodata`. 12 cases collapse to **5 unique behaviour bodies**:

| Sub-state | Cases (count) | Target     | Body                                   |
|-----------|---------------|------------|----------------------------------------|
| `validate_only` | 0, 2, 6, 8, 9, 10 (6) | `0xb0e44` | most monsters — just validate objInfo  |
| `anchor_full`   | 1                     | `0xb0e2c` | save bounds + repurpose as patrol anchor |
| `directional_motion` | 3                | `0xb0e72` | orientation check + motion 9 (DAMAGE-alt) |
| `boss_activate` | 4, 5, 11 (3)          | `0xb0f4c` | direct activation, skip validation     |
| `anchor_simple` | 7                     | `0xb0f34` | save anchor only, then validate        |

So `obj+0x40` is effectively a **5-way enum** with multiple value aliases.

**Confirmed source (2026-04-15):** `obj+0x40 = N5M object record's `f4`. Set
at spawn time in `CMap_J::LoadMap` (`@0x9fe54`). See
`50_init_flow/object_spawn.md` for the full field mapping.

#### `validate_only` (cases 0, 2, 6, 8, 9, 10) @ `0xb0e44`

```
objInfo = obj+0xf4
if objInfo.u8[0] == 0:        # active flag
  obj+0x1d = 1
  return
if (i16)objInfo.u16[9] < 0 or (i16)objInfo.u16[15] < 0:
  obj+0x1d = 1
  return
goto extended_setup @0xb0f92    # loads alt PZX slots from u16[1]/u16[7]
```

The "no setup" default — fall through to validation, then enter extended setup
that loads additional PZX motion slots if available.

#### `anchor_full` (case 1) @ `0xb0e2c`

```
obj+0x4c = obj+0xd6          # save AI bound (= u16[12]) as anchor X
obj+0x52 = obj+0xda          # save +0xda as anchor Y
obj+0xd6 = obj.x              # new bound = current X
obj+0xda = obj.y              # new bound = current Y
fall through to validate_only
```

This is the canonical "patrol around current position" pattern: the bounds
become anchors for oscillation.

#### `directional_motion` (case 3) @ `0xb0e72`

```
if obj+0x3e == obj+0xd4:      # orientation matches direction
  goto alt_path @0xb0fb4
objInfo = obj+0xf4
if (i16)objInfo.u16[11] < 0 or (i16)objInfo.u16[17] < 0: exit_with_flag
pzx = CMapMgr::GetPzxMgr(parent.field_14)
CObject::AttachPZX(obj, pzx)
CAniObject::ChangeMotion(obj, motion_id=objInfo.u8[9], 0)   # DAMAGE-alt motion pair
if obj+0xd6 != 0:
  goto specialized @0xb116e
```

Notable: this uses **motion pair 3** (`u8[9]` = DAMAGE-alt motion id; see
`CMonster_fields.md` motion pair table). Some monsters use the DAMAGE-alt motion
even in ACTIVE state — likely "warning/aggression" pose.

#### `boss_activate` (cases 4, 5, 11) @ `0xb0f4c`

```
obj+0x39 = 1                  # activate flag
obj+0x52 = obj+0xd4            # save spawn_x as anchor X
obj+0x56 = obj+0xd6            # save AI bound as anchor Y
[obj+0xec].field_0xc = 0       # clear chain pointer state
obj+0x3a = 1                   # secondary active flag
return                         # NO validation — direct activation
```

Boss-style: activate immediately without validation, set up chain-pointer link
for multi-segment behaviour.

#### `anchor_simple` (case 7) @ `0xb0f34`

```
obj+0x4c = obj+0xd6            # save anchor X only (no swap)
obj+0x52 = obj+0xda            # save anchor Y
obj+0x56 = 0
fall through to validate_only
```

Like `anchor_full` but doesn't repurpose `obj+0xd6`/`+0xda` — useful when
the monster should NOT change its movement bound on entering ACTIVE.

## CMonster_J::DoFSM_MONSTER_ACTIVE (`0xae59d`, 2652 B / 1234 insns)

Per-frame AI tick. Same 12-case dispatch as Init (jump table at `@0xae682`).

```
@0xae5a4  if obj+0xfa != 0: goto skip_exit       # paused / disabled flag
@0xae5b4  subtype = obj+0x40 (u8)
          if subtype <= 11:
              goto subtype_dispatch @0xae680     # same 5-unique-body table as Init
          # subtype > 11 — generic eMonType-driven path:
          CAniObject::DoAnimate(obj)              # tick animation
          eMonType = obj+0x48 (u16)
          if eMonType == 9:        goto gate_case @0xaec04
          if eMonType == 0x7b:     goto special_0x7b @0xaec3e
          if eMonType <= 0x7b:     ... small-eMonType branches ...
          # ... more eMonType-range branches
```

### Behavioural profile

Top BL-target frequency reveals what this function actually does:

| Function                          | Calls | Role                                  |
|-----------------------------------|-------|---------------------------------------|
| `CAniObject::IsEndAnimation`      | 16    | wait for current motion to finish     |
| `CMapMgr::GetPzxMgr`              | 12    | fetch alternate sprite manager        |
| `CAniObject::SetPzxMgr`           | 11    | swap to alternate sprite              |
| `CAniObject::ChangeMotion`        | 10    | trigger next motion                   |
| `CAniObject::DoAnimate`           | 7     | tick animation                        |
| `CMap::GetPath` / `GetPathLayer`  | 2 / 2 | path-following (movement along nodes) |
| `CPath::GetCorrectionPosY`        | 2     | snap-to-path Y correction             |
| `CAniObject::InitMotion`          | 2     | re-init motion (one-shot)             |

So the "AI" is overwhelmingly **animation-state driven**, not physics-driven:
- wait for animation end → swap sprite/motion → repeat
- per-frame movement comes from the velocity fields (`obj+0x4c/0x52`) set up
  during `InitFSM_MONSTER_ACTIVE` and integrated by `DoPathLogic` (the same
  `vtable[+0x1c]` integrator player jumps use)

Path-following monsters (rail-style) use `GetPath`/`GetPathLayer`/
`GetCorrectionPosY` to follow N5M path nodes; non-path monsters just oscillate
around the anchor set by `InitFSM_MONSTER_ACTIVE`.

### Internal helpers (recursive-looking BL targets)

- `0xae5bc`, `0xae618`, `0xae61c`, `0xae676` — these are addresses **inside**
  DoFSM_ACTIVE. GCC hoisted shared sub-blocks. They handle common cleanup:
  re-attaching an animation handle, advancing to the next motion in a
  pre-defined sequence, or transitioning to DAMAGE/END states.

### eMonType-specific branches in DoFSM_ACTIVE (decoded)

After `obj+0x40` 12-case dispatch (subtype > 11 fall-through), the engine
routes by `obj+0x48` (eMonType, i16):

| eMonType | Branch addr | Role                                                    |
|----------|-------------|---------------------------------------------------------|
| 9        | `@0xaec04`  | gate-class object (mirrors Init special)                |
| 0x70 (=112) | (small handler near `@0xae6a2`) | per-frame helper for eMonType 0x70 |
| 0x71 (=113) | `@0xaec92`  | special 0x71                                          |
| 0x7b (=123) | `@0xaec3e`  | boss-class 0x7b                                       |
| 0x7d (=125) | falls to `@0xae5e4` (gentle-activation default) | "activate without path-follow" path |
| 0x7e (=126) | `@0xaebc4`  | special 0x7e                                          |
| 0x7f (=127) | `@0xaeb6c`  | special 0x7f                                          |
| 0x82 (=130) | `@0xaed0e`  | special 0x82                                          |
| (other > 0x7e or in 0x7d range) | falls to validation | standard path |

Range structure (from cmp tree at `@0xae5d0..@0xae6a0`):
```
if eMonType == 9:    boss/gate
if eMonType == 0x7b: boss
if eMonType > 0x7b:
   if eMonType > 0x7e:
      if eMonType == 0x7f: special_0x7f
      if eMonType == 0x82: special_0x82
      else: validation
   else (0x7c..0x7e):
      if eMonType == 0x7d, 0x7e (excluding 0x7e special): gentle-activation
      if eMonType == 0x7e: special_0x7e
if eMonType <= 0x7b:
   if eMonType == 0x71: special_0x71
   if eMonType > 0x71: generic_high_path
   if eMonType == 9 (alt): special_9 path
   if eMonType == 0x70: special_0x70
   else: validation
```

### Per-eMonType branch decode (2026-04-15)

#### eMonType 9 (gate) — `@0xaec04`

```
if !IsEndAnimation(this): exit
if obj+0x30 == 0: exit                    # queued sub-state check
... vtable call (advance state)
obj+0x30 = 0
fallthrough to common validation
```
Animation-end + sub-state progression. Used by gate-class objects that
wait for the gate-open animation to finish, then advance.

#### eMonType 0x70 (=112) — `@0xae6a2`

```
if !IsEndAnimation: exit
if obj.current_motion == objInfo.u8[7]:   # on motion-pair-7
    recurse DoFSM_MONSTER_ACTIVE          # re-enter
obj+0xd8 -= 1                              # countdown
if obj+0xd4 (signed) <= 0: exit
... continues
```
"Hold motion-pair-7 while counting down" pattern — likely a charging or
warning-up enemy.

#### eMonType 0x71 (=113) — `@0xaec92`

```
if obj.current_motion != objInfo.u8[9]: exit  # waits for motion-pair-9
if GetFrameNum(this) == 1: jump @0xaefe2      # first-frame special
if !IsEndAnimation: exit
player+0x34 = 1                                # activate player state flag
... continues
```
"On motion-pair-9, special first-frame action; on animation end, set
player flag" — cooperative interactive enemy.

#### eMonType 0x7b (=123) — `@0xaec3e`

```
if obj.current_motion == objInfo.u8[7]: goto @0xaeec8   # motion-7 path
if obj.current_motion != objInfo.u8[9]: exit
if !IsEndAnimation: exit
... boss-specific multi-motion progression
```
Boss-class. Cycles through motion-pair-7 then motion-pair-9 with
distinct logic per phase.

#### eMonType 0x7e (=126) — `@0xaebc4`

```
if !(obj+0xcc & 8): exit                  # flag-bit gate
counter = obj+0xd4 (i16)
if counter > 14: goto @0xaee62            # exceeded — trigger special
counter += 1
obj+0xd4 = counter
... fallthrough to validation
```
Counter-driven enemy: counts up to 15 frames then fires special action.

#### eMonType 0x7f (=127) — `@0xaeb6c`

```
this->vtable[+0x1c]()                      # DoPathLogic (physics)
this->vtable[+0x20](1)                     # next vtable method (likely SetXxx)
exit
```
Minimal — passive object that just steps physics + flips a flag each
frame.

#### eMonType 0x82 (=130) — `@0xaed0e`

```
if !IsEndAnimation: exit
if obj.current_motion == objInfo.u8[7]: goto @0xaef7a   # motion-7 done
if obj.current_motion == objInfo.u8[8]: goto @0xaef96   # motion-8 done
if obj.current_motion == (objInfo.u8[8] - 4): exit_validation
... 3-motion cycle progression
```
3-phase animated enemy cycling through motions 7 → 8 → (8-4=4) → loop.

### Common pattern across special eMonTypes

All special eMonTypes follow the shape:
1. **Wait for specific animation/motion to finish**
   (`IsEndAnimation` check filtered by current motion id)
2. **Advance to next motion or trigger side effect**
   (player flag, counter increment, recursion, vtable call)
3. **Return to default validation gate** for fall-through cases

This keeps the dispatcher small (top-level cmp + branches) while
parameterising per-enemy behaviour via `tagSObjectInfo.u8[7..9]` motion
ids and the eMonType-specific code path.

### Gentle-activation default (`@0xae5e4`)

For eMonType in `{0x7c, 0x7d}` (and falls-through cases):
```
DoPathLogic(obj)                 # apply velocity integration
if obj+0x39 == 0 (not active):
    obj+0x4c = 0                  # vx = 0 (stop horizontal)
    if obj+0xd6 != 0: skip rest  # already moved
    obj+0x3a = 0                  # disable path-follow
    goto extended_setup
load objInfo, run validation
```

So these "gentle" eMonTypes activate without overwriting bounds — they
were spawned mid-air or as decorations.

### Validation gate (shared)

The shared validation block at `@0xae618` reads:
```
objInfo = obj+0xf4
if objInfo.u8[0] == 0: skip
if (i16)objInfo.u16[9] (offset 0x12) < 0: skip
if (i16)objInfo.u16[15] (offset 0x1e) < 0: skip
if !IsEndAnimation(obj): skip
if !active flag (++ counter not == 1): skip
# all-good — load alt PZX and change motion (motion-pair 0)
pzx = GetPzxMgr(objInfo.u16[9], objInfo.u16[15])
SetPzxMgr(obj, pzx)
ChangeMotion(obj, motion_id=objInfo.u8[7], init=(objInfo.u8[1]==0))
```

So the standard ACTIVE path swaps to alternate PZX (using `u16[1]/u16[7]`
PZX slots) and starts motion pair 1 (`u8[1]/u8[7]`). This is the "actually
attack/move" transition — the entry path was just animation-end waiting.

## Field reference

See `docs/40_engine/10_runtime_objects/CMonster_fields.md` for full field map.
Key ones for ACTIVE:

- `obj+0x40` — sub-state / pattern id
- `obj+0x48` — eMonType (top-level dispatch key)
- `obj+0x4c`, `+0x52` — saved anchor positions (set by ACTIVE Init)
- `obj+0xd6`, `+0xda` — current movement bounds (overwritten by ACTIVE Init)
- `obj+0xf4` — objInfo (data-driven AI parameters)

## Open

- ~~Per-case Init body decode~~ **DONE** for `CMonster_J` Init (12 cases →
  5 unique behaviours). `CMonster_T` and `CMonster_Shoting` Init mirrors not
  yet checked — likely similar dispatch with subclass tweaks.
- **DoFSM_MONSTER_ACTIVE** (`CMonster_J` 2652 B, `CMonster_T` 6714 B,
  `CMonster_Shoting` 4360 B) per-frame AI tick — much larger than Init; needs
  separate decode pass. Likely mirrors the same `obj+0x40` dispatch and uses
  the anchors set up by Init (`+0x4c/+0x52/+0x56`).
- Source of `obj+0x40` value (likely N5M object record field `f4` or `f5`).
  Confirm by inspecting `CMap_J::LoadMap` object construction path.
- Bullet/projectile spawn paths and parameters (`CMonster_J::FireBullet`
  at `0xafa01`, 440 B).

# Player Physics (Jump / Gravity / Movement Integration)

CNom physics is split between **state machine** (`DoFSM_NOM_*` per-state ticks)
and a **base-class virtual integrator** (`obj.vtable[+0x1c]()`) that advances
position from velocity each frame.

## Velocity field

`obj+0x52` is the **vertical velocity** (`vy`), shared between:
- `CMonster` damage recoil (set by `InitFSM_MONSTER_DAMAGE` cases — see
  `CMonster_DAMAGE.md`)
- `CNom` jumps (set by `InitFSM_NOM_JUMP` family)

Negative `vy` = upward, positive = falling. Initial jump values from KeyLogic
analysis: `-20 / -32 / -32 / -40` (3 strength tiers).

`obj+0x56` is a related **duration / counter** field used to time recoil/jump.

## Integrator: `CObject::DoPathLogic` (`0xd5f4d`, 846 B)

`vtable[+0x1c]` resolves to `CObject::DoPathLogic` for CNom (most subclasses),
CMonster (base), and many other CObject derivatives. CMonster_J / Decal /
Shoting override with their own `DoPathLogic`; CNom_Shoting also overrides.

The default branch (when `obj+0x3a == 0`, i.e. no path-following mode) is the
**velocity integrator**:

```
@0xd5f70  vx = obj+0x4c
          obj.x = obj+0x20 + vx
          vy = obj+0x52
          obj.y = obj+0x22 + vy
          ax = obj+0x50              # horizontal acceleration / friction
          obj+0x4c = vx + ax         # vx += ax
          ay = obj+0x56 (signed)     # vertical acceleration = gravity
          max_vy = obj+0x58 (signed) # terminal velocity
          new_vy = vy + ay
          if new_vy > max_vy: new_vy = max_vy   # clamp
          obj+0x52 = new_vy
          return
```

So gravity is **data-driven, not a hardcoded constant** — every object carries
its own `+0x56` (gravity) and `+0x58` (terminal velocity). FSM init handlers
set these per state.

The path-following branch (when `obj+0x3a != 0`) handles N5M path layers:
calls `0x9bee0` to advance along path nodes, applies scroll-mode-specific
adjustments (special-cases for `parent.+0x6d` values 0x11, 6).

## Confirmed gravity values

**CObject ctor defaults** (`0xd6359`, applies to every CObject including CNom
and CMonster on construction):

| Field          | Default value                          |
|----------------|----------------------------------------|
| `+0x4c` (vx)   | 0                                      |
| `+0x50` (ax)   | 0                                      |
| `+0x52` (vy)   | 0                                      |
| `+0x56` (gravity) | **0** (no gravity)                  |
| `+0x58` (terminal_vy) | **0x28 = 40** (clamp at 40 px/frame)|
| `+0x5a..0x66` (anchors, prev_x/y, etc.) | 0           |

So by default an object has **no gravity** (it floats / moves linearly).
Gravity is enabled per-state by FSM init handlers:

| State                  | `obj+0x52` (vy)         | `obj+0x56` (gravity) |
|------------------------|-------------------------|----------------------|
| `InitFSM_NOM_JUMP`     | `arg5` (passed in)      | **not set** — inherits |
| `InitFSM_NOM_JUMP_HIGH`| `arg5` (passed in)      | **8**                |
| `InitFSM_NOM_JUMP_WALL`| complex setup           | not directly set     |

So basic `JUMP` only produces a real arc if a prior state already set
gravity (e.g. an earlier `JUMP_HIGH` left it at 8, or a stage-init handler
set a stage-default). If gravity stays at 0, basic `JUMP` produces a linear
trajectory — used for short ballistic hops on path-attached movement
where vertical clamp isn't needed.

So `JUMP_HIGH` defines the engine's canonical **gravity = 8 per frame**.
Basic `JUMP` reuses whatever `+0x56` was set during stage init or the
previous active state. `JUMP_WALL` keeps the carry-over gravity but reshapes
the trajectory by manipulating `obj+0x44` (timing/range parameter) and
sub-counter at `obj+0xec[+8]`.

With `vy_initial = -32` and `gravity = 8`, the standard high jump arc is:

| frame | dy   | vy   |
|-------|------|------|
| 0     | -32  | -24  |
| 1     | -24  | -16  |
| 2     | -16  | -8   |
| 3     | -8   | 0    |
| 4     | 0    | 8    |
| 5     | 8    | 16   |
| ...   | ...  | (clamp at +0x58) |

Total airtime to apex ~4 frames, full arc shape is symmetric to landing.

## Wall jump (DoFSM_NOM_JUMP_WALL)

`DoFSM_NOM_JUMP_WALL` (`0xca251`, 200 B) implements the "stick to wall, hold,
release" sequence:

```
range = obj+0xec.field_0x18 (i32)
if range < 0:                              # finished
    obj+0x44 = 0
    DoAnimate(obj); return

obj+0x44 = (range - 1) * 0x5a              # = (range - 1) * 90 — accumulator
DoAnimate(obj)
phase = obj+0xec.field_8

if phase == 0:                             # entry frame
    obj+0xec.field_8 = 1
    PlaySound(0x32, 0)                     # wall-jump SFX (0x10214c)
    obj+0xec.field_0x1c = GetTime()        # start timer
    continue to phase >= 1

# phase >= 1
if !IsEndAnimation(obj):
    AddDrawLayerAniObject(...)             # tick draw, wait for anim end
    return

elapsed = GetTime() - obj+0xec.field_0x1c
if elapsed <= 1000ms:                      # hold 1 second
    AddDrawLayerAniObject(...)
    return

# released: change to motion 2d (release), end FSM state
singleton.vtable[+0x34]()                   # global state transition
ChangeMotion(emb, 0x2d, 0)                  # release-from-wall motion
DoAnimate(emb)
return
```

So wall jump = **stick to wall, play stick animation, hold 1 second, then
release with motion 0x2d**. The `range * 90°` accumulator at `obj+0x44`
suggests vertical-rotation-style climbing (each "range" step = 90°).

## Subclass overrides

`CMonster_J::DoPathLogic` (`0xadfd1`, 780 B) — the default-branch (no path,
`obj+0x3a == 0`) is **byte-for-byte identical** to `CObject::DoPathLogic`'s
integrator (lines `0xadfe8..0xae024` mirror `0xd5f70..0xd5faa` exactly).
The override adds **path-following correction** in the `obj+0x3a != 0` branch:

- `CMap::GetPath(obj+0x3d, obj+0x3e)` — fetch active path
- `CPath::GetPathAngle` — current tangent angle
- `CPath::GetCorrectionMovePos` / `GetCorrectionPosX` / `GetCorrectionPosY`
  — snap monster to path coordinates
- `__aeabi_idivmod` × 2 — modular arithmetic for path looping (segments wrap)

So path-attached monsters are constrained to the N5M path; non-path monsters
use the same integrator as the player. `CMonster_Decal` and `CMonster_Shoting`
inherit this same path-aware variant.

`CNom_Shoting::DoPathLogic` (`0xd1e95`) is a similar override for the
shooting-stage player variant.

## Per-object physics state field map

| Offset | Type | Meaning                                          |
|--------|------|--------------------------------------------------|
| +0x20  | u16  | current X                                        |
| +0x22  | u16  | current Y                                        |
| +0x4c  | u16  | vx (horizontal velocity)                         |
| +0x50  | i16  | ax (horizontal acceleration)                     |
| +0x52  | i16  | vy (vertical velocity)                           |
| +0x56  | i16  | ay (gravity / vertical acceleration)             |
| +0x58  | i16  | max_vy (terminal velocity clamp)                 |
| +0x3a  | u8   | "path-following mode" flag (chooses integrator branch) |

## Jump FSM family

| Symbol                          | Vaddr      | Size  | Role                    |
|---------------------------------|------------|-------|-------------------------|
| `PushFSM_NOM_JUMP(i,i,i,i)`     | `0xc778d`  | 44 B  | push state onto stack   |
| `InitFSM_NOM_JUMP(i,i,i,i)`     | `0xc7c39`  | 76 B  | initialise standard jump|
| `InitFSM_NOM_JUMP_HIGH(i,i,i,i)`| `0xc7be1`  | 86 B  | initialise high jump    |
| `InitFSM_NOM_JUMP_WALL(i,i,i,i,i)` | `0xc7db5` | 192 B | initialise wall jump   |
| `DoFSM_NOM_JUMP`                | `0xca651`  | 244 B | per-frame standard jump |
| `DoFSM_NOM_JUMP_HIGH`           | `0xca83d`  | 226 B | per-frame high jump     |
| `DoFSM_NOM_JUMP_WALL`           | `0xca251`  | 200 B | per-frame wall jump     |

## DoFSM_NOM_JUMP shape

```
@0xca650  vy = obj+0x52
          this->vtable[0x1c]()                   # step physics (apply gravity, integrate y)
          if scriptObj_state == 4: goto land     # FSM termination
          CAniObject::DoAnimate(this)             # advance animation
          if obj+0x39 != 0:                       # special "with item" branch
              CAniObjectMgr::AddDrawLayerAniObject(...)
              return

          # per-phase logic on vy direction
          if vy < 0:           # going up
              ...
          elif vy == 0:
              ...
          else:                # falling
              if CAniObject::IsEndAnimation(this):
                  CAniObject::ChangeMotion(this, motion_id=8a*2, init=2, 0)
                  CAniObject::DoAnimate(this)
                  return
```

So the loop is:
1. Snapshot vy
2. Step physics (gravity + position)
3. Advance animation
4. Branch on vy sign to handle ascend/peak/fall
5. On landing, change motion to "land" and end state

## DoFSM_NOM_JUMP_HIGH shape

Adds a **multi-phase counter** at `obj+0xec[+8]` (phase) and `obj+0xec[+0xc]`
(sub-phase):

```
phase++ at obj+0xec[+8]
if phase > 1:
   this->vtable[0x1c]()            # delay physics for first frame
if phase > 3:
   ...check vy/landing...
```

This implements a **windup**: high jump has 3 frames of preparation animation
before launch, then enters the integration loop.

## Run integrator (DoFSM_NOM_RUN)

`DoFSM_NOM_RUN` (`0xc7ec9`, 168 B) decoded:

```
mode = parent_mgr.+0x6d                 # terrain/scroll mode
if mode == 9 or mode == 0x1a:
    if obj+0x4c == 0:                   # vx is zero → idle
        obj+0x124 += 1                   # idle counter
        if obj+0x124 > 50:
            obj+0x4c = obj+0x4e          # restore vx from saved value
DoAnimate(obj)
this->vtable[+0x1c]()                    # CObject::DoPathLogic — same integrator
if global_state.+0x68 != 0 or global_state.+0x94 > 99:
    handle_popup_or_transition()
else:
    AddDrawLayerAniObject(...)           # continue running
```

So RUN uses the **same `DoPathLogic` integrator** as JUMP — there's only one
movement primitive in the engine. The state-specific FSM bodies just set
different velocity field values:

- RUN: `obj+0x4c` ≠ 0 (vx), `obj+0x52` = 0 (no vy), `obj+0x56` typically 0
- JUMP: `obj+0x52` ≠ 0 (vy), `obj+0x56` = gravity, `obj+0x4c` may carry from RUN

`obj+0x4e` is a **saved-vx field** restored after 50-frame idle (used in
vertical scroll modes 9/0x1a where the player auto-resumes movement).

## Open

- ~~Locate gravity constant~~ **DONE** — `obj+0x56` is data-driven; `JUMP_HIGH`
  sets it to `8`. Basic `JUMP` reuses inherited value.
- ~~Confirm `obj+0x4c` as horizontal velocity~~ **DONE** — confirmed in DoPathLogic
  default branch.
- ~~Find default `+0x56`/`+0x58` init~~ **DONE** — CObject ctor sets
  gravity=0, terminal_vy=40. Basic JUMP inherits whatever was set by the
  most recent gravity-aware state (typically JUMP_HIGH=8).
- Decode landing detection: terrain check that ends jump (likely in
  `DoFSM_NOM_JUMP` shape — currently calls `vtable[+0x1c]` then checks `obj+0x18`
  for state 4 = "landed").
- Decode wall-jump rebound logic in `DoFSM_NOM_JUMP_WALL`.
- Decode `CMonster_J::DoPathLogic` (`0xadfd1`, 780 B) — monster-specific
  override; likely adds AI movement on top of the same integrator.

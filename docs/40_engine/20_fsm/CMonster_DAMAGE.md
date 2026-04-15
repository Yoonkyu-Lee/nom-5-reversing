# CMonster DAMAGE FSM

Per-`u8[14]` 13-case jump table dispatched in `CMonster_J::InitFSM_MONSTER_DAMAGE`
(`0xab5fd`, 1240 B). `CMonster_T` and `CMonster_Shoting` mirror the same
structure.

## Dispatch

```
@0xab658  ldrb r3, [objInfo, #0xe]      ; r3 = u8[14]
@0xab65a  cmp  r3, #0xc                   ; > 12?
@0xab65c  bls  jump_dispatch              ; ≤ 12 → table
                                          ; > 12 → fall through to 0xab65e (no-op)

@0xab67c  ldr  r2, [pc, #0x2f0]           ; r2 = GOT-relative table offset
          lsls r3, r3, #2
          adds r2, r5, r2                  ; r5 = GOT base; r2 = table base
          ldr  r3, [r2, r3]
          adds r2, r3, r2                  ; target = entry + table_base
          mov  pc, r2
```

Resolved jump table base: `0x12a4c4` in `.rodata`. Decoded targets:

| u8[14] | target     | observed records | pattern (working name)            |
|--------|------------|------------------|-----------------------------------|
| 0      | `0xab778`  | 195              | horizontal knockback (default)    |
| 1      | `0xab7b2`  | (rare)           | random recoil for items           |
| **2**  | `0xab65e`  |                  | **NO-OP** (NULL animation)        |
| **3**  | `0xab65e`  |                  | **NO-OP**                         |
| 4      | `0xab7e4`  |                  | fixed-distance recoil             |
| 5      | `0xab81e`  |                  | explosion / particle spawn        |
| 6      | `0xab844`  | 193              | aerial knockback (fly upward)     |
| 7      | `0xab882`  |                  | strong horizontal recoil          |
| 8      | `0xab8b8`  |                  | variant of case 4 (shared tail)   |
| 9      | `0xab8da`  |                  | position-locked particle effect   |
| **10** | `0xab65e`  |                  | **NO-OP**                         |
| **11** | `0xab65e`  |                  | **NO-OP**                         |
| 12     | `0xab688`  |                  | boss pre-damage (eMonType == 0x7f) |

The empirical bimodal distribution (`u8[14]=0` × 195 and `u8[14]=6` × 193) maps
to the two main reactions: **horizontal pushback** vs **aerial pop-up**.
Cases 2/3/10/11 redirect to the no-op exit, meaning four out of 13 slots are
intentional NULL reactions (used for monsters that should not flinch on hit).

## Common runtime fields written

The damage handlers write a small set of CMonster runtime fields that the per-frame
update consumes:

| Offset  | Role                                                              |
|---------|-------------------------------------------------------------------|
| `+0x4c` | recoil X-velocity (or anchor X for case 6 aerial)                 |
| `+0x50` | recoil X-bound / 0                                                |
| `+0x52` | recoil Y-velocity                                                 |
| `+0x56` | recoil duration (frames)                                          |

So a hit reaction = "set (vx, vy, duration) and let DoFSM_DAMAGE animate".
The shared tail at `0xab7d8` (used by cases 4 and 8) writes the standard
duration/bookkeeping after each pattern-specific setup.

## Per-case pseudocode

### case 0 — horizontal knockback (default)

```
obj+0x56 = 0                               ; reset duration counter
eMonType = obj+0x48
delta = eMonType + (loaded constant)        ; clamp branch on (delta <= 1)
if not eMonType branch:
  # standard horizontal push from attacker direction
  attacker_x = eventRect+0x20 (signed)
  if eventRect+0x4c (some bound) <= 0: jump alt
  vx_target = current_x + (loaded constant)
  bl 0xd56f4(vx_target, current_y)         ; sets recoil velocity
goto exit (0xab65e)
```

`0xd56f4` is the "set recoil to (target_x, target_y)" helper used by multiple
cases (also case 6).

### case 6 — aerial knockback (fly upward)

```
if obj+0x37 (orientation) != 0: jump alt
if (parent_mgr+0x6b == 2): jump alt 0xaba88   ; some boss/special map check
attacker_x = eventRect+0x20
attacker_y = eventRect+0x22 - 0x32 (= attacker_y - 50)   ; aim slightly above
bl 0xd56f4(attacker_x, attacker_y - 50)
obj+0x52 = -10                              ; vy = -10 (upward)
obj+0x56 = 5                                ; duration = 5 frames
goto exit
```

This is the "spike upward" reaction common to most monsters when shot.

### case 1 / case 4 / case 7 — random horizontal recoil

```
case 1:  rand(0x14) + 0x14   → obj+0x52 (random small Y bounce)
case 4:  obj+0x4c = 0x28; obj+0x50 = 0;  rand(0x14)*-1 → obj+0x52
case 7:  obj+0x4c = (eventRect+0x4c) << 1; rand(0x0a)+0x1e → obj+0x52; obj+0x56 = -4
```

All branch on `obj+0x37` (left/right orientation flag) and `obj+0x3b` (monster
vs item classifier — if item, take alternate path that ignores recoil entirely).

### case 5 — explosion spawn

```
bl 0xab0e0(obj, &out_x, &out_y)            ; resolve hit position
bl 0x827b0(GOT.something, 0, out_y, 0, 0, out_x)  ; spawn effect/event
goto exit
```

Likely spawns a `CEventRect`-derived particle/explosion at the hit position.

### case 9 — position-locked particle

```
obj+0x10c = (current_x as i32) << 16        ; lock X position (.16 fixed)
obj+0x110 = (current_y as i32) << 16        ; lock Y position
bl 0x9bee0(parent_mgr, obj+0x3d, obj+0x3e)  ; spawn periodic effect
... periodic timer setup using parent_mgr+0x68
goto exit
```

### case 12 — boss pre-damage

```
if eMonType == 0x7f (127):
  if hp > 0:
    bl 0xa7c60(parent_mgr+0x14, ...)        ; some boss-state setup
    zero eventRect+0x4c on two referenced objects
    store current_x as i32 to obj+0x10c
... continues with boss-specific bookkeeping
```

Used by a single eMonType (127). Likely a multi-stage boss damage pre-step.

### no-op exit (cases 2/3/10/11 and u8[14] > 12)

```
@0xab65e  eMonType = obj+0x48
          if (eMonType - 0x6d) <= 1:        ; eMonType in {0x6d, 0x6e}
            (parent_mgr_chain pointer at obj+0xec)+0xc = 7
          return
```

So even the "no-op" path does ONE thing: for two specific eMonTypes (0x6d, 0x6e),
it writes `7` into a chain pointer's `+0xc` field. Likely resets some queued
animation state. For all other types, it's a true no-op.

## Field reference

See `CMonster_fields.md`. Damage-relevant offsets:
`+0x37` orientation flag, `+0x3b` monster/item classifier, `+0x41` extra flag,
`+0x48` eMonType, `+0x4c/0x50/0x52/0x56` recoil state, `+0x10c/0x110` locked
position (case 9, case 12), `+0xec` chain pointer.

## Open

- Identify `0xd56f4` precisely (recoil-velocity setter) — used by cases 0 and 6.
- Identify `0x827b0` (case 5 effect spawn).
- `obj+0x4c` semantics differ per case (recoil velocity vs anchor) — disambiguate.
- Cases 1/4/7/8 share substantial logic; could collapse into a single
  parameterised helper.

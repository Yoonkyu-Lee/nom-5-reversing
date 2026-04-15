# CNom Movement & Input

`CNom::KeyLogic(CObject*)` (`0xc9031`, 1026 B / 498 insns) is the **interactive
contact dispatcher**: when the per-frame collision check finds the player
intersects an interactive object, KeyLogic picks the correct response
(jump variant, attack, wall hit, item pickup) based on the object's
`eMonType` and contact mode.

**Important distinction:** This is *not* the raw input poller. The actual
input read happens earlier (likely `GetTuchKeyValue` and game-loop input
buffering). KeyLogic is "given an active key + a touched object, push the
right player FSM state".

## Entry guard

```
@0xc903c  obj = arg1 (CObject*)
          if obj+0x3c != 0:   return       ; obj has no contact-mode → skip
          if cnom+0x34 == 0:  return       ; cnom inactive → skip
          eMonType = obj+0x48 (i16)
          if eMonType > 160:  return       ; cap on object type id
          mode = obj+0x6d (u8)
          ... dispatch on (eMonType, mode) ...
```

`obj+0x6d` is the same byte that `CMonster_J::CheckCrashToNom` reads to choose
collision sub-cases — likely a **per-object collision-class code** (0..N).

## BL targets (action triggers)

| BL target  | Function                          | Calls | Action triggered          |
|------------|-----------------------------------|-------|---------------------------|
| `0xc778c`  | `CNom::PushFSM_NOM_JUMP`          | 4     | enter JUMP state (4 variants) |
| `0xc775c`  | `CNom::PushFSM_NOM_ATTACK`        | 2     | enter ATTACK state (2 variants) |
| `0xc8d94`  | `CNom::KeyWallLogic`              | 1     | delegate to wall handler  |
| `0xc8d28`  | `CNom::KeyCapsuleLogic`           | (called inline) | item pickup helper |
| `0xd3ae4`  | `CNomUI::AddMonFiver`             | 1     | award fiver on contact    |
| `0xd5a6c`  | (CNomUI helper)                   | 1     | UI side effect            |
| `0xd5bb8`  | (CNomUI helper)                   | 1     | UI side effect            |
| `0xaa9bc`  | `CMonster::IsActive`              | 1     | re-check object aliveness |
| `0xb8db8`  | `CMvApp::GetStageInfo`            | 2     | game-mode lookup          |
| `0x107114` | `GxGetFrameT1`                    | 2     | sprite frame helper       |

### Jump variants — by initial vy and variant id

Decoded from BL call sites (sp[0] = `vy_initial`, r3 = variant id passed to
`PushFSM_NOM_JUMP`):

| Site addr  | vy_initial | variant id (r3) | Notes                         |
|------------|------------|-----------------|-------------------------------|
| `0xc91ee`  | -32        | 4               | first jump branch             |
| `0xc9280`  | -32        | (from fp reg)   | sub-object-derived jump       |
| `0xc9394`  | -20        | 0               | weakest jump (likely default) |
| `0xc93ba`  | -40        | 5               | strongest jump (boss/special) |

So 4 jumps span 3 strength tiers (`vy = -20 / -32 / -40`). The variant id
selects animation/landing behaviour in the FSM body.

### Attack variants

Both `PushFSM_NOM_ATTACK` calls (`0xc9102`, `0xc925e`) share identical arg
setup pattern; the discriminator is which **outer eMonType branch** routes here:

| Site addr  | Trigger condition                                   |
|------------|-----------------------------------------------------|
| `0xc9102`  | first attack branch (eMonType range A)              |
| `0xc925e`  | second attack branch (eMonType range B)             |

Both pass `[obj+0xf4][+4]` (= `objInfo.u8[4]`, motion-pair 4 init flag) and
fields from sp+0x18/0x1c (likely target_x/target_y).

### Wall handler

`KeyWallLogic` BL @ `0xc92e8`: called with `(player, obj)` after a
`0xd5bb8` (some hit-test) returns nonzero. This is the delegation to wall
collision response.

## FSM state push pattern

```
PushFSM_NOM_JUMP(eMonType, ?, x_target, y_target, ?)
PushFSM_NOM_ATTACK(eMonType, x_target, y_target, ?)
```

These functions push a new FSM state record onto the player's state stack
(`CNom::PushFSM_*` mirrors `CMonster::PushFSM_*` pattern). The DoFSM
update tick later pops and processes state-specific motion.

Other FSM pushes from the broader CNom corpus:
- `PushFSM_NOM_DAMAGE_STAR_HARD` (0xb256d)
- `PushFSM_NOM_COLLISION_STAR` (0xb2599)
- `PushFSM_NOM_MOVE_LAYER` (0xb1231)

## Per-frame call chain

```
CMap_J::DoLogic
  ├─ poll input (GetTuchKeyValue → key buffer)
  ├─ for each interactive CObject:
  │    if overlap(player, obj):
  │      CNom::KeyLogic(obj)              # this function
  │        ├─ dispatch on obj.eMonType + obj.mode (+0x6d)
  │        ├─ PushFSM_NOM_JUMP / ATTACK / etc.
  │        └─ AddMonFiver / score side effects
  ├─ CNom::DoFSMLogic                       # consume pushed states
  ├─ CNom::DoLogic                          # per-frame movement update
  └─ ...
```

## Wall / capsule sub-handlers

- `CNom::KeyWallLogic` (`0xc8d95`, 668 B) — handles wall-collision response:
  bounce direction, damage trigger, animation.
- `CNom::KeyCapsuleLogic` (`0xc8d29`, 108 B) — item-capsule pickup: removes
  the capsule object, awards score/energy.

These are called from KeyLogic when `eMonType` falls in their respective ranges.

## Open

- Decode each `eMonType` branch to enumerate the 4 jump and 2 attack variants.
- Locate the **raw input read** (likely in a Java-side game loop calling
  `GetTuchKeyValue`).
- Decode `KeyWallLogic` 668-byte body for wall-bounce semantics.
- Identify the gravity / per-frame movement integration site (likely inside
  `CNom::DoFSMLogic` or `CNom::DoLogic`, not yet pinpointed).
- Map jump arc parameters (initial vy, gravity constant, max height).

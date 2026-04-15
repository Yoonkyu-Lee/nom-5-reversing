# Player ↔ Monster Collision (CheckCrashToNom)

`CMonster_J::CheckCrashToNom` (`0xad01d`, 4018 B / 1862 instructions) — the
largest single function in the monster system. Per-frame check that drives
**all** UI side effects when player hits or is hit by a monster.

`CMonster_T::CheckCrashToNom` (`0xb6e16`) is the parallel implementation for
T-mode stages.

## Entry guard

```
@0xad026  if obj+0x38 != 0:                  ; "active" flag
            return
@0xad036  player = obj+0x28
          if !player: return
@0xad03e  if obj+0x3c == 0: goto basic_check
          if obj+0xf9 != 0: continue         ; some active-collision flag
          else: goto branch_0xad1fc
```

So CheckCrashToNom only runs if the monster is alive (`+0x38==0`), there's a
target player (`+0x28`), and depending on `+0x3c` (collision-mode flag) takes
one of two main paths.

## Helper inventory (BL target frequency)

| BL target  | Function                          | Calls | Role                                    |
|------------|-----------------------------------|-------|-----------------------------------------|
| `0x107114` | `GxGetFrameT1`                    | 14    | sprite frame transform / bbox helper    |
| `0xb8db8`  | `CMvApp::GetStageInfo`            | 11    | game-mode / stage-flag lookup           |
| `0xd3ae4`  | `CNomUI::AddMonFiver`             | 11    | give player fivers on kill              |
| `0xad2ce`  | `CheckCrashToNom` *(internal helper)* | 11 | inner sub-check                          |
| `0xad332`  | `CheckCrashToNom` *(internal helper)* | 7  | second inner sub-check                   |
| `0x62208`  | `CAniObjectMgr::AddDrawLayerAniObject` | 6 | spawn hit-effect draw layer              |
| `0xd8e74`  | `CPopUpBase::GetTop`              | 6     | UI overlay lookup                        |
| `0xd3cec`  | `CNomUI::AddMonEnergy`            | 11    | give player energy on kill               |
| `0xd230c`  | `CNomUI::AddItemScore`            | 5     | score for item pickup                    |
| `0xa7ba4`  | `CMapMgr::GetPzxMgr`              | 4     | sprite manager fetch                     |
| `0x6197c`  | (CObject method)                  | 4     | sprite/anim attach                       |
| `0x61f40`  | (CAniObject method)               | 4     | motion change                            |
| `0x10266c` | (timer/state utility)             | 4     | bookkeeping                              |
| `0xd2250`  | `CNomUI::AddMonScore`             | 3     | kill score                               |
| `0xd25fc`  | `CNomUI::AddMissCnt`              | 3     | miss/whiff counter                       |

The labels `0xad2ce` and `0xad332` are addresses **inside** CheckCrashToNom —
GCC hoisted shared sub-blocks. Decoded:

### Helper `0xad2ce` — AddHitEffect

```
if obj+0xf9 == 0: return         # "effect spawn enabled" flag
animSlot = obj+0x3d
AddDrawLayerAniObject(mgr, animSlot*3, obj)        # primary hit-effect sprite
if obj.eMonType == 0x87:
    AddDrawLayerAniObject(mgr, animSlot*3 + 2, obj) # secondary effect (eMonType 0x87 only)
return to caller
```

The `*3` multiplier suggests each animation slot in the draw-layer table
has 3 entries (likely sprite/sound/extras). Special-case for eMonType 0x87
adds a second layered effect.

### Helper `0xad332` — trampoline

```
0xad332  ldr r0, [r4, #0x24]    # reset r0 = parent CMap_J
0xad334  b   0xad2ce             # tail-call into AddHitEffect
```

Just a 2-instruction tail-call into `0xad2ce` for sites that need r0 reloaded
first.

So the 18 combined calls (11 + 7) collapse to **a single shared
"AddHitEffect" routine** invoked from many collision-type branches.

## Reward fanout

When a hit resolves to "player kills monster", the function calls (from the
counts above):

- 11 × `AddMonFiver` — coin reward
- 11 × `AddMonEnergy` — energy reward
- 3 × `AddMonScore` — score reward

When the player picks up an item, `AddItemScore` fires (5 sites). The actual
reward values come from `tagSObjectInfo.u16[13/14/16/17]` (see
`CMonster_fields.md` and `30_n5s/40_semantics.md`).

`AddMissCnt` (3 sites) covers the case where the player's attack misses and the
monster slips past — feeds the post-stage results popup.

## Effect spawn

`CAniObjectMgr::AddDrawLayerAniObject` (6 calls) spawns the visible hit effect
(spark/explosion sprite). Specific effects vary by collision type — likely keyed
off `obj+0x48` (eMonType) or `tagSObjectInfo.u8[14]` damage pattern (see
`CMonster_DAMAGE.md`).

## Per-frame call chain

```
CMap_J::DoLogic
  └─ for each active monster:
       CMonster::DoLogic
         └─ DoFSM_<state>            (state-specific tick)
              └─ CheckCrashToNom     (always called when ACTIVE)
                   ├─ overlap test (rect or pixel)
                   ├─ if hit:
                   │    ├─ trigger CMonster::SetDamage (decrements hp, applies u8[14] dispatch)
                   │    ├─ AddDrawLayerAniObject(spark/explosion)
                   │    ├─ if hp == 0 and player attacked:
                   │    │    AddMonScore + AddMonEnergy + AddMonFiver
                   │    └─ if monster touched player:
                   │         AddMissCnt or trigger player damage
                   └─ if !hit and player passed:
                        AddMissCnt
```

## Open

- ~~Decode internal helpers~~ **DONE** — both = single `AddHitEffect` routine
  (one direct, one trampoline). Not "overlap math" as previously suspected;
  the overlap math is inlined per-branch in CheckCrashToNom.
- Confirm exactly when `AddMonScore` (3 sites) fires vs `AddMonFiver`/`AddMonEnergy`
  (11 sites each) — score might be the "primary kill", and fiver/energy are awarded
  per phase of multi-stage kills.
- Identify the player-damage-applying call (where the player loses energy /
  takes a hit reaction). Likely calls into `CNom::DoDamage` or similar.

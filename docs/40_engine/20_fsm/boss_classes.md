# Boss Classes — FSM Tree

Catalog of the engine's boss enemy classes (`CBoss_*`), boss-scene wrappers
(`CBossScene_*`), and player-side variants (`CNom_*`) used in stage-specific
gameplay.

## Boss enemies (CBoss_*)

5 boss classes, each with its own InitFSM_/DoFSM_ family.

### CBoss_GreedKing
Stage 21. Constructor takes `CNom_GreedKing*` (paired player variant).
- States: `INIT`, `ANGRY`, `ATTACK`, `HOLD`, `RUN`, `ESCAPE`, `ESCAPE_JUMP`, `GET_WEAPON`
- Init handlers: 5; Do handlers: 6

#### Per-state behaviour

| State          | Size  | Key calls                                            |
|----------------|-------|------------------------------------------------------|
| INIT           | 96 B  | InitMotion, SetPosition, SetAttack                   |
| ANGRY (Init)   | 120 B | InitMotion, SoundPlay, SetAttack, ClearShots         |
| ANGRY (Do)     | 96 B  | IsEndAnimation                                       |
| ATTACK (Init)  | 96 B  | InitMotion × 4 (multi-motion attack init)            |
| **ATTACK (Do)**| 504 B | `GetBalenceData × 5`, `FireShots × 4`, `Random × 3`, `GsCipher` — fires bullets via CShotManager with HP-tier-tuned params |
| ESCAPE (Do)    | 624 B | `__divsi3 × 3`, `Random × 3`, `GetBalenceData × 2`, `GetStr` — flees with randomized trajectory |
| ESCAPE_JUMP    | 68 B  | IsEndAnimation                                        |
| **GET_WEAPON** | 156 B | `Random × 2`, `GetStr × 2`, `IsEndAnimation`, `ActiveTalkBox` — picks up weapon, shows dialog ("got the weapon!") |
| HOLD (Init)    | 124 B | InitMotion                                            |
| RUN (Init)     | 108 B | InitMotion × 4                                        |

**Key insight**: ATTACK uses `CShotManager::FireShots` (bullets) and pulls
parameters via GetBalenceData — bullet count/speed/spread differ by HP tier.
GET_WEAPON triggers a TalkBox (boss talks during gameplay).

### CBoss_Plate
Boss class for plate-stage. Used by `CBossScene_Plate`.

**Pattern**: state-via-flags (no `Init/DoFSM_*` symbols). Behaviour driven
by direct `DoLogic` dispatch + state-changing setters:

| Method                   | Size  | Role                                  |
|--------------------------|-------|---------------------------------------|
| `Init`                   | 204 B | construct + initial state             |
| `DoLogic`                | 1040 B| **main per-frame dispatcher**         |
| `DoLogicMove`            | 712 B | movement integration                  |
| `DoLogicObjects`         | 2256 B| **bullet/object update** (heavy — manages CBBullet pool) |
| `SetMoveType(i)`         | 934 B | switch between movement patterns      |
| `SetDamage`              | 6 B   | (stub — likely overridden externally) |

`DoLogic` enumerates ~14 distinct state values (0, 1, 2, 3, 4, 5, 8, 9,
0xa, 0xb, 0xc, 0xd, 0x1a..0x1d). Major actions per state:
- `FireBullet × 5` sites — 5 different bullet patterns based on state
- `SetState × 5` — state transitions
- `IsEndAnimation × 8` — each state waits for its animation
- `GetBalenceData × 4` — HP-tiered param lookup
- `Random × 2` — attack pattern randomization

So Plate is a **"fire different bullet patterns based on state"** boss with
state 0 as the hub (29 cmp sites to 0 — likely "no-op if state is 0"
guards) and transitions fired via `SetState(...)`.

### CBoss_Rival_Alien
Stage Rival (boss-game scene with combat moves).
- States: `INIT`, `WAIT`, `BACKWARD`, `FORWARD`, `DASH`, `FAKE`, `GUARD`,
  `ATTACK_JAB`, `ATTACK_UPPER`, `DAMAGE_JAB`, `DAMAGE_UPPER`,
  `DAMAGE_GUARD`, `DAMAGE_GUARD_CRUSH`
- Init handlers: 7; Do handlers: 12 — **most complex boss** (boxing-style fight)

#### Per-state behaviour

All states call `DoAnimate × 1` and most call `IsEndAnimation × 1` and
`CalculateCrashRect × 1`. Distinct profiles:

| State                | Size  | Distinctive calls                                  |
|----------------------|-------|----------------------------------------------------|
| WAIT                 | 122 B | (just animate + crash rect)                         |
| BACKWARD             | 88 B  | (animate only)                                      |
| FORWARD              | 94 B  | + CalculateCrashRect                                |
| DASH                 | 88 B  | (animate only — short)                              |
| FAKE                 | 130 B | (animate only — feint move)                         |
| GUARD                | 92 B  | + IsEndAnimation + CalculateCrashRect               |
| ATTACK_JAB           | 252 B | + InitMotion (motion change mid-attack)             |
| ATTACK_UPPER         | 240 B | + InitMotion                                         |
| DAMAGE_JAB           | 284 B | + DoLogicBack (recoil physics)                      |
| DAMAGE_UPPER         | 296 B | + DoLogicBack × 2 (heavier recoil)                  |
| DAMAGE_GUARD         | 256 B | + DoLogicBack (guard takes some recoil)             |
| DAMAGE_GUARD_CRUSH   | 200 B | + DoLogicBack (guard broken)                        |

**Init pattern**: each Init writes 1-2 motions + frame counts.
`InitFSM_DAMAGE_*` calls **`Vibrator()`** (haptic feedback) — boss damage
shakes the device.

`DoLogicBack` is NOT a knockback helper — it's `CBossScene_Rival::DoLogicBack(int delta)`
(`0x6dc99`, 766 B), a **background-scroll delta applicator**. Each damage
state passes a signed delta which gets scaled (`<< 14 >> 16`, fixed-point)
and added to each back-layer element's X coordinate. So "heavy" damage states
(DAMAGE_UPPER with 2× calls) produce **camera sway** proportional to the
hit force — a visual "you got rocked" effect, not physics on the boss itself.

`CBossScene_Silkworm::DoLogicBack()` (`0x6f605`, 46 B) is a minimal
no-arg version for the silkworm arena — lighter camera feedback.

### CBoss_Silkworm
Boss with extensible body segments. Constructor 524 B initialises segment
chain. Same state-via-flags pattern as Plate (no `Init/DoFSM_*` symbols).

| Method                  | Size  | Role                                                   |
|-------------------------|-------|--------------------------------------------------------|
| `Init`                  | 160 B | initial setup                                          |
| `DoLogic`               | 884 B | main per-frame dispatcher                              |
| `DoLogicObejcts` *(sic)*| 520 B | per-frame update of segment objects                    |
| `DoLogicBossAttack`     | 268 B | attack tick                                             |
| `SetWormAttack`         | 360 B | trigger worm-segment swing/lash attack                 |
| `SetSporeAttack(b)`     | 448 B | trigger spore-projectile attack (boolean = direction?) |
| `SetDamage`             |  68 B | damage handling                                         |

Stage uses `b_silkworm_*.mpl` palette files for damage-flash effects.

`DoLogic` (884 B) enumerates 5 state values (0, 1, 2, 5, 0x19). Major calls:
- `GetBondingRect × 3` on `CNom_Silkworm`, `CSilkWormBody`, `CRock`
- `CrashCheck × 3` (`CNomUtil::CrashCheck`) — collision between player,
  worm segments, and thrown rocks
- `SetState × 3` — state transitions
- `SetAngry` — rage-trigger
- `DoLogicBossAttack` / `DoLogicObejcts` — delegate to sub-handlers
- `ActiveEnlargeScreen` — zoom effect on major events
- `CBossUi::AddEnergy` — feed damage to boss-specific UI (`CBossUi`,
  different from the regular `CNomUI`)

**Newly identified helper classes** used by Silkworm:
- `CSilkWormBody` — individual worm segment (has `GetBoundingRect`)
- `CRock` — projectile rocks with `GetBondingRect`, `SetAttack`

So the Silkworm arena works as: worm body (multi-segment) + thrown rocks,
all collision-checked against the player via `CNomUtil::CrashCheck`.

### CBoss_SpaceGod
Stage 30 final boss.
- States: `INIT`, `NORMAL`, `MOVEDES`, `FLYING`, `SHRINK`, `SHAKE`, `TOSS`,
  `PUNCH`, `HAMMER`, `FINGER`
- Init handlers: 10; Do handlers: 8 — **multi-phase boss with attack variety**

#### Per-state behaviour (BL-target analysis)

| State    | Size  | Key calls                                                       | Role                              |
|----------|-------|-----------------------------------------------------------------|-----------------------------------|
| INIT     | 112B  | (no BL targets — pure field setup)                              | construct fields                  |
| NORMAL   | 484B  | `GetBalenceData × 4`, `ActiveShakeScreen × 2`, `DoBezier3Logic`, `Random`, `SetState`, `SetReplect`, `AddMonEnergy` | idle/wait, minor moves, applies damage |
| PUNCH    | 992B  | `GetBalenceData × 9`, `Random × 6`, `InitMotion × 5`, `ActiveShakeScreen × 3`, `SetHitMode × 2`, `Push→NORMAL` | **biggest attack** — randomized punch combo |
| FINGER   | 940B  | `GetBalenceData × 9`, `Random × 6`, `InitMotion × 6`, `SetHitMode × 3`, `DoBezier3Logic × 2`, `Push→NORMAL` | finger-poke ranged attack with curved trajectory |
| HAMMER   | (TBD) | (find addr separately)                                          | overhead hammer slam               |
| TOSS     | 452B  | `SetState × 2`, `ActiveShakeScreen × 2`, `Push→NORMAL`           | quick toss + return                |
| FLYING   | 564B  | `__divsi3 × 2`, `Random`, `_Znwj`, `CFlyingObj_SpaceGod ctor`, `CVector::AddElement` | **spawns flying projectiles** during airborne phase |
| SHAKE    | 516B  | `Random × 3`, `_Znwj`, `CExposeObj_SpaceGod ctor`, `CVector::AddElement`, `Push→NORMAL` | screen-shake + spawns vulnerability indicator |
| SHRINK   | 304B  | `SetHitMode × 2`, `InitMotion × 2`, `MoveNextPtn`, `GetBalenceData` | shrink to next phase (HP threshold transition) |
| MOVEDES  |  90B  | `DoBezier2Logic`                                                | smooth bezier movement to a destination |

**Key helpers used across states:**
- `CBossGameBase::GetBalenceData` (0x65268) — game balance / difficulty params
- `CBossGameBase::ActiveShakeScreen` (0x6519c) — screen shake effect
- `DoBezier3Logic` (0x9b3a4) / `DoBezier2Logic` (0x9b454) — Bezier curve interpolation for movement
- `Random()` (0x10a970) — RNG for attack pattern variety
- `CNom_SpaceGod::SetState` / `SetHitMode` — boss controls player state during fight
- `CBoss_SpaceGod::SetReplect` (0x79f78) — boss reflection state (defending?)
- `PushFSM_BOSS_SPACEGOD_NORMAL` (0x7855c) — return-to-NORMAL transition (every attack ends here)
- `MoveNextPtn` (0x9b4e8) — pattern progression helper (likely indexes through attack sequence array)

**FSM transition pattern**: every attack state (PUNCH, FINGER, TOSS, FLYING, SHAKE)
ends with `PushFSM_BOSS_SPACEGOD_NORMAL` — boss is **state-machine with NORMAL as
the dispatcher hub** that branches into specific attacks based on Balance/Random.

**Satellite spawning**: FLYING and SHAKE states allocate satellite objects
(CFlyingObj_SpaceGod, CExposeObj_SpaceGod) and add them to the boss's
CVector pool — see `boss_satellite_objects.md`.

## Boss scenes (CBossScene_*)

Wrap a CBoss + override CMap_T's stage flow for boss arena.

| Scene class           | InitFSM_SCENE_BOSSGAME / DoFSM_SCENE_BOSSGAME states |
|-----------------------|-------------------------------------------------------|
| CBossScene_GreedKing  | (likely INTRO/RUN/ENDING — same shape as Rival)      |
| CBossScene_Plate      | (TBD)                                                 |
| CBossScene_Rival      | INTRO, RUN, FADEIN, FADEOUT, PAUSE, ENDING            |
| CBossScene_Silkworm   | (TBD)                                                 |
| CBossScene_Snake      | (TBD)                                                 |
| CBossScene_SpaceGod   | (TBD)                                                 |

`CBossScene_Rival` (the most documented) shows the stock pattern:
1. `INTRO` (boss appears, animation)
2. `FADEIN` (UI activates)
3. `RUN` (combat loop — drives boss + player FSMs)
4. `PAUSE` (results, score)
5. `FADEOUT` → `ENDING`

## Player variants (CNom_*)

Specialised player controllers used in specific stages. The base `CNom`
provides the generic input/movement/jump FSMs; subclasses override or add
state-specific handlers.

| Class           | Stage usage                | InitFSM_NOM_* states (subclass-added)         |
|-----------------|----------------------------|-----------------------------------------------|
| CNom_Beat       | beat-stage                 | NOM_BEAT_START, NOM_RUN, NOM_ATTACK_LONG, NOM_DAMAGE, NOM_INIT |
| CNom_Bounce     | bounce-stage               | NOM_BLACKHOLL, NOM_BOUNCE_LINE, NOM_BOUNCE_STAR, ATTACK/DAMAGE/COLLISION_STAR_* (CRASH/HARD/STICKY variants) |
| CNom_Bridle     | bridle-stage               | NOM_DAMAGE_BELL                                |
| CNom_Decal      | stages 10/25 (Decal)       | minimal — JUMP_WALL only                       |
| CNom_Earth      | earth-stage                | NOM_DAMAGE_PATH_WALL, NOM_ATTACK_WITH         |
| CNom_Gate       | gate-stages                | NOM_GATE_OUT, NOM_CHANGE_QUARDRANT, MOVE_LAYER, ATTACK_GATE_LONG, CATCH_BREAK, CATCH/DAMAGE_INSECTPLANT |
| CNom_Gravity    | gravity-stage              | NOM_CHANGE_GRAVITY, NOM_MOVE_GRAVITY, INIT, plus DAMAGE/INSECTPLANT |
| CNom_GreedKing  | stage 21 (paired w/ boss)  | NOM_GREEDKING_INIT, RUN, ATTACK, ESCAPE, ESCAPE_JUMP, GET_WEAPON |
| CNom_Illusion   | (stage TBD)                | (no Init; Do for ATTACK/DAMAGE/RUN — uses base Init?) |
| CNom_Path       | path-stages                | NOM_TRANSPLATE_RUN/JUMP/DAMAGE/LANDING, NOM_UPDOWNPALTE, NOM_DAMAGE_ENDPATH, JUMP_ENDPATH |
| CNom_Plate      | stage paired w/ CBoss_Plate| (CheckCrashBullet — bullet-collision focus)   |
| CNom_Shoting    | stages 12/28 (Shoting)     | NOM_KIDNAP, NOM_SHOTING_BLACKHOLL, INIT, RUN, CATCH_BREAK |
| CNom_Silkworm   | silkworm-stage             | (FSM TBD)                                      |
| CNom_Snake      | stage 18                   | (FSM TBD; no CBoss_Snake exists — player handles fight) |
| CNom_SpaceGod   | stage 30 (final boss)      | (FSM TBD; player variant for spacegod fight)  |

## Stage-num ↔ class mapping (verified)

| stage_num | player variant   | boss class       | scene wrapper        |
|-----------|------------------|------------------|----------------------|
| 10, 25    | CNom_Decal       | —                | (uses CMap_J)        |
| 12, 28    | CNom_Shoting     | —                | (uses CMap_J)        |
| 18        | CNom_Snake       | —                | CBossScene_Snake     |
| 21        | CNom_GreedKing   | CBoss_GreedKing  | CBossScene_GreedKing |
| 30        | CNom_SpaceGod    | CBoss_SpaceGod   | CBossScene_SpaceGod  |
| (other w/ CBoss) | (CNom_Plate, CNom_Silkworm, CNom_Bounce, CNom_Bridle, CNom_Beat etc.) | CBoss_Plate, CBoss_Silkworm, CBoss_Rival_Alien | CBossScene_Plate, CBossScene_Silkworm, CBossScene_Rival |

## Recreation strategy

For faithful recreation:
1. Implement the base CNom FSM (DoFSM_NOM_RUN/JUMP/JUMP_HIGH/JUMP_WALL/DAMAGE
   already documented in `30_physics/player_physics.md`).
2. Add per-stage variants: switch player class via `stage_num` table.
3. For each boss stage, implement matching CBossScene + CBoss FSM, dispatched
   from the engine's stage-load path.
4. Boss FSMs are clean state machines with named states — direct port from
   `Init/DoFSM_BOSS_<NAME>_<STATE>` pairs.

## Open

- Per-state body decode for each boss (10+ states × 5 bosses = ~50 handlers).
- CBossScene state coordination (boss FSM ↔ scene FSM coupling).
- Boss-scene → player input gating (e.g., disable jump during INTRO).
- CObject_<boss> classes (e.g. CObject_Snake, CObject_Silkworm, CObject_SpaceGod):
  these are boss-spawned satellite objects (eggs, projectiles, segments).

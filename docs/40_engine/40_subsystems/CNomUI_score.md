# CNomUI — Score / Energy / Fiver / NomPoint Subsystem

`CNomUI` is the singleton that owns the in-game **HUD state**: total score,
current energy, fiver count, nom-point count, miss counter, and the visual
gauges/popups that display them.

It is the **side-effect target** for almost every gameplay event: monster kill,
item pickup, hit, pickup-drop. The reward fields in `tagSObjectInfo`
(`u16[13..17]`) feed directly into the `Add*` methods below.

## API surface (Add / Set / Init / Get)

### Score

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `AddScore(i)`                | `0xd221d` | 50 B | base "add to total score"                        |
| `AddMonScore(i)`             | `0xd2251` | 188 B| monster-kill score; spawns popup; clamps; calls AddScore |
| `AddItemScore(i)`            | `0xd230d` | 156 B| item-pickup score; same shape as AddMonScore     |
| `SetScore_Total(i)`          | `0xd21f9` | 20 B | direct setter                                    |
| `SetScore_Fiver(i)`          | `0xd220d` | 14 B | fiver-bonus score field                          |

### Energy (player HP-equivalent)

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `SetCurEnergy(i)`            | `0xd23a9` | 26 B | direct setter                                    |
| `AddItemEnergy(i)`           | `0xd23c5` | 186 B| item-pickup energy gain (signed: negative = loss)|
| `AddMonEnergy(i)`            | `0xd3ced` | 314 B| energy from kill / collision; clamps; UI update  |

### Fiver (in-game currency / multiplier)

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `AddItemFiver(i)`            | `0xd24bd` | 280 B| item-source fiver gain                           |
| `AddMonFiver(i, b)`          | `0xd3ae5` | 464 B| monster-source fiver gain (with bool flag)       |
| `SetFiverMode(b, b)`         | `0xd2481` | 26 B | toggle fiver-multiplier mode                     |

### Nom Point

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `InitNomPoint()`             | `0xd21e1` | 24 B | reset to 0                                       |
| `AddNomPoint(i)`             | `0xd3e29` | 96 B | grant a nom point (achievement-style counter)    |

### Miss / counters

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `SetMissCnt(i)`              | `0xd25ed` | 14 B | direct setter                                    |
| `AddMissCnt(i)`              | `0xd25fd` | 18 B | increment miss counter (player whiff or escape)  |

### Stage / map state

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `SetCurMapNum(h)`            | `0xd2175` | 24 B | active stage's "map number" within stage         |
| `SetCurStageNum(h)`          | `0xd3cb5` | 56 B | **active stage id → `+0x6d`** (read across engine for per-stage behaviour dispatch) |
| `GetStageType(i)`            | `0xd21c1` | 32 B | stage classification lookup                       |

### Save / persistence

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `Init()`                     | `0xd249d` | 30 B | full reset                                       |
| `InitSaveData()`             | `0xd25d5` | 24 B | reset persistent save fields                     |
| `SaveDisket()`               | `0xd218d` | 50 B | persist to "disket" (save slot)                  |
| `InitLegacyData()`           | `0xd330d` | 408 B| import legacy save format                        |
| `ClearLegacyData()`          | `0xd26d5` | 24 B | wipe legacy save                                 |

### Eat (consumable item) tracking

| Method                       | Vaddr     | Size | Behaviour                                        |
|------------------------------|-----------|------|--------------------------------------------------|
| `ShowEatIcon` / `HideEatIcon`| `0xd2675/9` | 2 B | toggle visible eat-icon                          |
| `ClearCurEat()`              | `0xd267d` | 44 B | reset eat state                                  |
| `IsActiveEat()`              | `0xd26a9` | 10 B | check if eat-effect is active                    |
| `DecreseCurEatParam(h)`      | `0xd26b5` | 30 B | decrement per-frame eat counter                  |
| `GetEatColor(i)`             | `0xd34a5` | 26 B | eat-state color tint                              |

## Data-format ↔ method mapping

From `30_n5s/40_semantics.md` `tagSObjectInfo` reward fields:

| Field    | Method called               | Trigger                                  |
|----------|-----------------------------|------------------------------------------|
| `u16[13]`| `AddMonScore`               | monster kill (in `CMonster::SetDamage`)  |
| `u16[14]`| `AddItemEnergy` (signed)    | item pickup (positive) / monster contact (negative) |
| `u16[16]`| `AddNomPoint`               | item pickup                              |
| `u16[17]`| `AddItemFiver`              | item pickup                              |

Additional reward calls happen in `CMonster_J::CheckCrashToNom`:
- `AddMonFiver` × 11 sites
- `AddMonEnergy` × 11 sites
- `AddItemScore` × 5 sites
- `AddMissCnt` × 3 sites

## Visual rendering

| Method                          | Vaddr     | Size | Behaviour                                  |
|---------------------------------|-----------|------|--------------------------------------------|
| `Draw3D(i, i)`                  | `0xd262d` | 48 B | 3D-style HUD layer                         |
| `DrawNomPointNum(i, i, i)`      | `0xd2f89` | 64 B | numeric nom-point counter                  |
| `DrawNomPointEffect(i, i)`      | `0xd2fc9` | 544 B| nom-point award animation                  |
| `DrawScoreInfo(i, i)`           | `0xd31e9` | 292 B| score info panel                           |
| `DrawFiverRateEffect(i, i)`     | `0xd397d` | 360 B| fiver-rate visual                          |
| `DoFiverRateEffect()`           | `0xd3911` | 56 B | tick fiver-rate animation                  |
| `DoNomPointEffect()`            | `0xd3545` | 26 B | tick nom-point animation                   |
| `DoEnergyFiverGage()`           | `0xd3561` | 88 B | tick energy/fiver gauge fill animation     |

## Touch-input dispatchers (UI buttons)

A family of `IsTouchSelectButton_*` methods at `0xd2a91`+ handles button
hit-testing for the in-game UI (Challenge / OK / Clr / Skip / Game_Clr).
They take a `GxPointerPos` and return whether the touch falls inside a
button's bounds. Used by the front-end and result-popup screens.

## CNomUI field map (runtime state)

Partial — derived from `SetCurStageNum` and usage sites.

| Offset  | Type  | Field                                              |
|---------|-------|----------------------------------------------------|
| +0x6d   | u8    | **current stage number** — hard-coded behaviour key (0xa/0xc/0x11/0x19/0x1a/0x1c all trigger per-stage branches engine-wide) |
| +0x7c   | i32   | `GetStageType(stage_num)` cached result            |
| +0x80   | (zero init) | (TBD)                                        |
| +0x9c   | ptr   | stage info pointer from `CMvApp::GetStageInfo(…, stage_num, 2)` |
| +0xa0   | (zero init) | (TBD)                                        |
| +0xa4   | (zero init) | (TBD)                                        |
| +0xbc   | (zero init) | (TBD)                                        |
| +0xd8   | u32   | **current difficulty** (0..3; 3 = hard mode)       |
| +0xdc   | u32   | **hard-mode damage scale (%)** — multiplies damage delta when difficulty == 3 (see `40_subsystems/CBossUi.md` → AddEnergy) |

Singleton storage: `_ZN12CGsSingletonI6CNomUIE13ms_pSingletonE` at `0x1453ec`.

## Stage-number dispatch sites

Engine-wide, `CNomUI.ms_pSingleton->+0x6d` is read and compared to
specific stage numbers to trigger hardcoded per-stage behaviours:

| Stage num | Hex   | Triggers                                                          |
|-----------|-------|-------------------------------------------------------------------|
| 6         | 0x06  | `CObject::DoPathLogic` path-follow special                         |
| 9         | 0x09  | `CNom::DoFSM_NOM_RUN` vertical-scroll behaviour (saved-vx restore)|
| 10        | 0x0a  | `CMap_J::LoadMap` spawns `CMonster_Decal` instead of `CMonster_J` |
| 12        | 0x0c  | `CMap_J::LoadMap` spawns `CMonster_Shoting`                        |
| 17        | 0x11  | `CObject::DoPathLogic` boss-terrain / special path                 |
| 24        | 0x18  | `CMonster_T::DoLogic` branch                                        |
| 25        | 0x19  | Same as 10 (Decal)                                                 |
| 26        | 0x1a  | Same as 9 (vertical scroll)                                         |
| 28        | 0x1c  | Same as 12 (Shoting)                                               |

So stages come in pairs (N, N+15 or similar) sharing the same gameplay
variant. This matches the file-naming (stage_9 ↔ stage_9_s, stage_26 ↔
stage_26_s visible in N5S files).

### Engine-wide enumeration (2026-04-15)

`scripts/scratch/find-stagenum-dispatch-v2.py` finds 70 functions across the
engine that read `CNomUI+0x6d` and dispatch on it. Stage-num value
distribution by site count:

| stage  | sites | funcs | character                                                              |
|--------|-------|-------|------------------------------------------------------------------------|
| **10** | 28    | 20    | **heaviest** — Decal/Shoting Draw, CMap_J::LoadMap, EvPointerPress     |
| **25** | 25    | 18    | **twin of 10** — same touchpoints                                       |
| 0      | 22    | 18    | CScriptEngine SCRIPTCMD branches, CMap_T::Draw, multi-class            |
| 4      | 13    | 10    | UI/touch (EvPointerPress, KeyPressed) — twin with 20                   |
| 20     | 12    | 9     | twin of 4                                                               |
| 12     | 11    | 7     | CMap::DoMapScroll, CStageGameScene::InitFSM_SCENE — twin with 28      |
| 26     | 10    | 9     | DoFSM_NOM_RUN vertical scroll — twin with 9                            |
| 28     | 9     | 6     | twin of 12                                                              |
| 1, 9, 17, 22 | 6-7 | 5-6 | scripted-cutscene stages                                            |
| 30     | 8     | 5     | **CNom_SpaceGod boss + CBoss helpers** (final boss?)                   |
| 21     | 5     | 4     | **CNom_GreedKing + CShotManager** (greedking boss)                     |
| 18     | 5     | 3     | **CNom_Snake** (snake boss)                                            |
| 6, 17  | 6     | 6     | TalkBox + CScriptEngine special                                        |
| (rest) | < 6   | < 5   | regular data-driven stages                                              |

### Stage variant pairs (same special-case handlers)

| pair         | role                                       |
|--------------|--------------------------------------------|
| 4 ↔ 20       | UI/touch dispatch (gate stages?)           |
| 9 ↔ 26       | vertical-scroll restore (CNom RUN special) |
| 10 ↔ 25      | Decal-spawn + heavy CMap_J variant         |
| 12 ↔ 28      | DoMapScroll + InitFSM_SCENE special        |

These pairs likely correspond to "normal stage" vs "secret/boss-prep stage"
(matches the `_s` file suffix pattern in N5S — `stage_9_s.n5s`,
`stage_26_s.n5s`).

### Boss stages

| stage | boss class           | drives                                 |
|-------|----------------------|----------------------------------------|
| 18    | `CNom_Snake`         | snake boss FSM                         |
| 21    | `CNom_GreedKing`     | greedking + `CShotManager::FireShots`  |
| 30    | `CNom_SpaceGod`      | spacegod final boss + 2 CBoss helpers  |

Other stages (1, 23) DO have CBoss* / boss-content N5M data but NO
hardcoded engine branches — those are likely just "boss-themed" levels
using the standard engine.

## Engine-recreation notes

For a faithful reimplementation:

1. The reward functions are **side-effect-only** (no return value used by
   callers) — emit them at the same call sites and feed the same int values
   to reproduce HUD behaviour.
2. Scores wrap / clamp inside `AddScore` (50 B body) — likely caps at 9,999,999
   per typical mobile-era game UX.
3. `AddItemEnergy(negative)` must drain energy and trigger any
   energy-depleted FSM transition; preserve the sign behaviour.
4. The `Eat`/`Legacy`/`Disket` family is save-system territory; can be
   stubbed initially for an in-memory engine.

## Open

- Decode `AddMonScore` (188 B) to confirm clamp formula and popup spawn.
- Confirm cap value for total score / max energy (likely visible in
  constructor or `Init`).
- Map `Disket` save-slot format (separate sub-track).

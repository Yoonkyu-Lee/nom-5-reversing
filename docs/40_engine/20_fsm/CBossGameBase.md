# CBossGameBase — Boss Common Infrastructure

`CBossGameBase` is the shared base class for boss scenes / boss-game
controllers. It provides:

- **HP-tiered balance data lookup** (attacks change parameters as boss
  HP drops)
- **Screen effects** (shake, enlarge, spark)
- **Sound playback management**
- **Boss score / gameover / reset** flow

## Field layout (partial)

| Offset | Type  | Field                                          |
|--------|-------|------------------------------------------------|
| +0x08  | ptr   | boss state struct (with HP fields below)       |
| +0x10  | ptr   | balance-array (2D table) for `GetBalenceData`  |

Boss state struct (`+0x08` of base) layout:

| Offset | Type | Field                                  |
|--------|------|----------------------------------------|
| +0x18  | i16  | **max_hp**                             |
| +0x1a  | i16  | **cur_hp**                             |

## API

### `GetBalanceLevel()` — 0x65171, 44 B

```
GetBalanceLevel(this):
  cur_hp = this.+0x8.+0x1a (i16)
  max_hp = this.+0x8.+0x18 (i16)
  pct_x100 = (cur_hp * 100) / max_hp
  if pct_x100 == 0:  return 2
  return (100 - pct_x100) / 0x22         # (= /34): produces 0, 1, 2
```

So **3 HP tiers**:
- Level 0: HP > 66%
- Level 1: HP 34..66%
- Level 2: HP <= 33% OR HP == 0

This drives the `idx`-based `balance_array` lookup. Each boss has its
attacks parameterized differently per HP tier — as HP drops, parameters
shift (faster/harder attacks).

### `GetBalenceData(idx)` — 0x65269, 76 B

```
GetBalenceData(this, idx):
  level = GetBalanceLevel(this)
  stage_num = CNomUI.ms_pSingleton->+0x6d
  if stage_num in {0x12, 0x15, 0x18, 0x1d, 0x1e}:
    idx += 3                             # special-case stages get extra balance slots
  array = this.+0x10
  if !array: return 0
  return CGsArray::GetItem(array, level, idx)   # 0xfbe94
```

Stages with `+3` offset (i.e. 6+ balance slots per level instead of 3):
- 0x12 = stage 18 (Snake)
- 0x15 = stage 21 (GreedKing)
- 0x18 = stage 24 (Plate?)
- 0x1d = stage 29 (Silkworm?)
- 0x1e = stage 30 (SpaceGod)

These are all boss stages. The `idx`-shift means **boss stages have an
extended parameter set**, while non-boss stages use the base 3-slot layout.

### Screen effects

| Method                     | Vaddr     | Size | Role                                |
|----------------------------|-----------|------|-------------------------------------|
| `ActiveShakeScreen(i, i)`  | `0x6519d` | 10 B | trigger shake (duration, amplitude) |
| `DoShakeScreen()`          | `0x651a9` | 22 B | per-frame shake tick                |
| `ActiveEnlargeScreen(i,i,l,l)` | `0x651c1` | 26 B | trigger zoom (duration, scale, x, y)|
| `DoEnlargeScreen()`        | `0x651dd` | 60 B | per-frame zoom tick                 |
| `ActiveSparkScreen(i, i)`  | `0x65219` | 10 B | trigger spark/flash effect          |
| `DoSparkScreen()`          | `0x65225` | 40 B | per-frame spark tick                |
| `DrawShakeScreen()`        | `0x65639` | 68 B | render shake                        |
| `DrawElargeScreen()`       | `0x655f5` | 68 B | render zoom (typo: "Elarge")        |
| `DrawSparkScreen()`        | `0x655b1` | 68 B | render spark                        |

Standard **Active/Do/Draw** triple per effect — typical mobile-game UX
flair pattern.

### Sound

| Method                      | Vaddr     | Size  | Role                                  |
|-----------------------------|-----------|-------|---------------------------------------|
| `SoundPlay(i, b)`           | `0x654d9` | 108 B | play sound id with priority           |
| `StopSound()`               | `0x6541d` | 48 B  | stop currently playing                |
| `IsPlayingSound()`          | `0x6524d` | 28 B  | check play state                      |
| `PlayStageBackSound()`      | `0x65545` | 108 B | start stage BGM                       |

### Lifecycle

| Method                | Vaddr     | Size  | Role                                |
|-----------------------|-----------|-------|-------------------------------------|
| `Reset(h)`            | `0x653e9` | 52 B  | reset for next attempt              |
| `EndScript()`         | `0x6544d` | 140 B | end-of-fight script wrap-up         |
| `ProcessGameover()`   | `0x6516d` | 2 B   | (stub — overridden by subclasses)   |
| `SetBossScore()`      | `0x652b5` | 308 B | post-fight scoring                  |

## Usage by individual bosses

`CBoss_SpaceGod` heavy users (per `boss_classes.md`):
- `GetBalenceData × 9` per attack state (PUNCH, FINGER) — parameter lookup is the
  primary driver of attack variation.
- `ActiveShakeScreen × 2-3` per attack — visual feedback.

For other bosses (Rival_Alien, GreedKing, Silkworm, Plate), the same
GetBalenceData pattern applies — each call selects an attack parameter
(damage, range, speed, duration, etc.) by `idx`.

## Recreation strategy

1. Implement `CBossGameBase` with HP fields and a balance-table pointer.
2. Provide `GetBalanceLevel()` returning 0/1/2 based on HP %.
3. Boss-specific balance tables: `level × idx` 2D array where `level=3`
   and `idx=3 or 6` (depending on boss stage).
4. Each boss's attack states call `GetBalenceData(idx)` to fetch
   per-attack parameters that ramp difficulty as HP drops.

## Balance array initialization

Traced via `CBoss_SpaceGod` ctor (`0x7cb79`, 564 B): the boss allocates
**multiple SArray objects** in sequence, stored at `+0x10`, `+0x14`,
`+0x18`, `+0x1c`, etc.:

```
CBoss_SpaceGod::CBoss_SpaceGod:
  ... base init ...
  r0 = _Znwj(size)                      # alloc SArray
  SArray::ctor(r0, literal_data_ptr)     # init from static data
  this+0x10 = r0                         # balance table A
  r0 = _Znwj(size)
  SArray::ctor(r0, literal_data_ptr2)
  this+0x14 = r0                         # balance table B
  # ... repeats for +0x18, +0x1c ...
```

So **each boss has multiple balance tables** (not just one), letting
different attack types use different parameter sets. `CBossGameBase::GetBalenceData`
reads only `+0x10` as the "primary" table; other tables at `+0x14`/`+0x18`/
`+0x1c` are likely accessed directly by subclass attack code with
`SArray::GetInt((SArray*)(this+0xXX), level, idx)`.

For SpaceGod's `DoFSM_BOSS_SPACEGOD_PUNCH` state (9× GetBalenceData calls
per frame), this makes sense: punch parameters pull from multiple tables
(damage, speed, range, timing) indexed by HP tier.

Static data source is pc-relative literals in `.rodata` — each boss
embeds its own balance constants.

## Open

- The exact list of `idx` slots per boss (which slot = damage, which =
  speed, etc.). Probably 3-6 named parameters per boss per table.
- `EndScript`, `SetBossScore` decode for end-of-fight flow.
- Confirm `+0x14`/`+0x18`/`+0x1c` access patterns in non-SpaceGod bosses.

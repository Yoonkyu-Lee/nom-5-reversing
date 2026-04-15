# CBossUi — Boss-Specific HUD

Separate UI class from `CNomUI`. Used by specific bosses (at least Silkworm)
to show a dedicated boss HP bar / energy gauge instead of the normal
player UI.

## API

| Method               | Vaddr     | Size  | Role                                        |
|----------------------|-----------|-------|---------------------------------------------|
| `Init(i, s, i)`      | `0x7e4c9` | 38 B  | initialise (max, initial, quadrant)         |
| `DoLogic()`          | `0x7e4f1` | 200 B | per-frame update                            |
| `Draw()`             | `0x7e36d` | 348 B | render                                      |
| `AddEnergy(s)`       | `0x7e2e1` | 80 B  | add delta with hard-mode scaling + clamp    |
| `SetEnergy(s)`       | `0x7e331` | 10 B  | direct set                                  |
| `SetQuadrant(i)`     | `0x7e33d` | 48 B  | set position quadrant (top/bottom/left/right?) |

## Field layout

| Offset | Type | Field                                              |
|--------|------|----------------------------------------------------|
| +0x08  | ptr  | sprite/CAniObject for the bar rendering            |
| +0x0c  | u8   | byte flag (zeroed in Init)                          |
| +0x0e  | i16  | max energy (initial from Init arg1)                 |
| +0x10  | i16  | state mode (Init sets = 2)                          |
| +0x12  | i16  | dirty/updated flag (-1 = needs redraw)              |
| +0x18  | i16  | minimum clamp value                                  |
| +0x1a  | i16  | (likely previous-frame value for animation)         |
| +0x1c  | i16  | **current boss energy** (HP bar value)              |
| +0x20  | i32  | quadrant / position code                             |

## AddEnergy decoded

```
CBossUi::AddEnergy(delta):
  difficulty = CNomUI.ms_pSingleton->+0xd8 (u32)
  if difficulty == 3:                           # HARD mode
      scale = CNomUI.ms_pSingleton->+0xdc
      delta = (delta * scale) / 100             # scale damage by hard-mode percent
  this+0x1c += delta                             # apply to current energy
  if current < min (this+0x18):  current = min  # clamp
  this+0x12 = -1                                 # mark dirty (needs redraw)
```

So hard mode (`CNomUI+0xd8 == 3`) **scales all damage dealt to bosses
that use CBossUi**. The scale factor at `CNomUI+0xdc` is a percentage
(divisor 100) — the game reads it to multiply damage input.

## CNomUI difficulty-related fields

Implied from CBossUi::AddEnergy:

| CNomUI offset | Field                         |
|---------------|-------------------------------|
| +0xd8 (u32)   | current difficulty (0..3)     |
| +0xdc (u32)   | hard-mode damage scale (%) — applied to CBossUi::AddEnergy input |

Difficulty = 3 is "hard mode". Other values likely: 0=easy, 1=normal,
2=expert, 3=hard (or similar 4-tier scheme). Only level 3 triggers
the damage scale here — so the scale is a "balance-tuning knob for
the hardest tier", not a general multi-tier ramp.

## Usage

- `CBoss_Silkworm::DoLogic` calls `CBossUi::AddEnergy(-N)` on player hit.
- Other bosses likely route through `CNomUI::AddMonEnergy` (the more
  common path — 11 sites in CheckCrashToNom).

## Open

- Which other bosses use CBossUi vs CNomUI. Silkworm confirmed; others
  need symbol cross-reference.
- Where CBossUi is instantiated (likely CBossScene's constructor).
- `SetQuadrant(i)` — position codes (0=top, 1=bottom, etc.?).
# CNom (Player) Runtime Field Map

`CNom` is the player-controlled "Nom" character. Inherits from `CObject`, so
common offsets (vtable, base position) match `CMonster`. Subclasses include
`CNom_GreedKing`, `CNom_Plate`, `CNom_Silkworm`, `CNom_Snake`, `CNom_SpaceGod`
(boss-stage variants).

## Confirmed field offsets

From `CNom::DoLogic` (`0xc8ca5`, 130 B) and related methods.

| Offset  | Type   | Field                       | Source                                                  |
|---------|--------|-----------------------------|---------------------------------------------------------|
| +0x20   | u16    | **current X** (game units)  | `DoLogic` reads, copies to +0x64 (prev_x)               |
| +0x22   | u16    | **current Y**               | `DoLogic` reads, copies to +0x66 (prev_y)               |
| +0x34   | u8     | active/state flag           | `DoLogic` checks before running per-frame effects       |
| +0x38   | u8     | landing/contact flag        | (CObject base; same as CMonster)                        |
| +0x64   | u16    | previous X (last frame)     | `DoLogic` snapshot for delta calc                       |
| +0x66   | u16    | previous Y                  | same                                                    |
| +0xa9   | u8     | "in-cooldown" flag          | `DoLogic` reads at offset `+0xa9` (movs r3,#0xa9 form)  |
| +0xd0   | ptr    | active interactive object   | `DoLogic` checks `[obj+0xd0]` non-null then derefs      |
| +0xe4   | embed  | embedded animation/sub-obj  | `DoLogic` calls `0x8ae64` on `obj+0xe4` (CAniObject helper) |
| +0x108  | i8     | unknown signed counter      | `DoLogic` reads `[obj+0x108]` (movs r3,#0x8b; lsls #1)  |

## Frequently-touched bookkeeping (auto-extracted)

Top offsets read/written across all CNom-class methods (corpus scan):

| Offset  | Hits | Likely role                                |
|---------|------|--------------------------------------------|
| +0x04   | 28   | vtable / parent ptr (CObject base)         |
| +0x08   | 65   | base CObject member                         |
| +0x0c   | 25   | base CObject member                         |
| +0x10   | 86   | base CObject member (most-accessed)        |
| +0x14   | 35   | base CObject member                         |
| +0x18   | 21   | base CObject member                         |
| +0x1c   | 43   | base CObject member                         |
| +0x24   | 61   | parent CMap_J pointer (matches CMonster)   |
| +0x30   | 11   | (TBD)                                       |

These base-class offsets are shared with CMonster/CScriptObject and don't carry
player-specific semantics; listed here only for completeness.

## Methods and what they touch

| Method                | Vaddr     | Size   | Known field touches                                  |
|-----------------------|-----------|--------|------------------------------------------------------|
| `DoLogic`             | 0xc8ca5   | 130 B  | +0x20/+0x22→+0x64/+0x66, +0xa9, +0xd0, +0xe4, +0x108 |
| `DoFSMLogic`          | 0xca32d   | 220 B  | (TBD)                                                |
| `KeyLogic`            | 0xc9031   | 1026 B | input → movement; large dispatch on key state         |
| `KeyWallLogic`        | 0xc8d95   | 668 B  | wall collision response                              |
| `KeyCapsuleLogic`     | 0xc8d29   | 108 B  | item-pickup logic                                    |
| `InitFsmLogic`        | 0xc9b99   | 396 B  | FSM initialisation (per active key/state)           |
| `CheckEndMap`         | 0xc7935   | 316 B  | end-of-stage detection                               |
| `DamageWall`          | 0xc7885   | 96 B   | wall-damage response                                 |
| `DamageInsectPlant`   | 0xc78e5   | 78 B   | special-tile damage                                  |
| `DrawTalkBox`         | 0xc77e1   | 162 B  | dialog overlay                                       |
| `IsShadow`            | 0xc7aa9   | 128 B  | shadow-rendering check                               |
| `DoEatEffect`         | 0xc7a85   | 20 B   | item-eat visual                                      |
| `DoFiverEffect`       | 0xc7a99   | 14 B   | coin-pickup visual                                   |
| `DoSetEffect`         | 0xc7a71   | 20 B   | generic effect spawn                                 |
| `KeyReleased`         | 0xc77c5   | 28 B   | input key-release handler                            |
| `GetTuchKeyValue`     | 0xc77b9   | 10 B   | touch-input read                                      |
| `PushFSM_NOM_JUMP`    | 0xc778d   | 44 B   | jump state push                                      |
| `PushFSM_NOM_ATTACK`  | 0xc775d   | 46 B   | attack state push                                     |
| `PushFSM_NOM_MOVE_LAYER` | 0xb1231 | 46 B  | switch land/path layer                               |
| `PushFSM_NOM_DAMAGE_STAR_HARD` | 0xb256d | 42 B | hard-damage state                                  |
| `PushFSM_NOM_COLLISION_STAR` | 0xb2599 | 42 B | collision-stun state                                |
| `SetLandLayerNum`     | 0xc7741   | 16 B   | set current land layer index                         |
| `Init`                | 0xc773d   | 2 B    | base init (subclass-overridden)                      |

## FSM state names (from PushFSM_NOM_* symbols)

- `NOM_JUMP` — jump arc
- `NOM_ATTACK` — attack animation/hitbox
- `NOM_MOVE_LAYER` — transition between path/land layers
- `NOM_DAMAGE_STAR_HARD` — hit-stun (heavy)
- `NOM_COLLISION_STAR` — collision recoil (light)
- (more in CNom_<subclass>::*FSM_NOM_* subclass-specific symbols)

## Open

- Decode `KeyLogic` (1026 B) — input → movement integration. This is the player
  control core.
- Decode `DoFSMLogic` to enumerate full FSM state list (mirror of CMonster
  approach).
- Identify the subset of CObject base offsets (+0x04..+0x24) that have
  meaningful player-side roles (vs pure base bookkeeping).
- Player HP/lives field offset (likely high — outside +0x100 range).

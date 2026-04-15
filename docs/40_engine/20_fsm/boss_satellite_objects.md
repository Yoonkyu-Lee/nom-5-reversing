# Boss Satellite Objects & Bullets

Catalog of helper classes spawned by bosses (eggs, segments, projectiles)
plus the generic projectile system.

## Generic projectile system

| Class           | Vaddr / size        | Role                                     |
|-----------------|---------------------|------------------------------------------|
| `CBullet`       | 13 methods          | base bullet class (sprite, position, motion) |
| `CBBullet`      | 5 methods           | "boss bullet" variant (heavier damage)   |
| `CNBullet`      | 3 methods           | "nom bullet" — fired BY player (paired with `CNom_Plate`) |
| `CShotManager`  | 5 methods           | bullet pool/manager: `FireShots`, `DoShotsLogic`, `DrawShots`, `ClearShots`, `CrashAttack` |

`CShotManager` API (used in stage 21 GreedKing per stage_num dispatch):
- `FireShots` — spawn bullets
- `DoShotsLogic` — per-frame update for active bullets
- `DrawShots` — render
- `ClearShots` — wipe pool
- `CrashAttack` — collision detection

`CNBullet::CNBullet(this, CNom_Plate*)` — bullet ctor takes the player as
parent, so player-fired bullets are tied to player object lifecycle.

`CBullet` methods include `SetDir`, `SetSpeed`, `SetSpeedX`, `SetSpeedY`,
`InitPos`, `SetFire`, `SetDamaged`, `SetDeath`, `SetDamageWall`, etc. —
classic per-bullet state-machine API.

## Per-boss satellite objects

### CBoss_GreedKing
- **`CItemBox_GreedKing`** (`0x68321`, 232 B ctor) — treasure boxes the king
  carries/throws. Used in `GET_WEAPON` state.

### CBoss_Plate
- Uses `CNBullet` (player) + `CBBullet` (boss) for the bullet-vs-bullet
  combat. `CNom_Plate::CheckCrashBullet` (832 B) is the player-side
  collision check between Nom and incoming boss bullets.

### CBoss_Silkworm
- **`CObject_Silkworm`** (`0x70185`, 236 B ctor with `(pzx, h)` — the `h`
  byte is the segment index). Each silkworm body segment is a separate
  CObject_Silkworm; the boss assembles a chain of segments managed via
  `CVector<CObject_Silkworm*>`.

### CBoss_SpaceGod (final boss)

The most complex boss with 4 satellite types:

| Class                 | Ctor size | DoLogic | Draw  | Role                                           |
|-----------------------|-----------|---------|-------|------------------------------------------------|
| `CObject_SpaceGod`    | 92 B      | 4 B (stub) | 2 B (stub) | **abstract base** — minimal; provides Calculate/IsCrashRect, SetDamage/Death vtable entries |
| `CExposeObj_SpaceGod` | 96 B `(pzx, i, i)` | 234 B | 10 B (stub) | "vulnerability indicator" — animates to show where to hit |
| `CFlyingObj_SpaceGod` | 340 B `(pzx, i, i, i, b)` | 148 B | 78 B | **flying projectile** — trajectory + real rendering + damage |
| `CEnergyWave`         | 152 B + 268 B alt | **1208 B** | 304 B | **energy beam attack** — largest of all; `SetFire(i, b)` is 544 B (beam trajectory setup) |

`CEnergyWave` is by far the boss's most complex attack primitive:
- Two ctors: satellite-emitted `(pzx, CNom_SpaceGod*, CObject_SpaceGod*)`
  and player-emitted `(pzx, CNom_SpaceGod*, i, i)`.
- `SetFire(i, b)` (544 B) sets up direction, speed, length.
- `DoLogic` (1208 B) runs the beam propagation + collision per frame.
- `IsAttackRect` / `CaculateCrashRect` provide hit detection.
- `SetDamaged(b)` toggles damage state (beam-hit visualisation).

So SpaceGod's combat loop alternates between flying projectile showers
(CFlyingObj) and sustained energy beams (CEnergyWave), with Expose
objects highlighting vulnerabilities.

CEnergyWave has two ctor variants: one bound to a CObject_SpaceGod
(satellite-emitted wave) and one bound directly to CNom_SpaceGod
(player-emitted wave). So the player can also fire energy waves —
matching the SpaceGod boss-fight format.

`CObject_SpaceGod` is managed via `CVector<CObject_SpaceGod*>` (3 vector
methods present), so the boss spawns multiple such satellites
simultaneously.

### CBoss_Rival_Alien
- No CObject_Rival_* class found. The fight is **pure 1v1 boxing** —
  no bullets, no satellites. Just direct collision via the boss's
  attack/damage states (jab/upper/guard/dash).

### CNom_Snake / CBossScene_Snake
- No CObject_Snake or CBoss_Snake symbol. The Snake "boss" is
  implemented entirely as a player-side variant (`CNom_Snake`) — the
  player IS the snake (controlling its head) in this stage.

## Recreation strategy

1. **Generic projectiles** — implement `CBullet` base + `SetSpeed/SetDir`
   API. `CShotManager` is a typical fixed-size pool (count TBD via ctor decode).
2. **Player bullets** — `CNBullet` for stage 21 (GreedKing).
3. **Boss bullets** — `CBBullet` shared across all shooting bosses.
4. **Per-boss satellites** — implement only what each boss uses:
   - GreedKing: ItemBox spawn/throw mechanic
   - Silkworm: segment chain
   - SpaceGod: 4-class satellite system + EnergyWave attack
5. **Snake/Rival** — no satellite work needed.

## Open

- `CShotManager` pool size and bullet lifetime decode.
- `CFlyingObj_SpaceGod` 340-byte ctor — many fields suggest complex
  trajectory state (position, velocity, target, damage, expose state).
- `CEnergyWave` two ctor variants — confirm difference (which one fires
  first, geometry differences).

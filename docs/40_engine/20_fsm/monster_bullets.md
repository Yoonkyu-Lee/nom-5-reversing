# Monster Projectile System (FireBullet)

`CMonster_J::FireBullet` (`0xafa01`, 440 B / 206 insns) — spawns a
projectile when a monster decides to shoot the player. Used during ACTIVE
state when a monster's AI decides to attack.

## Signature & flow

```
CMonster_J::FireBullet(target_x?, target_y?, sl_arg, sp[0x38], sp[0x3c]):
    info = CMapMgr::FindObjectInfo(eMonType=...)       # bullet's spawn template
    pzx  = CMapMgr::GetPzxMgr(info.u16[0], info.u16[6])
    bullet = new CMonster_Shoting(parent, info, pzx, 0)  # 0xac*2 = 344 B
    CAniObject::InitMotion(bullet, motion=info.u8[6], init=(info.u8[0]==0))
    
    if parent+0x68 != 0:
        bullet.fields = ...                              # set up runtime state
        dist = CNomUtil::Distance2D(target, bullet_pos)
        if dist > 100:
            bullet+0xd6 = (target_x - bullet_x)          # X velocity (delta)
            bullet+0xd8 = (target_y - bullet_y)          # Y velocity (delta)
```

So **bullets ARE `CMonster_Shoting` instances** — not a separate Bullet
class. The same path-following physics (`DoPathLogic` path-mode) drives
both AI monsters and projectiles, with the bullet getting velocity
components from target-direction calculation.

## Bullet runtime state setup

After construction, FireBullet writes these fields on the new bullet:

| Offset | Value                          | Meaning                            |
|--------|--------------------------------|------------------------------------|
| +0x28  | parent.+0x28 (player ptr)       | track the player as target         |
| +0x34  | 1                              | "active" flag                      |
| +0x36  | 1                              | (subclass-specific flag)           |
| +0x37  | parent.+0x37 (orientation)      | inherit firing direction           |
| +0x3a  | 1                              | path-following on                  |
| +0x40  | 0xf (=15)                      | ACTIVE-subtype (out of 12-case range — falls to eMonType-driven path) |
| +0x41  | 0                              | (clear)                            |
| +0x4c  | 0                              | vx = 0 (no static velocity; uses delta below) |
| +0x52  | 0                              | vy = 0                              |
| +0xd4  | `sp[0x40]` (spawn x?)          | initial X anchor                   |
| +0xd6  | `target_x - bullet_x` (if dist > 100) | trajectory delta X            |
| +0xd8  | `target_y - bullet_y`          | trajectory delta Y                 |
| +0xf9  | 0                              | effect-spawn disabled              |
| +0x44, +0x46 | 0                        | (clear timing fields)              |

## Distance gate

```
dist = Distance2D(target_pos, bullet_pos)
if dist <= 100:
    skip trajectory write
    (bullet doesn't move toward target — fires straight or static?)
```

So projectiles fired at very close range (≤100 px) don't get a
target-tracking trajectory. Likely a guard against bullets immediately
warping due to division/normalization issues at small distances.

## Why `obj+0x40 = 0xf`?

The 12-case ACTIVE dispatch (see `CMonster_ACTIVE.md`) handles values
`0..11`. Setting `+0x40 = 0xf (=15)` deliberately pushes the bullet's
ACTIVE state into the **eMonType-driven fall-through path** (the code at
`@0xae5b8 if subtype <= 11: dispatch / else: eMonType branches`).

So bullets are processed by the eMonType-specific paths in
DoFSM_MONSTER_ACTIVE — likely matching whatever bullet eMonType is
configured (small fast moving sprite with collision).

## Related helpers

| Symbol                     | Vaddr     | Role                                      |
|----------------------------|-----------|-------------------------------------------|
| `CMonster_Shoting()`       | `0xaf954` | bullet ctor (344 B alloc)                  |
| `CMapMgr::FindObjectInfo`  | `0xa7be0` | look up tagSObjectInfo by eMonType        |
| `CMapMgr::GetPzxMgr`       | `0xa7ba4` | sprite manager fetch                       |
| `CNomUtil::Distance2D`     | `0xd55c4` | Euclidean distance                         |
| `CObject::SetPosition`     | `0xd56f4` | place bullet at firing point               |
| `CMap::GetPath` / `GetPathLayer` | `0x9bee0`/`0x9beb0` | attach bullet to a path layer    |

## Recreation strategy

For faithful recreation:
1. Treat bullets as a regular `CMonster_Shoting` subclass — share the same
   physics integrator (`DoPathLogic`).
2. On firing: spawn a CMonster_Shoting at parent position, set
   `+0xd6/+0xd8` to (target - pos) for tracking trajectory.
3. For distances ≤100, fire straight (no tracking) — matches edge case.
4. Bullet lifetime ends when it leaves the path layer or hits target
   (handled by `CheckCrashToNom` on player side).

## Open

- Confirm where `CMonster_J::FireBullet` is called from — likely
  `DoFSM_MONSTER_ACTIVE` per-eMonType branches for shooting monsters.
- Bullet's eMonType source (where `FindObjectInfo`'s arg comes from).
- Expiration / off-screen cleanup logic.

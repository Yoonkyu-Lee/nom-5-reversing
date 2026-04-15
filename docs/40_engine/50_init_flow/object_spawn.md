# N5M Object Spawn — f0..f6 Field Mapping

Resolves how the 7 `u8` fields per N5M object record (`f0..f6`) map to runtime
`CMonster` / `CObject` fields when `CMap_J::LoadMap` constructs an object.

## Source: CMap_J::LoadMap object loop (`@0x9ff10..@0xa012e`)

### Step 1 — read record

```
@0x9ff12  f0 = readUint8()  → sb
@0x9ff1a  f1 = readUint8()  → sp[0x20]
@0x9ff22  f2 = readUint8()  → fp
@0x9ff2a  f3 = readUint8()  → r5            # type selector
@0x9ff32  f4 = readUint8()  → r8            # ACTIVE dispatch subtype
@0x9ff3a  f5 = readUint8()  → sp[0x28]
@0x9ff42  f6 = readUint8()  → sp[0x38]
```

### Step 2 — lookup objectInfo and pzx

```
info = CMapMgr::GetObjectInfo(f3)            # tagSObjectInfo[f3]
pzx  = CMapMgr::GetPzxMgr(info.u16[0], info.u16[6])   # (pzx1, pzx2)
```

### Step 3 — choose CMonster variant by current stage number

```
stage_num = CNomUI.ms_pSingleton->+0x6d      # current stage id (set by SetCurStageNum)
switch (stage_num):
    0xa (=10) or 0x19 (=25) → allocate CMonster_Decal (gate-like stages)
    0xc (=12) or 0x1c (=28) → allocate CMonster_Shoting (shooting stages)
    default                  → allocate CMonster_J
```

The byte is **the current stage number**, set by `CNomUI::SetCurStageNum(h)`
at `0xd3cb5`. `CNomUI.ms_pSingleton` singleton is at `0x1453ec` in .got.

Many other engine functions read `CNomUI+0x6d` to branch on stage number
(CNom::DoFSM_NOM_RUN, CObject::DoPathLogic, etc.) — the game hard-codes
per-stage gameplay differentiation via this single byte. This is NOT
"scene mode" (my earlier naming was wrong); it IS the current stage id.

### Step 4 — construct monster + set per-instance fields

```
new CMonster_J/Decal/Shoting(info, pzx, shadow_pzx, parent_mgr)
# then immediately after:
obj+0x40 = f4                                 # ACTIVE 12-case dispatch subtype
obj+0x37 = (f1 == 0)                          # bool flag — "enable X"
obj+0xf9 = (f2 == 0)                          # bool flag — effect-spawn enable
obj+0x3e = <derived>                          # another flag
obj+0x41 = <derived>
obj+0x36 = <derived>
```

## Confirmed f-field meanings

| N5M field | Runtime field      | Meaning                                      |
|-----------|---------------------|----------------------------------------------|
| `f0`      | spawn-path gate flag | **0 ⇒ standard spawn path** (allocates CTalkBox even with empty text), non-0 ⇒ alternative path. ~99% of objects have f0=0; only 1% have actual text content |
| `f1`      | `obj+0x37` = (f1==0) | orientation / left-right flip (used by CEventRect_J::IsInRect at `[event+0x37]`, and by CMonster_J DAMAGE case 6/7 branches as "mirror" flag) |
| `f2`      | `obj+0xf9` = (f2==0) | effect-spawn enable (read by `AddHitEffect` helper `0xad2ce` as "enable" gate) |
| `f3`      | (type selector)      | tagSObjectInfo index → info ptr at `obj+0xf4` |
| `f4`      | `obj+0x40`           | **ACTIVE-state 12-case dispatch subtype** (see `20_fsm/CMonster_ACTIVE.md`) |
| `f5`      | `CTalkBox+0x30`       | talkbox int param (passed as 6th arg to Init)       |
| `f6`      | `CTalkBox+0x40`       | talkbox int param (passed as 5th arg to Init)       |

## CTalkBox attachment per object

After `CMonster_J` ctor, if `f0 == 0` and the object isn't an item (per
`CObject::IsItem`), and `parent_mgr+0x68 != 1`, the spawn loop:

1. Reads text length (u16) and text bytes from the stream (already in our N5M
   parser as `text_len` + `text`).
2. Allocates a string buffer via `_Znaj` and copies bytes.
3. Allocates a CTalkBox (68 bytes) via `_Znwj` and runs `CTalkBox()` ctor
   (`0x103760`).
4. Stores the talkbox pointer at `obj+0xd0`.
5. Calls `CTalkBox::Init(text_str, eTalkBoxKind=0, int=2, f6, f5)` at `0x102ffc`.

   Confirmed signature (`CTalkBox::Init(char*, eTalkBoxKind, int, int, int)`,
   26 B):
   ```
   text   → CTalkBox::SetText() helper (bl 0x102fc4)
   kind   → CTalkBox+0x3c
   int_a  → CTalkBox+0x38   (always 2 in spawn path)
   int_b  → CTalkBox+0x40   (= N5M f6)
   int_c  → CTalkBox+0x30   (= N5M f5)
   ```

   `f0` does NOT enter Init args — it just selects the spawn-flow branch
   (f0==0 → constant `int_a=2`, f0!=0 → alternative branch).

So every monster on the standard spawn path **carries a CTalkBox slot**
even when text is empty (only ~1% of objects across stages 0..15 actually
have text). The `f5`/`f6` slot params are stored regardless; if text is
non-empty the talkbox renders.

Empirical (first 5 stages, 1793 objects):
- `(f0=0, no text)` × 1775 — silent default monsters with empty CTalkBox
- `(f0=0, has text)` × 18 — actual dialog speakers
- `(f0!=0, *)` × 0 (in this sample) — alternative path very rare

So f0=0 is the engine's default and the gating is mostly "do I have text
to display" via text_len, not via f0 alone.

## Mirror: CMonster variant selection

| mode (singleton+0x6d) | Spawned class        | Stage type                 |
|-----------------------|----------------------|----------------------------|
| 0xa, 0x19             | `CMonster_Decal`     | gate stages                |
| 0xc, 0x1c             | `CMonster_Shoting`   | shooting stages            |
| everything else       | `CMonster_J`         | standard side-scroller     |

This also determines which `DoFSM_MONSTER_*` set gets used per block — the
subclass dispatch happens at spawn time, not per-frame.

## Block flags[0..6] mapping (separate finding)

N5M block `flags[7]` bytes map as follows:

| N5M flag  | Destination          | Role                                   |
|-----------|----------------------|----------------------------------------|
| flags[0]  | `CMap_J+0x67`        | scroll_phase (2-bit back-layer counter)|
| flags[1]  | `CMap_J+0x68`        | stage_class_1                          |
| flags[2]  | `CMap_J+0x69`        | reverse_path                           |
| flags[3]  | `CMap_J+0x6a`        | stage_class_3                          |
| flags[4]  | `CMap_J+0x6b`        | stage_class_4                          |
| flags[5]  | `CMap_J+0x6c`        | stage_class_5                          |
| flags[6]  | stack `sp[0x44]` then **each spawned `obj+0x3e`** | **per-object flag copied from block** |

So flags[0..5] are block-global (stored on CMap_J) while **flags[6] is a
per-object seed**: the byte is held on stack during the block parse and then
written into every CMonster's `obj+0x3e` as it spawns. This explains the
value range of flags[6] (0 or 1 across 21 stages): it's a boolean
per-object "mode" flag that propagates down to all monsters in that block.

## Open

- `f0`, `f5`, `f6` exact meanings — pinned through CMonster_J constructor
  (`0xae560`) which receives them as args.
- Other strb targets (`obj+0x36`, `+0x3e`, `+0x41`) — precise source chain
  (some are derived from `sp[0x44]` via an intermediate helper call).
- Confirm `singleton+0x6d` is `CStageGameScene+0x6d` and trace where the
  game sets it per stage.

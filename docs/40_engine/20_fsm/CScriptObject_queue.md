# CScriptObject Queue Handlers

`CScriptObject::DoFSMLogic` (`0xffce5`, 228 B) processes the per-object FSM
queue set up by `Init_SCRIPTCMD_*` handlers (see
`docs/30_formats/20_scr/40_semantics.md` and
`20_fsm/CScriptEngine_dispatch.md`).

## Queue record layout

A queue record is a 0x24-byte struct allocated by the scripted-command
init handlers. Common fields:

| Offset | Field           | Notes                                            |
|--------|-----------------|--------------------------------------------------|
| +0x00  | type            | 1 = idle / 2 = MOVE_POS / 4 = CHANGE_ANI         |
| +0x08  | param 0         | type 2: vx;  type 4: ?                            |
| +0x0c  | param 1         | type 2: vy;  type 4: ?                            |
| +0x10  | param 2         | type 2: end_x; type 4: motion_id                 |
| +0x14  | param 3         | type 2: end_y; type 4: init flag                  |

The active queue record pointer is at `obj+0x2c`; the active type at `obj+0x30`.

## Per-frame dispatch

```
@0xffce6  if obj+0x40 (delay) > 0:
              obj+0x40 -= 1                      # OBJ_SET_FSM_DELAY countdown
@0xffcf4  type = obj+0x30
          switch (type):
            case 2:  goto MOVE_POS
            case 4:  goto CHANGE_ANI
            case 1:  goto IDLE
            default: return                       # no active queue
```

## type 1 — IDLE (`@0xffd48`)

```
DoAnimate(obj)
return
```

Trivial: just tick the current animation. Used as the "post-completion" state
after a CHANGE_ANI finishes — keeps animating the new motion until something
else is queued.

## type 2 — MOVE_POS (`@0xffd06`)

```
record = obj+0x2c
obj.x = obj+0x20 + record.vx                       # integrate position
obj.y = obj+0x22 + record.vy
vx = record.vx
vy = record.vy

# X clamp
if vx > 0:
    if obj.x > end_x: obj.x = end_x; signal_end()
elif vx < 0:
    if obj.x < end_x: obj.x = end_x; signal_end()
# (vx == 0 → no X clamp)

# Y clamp (same shape with vy/end_y)
DoAnimate(obj)
return
```

`signal_end()` calls vtable[+0x1c] on the embedded sub-object — likely a
"motion completed" hook. Confirms earlier `OBJ_MOVE_POS` documentation.

## type 4 — CHANGE_ANI (`@0xffd50`)

```
DoAnimate(obj)
if !IsEndAnimation(obj):
    return                                          # wait for current motion to finish

record = obj+0x2c
queued_motion = record.field_0x10
if queued_motion >= 0:
    init_flag = (record.field_0x14 == 0)            # canonical "init=true if 0" idiom
    CAniObject::InitMotion(obj, queued_motion, init_flag)

# also tick the embedded sub-anim
embed = obj+0x24
embed.vtable[some]()  → ChangeMotion(embed, 1, 0)
DoAnimate(embed)
return
```

So CHANGE_ANI is **"wait for current animation, then start the queued
motion"** — the standard scripted-cutscene primitive. Used by SCR opcode
`23 OBJ_CHANGE_ANI` with `wait_flag=1`.

## Lifecycle

A typical script-driven object motion looks like:

```
SCR opcode 18 OBJ_CREATE → allocate CScriptObject (queue type 0 / no record)
SCR opcode 23 OBJ_CHANGE_ANI(slot, motion=N, wait=1) →
    allocate queue record; type=4; field_0x10=N
    obj+0x30 = 4
    DoFSMLogic ticks each frame:
        wait for current anim to end
        switch motion to N
        switch type to 1 (idle) [implicit, on next ChangeMotion call]
SCR opcode 27 OBJ_MOVE_POS(slot, vx,vy,end_x,end_y) →
    allocate queue record; type=2; vx/vy/end_x/end_y
    obj+0x30 = 2
    DoFSMLogic ticks each frame:
        integrate, clamp, signal_end on arrival
```

## Open

- Map "type 0" / no-active-queue state precisely (start condition).
- Identify what `signal_end()` (vtable on embedded sub-object) actually
  triggers — likely advances the script command stream by clearing a wait
  flag.
- Decode the case where `obj+0x30 = 3` (if any opcode allocates type 3).

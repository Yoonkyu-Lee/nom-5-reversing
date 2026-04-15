# NOM5 Opcode Semantics

- Date: 2026-04-14
- Related: `./30_parser.md`, `./20_loader.md`

## Goal

This document records the current semantic interpretation of `.scr` opcodes with emphasis on game recreation.

The point is not just to parse scripts, but to know what a future reimplementation must do when each command appears.

## High-Confidence Mappings

These are now backed by direct handler analysis and/or unambiguous call targets.

| Opcode | Name | Confidence | Evidence |
|---|---|---|---|
| `00` | `CLEAR_WAIT_FLAG` | high | init/do both clear engine byte `0x76` and immediately `NextCommand(0)` |
| `01` | `END_SCRIPT_FINALIZE` | high | final tiny-script opcode; init calls popup virtual end/finalize path and `DeleteCommandAll()` |
| `02` | `LOAD_RES` | high | direct symbol `Init_SCRIPTCMD_LOAD_RES` |
| `03` | `COMMAND_PUSH_START` | high | direct symbol |
| `04` | `COMMAND_PUSH_END` | high | direct symbol |
| `05` | `ENABLE_SKIP` | high | init sets engine byte `0x78`; `CScriptPopUp::KeyProcess()` checks it and calls `CScriptEngine::SkipScript()` |
| `07` | `WAIT_OBJECTS_SETTLE` | high | no init work; do-handler waits until scripted popup objects finish/settle |
| `08` | `WAIT_FRAMES` | high | init stores arg to `recCommand+0x20`, do decrements until completion |
| `09` | `VIBRATE` | high | internal handler calls `CGsSound::Vibrator()` |
| `10` | `SOUND` | high | direct symbol `Init_SCRIPTCMD_SOUND` |
| `11` | `SOUND_STOP` | high | internal handler calls `CScriptPopUp::SoundStop()` |
| `12` | `SHAKE_SCREEN` | high | internal handler calls `CScriptPopUp::ActiveShakeScreen(3,8)` and then advances |
| `13` | `SCREEN_SCROLL` | high | do-handler is `Do_SCRIPTCMD_SCREEN_SCROLL` |
| `14` | `FADE` | high | arg `0` -> `ActiveFadeIn`, nonzero -> `ActiveFadeOut` |
| `15` | `CLEAR_FADE_FLAG` | medium | init clears popup byte `0x2f`, which is the fade-active flag set by `ActiveFadeIn/Out()` |
| `16` | `END_SCRIPT_NOW` | medium | init directly calls `CScriptPopUp::EndScript()` and immediately advances |
| `17` | `RESULT_POPUP` | high | direct symbol `Init_SCRIPTCMD_RESULT_POPUP` and end-script usage |
| `18` | `OBJ_CREATE` | high | direct symbol and argument shape |
| `19` | `OBJ_SET_TALKBOX_MODE` | high | sets `CScriptObject + 0x3c = 1`, which switches draw path to `CTalkBox` |
| `20` | `OBJ_ENLARGE_SCREEN` | high | direct symbol calls `CScriptPopUp::ActiveEnlargeScreen(..., CScriptObject*)` |
| `21` | `OBJ_TALKBOX` | high | direct symbol and inline-string usage |
| `22` | `OBJ_TALKBOX_POS` | high | direct symbol and explicit position args |
| `23` | `OBJ_CHANGE_ANI` | high | direct init/do symbols |
| `24` | `OBJ_CHANGE_ANI_INIT` | high | direct symbol |
| `25` | `OBJ_SET_POS` | high | direct symbol |
| `26` | `OBJ_SET_FLIP_LR` | high | direct symbol |
| `27` | `OBJ_MOVE_POS` | high | direct init/do symbols |
| `28` | `OBJ_SET_FSM_DELAY` | high | writes arg to `CScriptObject + 0x40`, used as object-local countdown in `DoFSMLogic()` |
| `29` | `OBJ_SET_FLIP_UD` | high | direct symbol |
| `30` | `SOUND_EFFECT` | high | direct init/do symbols |

## Important Behavioral Notes

### `08` WAIT_FRAMES

This is script-engine-local waiting.

- init stores the single `i8` argument into `recCommand + 0x20`
- do-handler decrements that value every frame
- command advances when the counter expires

This is not object-local timing.

### `14` FADE

This command is now confirmed to multiplex fade-in and fade-out.

- `arg0 == 0` -> `CScriptPopUp::ActiveFadeIn()`
- `arg0 != 0` -> `CScriptPopUp::ActiveFadeOut()`

So a future reimplementation should not split this into two script opcodes.

### `05` ENABLE_SKIP

This is not a timing wait.

- init sets engine byte `0x78 = 1`
- `CScriptPopUp::KeyProcess()` checks that flag on confirm key input
- if set, it calls `CScriptEngine::SkipScript()`

`SkipScript()`:

- closes all active talkboxes
- advances through commands until it hits a stop condition
- clears byte `0x78` before returning

The observed stop conditions inside `SkipScript()` are:

- opcode `17` (`RESULT_POPUP`)
- opcode `14` (`FADE`) when `arg0 == 1`

So this opcode is best modeled as "allow player-confirmed fast-forward / skip" for the upcoming dialogue beat.

### `07` WAIT_OBJECTS_SETTLE

This opcode has no meaningful init handler, but its do-handler is specific.

It scans the active script-object vector and waits until popup/script objects have settled before advancing.

This matters for recreation because it is a synchronization barrier, not a visible effect.

### `19` OBJ_SET_TALKBOX_MODE

This command selects a script object and sets byte `+0x3c` to `1`.

`CScriptObject::Draw()` checks this flag:

- `0` -> draw animated sprite object
- `1` -> draw embedded `CTalkBox`

So this is a presentation-mode switch, not a generic "enable object" flag.

### `20` OBJ_ENLARGE_SCREEN

This is a scripted zoom/emphasis effect on a specific object.

The handler calls:

- `CScriptPopUp::ActiveEnlargeScreen(..., CScriptObject*)`

This matters for recreation because it is a camera/UI effect, not a sprite transform only.

### `28` OBJ_SET_FSM_DELAY

This writes an `i16` value into `CScriptObject + 0x40`.

`CScriptObject::DoFSMLogic()` decrements that field before processing motion/state logic.

So this is best modeled as an object-local delay / cooldown / wait field.

## Object Commands (arg semantics — 2026-04-15 update)

### `10` SOUND

Schema: `[i32 sound_channel, i32 enable_flag]`

Decoded from `Init_SCRIPTCMD_SOUND` (0xfed64) — 5-case jump table on arg0:

| arg0 | sound system code |
|------|-------------------|
| 0    | 0x1c              |
| 1    | 0x2c              |
| 2    | 0x2b              |
| 3    | 0x29              |
| 4    | 0x2a              |

arg1 is a boolean (`(|arg1|>>31) ? 1 : 0`). Observed: arg1 = 1 (play). Init also calls
`SoundStop` first, so this is "stop current → play category arg0".

### `18` OBJ_CREATE

Schema: `[i32 type, i32 pos1, i32 pos2, i32 parent_ref]`

Decoded from `Init_SCRIPTCMD_OBJ_CREATE` (0xfeff0):

- arg0: object type/template id, passed to constructor at `0xfff88`
- arg1, arg2: position params (i16) → `SetPos(arg1, arg2)` at `0x618d8`
- arg3: parent/ref id, stored at `CScriptObject+0x4c`. `-1` (always observed) = no parent.

Allocates 0xa4-byte `CScriptObject`, sets active flag (+0x38=1). Object is queued or
created directly depending on engine state byte `[r7+0x31] ∈ {3,4,5}`.

### `23` OBJ_CHANGE_ANI

Schema: `[i32 slot, i32 motion_id, i32 wait_flag]`

Decoded from `Init_SCRIPTCMD_OBJ_CHANGE_ANI` (0xff7e8):

- arg0: script object slot index (0..3 observed)
- arg1: motion id, eventually passed to `CAniObject::ChangeMotion`
- arg2: queue/wait flag — `0` = immediate change with init=1, `1` = queue (Do_handler
  processes and waits)

The 0x24-byte queue record format: `{type=4, motion_id=arg1, init_flag=(arg2==0)}`.

### `27` OBJ_MOVE_POS

Schema: `[i32 slot, i16 vx, i16 vy, i16 target_x, i16 target_y]`

Decoded from `Init_SCRIPTCMD_OBJ_MOVE_POS` (0xff9c4) and queue-type-2 handler in
`CScriptObject::DoFSMLogic` (0xffd06):

- arg0: script object slot index
- arg1: vx (velocity X per frame, signed)
- arg2: vy (velocity Y per frame, signed)
- arg3: target_x (clamp boundary; semantics depends on sign of vx)
- arg4: target_y (clamp boundary; semantics depends on sign of vy)

Per-frame logic in queue type=2:
```
obj.x += vx
obj.y += vy
if vx > 0 and obj.x > target_x: clamp obj.x = target_x; advance
if vx < 0 and obj.x < target_x: clamp obj.x = target_x; advance
if vx == 0: no horizontal clamp
(same for vy / target_y)
```

So this is a velocity-based linear move with target-position clamp. Movement starts
from current position (set previously by `OBJ_SET_POS` or `OBJ_CREATE`).

### `12` SHAKE_SCREEN

Schema: `[i32 a, i32 b]` — **arguments are unused at runtime**

The opcode 12 handler is inline at `0xffbe6` inside `CScriptEngine::InitScriptEngine`'s
dispatch switch (no exposed `Init_SCRIPTCMD_SHAKE_SCREEN` symbol). The full handler is:

```
ldr  r0, [r0, #4]      ; r0 = popup pointer
movs r1, #3            ; HARDCODED duration = 3
movs r2, #8            ; HARDCODED amplitude = 8
bl   CScriptPopUp::ActiveShakeScreen   ; calls (popup, 3, 8)
bl   NextCommand(0)
```

The recCommand args (arg0, arg1 — observed `[0/1, 8/16]`) are **not read** by the
handler. They are vestigial bytes that the format and parser still consume, but the
runtime ignores them. Likely a leftover from a prior engine version where shake was
customizable. `ActiveShakeScreen(duration, amplitude)` writes `popup+0x54=duration`,
`popup+0x50=amplitude`, and triggers a callback on `popup+0x1c` if non-null.

For faithful recreation: emit a fixed shake of (duration=3 frames, amplitude=8) and
discard the script args.

### Dispatch Table Location

All `Init_SCRIPTCMD_*` handlers (both exposed-symbol and anonymous-inline) are reached
via a 31-entry jump table inside `CScriptEngine::InitScriptEngine` at `0xffb00`:

```
ldr  r2, [r0, #0x18]   ; current opcode
cmp  r2, #0x1e          ; opcode > 30 ⇒ no-op
bhi  exit
... jump-table dispatch ...
```

Anonymous handlers (no exposed symbol — opcodes `00/01/05/06/07/11/12/13/14/15/16/19/22*` etc.)
are inline within this function. This is where to look for any handler whose precise
behavior is in doubt.

## Talkbox Commands

### `21` OBJ_TALKBOX

Schema:

```text
[i8, i8, i8, str, i8, i8, i8]
```

Observed behavior:

- selects an existing script object via arg0
- activates embedded `CTalkBox`
- passes inline dialogue string
- may initialize object motion after the talkbox call
- sets object field `+0x90 = -1`, which is later used by do-handlers as a talkbox/readiness gate

Confirmed via `Init_SCRIPTCMD_OBJ_TALKBOX` (0xff2f0):

- arg0: object slot / speaker object id (resolved via `0xfe3b8`)
- arg1: `eTalkBoxType`
- arg2: `eTaklBoxEmotionKind` (≤ 12 = use directly; > 12 = use default emotion `0xd` = 13).
  The branch is at `0xff334`: `cmp arg2, #0xc; bgt main_path; b alt_path`. Same logic
  as opcode 22.
- arg3: inline text (passed to `CTalkBox::ActiveTalkBox` as `const char*`)
- arg4: motion_id (`> 0` triggers `CAniObject::ChangeMotion` after talkbox setup)
- arg5: motion init flag passed to ChangeMotion
- arg6: extra integer parameter passed into `CTalkBox::ActiveTalkBox`

Side effects after talkbox activation:
- `scriptObj+0x90 = -1` (talkbox-active marker)
- `scriptObj+0x80 = 0` (x position cleared)
- `scriptObj+0x82 = 0 or computed-from-arg2` (y position)

`CTalkBox::ActiveTalkBox()` signature is:

```text
CTalkBox::ActiveTalkBox(const char*, eTalkBoxType, int, eTalkBoxKind, eTaklBoxEmotionKind, bool)
```

For opcode `21`, the handler appears to:

- pass `arg1` as `eTalkBoxType`
- pass `arg6` as the raw integer parameter
- use a fixed `eTalkBoxKind = 0`
- derive / clamp the emotion path internally rather than forwarding `arg2` directly in the common path

So the exact semantic name of `arg2` still needs refinement, but the call shape is now bounded.

Current shipped-script distribution also suggests:

- `arg5` is almost always `1`
- `arg6` is overwhelmingly `16`, with a smaller secondary cluster at `6`

So `arg5/arg6` likely include preset-like UI behavior rather than fully free gameplay parameters.

### `22` OBJ_TALKBOX_POS

Schema:

```text
[i16, i8, i8, str, i8, i16, i16]
```

Observed behavior:

- if arg0 >= 0: use existing script object
- if arg0 < 0: allocate a temporary `CScriptObject`
- initialize talkbox on that object
- write explicit position into object fields `+0x80`, `+0x82`
- set object field `+0x90 = -1`

Current working interpretation:

- arg0: object slot, or `-1` for temporary speaker object
- arg1: `eTalkBoxType`
- arg2: `eTaklBoxEmotionKind` when `<= 12`, otherwise handler falls back to a stage/scene-specific default
- arg3: inline text
- arg4: extra integer parameter passed into `CTalkBox::ActiveTalkBox`
- arg5: x position
- arg6: y position

This is the positioned speaker/dialogue variant used for dramatic entrances and boss lines.

Unlike opcode `21`, this positioned variant forwards the emotion slot much more directly.

For shipped scripts, this positioned variant is also much more constrained:

- `arg4` is almost always `24`
- `arg1` is concentrated in a small set (`2`, `4`, `3`, `5`, `0`)

That again suggests mostly preset-driven talkbox styling.

## End-Script Commands

### `01` END_SCRIPT_FINALIZE

This is the common terminal opcode in the shipped 2-command stubs:

```text
[00, 01]
```

It runs a stronger finalization path than `16`:

- calls a popup virtual finalize/end method
- calls `CScriptEngine::DeleteCommandAll()`

This is the "tear down the current script session" opcode.

### `16` END_SCRIPT_NOW

This opcode is not used in the shipped scripts we parsed, but its handler is clear:

- it calls `CScriptPopUp::EndScript()`
- then immediately advances

So it looks like a direct "request end-script behavior now" command, while opcode `01` is the full finalizer / cleanup terminator.

## Commands Still Needing Better Names

These are no longer format blockers, but the names are still provisional.

| Opcode | Current name | Notes |
|---|---|---|
| `06` | `NOOP_ADVANCE` | explicit no-op / sequencing marker |
| `12` | `SHAKE_SCREEN` | effect is clear, but the two script args are still not mapped to runtime parameters |
| `15` | `CLEAR_FADE_FLAG` | strong handler evidence, but not used in shipped scripts yet |
| `16` | `END_SCRIPT_NOW` | strong handler evidence, but not used in shipped scripts yet |

## Why This Matters For Reimplementation

At this point, `.scr` is no longer only data that can be parsed.

It is now close to a script IR that can drive a replacement runtime:

- wait commands
- fade commands
- sound and sound-effect commands
- vibrate
- object creation
- object motion
- talkbox/dialogue presentation
- positioned dialogue
- enlarge-screen emphasis
- result popup

That is enough to begin sketching a script interpreter for cutscenes once object and popup abstractions are recreated.

## Next Steps

1. Rename opcodes `00/01/05/15/16` by tracing their side effects more precisely.
2. Refine talkbox argument names by correlating enum values with rendered behavior.
3. Move into `.n5s` / `.n5m` so script opcodes can be tied to stage object IDs and map events.

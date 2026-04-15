# CScriptEngine Opcode Dispatch

Runtime mapping of the 31 SCR opcodes to their actual handler code in
`libgameDSO.so`. Pairs with `docs/30_formats/20_scr/40_semantics.md` (which covers
the on-disk argument layout).

## Entry point

`CScriptEngine::InitScriptEngine` (`0xffaed`, 408 bytes) runs each frame for the
currently-active recCommand. Dispatch:

```
@0xffb00  ldr  r2, [r0, #0x18]   ; r2 = current opcode
@0xffb02  cmp  r2, #0x1e          ; > 30 → no-op exit
@0xffb04  bhi  exit
@0xffb06  ldr  r1, [pc, #0x174]   ; jump table base offset
@0xffb08  lsls r2, r2, #2          ; r2 *= 4
@0xffb0a  adds r1, r3, r1
@0xffb0c  ldr  r2, [r1, r2]        ; r2 = jump_table[opcode]
@0xffb0e  adds r1, r2, r1
@0xffb10  mov  pc, r1               ; jump
```

After each opcode body, control falls to `b 0xffb20` (pop and return) so each
handler is "advance one command and exit".

`Do_SCRIPTCMD_*` (separate symbols at `0xfeXXX`) handle multi-frame waits for
opcodes that don't complete in one Init call (WAIT_FRAMES, OBJ_MOVE_POS,
OBJ_CHANGE_ANI, SOUND_EFFECT, SCREEN_SCROLL, FADE_ON).

## Handler map

External handlers (own ELF symbol):

| Opcode | Name                  | Init handler (vaddr)   | Do handler       |
|--------|-----------------------|------------------------|------------------|
| 02     | LOAD_RES              | `0xfee45` (144 B)      | —                |
| 03     | COMMAND_PUSH_START    | `0xfeed5` (88 B)       | —                |
| 04     | COMMAND_PUSH_END      | `0xff725` (196 B)      | —                |
| 10     | SOUND                 | `0xfed65` (144 B)      | —                |
| 17     | RESULT_POPUP          | `0xfefc1` (48 B)       | —                |
| 18     | OBJ_CREATE            | `0xfeff1` (268 B)      | —                |
| 20     | OBJ_ENLARGE           | `0xff0fd` (60 B)       | —                |
| 21     | OBJ_TALKBOX           | `0xff2f1` (316 B)      | —                |
| 22     | OBJ_TALKBOX_POS       | `0xff139` (440 B)      | —                |
| 23     | OBJ_CHANGE_ANI        | `0xff7e9` (162 B)      | `0xfeb3d` (44 B) |
| 24     | OBJ_CHANGE_ANI_INIT   | `0xfe485` (88 B)       | —                |
| 25     | OBJ_SET_POS           | `0xff88d` (312 B)      | —                |
| 26     | OBJ_SET_FLIP_LR       | `0xffa59` (148 B)      | —                |
| 27     | OBJ_MOVE_POS          | `0xff9c5` (146 B)      | `0xfe4dd` (344 B)|
| 29     | OBJ_SET_FLIP_UD       | `0xfef2d` (148 B)      | —                |
| 30     | SOUND_EFFECT          | `0xfedf5` (80 B)       | `0xfeb69` (100 B)|
| —      | (FADE_ON do)          | —                      | `0xfe455` (48 B) |
| —      | (SCREEN_SCROLL do)    | —                      | `0xfe3e9` (106 B)|

Inline handlers (no exposed symbol — body lives inside `InitScriptEngine`):

| Opcode | Name                  | Inline body | Action                                                                 |
|--------|-----------------------|-------------|------------------------------------------------------------------------|
| 00     | CLEAR_WAIT_FLAG       | `@0xffc64`  | engine+0x76 = 0; advance                                               |
| 01     | END_SCRIPT_FINALIZE   | `@0xffc54`  | popup vtable[+0x4c] (finalize); `bl 0xfe770` (DeleteCommandAll)        |
| 05     | ENABLE_SKIP           | `@0xffc38`  | engine+0x78 = 1; advance                                               |
| 06     | NOOP_ADVANCE          | `@0xffc2a`  | recCommand+0x20 = arg (just stores arg); advance                       |
| 07     | WAIT_OBJECTS_SETTLE   | (do-side)   | no init; do-handler waits for popup objects to settle                  |
| 08     | WAIT_FRAMES           | `@0xffb22`  | resolved scriptObj+0x40 = arg (frame countdown)                        |
| 09     | VIBRATE               | `@0xffc12`  | `bl CGsSound::Vibrator(0x64, arg)` (= 0x5f3f0)                         |
| 11     | SOUND_STOP            | `@0xffbfa`  | `bl 0x100154` (CScriptPopUp::SoundStop)                                |
| 12     | SHAKE_SCREEN          | `@0xffbe6`  | `bl ActiveShakeScreen(popup, 3, 8)` — **HARDCODED**, args ignored      |
| 13     | SCREEN_SCROLL         | (init n/a)  | only do-handler at 0xfe3e9                                             |
| 14     | FADE                  | `@0xffbd0`  | arg==0 → `ActiveFadeIn` (0x100128); else → `ActiveFadeOut` (0x100114)  |
| 15     | CLEAR_FADE_FLAG       | `@0xffbc2`  | popup+0x2f = 0                                                         |
| 16     | END_SCRIPT_NOW        | `@0xffbac`  | `bl CScriptPopUp::EndScript(arg, ~arg)` (0x100390); advance            |
| 19     | OBJ_SET_TALKBOX_MODE  | `@0xffb7e`  | resolved scriptObj+0x3c = 1 (switches Draw to CTalkBox)                |
| 28     | OBJ_SET_FSM_DELAY     | (alias 06?) | overlap with NOOP_ADVANCE inline body — both write recCommand+0x20    |

Note: opcodes 06 and 28 may share an inline body at `@0xffc2a` / `@0xffb22` since
both are "store arg into a fixed offset and advance". Confirm with jump-table
offset extraction.

## Engine state byte map

`CScriptEngine` instance fields touched by these handlers:

| Offset | Field name (working)        | Set by                          | Read by                                  |
|--------|-----------------------------|---------------------------------|------------------------------------------|
| +0x18  | current opcode              | NextCommand()                   | dispatch                                 |
| +0x1c  | recCommand pointer (state)  | dispatch helpers                | every handler                            |
| +0x76  | wait flag                   | (set by some FSM)               | CLEAR_WAIT_FLAG (00) clears it           |
| +0x78  | skip-allowed flag           | ENABLE_SKIP (05)                | `CScriptPopUp::KeyProcess`               |
| +0x7c  | command-table base index    | constructor                     | dispatch index calc                      |

`CScriptPopUp` state:

| Offset | Field                        | Meaning                                |
|--------|------------------------------|----------------------------------------|
| +0x2f  | fade-active flag             | set by ActiveFadeIn/Out, cleared by 15 |
| +0x50  | shake amplitude              | written by ActiveShakeScreen           |
| +0x54  | shake duration               | written by ActiveShakeScreen           |

## How a script tick runs

```
for each active script:
    cmd = engine.commands[engine.current_index]
    engine.current_opcode = cmd.opcode
    engine.recCommand = cmd
    InitScriptEngine()              # dispatch on current_opcode
    if !engine.wait_flag:
        engine.current_index++       # advance
    else:
        Do_SCRIPTCMD_<opcode>(cmd)   # multi-frame wait handler
```

Most handlers call `NextCommand(0)` (`0xfe381`) at the end to advance immediately;
those that need waiting set `engine.wait_flag` and rely on `Do_*` to clear it.

## Open

- Confirm jump-table opcode→address map by extracting the actual u32 table bytes
  (currently inferred from BL target identification + sequential block layout).
- Opcode 28 OBJ_SET_FSM_DELAY inline body location (suspected to share with op 06).
- `Do_SCRIPTCMD_OBJ_MOVE_POS` (0xfe4dd, 344 B) — already documented in N5M /
  CScriptObject::DoFSMLogic context; cross-link.

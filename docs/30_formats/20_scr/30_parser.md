# NOM5 Script Schema and Static Parser

- Date: 2026-04-14
- Related: `./10_structure.md`, `./20_loader.md`

## Summary

The major `.scr` blocker is now removed.

What is now confirmed:

- `CScriptEngine` constructor loads a schema file from `script/sFormat.tbl`
- `CScriptEngine::LoadScriptFile()` builds script paths as:
  - `script/`
  - `<user-supplied stem>`
  - `.scr`
- `sFormat.tbl` is the opcode argument schema table
- A static parser can now parse every `assets/script/*.scr` file to EOF

This means `.scr` is no longer "opaque binary". At the structural level, it is now effectively decoded.

## Fixed String Resolution

`scripts/formats/scr/10_probe/dump-scriptengine-strings.py` now resolves the constructor and loader strings correctly.

Constructor:

- `script/`
- `sFormat`
- `.tbl`

Loader:

- `script/`
- `<stem>`
- `.scr`

This supersedes the earlier speculation that the constructor might be loading `stage/script_object`.

## sFormat.tbl

Path:

- `jadx-out/nom5/resources/assets/script/sFormat.tbl`

File size:

- `87` bytes

Format:

```text
[0]        u8 opcode_count
[1..]      repeated opcode_count times:
             u8 argc
             argc * u8 type_codes
```

Current decoded contents:

- opcode count: `31`
- valid opcodes: `0x00 .. 0x1e`

## Type Code Mapping

This is now confirmed from the `LoadScriptFile()` jump table.

| Type code | Reader | Meaning |
|---|---|---|
| `0` | `readInt8()` | `i8` |
| `1` | `readUint8()` | `u8` |
| `2` | `readInt16()` | `i16` |
| `3` | `readUint16()` | `u16` |
| `4` | `readInt32()` | `i32` |
| `5` | `readUint32()` | `u32` |
| `6` | `readUint16()` + `readString()` | inline EUC-KR string |

This corrects the earlier tentative mapping.

## Opcode Schema Table

The current decoded schema from `sFormat.tbl` is:

```text
00: []
01: []
02: []
03: []
04: []
05: []
06: []
07: []
08: [i8]
09: [i8]
10: [i8, i8]
11: []
12: [i8, i8]
13: [i16, i16, i16, i16]
14: [i8]
15: []
16: [i8]
17: []
18: [i8, i16, i16, i16]
19: [i8]
20: [i8]
21: [i8, i8, i8, str, i8, i8, i8]
22: [i16, i8, i8, str, i8, i16, i16]
23: [i8, i8, i8]
24: [i8, i8, i8, i8]
25: [i8, i16, i16]
26: [i8, i8]
27: [i8, i16, i16, i16, i16]
28: [i8, i16]
29: [i8, i8]
30: [i8, i8]
```

Notable observations:

- `21` and `22` are the main text-bearing commands
- many object/control opcodes are tiny and only use `i8`
- the 3-byte stub scripts are still exactly:
  - command count `2`
  - opcode stream `[0x00, 0x01]`

## Jump Table Status

`scripts/formats/scr/10_probe/analyze-scriptengine-jumptables.py` now resolves the switch tables correctly.

High-confidence named opcode mappings:

- `02` -> `Init_SCRIPTCMD_LOAD_RES`
- `03` -> `Init_SCRIPTCMD_COMMAND_PUSH_START`
- `04` -> `Init_SCRIPTCMD_COMMAND_PUSH_END`
- `10` -> `Init_SCRIPTCMD_SOUND`
- `13` -> `Do_SCRIPTCMD_SCREEN_SCROLL`
- `14` -> `Do_SCRIPTCMD_FADE_ON`
- `17` -> `Init_SCRIPTCMD_RESULT_POPUP`
- `18` -> `Init_SCRIPTCMD_OBJ_CREATE`
- `20` -> `Init_SCRIPTCMD_OBJ_ENLARGE`
- `21` -> `Init_SCRIPTCMD_OBJ_TALKBOX`
- `22` -> `Init_SCRIPTCMD_OBJ_TALKBOX_POS`
- `23` -> `Init/Do_SCRIPTCMD_OBJ_CHANGE_ANI`
- `24` -> `Init_SCRIPTCMD_OBJ_CHANGE_ANI_INIT`
- `25` -> `Init_SCRIPTCMD_OBJ_SET_POS`
- `26` -> `Init_SCRIPTCMD_OBJ_SET_FLIP_LR`
- `27` -> `Init/Do_SCRIPTCMD_OBJ_MOVE_POS`
- `29` -> `Init_SCRIPTCMD_OBJ_SET_FLIP_UD`
- `30` -> `Init/Do_SCRIPTCMD_SOUND_EFFECT`

Several low opcodes still route to unnamed internal blocks inside `InitScriptEngine()` / `DoScriptEngine()`. Those are now bounded unknowns rather than format blockers.

## Static Parser

New scripts:

- `scripts/formats/scr/00_inspect/inspect-sformat.py`
- `scripts/formats/scr/20_parse/parse-nom5-script.py`
- `scripts/formats/scr/30_export/export-nom5-scripts-json.py`

Example:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\scr\20_parse\parse-nom5-script.py .\jadx-out\nom5\resources\assets\script\startscript_0.scr
```

`startscript_0.scr` now parses cleanly and exposes the inline EUC-KR dialogue as structured command arguments.

Example talkbox commands from `startscript_0.scr`:

- `지구 아닌 곳 달리는 건 처음이네`
- `근데 우주도 달리는거야?`
- `우주라고 별거없네ㅋㅋ`
- `여자 외계인도 있겠지?`
- `없기만 해봐라!!`
- `여자들이여 내게 와라!`

## Batch Validation

Batch check command:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\scr\20_parse\parse-nom5-script.py --check-all
```

Current result:

- `128 / 128` script files parse successfully
- every file is consumed exactly to EOF
- no schema mismatch remains in `assets/script/*.scr`

This is a strong signal that the parser and `sFormat.tbl` interpretation are correct.

## JSON Export

Export command:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\scr\30_export\export-nom5-scripts-json.py
```

Current output:

- `out/script-json/*.json`
- `128` files exported

Example:

- `out/script-json/startscript_0.json`

This gives future tooling and other agents a stable IR layer without having to re-run the reverse-engineering steps manually.

## Implications

For a full recreation effort, `.scr` is now in a much better state than before:

- script path construction is known
- command schema is known
- inline text extraction is exact
- all distributed script binaries are statically parseable

What remains is mostly semantic:

- precise meaning of the unnamed low opcodes
- field-by-field meaning of the talkbox and object commands
- how these commands connect to object IDs, scene state, and popup systems

## Next Steps

1. Rename the remaining internal opcodes by tracing their side effects in `InitScriptEngine()` and `DoScriptEngine()`.
2. Correlate opcode arguments with concrete runtime objects and popup slots.
3. Export all parsed scripts into a human-readable IR or JSON for browsing.
4. Move to `.n5s` / `.n5m` and `.mpl` with the script layer now structurally understood.

# SCR Status

## 1. Role In Game

- `SCR`는 컷신/대화/오브젝트 연출용 스크립트 포맷이다.
- 핵심 클래스는 `CScriptEngine`, `CScriptPopUp`, `CScriptObject`, `CTalkBox`다.
- faithful recreation에서는 컷신 플레이어와 연출 복원의 핵심이다.

## 2. File Set And Variants

- 문자열 계열: `assets/string/*.scr`
- 스크립트 계열: `assets/script/*.scr`
- schema 파일: `assets/script/sFormat.tbl`

## 3. Loader Path

- `CScriptEngine` 생성자는 `script/sFormat.tbl`을 읽는다.
- `LoadScriptFile()`는 `script/<stem>.scr` 경로를 조립한다.

## 4. Binary Structure

- `string/*.scr`: string table
- `script/*.scr`: `u8 command_count + opcode stream`
- `sFormat.tbl`: opcode argument schema

## 5. Field Semantics

- 31개 opcode 구조는 확정
- opcode 이름과 다수의 side effect도 확보
- 남은 핵심은 talkbox/object 인자 의미를 더 정밀화하는 것

## 6. Tooling

- inspect:
  - `scripts/formats/scr/00_inspect/inspect-scr.py`
  - `scripts/formats/scr/00_inspect/inspect-sformat.py`
- probe:
  - `scripts/formats/scr/10_probe/dump-scriptengine-strings.py`
  - `scripts/formats/scr/10_probe/analyze-scriptengine-jumptables.py`
  - `scripts/formats/scr/10_probe/analyze-talkbox-args.py`
  - `scripts/formats/scr/10_probe/summarize-script-opcodes.py`
- parse:
  - `scripts/formats/scr/20_parse/parse-nom5-script.py`
- export:
  - `scripts/formats/scr/30_export/export-nom5-scripts-json.py`

## 7. Current Status

- 구조 해독은 사실상 완료
- 정적 파서는 전체 파일을 EOF까지 소비
- 현재 블로커는 의미 복원이다

## 8. Next Steps

1. `CTalkBox` 경로를 더 파서 talkbox enum 의미를 확정
2. object 관련 opcode 인자를 scene object field와 더 직접 연결
3. 컷신 재생기용 IR 설계

## Related Docs

- [10_structure.md](./10_structure.md)
- [20_loader.md](./20_loader.md)
- [30_parser.md](./30_parser.md)
- [40_semantics.md](./40_semantics.md)
- [90_todo.md](./90_todo.md)

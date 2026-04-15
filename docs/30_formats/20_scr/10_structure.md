# NOM5 SCR 초기 분석

- 작성일: 2026-04-14
- 관련 문서: `../../20_native-engine/native-engine-analysis.md`, `../10_pzx/10_structure.md`

## 목적

`.scr`는 `CScriptEngine`이 소비하는 바이너리 스크립트 포맷이다. 현재 목표는 전체 opcode를 해독하는 것이 아니라, 먼저 파일군이 몇 가지 하위 포맷으로 나뉘는지와 문자열이 어떻게 저장되는지를 정리하는 것이다.

## 사용 스크립트

- `scripts/formats/scr/00_inspect/inspect-scr.py`

실행:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\scr\00_inspect\inspect-scr.py .\jadx-out\nom5\resources\assets\string\globalstring.scr
.\.venv\Scripts\python.exe .\scripts\formats\scr\00_inspect\inspect-scr.py .\jadx-out\nom5\resources\assets\string\popup.scr
.\.venv\Scripts\python.exe .\scripts\formats\scr\00_inspect\inspect-scr.py .\jadx-out\nom5\resources\assets\script\startscript_0.scr
```

## 파일군

현재 관찰된 `.scr`는 크게 두 계열이다.

1. `assets/string/*.scr`
2. `assets/script/*.scr`

이 둘은 구조가 다르다.

## string/*.scr: 문자열 테이블 포맷

현재까지 가장 강한 가설은 다음 구조다.

```text
[0..1]         u16 BE string_count
[2..]          (string_count + 1) * u16 LE offsets
[payload...]   EUC-KR strings
```

이 가설은 이제 단순 hex 추측이 아니라 `CScript::CScript(char*)` 디스어셈블리로도 뒷받침된다.

생성자에서 실제로 하는 일:

- 파일을 `GsLoadFile()`로 통째로 읽음
- 첫 2바이트를 **big-endian count**로 읽음
- 길이 `count * 4`의 포인터 배열을 할당
- 이어지는 오프셋 테이블을 **little-endian u16 쌍**으로 읽어 문자열 시작/끝을 계산
- 각 구간 길이만큼 문자열을 복사해 널 종료를 붙임

중요한 관찰:

- 첫 2바이트는 오프셋이 아니라 **문자열 개수**
- 실제 오프셋 테이블은 little-endian
- sentinel offset이 하나 더 있어서 총 `(count + 1)`개
- 첫 문자열 오프셋은 정확히 `2 + (count + 1) * 2`

### 예시 1: `globalstring.scr`

파일 크기: `1059`

- 첫 2바이트: `00 24`
- string count = `36`
- 오프셋 테이블 크기 = `2 + 37 * 2 = 76 = 0x4c`
- 첫 문자열 오프셋 = `0x004c`

실제 추출된 문자열 예시:

- `<공략 팁>`
- `<경고>`
- `스토리 모드에서 클리어한 스테이지만 선택 가능합니다`
- `게임을 중단하시겠습니까?`

### 예시 2: `popup.scr`

파일 크기: `5536`

- 첫 2바이트: `00 7f`
- string count = `127`
- 오프셋 테이블 크기 = `2 + 128 * 2 = 258 = 0x0102`
- 첫 문자열 오프셋 = `0x0102`

실제 추출된 문자열 예시:

- `유물과 간식을 선택할 수 있는 메뉴입니다...`
- `버전에서는 지원하지 않는 기능입니다.`
- `놈포인트가 부족합니다.`

## script/*.scr: opcode 스트림 + inline text

`assets/script/*.scr`는 `string/*.scr`처럼 오프셋 테이블로 시작하지 않는다.

현재까지 확인된 특징:

- 첫 바이트는 **u8 command_count**
- 그 뒤에 opcode/parameter 스트림이 이어짐
- 중간중간 **u16 LE 길이 + EUC-KR 문자열 본문** 형태의 inline text가 들어감
- 즉 별도 문자열 테이블이 아니라, 대사나 이벤트 텍스트가 스크립트 본문에 섞여 있음

이 역시 `CScriptEngine::LoadScriptFile()` 디스어셈블리로 뒷받침된다.

로더에서 확인된 사실:

- `CInputStream::readUint8()`로 command count를 읽어 `this+0x80`에 저장
- `count * 0x28` 바이트를 할당
- 각 command는 런타임에서 **40바이트 `recCommand`** 구조체로 전개됨
- `CScriptEngine::GetCurScriptCommand()`는 `base + index * 0x28`로 현재 command를 가리킴
- 각 command의 첫 값은 opcode이고, 나머지 필드는 opcode별 스키마에 따라 `readUint8/readInt8/readUint16/readInt16/readUint32/readInt32/readString`으로 읽힘

즉 원본 `.scr`는 "이미 40바이트 구조체 배열인 파일"이 아니라, **가변 길이 바이너리 명령 스트림을 로더가 `recCommand[40]` 배열로 컴파일하는 구조**다.

### 예시: `startscript_0.scr`

파일 크기: `235`

`inspect-scr.py`로 잡힌 inline text 후보:

- `지구 아닌 곳 달리는 건 처음이네`
- `근데 우주도 달리는거야?`
- `우주라고 별거없네ㅋㅋ`
- `여자 외계인도 있겠지?`
- `없기만 해봐라!!`
- `여자들이여 내게 와라!`

이 샘플에서 문자열 앞 패턴은 대체로 이런 식으로 보인다.

```text
... 15 00 00 00 1F 00 <31-byte EUC-KR text> ...
```

즉 적어도 일부 opcode는:

- opcode / flags / speaker / event 파라미터들
- `u16 LE text_len`
- text bytes

형태일 가능성이 높다.

추가로, 첫 바이트 `0x1b`는 이제 **command count = 27**로 보는 것이 가장 자연스럽다.

## 추가 관찰

- 크기가 정확히 `3`인 `.scr` 파일이 다수 있음
- 샘플 확인 결과 이 파일들은 모두 동일하게 `02 00 01`
- 즉 진짜 빈 파일이 아니라, **공통 최소 opcode 스텁**으로 보는 쪽이 더 자연스럽다
- `CScriptEngine`의 opcode dispatch를 더 보면 `02 00 01`의 의미를 빨리 확정할 수 있다

## 네이티브 심볼 힌트

`logs/libgameDSO-symbols.txt`와 `logs/libgameDSO-strings.txt`에는 `CScriptEngine` 관련 심볼이 이미 다수 잡혀 있다.

현재 바로 의미 있는 것들:

- `CScriptEngine::LoadScriptFile()`
- `CScriptEngine::NextCommand()`
- `CScriptEngine::GetCurScriptCommand()`
- `CScriptEngine::GetNextScriptCommand()`
- `CScriptEngine::DoScriptEngine()`
- `CScriptEngine::ScriptEngineHandle()`
- `CScriptEngine::Init_SCRIPTCMD_OBJ_TALKBOX()`
- `CScriptEngine::Init_SCRIPTCMD_OBJ_TALKBOX_POS()`
- `CScriptEngine::Init_SCRIPTCMD_SOUND()`
- `CScriptEngine::Init_SCRIPTCMD_SOUND_EFFECT()`
- `CScriptEngine::Init_SCRIPTCMD_LOAD_RES()`
- `CScriptEngine::Init_SCRIPTCMD_COMMAND_PUSH_START()`
- `CScriptEngine::Init_SCRIPTCMD_COMMAND_PUSH_END()`

이 목록은 `.scr`를 "opcode + parameter + optional text" 관점으로 해석할 수 있다는 강한 근거다.

## 새로 확정된 런타임 구조

현재까지 코드 레벨에서 확인된 구조는 다음과 같다.

- `current_command_index`는 `this + 0x7c`
- `command_count`는 `this + 0x80`
- `current_opcode`는 `this + 0x18`
- `recCommand*` 배열 포인터는 `this + 0x10`
- `GetCurScriptCommand()`는 `index * 0x28`로 현재 command를 찾음

즉 `recCommand`의 최소 구조적 사실은:

- 크기: `0x28`
- `+0x00`: opcode
- `+0x04` 이후: opcode별 인자들
- `+0x24`: 문자열 포인터 또는 후반부 보조 필드로 사용되는 경우가 있음

또한 `InitScriptEngine()`와 `DoScriptEngine()`를 보면 opcode는 최대 `0x1e` 근처까지 switch/jump table로 처리된다.

## 현재 결론

`.scr`는 단일 포맷이 아니라 최소 두 하위 포맷으로 봐야 한다.

1. `string/*.scr`
   - 문자열 테이블
   - `u16 BE count + u16 LE offsets + EUC-KR payload`
2. `script/*.scr`
   - `u8 command_count + variable-length opcode stream`
   - 로딩 후 `recCommand[0x28]` 배열로 전개
   - 중간에 `u16 LE length + inline EUC-KR text`

즉 다음 단계는 문자열 추출 자체보다, `script/*.scr`의 opcode 경계를 잡는 쪽이 더 중요하다.

## 다음 단계

1. `InitScriptEngine()` jump table에서 opcode ID ↔ init 함수 매핑을 정리
2. `LoadScriptFile()`의 인자 타입 코드 0..6을 정확히 매핑
3. `startscript_0.scr` 같은 작은 샘플을 기준으로 실제 opcode 경계 복원
4. `02 00 01` 스텁이 어떤 최소 명령 조합인지 확인
5. 문자열 추출기를 `string/*.scr` 전체 배치 처리용으로 확장

# NOM5 ScriptEngine Dispatch Notes

- 작성일: 2026-04-14
- 관련 문서: `./10_structure.md`, `../../20_native-engine/native-engine-analysis.md`

## 목적

`CScriptEngine`가 `.scr`를 어떤 런타임 구조로 바꾸는지, 그리고 opcode가 어떤 init/do 함수로 이어지는지 정리한다.

## 현재까지 코드로 확인된 사실

### 런타임 상태 필드

디스어셈블리 기준:

- `this + 0x7c`: current command index
- `this + 0x80`: command count
- `this + 0x18`: current opcode
- `this + 0x10`: `recCommand` 배열 포인터

`GetCurScriptCommand()`:

- `base + index * 0x28`

즉 `recCommand` 크기는 `0x28`이다.

### index 이동

`NextCommand(int)`:

- 항상 `this+0x18`를 `-1`로 리셋
- 인자가 0이 아니면 현재 index를 그 값으로 직접 대입
- 인자가 0이면 현재 index를 `+1`

즉 스크립트 진행은 "현재 opcode 해제 후 다음 command로 이동" 구조다.

### Handle 흐름

`ScriptEngineHandle()`:

- 현재 index가 유효한지 검사
- `current_opcode = recCommand[index].opcode`
- `InitScriptEngine()` 호출

`DoScriptEngine()`:

- 현재 opcode를 보고 do-handler switch 실행
- 일부 opcode는 즉시 `NextCommand(0)`로 다음 command로 넘어감
- 일부 opcode는 wait/state를 걸어두고 이후 프레임에 계속 처리

## LoadScriptFile() 구조

현재까지 가장 중요한 로딩 흐름:

1. `readUint8()`로 command count 읽기
2. `count * 0x28` 바이트 크기의 `recCommand` 배열 할당
3. command마다:
   - `readUint8()`로 opcode 읽기
   - `recCommand + 0x24`를 0으로 초기화
   - opcode별 schema에 따라 인자들을 읽기

로딩 시 사용하는 `CInputStream` reader 함수 후보:

- `readUint32()`
- `readInt32()`
- `readUint16()`
- `readInt16()`
- `readString()`
- `readUint8()`
- `readInt8()`

즉 원본 스크립트는 command별 가변 길이 바이너리이고, 로더가 이를 정규화된 `recCommand[0x28]` 배열로 바꾼다.

## 문자열 인자 처리

`LoadScriptFile()` 내부에서 한 type code는 별도 문자열 경로를 탄다.

확인된 흐름:

- 먼저 `readUint16()`로 문자열 길이 읽기
- `len + 1` 바이트 할당
- 포인터를 `recCommand + 0x24`에 저장
- `readString(buf, len)` 호출

즉 inline text는 단순 길이+본문이고, 런타임에 C string으로 재구성된다.

## init 함수 목록

심볼 테이블에서 확인된 init 함수들:

- `Init_SCRIPTCMD_OBJ_MOVE_POS`
- `Init_SCRIPTCMD_OBJ_SET_FLIP_LR`
- `Init_SCRIPTCMD_OBJ_SET_POS`
- `Init_SCRIPTCMD_OBJ_CHANGE_ANI_INIT`
- `Init_SCRIPTCMD_OBJ_CHANGE_ANI`
- `Init_SCRIPTCMD_OBJ_TALKBOX_POS`
- `Init_SCRIPTCMD_OBJ_TALKBOX`
- `Init_SCRIPTCMD_OBJ_ENLARGE`
- `Init_SCRIPTCMD_OBJ_CREATE`
- `Init_SCRIPTCMD_OBJ_SET_FLIP_UD`
- `Init_SCRIPTCMD_RESULT_POPUP`
- `Init_SCRIPTCMD_SOUND`
- `Init_SCRIPTCMD_SOUND_EFFECT`
- `Init_SCRIPTCMD_LOAD_RES`
- `Init_SCRIPTCMD_COMMAND_PUSH_START`
- `Init_SCRIPTCMD_COMMAND_PUSH_END`

## do 함수 목록

심볼 테이블에서 확인된 do 함수들:

- `Do_SCRIPTCMD_SCREEN_SCROLL`
- `Do_SCRIPTCMD_FADE_ON`
- `Do_SCRIPTCMD_OBJ_MOVE_POS`
- `Do_SCRIPTCMD_OBJ_CHANGE_ANI`
- `Do_SCRIPTCMD_SOUND_EFFECT`

현재까지는 init 쪽이 훨씬 풍부하고, do 쪽은 일부 opcode만 별도 runtime handler를 가진다.

## 작은 opcode 의미 후보

`02 00 01` 형태의 3바이트 스텁은 현재 가장 자연스럽게:

- command count = `2`
- opcode stream = `[0x00, 0x01]`

로 해석된다.

아직 `0x00`, `0x01`의 정확한 의미는 확정 전이지만, 매우 짧은 스크립트를 종료시키는 최소 명령 조합일 가능성이 높다.

## 아직 미확정인 점

1. `LoadScriptFile()` 내부 type code `0..6`의 정확한 숫자 매핑
2. `InitScriptEngine()` jump table의 opcode 번호 ↔ 함수 매핑
3. 생성자가 읽는 schema/resource 파일의 실제 경로

## 다음 단계

1. jump table을 기계적으로 다시 풀거나, 함수 바디 배치 순서로 opcode 번호를 확정
2. 작은 `.scr` 샘플에 대해 schema 없이도 맞는 정적 파서를 만들 수 있는지 검토
3. constructor가 읽는 metadata resource 경로를 확정

# NOM5 Session Start Guide

이 문서는 **문맥이 없는 새로운 세션**에서 바로 작업을 시작하기 위한 최소 진입 규칙이다.

목표는 두 가지다.

1. 예전 연대기 문서를 처음부터 다시 읽지 않기
2. 지금 필요한 문맥만 빠르게 불러와 바로 작업에 착수하기

---

## 1. 기본 원칙

새 세션은 항상 아래 원칙을 따른다.

- 전역 목표는 [00_recreation-strategy.md](../00_overview/00_recreation-strategy.md)에서 확인한다.
- 현재 우선순위와 블로커는 [active-workboard.md](./active-workboard.md)에서 확인한다.
- 실제 분석은 **현재 트랙의 `00_status.md`부터** 시작한다.
- 세부 문서는 필요할 때만 `10 -> 20 -> 30 -> 40 -> 90` 순서로 내려간다.

즉 진입 순서는 항상:

1. 전략
2. 현재 작업 보드
3. 현재 포맷/트랙의 상태 문서
4. 필요한 세부 문서

---

## 2. 새 세션 시작 순서

### Step 1. 전역 목표 확인

먼저 이 문서를 읽는다.

- [00_recreation-strategy.md](../00_overview/00_recreation-strategy.md)

여기서 확인할 것:

- 지금 프로젝트의 최종 목표가 `faithful recreation`이라는 점
- 작업 축이 `원본 실행`, `네이티브 엔진`, `포맷`, `의미 복원`, `재현 런타임`으로 나뉜다는 점

### Step 2. 현재 우선순위 확인

다음으로 이 문서를 읽는다.

- [active-workboard.md](./active-workboard.md)

여기서 확인할 것:

- 현재 primary track
- secondary track
- immediate questions
- next concrete tasks

이 문서를 읽으면 “이번 세션에서 뭘 해야 하는지”가 정해진다.

### Step 3. 현재 트랙의 상태 문서 읽기

현재 트랙에 따라 아래 중 하나의 `00_status.md`를 읽는다.

- `PZX`: [10_pzx/00_status.md](../30_formats/10_pzx/00_status.md)
- `SCR`: [20_scr/00_status.md](../30_formats/20_scr/00_status.md)
- `N5S`: [30_n5s/00_status.md](../30_formats/30_n5s/00_status.md)
- `N5M`: [40_n5m/00_status.md](../30_formats/40_n5m/00_status.md)
- `MPL`: [50_mpl/00_status.md](../30_formats/50_mpl/00_status.md)
- `FT2`: [60_ft2/00_status.md](../30_formats/60_ft2/00_status.md)

여기서 확인할 것:

- 이 포맷/트랙이 게임에서 하는 역할
- 현재 완료된 것
- 지금 블로커
- 다음 작업
- 관련 스크립트

### Step 4. 세부 문서 내려가기

필요한 경우에만 아래 순서로 읽는다.

- `10_structure.md`: 파일 구조와 샘플 분류
- `20_loader.md`: 네이티브 로더/읽기 순서
- `30_parser.md`: 현재 파서 상태와 검증
- `40_semantics.md`: 필드 의미와 런타임 연결
- `90_todo.md`: 남은 작업

모든 문서를 다 읽는 것이 목적이 아니다.  
현재 질문과 직접 관련된 슬롯만 읽으면 된다.

---

## 3. 스크립트 진입 규칙

스크립트는 문서와 같은 단계 번호를 따른다.

- `00_inspect`: raw dump / 기본 관찰
- `10_probe`: 경계, 분기, 후보 필드 탐색
- `20_parse`: 구조 파서
- `30_export`: JSON/IR export
- `90_native-support`: 네이티브 디스어셈블리 보조

새 세션에서는 보통 이 순서를 따른다.

1. 현재 포맷의 `README.md`
2. 필요한 단계의 스크립트만 확인
3. Python은 항상 workspace venv로 실행

예:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\n5s\00_inspect\inspect-n5s.py ...
.\.venv\Scripts\python.exe .\scripts\formats\n5s\10_probe\trace-n5s-parse.py ...
.\.venv\Scripts\python.exe .\scripts\formats\n5s\20_parse\parse-n5s.py ...
```

---

## 4. 세션별 추천 읽기 깊이

### 가벼운 연속 작업

- strategy는 생략 가능
- `active-workboard.md`
- 현재 트랙 `00_status.md`
- 필요한 세부 문서 1~2개

### 완전 새 세션 / 문맥 상실

- [00_recreation-strategy.md](../00_overview/00_recreation-strategy.md)
- [active-workboard.md](./active-workboard.md)
- 현재 트랙 `00_status.md`
- 현재 트랙의 `90_todo.md`

### 포맷 전환 세션

- `active-workboard.md`
- 새 포맷의 `00_status.md`
- 새 포맷의 `10_structure.md`
- 새 포맷 스크립트 `README.md`

---

## 5. 세션 종료 전 해야 할 일

새 세션이 끝날 때는 최소한 아래 중 하나를 갱신한다.

1. 해당 트랙 문서
2. 해당 트랙 `90_todo.md`
3. [active-workboard.md](./active-workboard.md)

즉 새 세션이 시작될 때 필요한 문맥은 항상 `workboard + status + todo`에 남아 있어야 한다.

---

## 6. 중간 전환점 업데이트 규칙

문서 업데이트는 **작업 완료 시점만** 기다리지 않는다.  
다음과 같은 전환점이 오면 미완성 상태라도 바로 기록한다.

### 반드시 갱신할 전환점

1. **가설이 반증되었을 때**
   - 예: `N5S flags=9` 가설이 깨짐
   - 해야 할 일:
     - 해당 트랙 문서의 관련 섹션에 “폐기된 가설” 또는 “현재 반증됨” 표시
     - `90_todo.md`의 다음 작업 수정

2. **새 변형이나 예외를 발견했을 때**
   - 예: 포맷 변형이 normal/boss 외에 하나 더 보임
   - 해야 할 일:
     - `00_status.md`의 variants 요약 갱신
     - 필요하면 `10_structure.md`에 새 하위 섹션 추가

3. **파서/스크립트 단계가 바뀌었을 때**
   - 예: inspect 수준에서 probe 수준으로 올라감
   - 예: parser가 처음으로 EOF까지 도달함
   - 해야 할 일:
     - `00_status.md`의 current status 갱신
     - `90_todo.md`의 우선순위 재정렬

4. **네이티브 로더 경로를 새로 확보했을 때**
   - 예: 어떤 포맷을 읽는 함수가 확정됨
   - 해야 할 일:
     - `20_loader.md` 갱신
     - 필요 시 관련 엔진 문서에도 링크 추가

5. **의미 복원에서 중요한 해석이 확정됐을 때**
   - 예: opcode, field, enum 의미 확정
   - 해야 할 일:
     - `40_semantics.md` 갱신
     - `00_status.md`의 blocker/next step 조정

6. **다음 세션의 시작점이 바뀌었을 때**
   - 예: 이제 primary track이 `SCR`에서 `N5S`로 넘어감
   - 해야 할 일:
     - `active-workboard.md` 갱신

### 가벼운 업데이트 원칙

전환점마다 모든 문서를 다 고치지 않는다.  
최소한 아래 둘 중 하나는 꼭 갱신한다.

1. 해당 트랙의 `00_status.md`
2. 해당 트랙의 `90_todo.md`

즉, 미완성 상태라도 **다음 사람이 바로 이어받을 수 있는 최소 문맥**은 남겨야 한다.

또한 trial and error를 전부 장문으로 기록하지 않는다.  
문서에는 `무엇이 바뀌었는가`, `무엇이 반증되었는가`, `다음에 뭘 하면 되는가`만 요약한다.

### 업데이트 우선순위

전환점이 발생했을 때는 아래 순서를 따른다.

1. `90_todo.md`
2. `00_status.md`
3. 필요 시 `10/20/30/40` 세부 문서
4. 트랙 전환이 있으면 `active-workboard.md`

이 순서를 두는 이유는, 세부 문서 정리가 덜 되어도 다음 세션이 막히지 않게 하기 위함이다.

---

## 7. 가장 짧은 버전

아무 문맥 없이 들어왔을 때는 이것만 따르면 된다.

1. [active-workboard.md](./active-workboard.md)
2. 현재 트랙의 `00_status.md`
3. 현재 트랙의 `90_todo.md`
4. 필요하면 `10_structure.md`와 관련 스크립트

이 네 단계면 대부분의 세션은 바로 시작할 수 있다.

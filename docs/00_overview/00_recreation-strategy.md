# NOM5 Faithful Recreation Strategy

- Date: 2026-04-14
- Goal: `놈5`를 가능한 한 원작과 동일한 동작으로 재현하는 독립 구동기와 분석 자산을 만든다.
- Principle: `포맷 해독`, `엔진 의미 복원`, `원본 실행 관찰`, `대체 런타임 구현`을 분리하되 서로 연결된 파이프라인으로 관리한다.

---

## 1. 최종 목표

최종 산출물은 단순 뷰어나 추출기가 아니라 다음 네 가지를 만족하는 재현 환경이다.

1. 원본 에셋을 변환 없이 읽거나 최소 변환만으로 사용할 수 있다.
2. 원본 스크립트, 맵, 모션, 폰트, 스프라이트를 같은 의미로 해석한다.
3. 원작의 게임플레이 규칙, UI 흐름, 연출, 보스 패턴을 동일하게 재생한다.
4. 현대 환경에서 실행 가능한 별도 런타임으로 정리된다.

즉 목표는 `APK 패치`가 아니라 `원작 데이터 + 원작 의미 + 현대 런타임`의 조합이다.

---

## 2. 작업 축

프로젝트는 아래 여섯 축으로 나눈다.

### A. 원본 실행 기반

- 목적: 원본 APK가 어떤 환경을 요구했고 어디서 깨지는지 기록한다.
- 산출물:
  - 인증/과금 의존 분석
  - 최소부팅 패치
  - 실기기/에뮬레이터 재현 로그
- 이유: 대체 런타임을 만들 때 “원작이 실제로 뭘 기대했는지” 검증 기준이 된다.

### B. 네이티브 엔진 구조 복원

- 목적: `libgameDSO.so` 내부 클래스, 장면, 매니저, 콜백 구조를 복원한다.
- 산출물:
  - JNI 인터페이스 맵
  - 주요 클래스/서브시스템 맵
  - 함수 의미와 상태 필드 메모
- 이유: 포맷을 알아도 엔진 의미를 모르면 재현기가 아니라 단순 디코더에 머문다.

### C. 콘텐츠 포맷 해독

- 목적: 원본 에셋 파일을 손실 없이 읽어낼 수 있게 한다.
- 우선순위:
  1. `PZX`, `ZT1`, `SCR`
  2. `N5S`, `N5M`
  3. `MPL`, `FT2`
  4. 필요 시 `PZF`, `PZD`, 기타 보조 포맷
- 이유: 런타임 구현 전에 데이터 계층이 안정돼야 한다.

### D. 엔진 의미 복원

- 목적: 파일 구조가 아니라 “이 값이 게임에서 무슨 의미인지”를 확정한다.
- 예시:
  - `SCR opcode -> scene/popup/object side effect`
  - `N5S layer/event/object field meaning`
  - `MPL motion track semantics`
  - 보스 FSM state meaning
- 이유: faithful recreation의 핵심은 바이트 배치보다 런타임 의미다.

### E. 서브시스템 재구현

- 목적: 렌더링, 입력, 오디오, 저장, 충돌, UI, 컷신 플레이어를 새 런타임에 옮긴다.
- 우선순위:
  1. 스크립트/컷신 재생기
  2. 맵/오브젝트 로더
  3. 2D 렌더러와 애니메이션
  4. 플레이어/적/보스 로직
  5. 오디오/진동/저장

### F. 통합 검증

- 목적: 실제 장면 단위로 원작과 새 런타임을 대조한다.
- 검증 단위:
  - 타이틀/메뉴
  - 컷신
  - 일반 스테이지 1개
  - 보스전 1개
  - 저장/재시작

---

## 3. 현재 진행도

### 완료에 가까운 축

- `PZX`: 현 샘플 기준 exact decode 가능
- `ZT1`: 구조 확정
- `SCR`: schema, static parser, opcode naming 대부분 확보
- `JNI / native engine map`: 큰 뼈대 확보

### 진행 중인 축

- `N5S`: 헤더와 일부 읽기 순서 확보, 내부 루프 구조 분석 중
- `SCR semantics`: talkbox/object 계열의 인자 의미를 계속 정밀화 중
- `map loading flow`: `CMap_J::LoadMap` 중심으로 구조 복원 중

### 아직 초기 단계인 축

- `N5M`
- `MPL`
- `FT2`
- 렌더링 파이프라인
- 충돌/물리
- 보스 FSM 정밀 복원

---

## 4. 권장 작업 순서

아래 순서를 현재 표준 진행 순서로 둔다.

1. `N5S`를 구조적으로 끝낸다.
2. `N5M`과 `MPL`을 연결해서 맵과 모션 데이터의 실사용 경로를 잡는다.
3. `SCR` 의미 복원을 이어서 컷신 재생기를 설계한다.
4. `PZX + MPL + SCR + N5S/N5M`를 묶어 최소 장면 재생기를 만든다.
5. 그 다음에 플레이어, 적, 보스, 충돌, 오디오를 붙인다.

이 순서를 택하는 이유는 다음과 같다.

- `PZX`와 `SCR`만으로는 “무슨 일이 일어나는지” 일부만 보인다.
- `N5S/N5M`가 풀려야 스테이지 구성과 오브젝트 배치가 살아난다.
- `MPL`가 풀려야 연출과 애니메이션이 원형에 가까워진다.

---

## 5. 세션 운영 규칙

세션은 아래 흐름으로 시작한다.

1. [workspace-map.md](./01_workspace-map.md)를 읽고 진입점 확인
2. [active-workboard.md](../90_session/active-workboard.md)를 읽고 현재 트랙 확인
3. 현재 트랙 문서와 해당 `scripts/` 하위 폴더만 열고 작업
4. 새 발견은 해당 트랙 문서에 누적
5. 세션 종료 전 `active-workboard.md`의 상태/다음 작업 갱신

즉 예전처럼 “전체 연대기 문서를 처음부터 읽는 방식” 대신, `전략 -> 현재 작업 -> 관련 트랙 문서`로 들어간다.

---

## 6. 트랙별 산출물 정의

### Track R0. Baseline

- 원본 APK 구조
- 인증/과금 환경
- 최소부팅 패치
- 실기기/에뮬레이터 로그

### Track R1. Native Engine

- class map
- JNI interface
- scene lifecycle
- manager ownership

### Track F1. Sprite / Image Formats

- `ZT1`
- `PZX`
- palette handling
- future `PZF/PZD`

### Track F2. Script System

- `sFormat.tbl`
- `.scr` parser
- opcode semantics
- talkbox/object command meaning

### Track F3. Map / Stage Formats

- `N5S`
- `N5M`
- layer/event/object layout
- stage-type-specific differences

### Track F4. Motion / Font

- `MPL`
- `FT2`

### Track E1. Replacement Runtime

- scene player
- map viewer
- script interpreter
- gameplay loop skeleton

---

## 7. 현재 권장 다음 단계

현재 프로젝트 전체 관점에서 가장 효율이 좋은 다음 단계는:

1. `N5S` 파서를 더 밀어서 land/path/event/object 경계를 안정화
2. `N5M` 초기 조사 시작
3. `SCR` talkbox/object 인자 의미를 runtime field 기준으로 계속 확정

이 세 가지가 끝나야 `최소 장면 재생기` 설계가 구체화된다.

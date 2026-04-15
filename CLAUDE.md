# CLAUDE.md — NOM5 Reversing Project Workflow Guide

이 문서는 Claude가 이 프로젝트에서 따라야 할 **워크플로우 규칙**을 정의한다.
실무 기록(진행 상황, 발견 사항, 다음 작업)은 `docs/90_session/active-workboard.md`에 있다.

---

## 세션 시작 규칙

세션이 시작되면 항상 이 순서로 읽는다.

1. `docs/90_session/active-workboard.md` — 현재 트랙, 블로커, 다음 작업 확인
2. 현재 트랙의 `docs/30_formats/<fmt>/00_status.md` — 포맷 상태와 진행 현황
3. 현재 트랙의 `docs/30_formats/<fmt>/90_todo.md` — 남은 작업 목록
4. 필요한 경우에만 세부 문서: `10_structure → 20_loader → 30_parser → 40_semantics`

사용자가 "active-workboard 읽고 작업 계속해줘"처럼 지시하면
3단계까지 읽고 바로 마지막 작업에서 이어서 시작한다.

문맥이 완전히 없는 새 세션이면 `docs/90_session/00_session-start-guide.md`도 읽는다.

---

## 문서 업데이트 규칙

### 언제 업데이트하나

작업이 완료될 때까지 기다리지 않는다. 다음 **전환점**이 오면 즉시 기록한다.

- 가설이 반증되었을 때
- 새 변형 또는 예외를 발견했을 때
- 파서/스크립트 단계가 바뀌었을 때 (예: 처음으로 EOF까지 파싱 성공)
- 로더 함수 경로를 확보했을 때
- 필드/opcode 의미가 확정되었을 때
- 다음 세션의 primary track이 바뀌었을 때

### 최소 업데이트 대상

전환점마다 최소한 아래 둘 중 하나는 갱신한다.

1. `docs/30_formats/<fmt>/90_todo.md`
2. `docs/30_formats/<fmt>/00_status.md`

### 업데이트 우선순위

1. `90_todo.md`
2. `00_status.md`
3. 필요 시 `40_semantics.md` 등 세부 문서
4. 트랙 전환이 있으면 `active-workboard.md`

### 무엇을 기록하나

trial-and-error 전 과정을 기록하지 않는다.
**무엇이 바뀌었는가 / 무엇이 반증되었는가 / 다음에 뭘 하면 되는가**만 요약한다.

---

## 세션 종료 규칙

세션 끝에 최소 하나를 갱신한다.

1. 해당 트랙의 발견 사항 문서
2. `active-workboard.md`의 Current State Summary 또는 Next Concrete Tasks

---

## 스크립트 작성 규칙

- **`python -c "..."` 인라인 실행 금지**. 일회성 trial-and-error 코드도 항상
  파일로 작성한 뒤 실행한다. 인라인 실행은 매번 사용자 승인이 필요해 작업 흐름을
  끊는다.
- 일회성 탐색·디버그 스크립트는 `scripts/scratch/` 아래에 명확한 이름으로 둔다
  (예: `scratch/probe-mpl-magic-0x40.py`). 이 디렉토리는 .gitignore되며 영구
  보존을 가정하지 않는다.
- 결정적이고 반복 사용할 분석 로직 (구조 파서·검증기·익스포터 등)은 반드시
  `scripts/formats/<fmt>/<stage>/` 또는 `scripts/engine/` 아래에 파일로 작성한다.
- 파이썬 실행은 항상 프로젝트 venv 사용:
  `.venv/Scripts/python.exe scripts/...`

---

## 문서 구조 참조

```
docs/
  00_overview/
    00_recreation-strategy.md   ← 전역 목표 (가끔 참조)
  30_formats/
    <fmt>/
      00_status.md              ← 현재 상태 (세션마다 읽음)
      10_structure.md           ← 파일 구조
      20_loader.md              ← 네이티브 로더 경로
      30_parser.md              ← 파서 상태
      40_semantics.md           ← 필드/opcode 의미
      90_todo.md                ← 남은 작업 (세션마다 읽음)
  90_session/
    active-workboard.md         ← 현재 우선순위, 블로커, 진행 요약 (세션마다 읽음)
    00_session-start-guide.md   ← 세션 시작 상세 가이드

scripts/
  formats/<fmt>/
    00_inspect/   ← raw dump / 기본 관찰
    10_probe/     ← 경계 · 분기 · 필드 탐색
    20_parse/     ← 구조 파서
    30_export/    ← JSON/IR 익스포터
```

---

## 언어 규칙

- 사용자와의 대화: 한국어
- 코드, 스크립트, 문서 내부 기술 용어: 영어 유지

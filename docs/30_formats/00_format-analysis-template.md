# NOM5 Format Analysis Template

이 템플릿은 각 포맷 문서의 `00_status.md`가 따라야 할 공통 구조다.

포맷 문서는 가능하면 아래 구조를 유지한다.

- `00_status.md`
- `10_structure-...md`
- `20_loader-...md`
- `30_parser-...md`
- `40_semantics-...md`
- 필요 시 `90_todo.md`

---

## 1. Role In Game

- 이 포맷이 게임에서 맡는 역할
- 어느 클래스/매니저가 소비하는지
- faithful recreation에서 왜 중요한지

## 2. File Set And Variants

- 샘플 파일 위치
- 변형 수
- 매직/헤더 구분
- 스테이지/씬별 차이

## 3. Loader Path

- 이 파일을 읽는 엔진 함수
- 파일명 조립 경로
- `read*()`/`skip()` 순서
- 관련 네이티브 클래스

## 4. Binary Structure

- 헤더
- 오프셋 테이블
- 섹션 구조
- 문자열/센티널/패딩

## 5. Field Semantics

- 각 필드의 실제 의미
- 값 범위
- enum 추정
- side effect 연결

## 6. Tooling

- 현재 사용하는 스크립트
- inspect / probe / parse / export 단계 구분
- 대표 실행 명령

## 7. Current Status

- 완료된 것
- 검증된 것
- 아직 가설인 것
- 지금 블로커

## 8. Next Steps

- 다음 세션에서 바로 할 수 있는 작업 3개 이내

---

## Script Naming Rule

스크립트는 포맷 폴더 아래에서 단계별 하위 폴더를 쓴다.

- `00_inspect`
- `10_probe`
- `20_parse`
- `30_export`
- 필요 시 `90_native-support`

즉 정리 축은 다음과 같다.

1. 1차 축: `포맷 폴더`
2. 2차 축: `작업 단계 번호`
3. 3차 축: `구체적 스크립트 이름`

이 혼합 방식이 `번호만 있는 평면 구조`보다 낫다. 이유는 포맷 수가 늘어도 탐색 범위가 줄어들기 때문이다.

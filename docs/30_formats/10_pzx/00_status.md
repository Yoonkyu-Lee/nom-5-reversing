# PZX Status

## 1. Role In Game

- `PZX`는 스프라이트 프레임 컨테이너다.
- 관련 클래스는 `CGxPZxMgr`, `CPzxMgr`, `CGxPZxFrame`, `CGxPZxAni`다.
- faithful recreation에서는 렌더링 재현의 기본 자산 계층이다.

## 2. File Set And Variants

- 샘플 위치: `jadx-out/nom5/resources/assets/**/*.pzx`
- 관련 보조 포맷: `ZT1`
- 현재 확인된 압축 변형:
  - `u16 literal-copy`
  - `u8 fill-run`
  - `u16 sparse-row fill`

## 3. Loader Path

- 주요 단서는 `CPzxMgr::HookUncompressImageCB`, `HookSingleImageCB`에서 확보했다.
- 디스어셈블리 보조는 `scripts/engine/`와 `scripts/formats/pzx/90_native-support/`를 같이 쓴다.

## 4. Binary Structure

- `PZX` 매직, zlib 블록, 프레임 오프셋 테이블, 16바이트 프레임 헤더 구조 확보
- `ZT1`는 `8-byte header + zlib` 확정

## 5. Field Semantics

- 스프라이트 압축 규칙은 현 샘플 기준 exact decode 가능
- boss 계열은 일부 팔레트가 아직 grayscale fallback에 의존할 수 있음

## 6. Tooling

- inspect:
  - `scripts/formats/pzx/00_inspect/inspect-zt1.py`
  - `scripts/formats/pzx/00_inspect/inspect-pzx.py`
  - `scripts/formats/pzx/00_inspect/dump-pzx-frame-prefix.py`
- probe:
  - `scripts/formats/pzx/10_probe/analyze-pzx-blocks.py`
  - `scripts/formats/pzx/10_probe/inspect-pzx-block-candidates.py`
  - `scripts/formats/pzx/10_probe/probe-pzx-token-modes.py`
  - `scripts/formats/pzx/10_probe/trace-pzx-u8-rowpair.py`
- parse/decode:
  - `scripts/formats/pzx/20_decode/decode-pzx.py`

## 7. Current Status

- 완료에 가깝다.
- 현 샘플 기준 `PZX`는 직접 블로커가 아니다.
- 남은 이슈는 팔레트 일반화다.

## 8. Next Steps

1. 팔레트 탐지를 일반화
2. `PZF/PZD`로 확장할지 결정
3. 향후 재현기 렌더러에 바로 넣을 수 있는 IR/atlas 전략 정리

## Related Docs

- [10_structure.md](./10_structure.md)
- [20_loader.md](./20_loader.md)
- [30_parser.md](./30_parser.md)
- [40_semantics.md](./40_semantics.md)
- [90_todo.md](./90_todo.md)

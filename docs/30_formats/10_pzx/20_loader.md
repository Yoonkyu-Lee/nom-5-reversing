# PZX Loader

- Status: placeholder
- Why this file exists: `PZX`도 다른 포맷과 같은 분석 슬롯을 유지하기 위해 별도 loader 문서를 둔다.

## Current Understanding

- 핵심 로더/디코드 경로는 `CPzxMgr::HookUncompressImageCB`, `HookSingleImageCB` 쪽에서 확보했다.
- 실제 세부 규칙은 현재 [10_structure.md](./10_structure.md) 안에 같이 기록돼 있다.

## What should move here later

- 파일명 조립 경로
- `CGxPZxMgr` / `CPzxMgr` ownership 관계
- zlib block 선택 경로
- frame decode 진입 함수별 분기

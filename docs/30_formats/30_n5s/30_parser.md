# N5S Parser

- Status: placeholder but active

## Current Understanding

- parser 단계가 둘로 나뉘었다.
  - top-level front-matter: exact parse 가능
  - `LoadMap` body: 아직 미완
- 현재 핵심 probe는 `scripts/formats/n5s/10_probe/probe-n5s-frontmatter.py`다.
- 이 스크립트는 `u8 + u16*5 + 5 string groups + 0x34 record table + trailing u16 table` 모델로 전 샘플을 EOF까지 소비한다.
- 반면 `scripts/formats/n5s/20_parse/parse-n5s.py`는 여전히 body 쪽 best-effort parser다.

## Current Blockers

- exact parse된 front-matter field들의 의미
- trailing `u16` table이 raw same-file offset이 아닌 이유
- `GetMapOffset(stage_id)`와 실제 skip 대상 스트림 정렬
- 그 다음 body trace 재시도
- boss variant 별도 구조

## What should move here later

- front-matter JSON export
- body field map
- section-by-section validation
- JSON/IR export plan

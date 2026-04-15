# N5S Todo

1. `header_u8`, `u16[0..3]`, marker의 top-level 의미를 정리
2. `5 string groups`의 엔진 필드 대응을 정리
3. `0x34` record table의 구조/역할을 정리
4. trailing `u16` table이 `N5M` 내부 section/block offsets인지 확인
5. `GetMapOffset(stage_id)`와 실제 `LoadMap` skip 대상 스트림(`N5M` 가설)을 재검증
6. `N5M` 초기 header/section 구조를 정리
7. 그 다음 `LoadMap` body trace를 `N5M` 기준으로 다시 맞춘다
8. `CMap_J::LoadMap` / `CMap_T::LoadMap` 차이 정리

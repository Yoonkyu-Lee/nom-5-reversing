# N5S Loader

- Status: placeholder but active

## Current Understanding

- 핵심 소비 경로는 `CMap_J::LoadMap`, `CMap_T::LoadMap`이다.
- `BufReader`와 `readUint8/readInt16/readUint16/skip` 순서는 이미 일부 확보됐다.
- 전환점 1:
  - `CMap_J::LoadMap`는 `skip(96)`을 쓰지 않는다.
  - 실제 호출 순서는 `CInputStream::CInputStream(buf) -> CMapMgr::GetMapOffset(stage_id) -> skip(offset)`이다.
  - `CMapMgr::GetMapOffset(stage_id)`는 `this+0x20`의 table에서 `stage_id * 4` 인덱스로 값을 꺼내는 8-byte accessor다.
- 추가로 확인된 점:
  - `CMapMgr_J::Init`는 `StringBuffer`로 `map/stage_` + `stage_id` + `.n5s` 경로를 만들고 `GsLoadResource()`로 같은 `N5S` 리소스를 읽는다.
  - 같은 front-matter에서 `5개 counted string groups`, `0x34 record table`, trailing `u16` table을 읽는 큰 흐름이 보인다.
  - table 초기화 자체는 여전히 `u8 count -> alloc(count * 4) -> readUint16() * count` 순서가 맞다.
- 하지만 새 반증도 있다:
  - exact front-matter parser로 뽑은 trailing `u16` 값들은 원본 `.n5s` 파일 크기를 넘는 경우가 많다.
  - 따라서 이 table을 곧바로 `same-file raw body offset`이라고 해석하는 것은 현재 보류해야 한다.
- 현재 더 강한 정황:
  - `compare-n5s-tail-to-n5m.py` 기준으로 `21/21` 샘플 모두에서 `tail_max < sibling stage_X_m.n5m size`가 성립한다.
  - 즉 이 table은 `N5S`보다 `N5M` 쪽과 연결될 가능성이 높다.
  - `inspect-n5m.py` 기준으로 `stage_0.n5s`의 trailing offsets는 실제로 `stage_0_m.n5m` 안의 반복 블록 시작점 hexdump와 맞는다.
- 새 전환점:
  - `CMapMgr_J::InitMap`와 `CMapMgr_T::InitMap`는 둘 다 `map/stage_` + `'_m'` + `.n5m` 경로를 조립해 `this+0x34`에 리소스를 로드한다.
  - 이후 `CMap_J` / `CMap_T` constructor는 그 포인터를 그대로 `LoadMap(stage_id, resource_ptr)` 인자로 넘긴다.
  - 즉 `LoadMap`가 실제로 읽는 스트림은 현재 `N5S`보다 `N5M`일 가능성이 훨씬 높다.
- 현재 세부 구조는 [10_structure.md](./10_structure.md)에 정리했다.

## What should move here later

- `CMap_J::LoadMap` 단계별 read sequence
- `CMap_T::LoadMap`와의 차이
- stage variant 분기 조건
- `GetMapOffset` table이 실제로 어느 스트림/섹션을 가리키는지
- layer/event/object 생성 경로

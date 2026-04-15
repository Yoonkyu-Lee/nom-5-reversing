# N5M Loader

## Current Understanding

- `CMapMgr_J::InitMap`와 `CMapMgr_T::InitMap`는 둘 다 `map/stage_<id>_m.n5m`를 로드한다.
- 로드된 리소스 포인터는 `this+0x34`에 저장된다.
- 이후 각 map object constructor는 이 포인터를 그대로 `LoadMap(stage_id, resource_ptr)`로 넘긴다.

즉 현재 가장 강한 해석은:

- `N5S`: top-level stage metadata + sibling `N5M` offsets
- `N5M`: `LoadMap`가 실제로 읽는 본문 스트림

## Call Path

`CMapMgr_J::InitMap`

1. `map/stage_` path 조립
2. `'_m'`
3. `.n5m`
4. `GsLoadResource()`
5. `this+0x34 = resource_ptr`
6. `CMap_J(...)` constructor
7. constructor 내부에서 `CMap_J::LoadMap(stage_id, resource_ptr)`

`CMapMgr_T::InitMap`도 같은 패턴이다.

## Remaining Questions

1. `LoadMap`의 `skip(GetMapOffset(stage_id))`가 `N5M` 파일 내부 어디를 기준으로 하는가
2. `GetMapOffset` table은 `N5M` 전체 section offset인가, 특정 chunk selector인가

# N5S Status

## 1. Role In Game

- `N5S`는 스테이지 정의와 레이어/경로/이벤트/오브젝트 배치를 담는 핵심 맵 포맷이다.
- 주요 소비 경로는 `CMap_J::LoadMap`, `CMap_T::LoadMap`이다.
- faithful recreation에서는 실제 플레이 가능한 stage reconstruction의 핵심이다.

## 2. File Set And Variants

- 샘플 위치: `jadx-out/nom5/resources/assets/map/*.n5s`
- 현재 확인된 변형:
  - normal marker `0xfffe`
  - boss marker `0xffff`

## 3. Loader Path

- `BufReader` 기반으로 `readUint8/readInt16/readUint16/skip` 순서를 복원 중
- `CMap_J::LoadMap`이 현재 주 분석 대상이다
- 새 전환점: `skip(96)` 고정 가설은 폐기됐다.
- 실제 런타임은 `CMapMgr::GetMapOffset(stage_id)`가 돌려준 값을 `skip(int)`에 넘긴다.
- 추가 전환점: `GetMapOffset` table은 별도 파일이 아니라, `CMapMgr_J::Init`가 `map/stage_<id>.n5s`를 직접 열어 그 front-matter에서 읽는 `u16` offset table이다.

## 4. Binary Structure

- 가장 큰 전환점:
  - `N5S`는 느슨한 header/string blob이 아니라, `CMapMgr_J::Init`가 읽는 exact front-matter 구조를 가진다.
  - 현재 강한 모델은 `u8 + u16*5 + 5 counted string groups + counted 0x34 record table + counted trailing u16 table`이다.
- 이 구조는 `probe-n5s-frontmatter.py`로 전 샘플에서 EOF까지 정확히 소비된다.
- 따라서 예전의 `normal=96`, `boss=106` 같은 body-start 중심 해석은 이제 보조 관찰값일 뿐이다.

## 5. Field Semantics

- string group 카운트/고정 10-byte 문자열 규칙은 확정
- `0x34` record의 내부 의미와 trailing `u16` table의 의미는 아직 미정
- 특히 trailing `u16` 값들은 원본 `.n5s` 파일 크기를 넘는 경우가 많아, 예전의 `same-file body offset` 해석은 현재 보류 상태다
- 대신 `21/21` 샘플에서 trailing `u16` 최대값이 sibling `stage_X_m.n5m` 크기 안에 들어가고, `stage_0` 기준으로는 실제 반복 블록 시작점 hexdump와도 맞아 떨어진다
- 따라서 현재 strongest interpretation은 `trailing u16 table = sibling N5M 내부 section/block offsets`다

## 6. Tooling

- inspect:
  - `scripts/formats/n5s/00_inspect/inspect-n5s.py`
- probe:
  - `scripts/formats/n5s/10_probe/probe-n5s-frontmatter.py`
  - `scripts/formats/n5s/10_probe/probe-n5s-offsets.py`
  - `scripts/formats/n5s/10_probe/scan-n5s-header-end.py`
  - `scripts/formats/n5s/10_probe/trace-n5s-parse.py`
- parse:
  - `scripts/formats/n5s/20_parse/parse-n5s.py`

## 7. Current Status

- 가장 중요한 현재 포맷 트랙이다
- parser 단계가 바뀌었다:
  - 이전: heuristic body-start 추정
  - 현재: exact front-matter parse 완료
- direct file read 기준 `tile_w`, `tile_h` 뒤에 오는 플래그 `7개` 자체는 여전히 `LoadMap` 분석의 강한 결론이다
- 현 블로커:
  - front-matter `header_u8/u16[0..3]` 의미
  - `0x34` record table 의미
  - trailing `u16` table의 실제 역할 (`N5M` 내부 section/block offsets 가능성 매우 높음)
  - `GetMapOffset(stage_id)`와 `LoadMap` 대상 스트림의 정확한 대응
  - 그 다음에야 body trace(`tile_w/tile_h/7 flags/...`)를 다시 안정화할 수 있음

## 8. Next Steps

1. `probe-n5s-frontmatter.py` 기준으로 top-level field 의미를 문서화
2. trailing `u16` table이 왜 file size를 넘는지 해명
3. `GetMapOffset(stage_id)`와 실제 `LoadMap` skip 대상 관계를 재검증
4. 그 다음 첫 정상 stage 하나를 끝까지 맞추는 body trace 작성
5. `CMap_J::LoadMap`와 `CMap_T::LoadMap` 차이 정리

## Related Docs

- [10_structure.md](./10_structure.md)
- [20_loader.md](./20_loader.md)
- [30_parser.md](./30_parser.md)
- [40_semantics.md](./40_semantics.md)
- [90_todo.md](./90_todo.md)

# N5S Structure

## Current Structural Model

`N5S`는 현재 기준으로 `map body + 앞쪽 문자열 테이블` 정도가 아니라, `CMapMgr_J::Init`가 먼저 읽는 **front-matter**와 그 뒤의 추가 데이터로 보는 편이 맞다.

현재 가장 강한 구조는 아래와 같다.

```text
+0x00  u8    header_u8
+0x01  u16   header_u16[0]
+0x03  u16   header_u16[1]
+0x05  u16   header_u16[2]
+0x07  u16   header_u16[3]
+0x09  u16   marker        ; 0xfffe normal / 0xffff boss
+0x0b  u8    group0_count
       char  group0[group0_count][10]
       u8    group1_count
       char  group1[group1_count][10]
       u8    group2_count
       char  group2[group2_count][10]
       u8    group3_count
       char  group3[group3_count][10]
       u8    group4_count
       char  group4[group4_count][10]
       u8    record_count
       record[record_count]  ; 0x34 bytes each
       u8    tail_count
       u16   tail_u16[tail_count]
EOF
```

이 구조는 [probe-n5s-frontmatter.py](../../../scripts/formats/n5s/10_probe/probe-n5s-frontmatter.py)로 전 샘플 파일에서 EOF까지 정확히 소비된다.

## Header Fields

초기 11바이트는 현재 이렇게 읽힌다.

- `u8`
- `u16 * 5`
- 그 다섯 번째 `u16`가 observed marker다

대표 예시:

- `stage_0.n5s`
  - `lead_u8 = 0x04`
  - `header_u16 = [0x0008, 0x0000, 0x0064, 0x0000, 0xfffe]`
- `stage_9.n5s`
  - `lead_u8 = 0x04`
  - `header_u16 = [0x0009, 0x000a, 0x0014, 0x001e, 0xffff]`

현재 의미가 확정된 것은 `marker`뿐이다. 나머지 4개 `u16`는 아직 의미 미상이다.

## String Groups

`CMapMgr_J::Init`는 고정 길이 `10` 바이트 문자열을 `5개 그룹`으로 나눠 읽는다.

각 그룹은:

- `u8 count`
- `count * readString(buf, 10)`

형태다.

샘플 분포:

- normal 계열의 전형적 패턴:
  - `[2, 2, 3, 0, 1]`
  - `[2, 5, 0, 1, 0]`
  - `[1, 3, 3, 0, 1]`
- boss 계열의 전형적 패턴:
  - `[2, 6, 0, 1, 0]`
  - `[2, 4, 1, 1, 1]`

대표 예시 `stage_0.n5s`:

- `G0 = ['map_0_back', 'map_0']`
- `G1 = ['item', 'capsule']`
- `G2 = ['ok_key_rot', 'wall_rot', 'mon_0_rot']`
- `G3 = []`
- `G4 = ['nom_0_rot']`

즉 예전처럼 “0x0c부터 느슨한 string blob”으로 보는 것보다, **counted fixed-string groups**로 보는 편이 정확하다.

## Fixed Record Table

다섯 번째 문자열 그룹 뒤에는 `u8 record_count`가 오고, 그 뒤로 `record_count`개의 고정 길이 레코드가 붙는다.

레코드 크기:

- `0x34` bytes
- 내부 구조:
  - `u8 * 16`
  - `u16 * 18`

즉 한 레코드는 정확히 `16 + 36 = 52 (0x34)` 바이트다.

샘플 분포:

- `stage_0`: `26`
- `stage_1`: `25`
- `stage_10`: `23`
- `stage_12`: `29`
- `stage_26_s`: `31`

**확인됨**: 이 레코드 테이블은 `CMapMgr_J::Init`가 읽는 per-stage `tagSObjectInfo` 테이블이다.
`record[f3]` = N5M의 object field `f3`에 해당하는 `tagSObjectInfo` 항목.
`GetObjectInfo(f3)` = 단순 벡터 인덱스; `FindObjectInfo(eMonType)` = u8[12]로 선형 탐색.
자세한 필드 매핑은 [40_semantics.md](./40_semantics.md)를 참조.

## Trailing U16 Table

레코드 테이블 뒤에는:

- `u8 tail_count`
- `u16 * tail_count`

가 온다.

대표 예시 `stage_0.n5s`:

- `tail_count = 7`
- `tail_u16 = [0x0000, 0x040c, 0x08a9, 0x0cea, 0x112a, 0x15dd, 0x1a16]`

중요한 점:

- 이 값들은 **원본 `.n5s` 파일 크기보다 크다**
- 따라서 이 tail table을 곧바로 “same-file raw body offset table”이라고 단정하면 안 된다
- 반대로 `compare-n5s-tail-to-n5m.py` 기준으로는 `21/21` 샘플 모두에서 `tail_max < sibling stage_X_m.n5m size`가 성립한다

즉, 현재 더 강한 가설은:

- trailing `u16` table은 `N5S` 본문이 아니라 **짝이 되는 `stage_X_m.n5m` 쪽 오프셋/인덱스**와 관련돼 있다

이고, 이전의 `GetMapOffset(stage_id) = raw .n5s body offset` 가설은 현재 **보류** 상태다.

## Variants

현재 샘플 기준으로 marker 기반 두 변형이 있다.

- normal: `0xfffe`
- boss: `0xffff`

하지만 front-matter의 **큰 뼈대 자체**는 두 변형 모두에서 유지된다.

차이는 현재 이 정도가 보인다.

- 문자열 그룹 카운트 패턴이 다름
- `record_count` 분포가 다름
- trailing table 길이 분포가 다름

## What This Replaces

아래 해석은 현재 더 이상 주 해석이 아니다.

- `96/106`을 구조 상수처럼 보는 해석
- `0x60 근처부터 바로 tile_w/tile_h/body`라고 보는 해석
- `tail_u16`를 바로 raw file body offset으로 읽는 해석

이 값들은 일부 샘플에서 그럴듯하게 보였지만, exact front-matter parse를 돌려 보면 일반 규칙으로 유지되지 않는다.

## Next Structural Questions

1. `header_u8`와 앞쪽 `u16[0..3]`의 의미는 무엇인가
2. `0x34` 레코드는 어떤 엔진 객체를 나타내는가
3. trailing `tail_u16`는 정확히 무엇의 오프셋/인덱스인가
4. `CMap_J::LoadMap`가 실제로 skip하는 대상 스트림은 무엇인가

# NOM5 에셋 포맷 리버싱 현황

- 작성일: 2026-04-14
- 이전 문서: `../20_native-engine/native-engine-analysis.md`

## 현재 상태 요약

### 완료

- `ZT1` 포맷: 8바이트 헤더 + zlib 구조 확인 완료
- `PZX` 컨테이너: zlib 블록 탐지, 프레임 블록 판별, 프레임 오프셋 테이블 구조 확인
- `PZX` 프레임 헤더: **16바이트 구조 확인 완료**
- `PZX` 픽셀 압축: **현재 샘플 8개 전부 exact decode 완료**
- `decode-pzx.py`: 세 가지 압축 변형을 자동 선택해서 PNG 추출 가능

### 현재 블로커

- `PZX` 자체에는 현재 기준 **직접적인 블로커가 없음**
- 남은 이슈는:
  - 팔레트 탐지 일반화
  - `.scr`, `.n5s`, `.n5m`, `.mpl` 등 다음 포맷으로 확장

## 관련 스크립트

- `scripts/formats/pzx/00_inspect/inspect-zt1.py`
- `scripts/formats/pzx/10_probe/analyze-pzx-blocks.py`
- `scripts/formats/pzx/20_decode/decode-pzx.py`
- `scripts/formats/pzx/10_probe/probe-pzx-token-modes.py`
- `scripts/formats/pzx/10_probe/inspect-pzx-block-candidates.py`
- `scripts/formats/pzx/00_inspect/dump-pzx-frame-prefix.py`
- `scripts/engine/disasm-one-symbol.py`
- `scripts/formats/scr/00_inspect/inspect-scr.py`

모든 파이썬 실행은 워크스페이스 가상환경 기준:

```powershell
.\.venv\Scripts\python.exe <script>
```

## ZT1 포맷 (완료)

구조:

```text
[0..3]  u32: file_size
[4..7]  u32: uncompressed_size
[8..]   zlib stream
```

## PZX 파일 수준 구조

```text
[0..3]   magic = "PZX\x01"
[4..7]   u32 field_a
[8..11]  u32 field_b
[12..15] u32 field_c
[16..]   body (multiple zlib blocks)
```

경험적으로:

- 여러 개의 zlib 블록이 들어있음
- 그중 하나는 프레임 블록
- 일부 파일은 별도 팔레트 블록을 가짐

## 프레임 블록 구조

압축 해제된 프레임 블록:

```text
[0..N-1]   u32 offset_table
[N..]      frame blobs
```

규칙:

- `entry[0] == offset_table byte size`
- `entry_count = entry[0] / 4`
- 실제 프레임 수 = `entry_count - 1`
- `entry[i]`는 각 프레임 시작 오프셋

`figure_icon.pzx` 예시:

- frame block zlib offset: `455`
- decompressed size: `40331`
- offset table bytes: `244`
- entry count: `61`
- frame count: `60`

## 프레임 헤더 구조

현재 확정된 프레임 헤더:

```text
[0..1]    u16 width
[2..3]    u16 height
[4..5]    u16 comp_type
[6..7]    u16 marker
[8..11]   u32 compressed_stream_size
[12..15]  u32 reserved
[16..]    token stream
```

중요한 관찰:

- `frame_size - 16 == compressed_stream_size`
- 예전에 불명확했던 "픽셀 데이터 앞 6~10바이트"는 실제로 프레임 헤더 일부였음
- 실제 토큰 스트림 시작점은 `frame_start + 16`

## Variant A: 16비트 literal-copy 토큰 스트림

디스어셈블리 근거:

- 함수: `CPzxMgr::HookUncompressImageCB`
- `0x8xxx` 분기에서 `tok & 0x7fff` 길이만큼 `r4 + 2` 이후 바이트를 출력 버퍼로 복사
- 즉 `0x8xxx`는 repeat-fill이 아니라 **literal copy**

규칙:

| 토큰 값 | 의미 |
|---|---|
| `0xffff` | 종료 |
| `0xfffe` | separator / no-op |
| `0x8000..0xfffd` | literal copy, 길이 = `tok & 0x7fff` |
| `0x0000..0x7fff` | transparent skip |

이 변형이 exact decode되는 파일:

- `figure_icon.pzx`
- `boss/b_greedking_etc.pzx`
- `boss/b_p_meteor.pzx`

## Variant B: 8비트 fill-run 토큰 스트림

디스어셈블리 근거:

- 함수: `CPzxMgr::HookSingleImageCB` 내부 특수 경로
- 바이트 단위 토큰 사용
- high bit set 시 `tok & 0x7f` 길이만큼 **다음 1바이트 값을 반복**

규칙:

| 토큰 값 | 의미 |
|---|---|
| `0xff` | 종료 |
| `0xfe` | separator |
| `0x80..0xfd` | repeat next byte N times |
| `0x00..0x7f` | transparent skip |

이 변형이 exact decode되는 파일:

- `boss/b_greedking_nom.pzx`
- `boss/b_greedking_non.pzx`
- `boss/b_greedking_boss.pzx`

## Variant C: 16비트 sparse-row fill 토큰 스트림

이 변형이 원래 남아 있던 블로커였다.

초기 증상:

- `u16` literal-copy 규칙으로는 overshoot
- `u8` 규칙으로는 너무 일찍 종료
- `u8 row-pair` 가설로는 거의 맞지만 1~4픽셀씩 차이가 남음

핵심 바이트 패턴:

```text
06 00 09 80 03 08 00 07 80 03 ...
13 00 01 80 07 04 00 01 80 07 ...
1c 00 05 80 01 fe ff 18 00 09 80 01 ...
```

이 패턴은 다음처럼 읽는 것이 맞았다.

- `u16 LE skip`
- `u16 LE fill_token`
- `1 byte value`
- row 끝은 `0xfffe`

즉 `06 00 09 80 03`는:

- skip 6
- fill 9
- value 0x03

로 해석되며, row 합이 정확히 width에 맞아떨어진다.

규칙:

| 토큰 값 | 의미 |
|---|---|
| `0xffff` | 종료 |
| `0xfffe` | row separator |
| `0x8000..0xfffd` | repeat next byte N times |
| `0x0000..0x7fff` | transparent skip |

이 변형이 exact decode되는 파일:

- `boss/b_greedking_back.pzx`
- `boss/b_greedking_itemship.pzx`
- `boss/b_p_boss.pzx`

## PNG 추출 상태

동작 스크립트:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\pzx\20_decode\decode-pzx.py .\jadx-out\nom5\resources\assets\figure_icon.pzx
```

전체 PZX 일괄 추출:

```powershell
.\.venv\Scripts\python.exe .\scripts\formats\pzx\20_decode\decode-pzx.py --all 8
```

현재 exact 추출 성공 확인:

- `figure_icon.pzx`
- `boss/b_greedking_back.pzx`
- `boss/b_greedking_boss.pzx`
- `boss/b_greedking_etc.pzx`
- `boss/b_greedking_itemship.pzx`
- `boss/b_greedking_nom.pzx`
- `boss/b_greedking_non.pzx`
- `boss/b_p_boss.pzx`
- `boss/b_p_meteor.pzx`

출력 위치:

- `out/pzx/...`

현재 boss 출력 폴더:

- `out/pzx/boss/b_greedking_back`
- `out/pzx/boss/b_greedking_boss`
- `out/pzx/boss/b_greedking_etc`
- `out/pzx/boss/b_greedking_itemship`
- `out/pzx/boss/b_greedking_nom`
- `out/pzx/boss/b_greedking_non`
- `out/pzx/boss/b_p_boss`
- `out/pzx/boss/b_p_meteor`

## 팔레트

현재 구현:

- 길이 `1020`의 zlib 블록을 팔레트 후보로 취급
- `1020 = 255 * 4`
- PNG 저장 시 `index 0 = transparent black`를 암묵적으로 추가

이 부분은 `figure_icon.pzx`에서 동작 확인됨.

boss 계열 다수는 별도 팔레트를 아직 찾지 못해 현재는 fallback grayscale로 출력된다.

## 현재 가장 중요한 결론

PZX는 이제 "픽셀 압축 미해독" 상태가 아니다.

현재 상태는 다음처럼 정리하는 것이 정확하다.

1. `ZT1` 완전 해독 완료
2. `PZX` 프레임 헤더 구조 확정
3. `PZX` 픽셀 압축 3변형 exact decode 완료
4. 현재 샘플 PZX 전체 PNG 추출 가능

즉, 원래 블로커였던 `HookUncompressImageCB` / `HookSingleImageCB` 관련 픽셀 압축 문제는 현재 기준으로 해소됐다.

## 다음 단계

1. `PZX` 팔레트 탐지를 파일군 전체로 일반화
2. `.scr` 포맷 정리
3. `.n5s`, `.n5m`, `.mpl` 순으로 확장

# NOM5 Workspace Map

- Start here for new sessions.
- Strategy: [00_recreation-strategy.md](./00_recreation-strategy.md)
- Session start guide: [00_session-start-guide.md](../90_session/00_session-start-guide.md)
- Current workboard: [active-workboard.md](../90_session/active-workboard.md)

---

## Docs

### `docs/10_runtime-baseline`

원본 APK와 최소부팅 패치, 실행 실험을 다룬다.

- [nom5-app-structure.md](../10_runtime-baseline/nom5-app-structure.md)
- [original-apk-execution-plan.md](../10_runtime-baseline/original-apk-execution-plan.md)
- [runtime-test-log.md](../10_runtime-baseline/runtime-test-log.md)
- [minimal-boot-patch-plan.md](../10_runtime-baseline/minimal-boot-patch-plan.md)
- [java-patch-points.md](../10_runtime-baseline/java-patch-points.md)
- [minboot-patch-implementation.md](../10_runtime-baseline/minboot-patch-implementation.md)

### `docs/20_native-engine`

`libgameDSO.so` 클래스/함수/JNI 구조를 다룬다.

- [native-engine-analysis.md](../20_native-engine/native-engine-analysis.md)

### `docs/30_formats`

포맷 역공학 자료를 다룬다.

- [README.md](../30_formats/README.md)
- [10_pzx/00_status.md](../30_formats/10_pzx/00_status.md)
- [20_scr/00_status.md](../30_formats/20_scr/00_status.md)
- [30_n5s/00_status.md](../30_formats/30_n5s/00_status.md)
- [40_n5m/00_status.md](../30_formats/40_n5m/00_status.md)
- [50_mpl/00_status.md](../30_formats/50_mpl/00_status.md)
- [60_ft2/00_status.md](../30_formats/60_ft2/00_status.md)

### `docs/90_session`

현재 트랙, 다음 작업, 세션 종료 전 갱신할 내용을 둔다.

- [active-workboard.md](../90_session/active-workboard.md)

---

## Scripts

### `scripts/build`

- APK 재빌드 등 보조 빌드 스크립트

### `scripts/engine`

- ELF 심볼, 문자열, 디스어셈블리 보조 도구

### `scripts/formats/pzx`

- `ZT1` / `PZX` 스크립트
- 진입점: `scripts/formats/pzx/README.md`

### `scripts/formats/scr`

- `SCR` 스크립트
- 진입점: `scripts/formats/scr/README.md`

### `scripts/formats/n5s`

- `N5S` 스크립트
- 진입점: `scripts/formats/n5s/README.md`

---

## Session Entry Rule

1. 전략 문서 확인
2. workboard 확인
3. 현재 트랙 폴더만 집중
4. 새 발견은 해당 트랙 문서에 누적

이 구조의 목적은 연대기 전체를 다시 읽지 않고도 바로 현재 작업에 들어가기 위함이다.

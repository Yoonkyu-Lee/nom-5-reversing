# NOM5 Runtime Test Log

이 문서는 실제 실행 실험 결과를 누적 기록하는 문서다.

관련 문서:

- [nom5-app-structure.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/nom5-app-structure.md:1)
- [original-apk-execution-plan.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/original-apk-execution-plan.md:1)

## Test 001

- 날짜: 2026-04-13
- 환경: Android Emulator
- 기기 프로필: `Nexus_One`
- Android 버전: `API 19 / Android 4.4 / Google APIs Intel x86 Atom System Image`
- ABI: `x86`
- 설치 조합:
  - `놈5(com.gamevil.nom5.lgu)(100).apk`
  - `lgt-arm기능.apk`
- 비행기모드: 미적용
- 로그 파일:
  - [logs/nom5-first-run-logcat.txt](/d:/Engineering/nom-five-reversing/logs/nom5-first-run-logcat.txt:1)

### 결과 요약

- 두 APK 모두 설치 성공
- `놈5` 액티비티 실행 명령은 정상 진입
- 하지만 앱은 시작 직후 크래시
- 인증/과금 단계까지 가지 못함

### 핵심 로그

대표 에러:

```text
java.lang.UnsatisfiedLinkError: Couldn't load gameDSO ...
findLibrary returned null
```

로그 근거:

- `W/dalvikvm: Exception Ljava/lang/UnsatisfiedLinkError; thrown while initializing Lcom/gamevil/nexus2/NexusGLActivity;`
- `E/AndroidRuntime: java.lang.UnsatisfiedLinkError: Couldn't load gameDSO ... nativeLibraryDirectories=[/data/app-lib/com.gamevil.nom5.lgu-1, /vendor/lib, /system/lib]: findLibrary returned null`

### 해석

이 실험은 **인증 실패 실험이 아니었다.**

실패 지점은 더 앞이다.

- `NexusGLActivity`는 static block에서 `System.loadLibrary("gameDSO")`를 호출함
- 그런데 현재 에뮬레이터는 `x86`
- APK 안의 네이티브 라이브러리는 `lib/armeabi/libgameDSO.so`
- 그 결과 설치는 되지만, 런타임에서 로더가 호환되는 네이티브 라이브러리를 찾지 못함

즉:

- 현재 x86 KitKat 에뮬레이터에서는 `놈5` 본체가 **인증 단계 이전에 ABI 문제로 중단**
- 따라서 지금 로그로는 `armPassed`, `lgt-arm`, `IBillSocket` 문제를 아직 관찰하지 못함

### 의미

이 실험으로 확인된 사실:

1. `API 19` 자체는 좋은 선택이었다
2. 하지만 `x86 system image`는 이 APK의 `armeabi` 네이티브 라이브러리와 직접 호환되지 않는다
3. 따라서 다음 단계는 **ARM 계열 환경 확보**가 우선이다

### 다음 액션

우선순위:

1. `API 19 ARM system image` 확보 후 ARM AVD 생성
2. 가능하면 실제 ARM 안드로이드 기기에서 재실험
3. 보조 대안으로 ARM translation/Houdini가 포함된 x86 이미지 검토

### 현재 결론

현재까지의 실행 테스트는 실패했지만, 실패 원인은 명확하다.

- 지금은 인증 우회 이전에
- **네이티브 ABI 호환 환경을 먼저 확보해야 한다**

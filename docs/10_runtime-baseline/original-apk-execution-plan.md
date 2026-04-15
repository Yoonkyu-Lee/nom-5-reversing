# NOM5 Original APK Execution Plan

현재 우선순위는 다음과 같다.

- `놈5.apk`를 가능한 한 **원본 그대로** 실행해 본다.
- `lgt-arm기능.apk`가 실제로 어떤 역할을 하는지 런타임에서 확인한다.
- 외부 서비스 재현만으로 살릴 수 있는지 먼저 본다.
- 그게 안 될 때만 최소 패치로 넘어간다.

관련 구조 문서:

- [nom5-app-structure.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/nom5-app-structure.md:1)

## 1. 현재 목표

최종 목표는 구동기 개발이지만, 지금 당장은 다음 질문에 답하는 것이 중요하다.

1. 원본 `놈5.apk`는 어떤 조건에서 어디까지 실행되는가
2. `lgt-arm기능.apk`는 실제로 `armPassed`를 살리는가
3. `IBillSocket` 같은 추가 외부 의존성이 실제 플레이를 막는가
4. 원본 APK를 유지한 채 해결 가능한가

즉 현재 단계는 “인증을 완전히 도려내기”가 아니라, **원본 앱의 실제 요구 조건을 재현해서 부팅 경계를 파악하는 단계**다.

## 2. 단계별 계획

### 2.1 1단계: 테스트 환경 확보

먼저 오래된 안드로이드 실행 환경을 하나 마련한다.

권장 우선순위:

1. 실제 구형 안드로이드 기기
2. 안드로이드 에뮬레이터
3. 그 외 호환 레이어

현재 목표가 “당시 환경 재현”에 가까우므로, **Android 4.4.x 계열**이 최우선이다.

이유:

- 업로더 제보가 `Android 4.4.2` 기준
- 본 APK는 `minSdkVersion=3` 수준의 매우 구형 앱
- 전화번호/IMEI/통신사 서비스 의존이 있어 신형 안드로이드보다 구형 쪽이 유리

### 2.2 2단계: 설치 조합 실험

아래 조합을 각각 독립적으로 실험한다.

1. `놈5.apk`만 설치
2. `놈5.apk + lgt-arm기능.apk`
3. `놈5.apk + lgt-arm기능.apk + 비행기모드 ON`

각 조합마다 반드시 기록할 항목:

- 실행 성공 여부
- 첫 팝업 문구
- 터치 입력 가능 여부
- 뒤로가기 반응
- 타이틀 진입 여부
- 실제 플레이 화면 진입 여부
- 앱 종료 시점

기록은 표 형태로 남기는 것이 좋다.

예시:

| 조합 | 첫 화면 | 오류 문구 | 터치 | 뒤로가기 | 결과 |
|---|---|---|---|---|---|
| 놈5만 | 앱 시작됨 | ARM/IAP 관련 | 안 됨 | ? | 메뉴 진입 실패 |

### 2.3 3단계: 런타임 로그 수집

실행 결과만 보면 부족하다. 반드시 로그를 같이 수집한다.

우선 키워드:

- `com.lgt.arm`
- `ARM`
- `IAP`
- `IBillSocket`
- `RemoteException`
- `bindService`
- `gamevil`
- `nom5`

목표:

- 실제 실패가 ARM 바인드인지
- IAP 서비스 부재인지
- 터치 게이트 문제인지
- 다른 예외인지

구분 가능하게 만들기

### 2.4 4단계: `lgt-arm기능.apk`의 실제 기여 확인

보조 APK가 정말 도움이 되는지 관찰한다.

확인할 것:

- `com.lgt.arm.ArmInterface` 서비스가 실제로 잡히는지
- `executeArm()` 호출 흔적이 있는지
- `verifyData` 파일이 생성되는지
- 비행기모드 ON/OFF에 따라 결과가 달라지는지

핵심 질문:

- `lgt-arm기능.apk`는 단순 성공 스텁인가
- 에뮬레이터/비정상 상태에서만 우회 경로가 열리는가

### 2.5 5단계: 원본 APK 유지 가능성 판단

다음 두 경우를 구분한다.

경우 A:

- `lgt-arm기능.apk`만으로도 상당 부분 실행 가능

이 경우 다음 목표:

- 부족한 외부 서비스만 추가 스텁으로 메우기

경우 B:

- 원본 APK가 여전히 시작 단계에서 계속 죽음

이 경우 다음 목표:

- 최소 패치 단계로 이동

## 3. 최소 패치로 넘어가는 기준

아래 중 하나면 최소 패치로 넘어간다.

1. 원본 APK가 외부 서비스 재현만으로 부팅되지 않음
2. 런타임 중 LGU 의존이 너무 많아 스텁 전략이 비효율적임
3. 터치 게이트가 계속 막혀 관찰 자체가 불가능함

최소 패치의 1차 목표는 다음 네 가지다.

- `armPassed` 강제 true
- `runArmService()` 무력화 또는 성공 처리
- `bindIAPService()` 실패 시 종료하지 않게 변경
- ARM/IAP 오류 다이얼로그 종료 경로 차단

중요:

- 이건 “최종 독립 실행화”가 아니라 **부팅 관찰용 패치**다.

## 4. 안드로이드 테스트 환경 선택지

### 4.1 선택지 A: 실제 구형 안드로이드 기기

장점:

- 전화번호/IMEI/구형 서비스 동작이 가장 현실적
- 업로더 제보와 가장 가까운 환경

단점:

- 구하기 어렵다
- 로그 수집과 반복 실험이 번거롭다

추천도:

- 최고

### 4.2 선택지 B: Android Studio 에뮬레이터

장점:

- 세팅이 표준적
- `adb`, `logcat`, 파일 푸시/풀, 스냅샷 사용 가능

단점:

- Android 4.4 계열 시스템 이미지 준비가 번거로울 수 있다
- 전화번호/IMEI/통신사 서비스 재현은 약하다

추천도:

- 높음

### 4.3 선택지 C: Genymotion 같은 서드파티 에뮬레이터

장점:

- 구형 안드로이드 이미지 확보가 쉬운 경우가 있다
- 성능이 괜찮은 편

단점:

- 기본 Google/telephony 환경이 다를 수 있다
- ARM 호환성 문제가 생길 수 있다

추천도:

- 보조 선택지

### 4.4 선택지 D: 최신 안드로이드에서 바로 시도

장점:

- 당장 손쉽다

단점:

- 권한, ABI, 구형 서비스 의존, 전화번호/IMEI 정책 때문에 실패 원인 분리가 어렵다

추천도:

- 낮음

## 5. 현재 추천 환경

가장 현실적인 추천은 다음 순서다.

1. **Windows에 Android SDK Platform Tools 설치**
2. **Android Studio 에뮬레이터나 별도 4.4.x AVD 준비**
3. 먼저 에뮬레이터에서 `놈5 + lgt-arm` 조합 실험
4. 가능하면 나중에 실제 구형 기기로 교차 검증

## 6. Windows PowerShell 기준 준비물

현재 워크스페이스 분석용 도구는 이미 있다.

- `jadx`

다음으로 필요한 것:

- `adb`
- 가능하면 Android Studio 또는 최소한 Android SDK Platform Tools

설치 후 확인 명령:

```powershell
adb version
adb devices
```

## 7. 실험 기본 명령 예시

PowerShell 기준 예시다. 실제 경로는 환경에 맞게 조정한다.

APK 설치:

```powershell
adb install ".\놈5(com.gamevil.nom5.lgu)(100).apk"
adb install ".\lgt-arm기능.apk"
```

앱 실행:

```powershell
adb shell am start -n com.gamevil.nom5.lgu/com.gamevil.nom5.lgu.Nom5Launcher
```

로그 수집:

```powershell
adb logcat > .\logs\nom5-logcat.txt
```

키워드 필터 예시:

```powershell
adb logcat | Select-String "nom5|gamevil|lgt|IAP|ARM|IBillSocket|RemoteException"
```

패키지 설치 확인:

```powershell
adb shell pm list packages | Select-String "gamevil|lgt"
```

보조 앱 서비스 존재 확인용 힌트:

```powershell
adb shell dumpsys package com.lgt.arm
```

주의:

- 아주 오래된 안드로이드에서는 `run-as`나 일부 `dumpsys` 동작이 제한될 수 있다.
- 로그를 먼저 잡아두는 것이 우선이다.

## 8. 실험 기록 규칙

매 실험마다 최소한 아래를 남긴다.

- 날짜/시간
- 기기 또는 에뮬레이터 정보
- 안드로이드 버전
- 설치 조합
- 비행기모드 상태
- 실행 결과
- 로그 파일 경로

예시 템플릿:

```text
[실험 001]
- 환경: Android 4.4.2 emulator
- 조합: 놈5 + lgt-arm
- 비행기모드: ON
- 결과: 첫 팝업 후 뒤로가기로 넘어감, 인증창 확인, 터치 일부 동작
- 로그: logs/001-logcat.txt
- 메모: com.lgt.arm bind 흔적 있음 / IBillSocket 실패 의심
```

## 9. 우리가 실제로 알고 싶은 관찰 포인트

실험하면서 특히 아래 질문에 답을 모은다.

1. `lgt-arm기능.apk` 설치 여부가 `armPassed` 체감 결과에 영향을 주는가
2. 비행기모드가 정말 필요한가, 아니면 특정 단말 상태만 맞추면 되는가
3. 오류 팝업 뒤에 실제로 게임은 어느 UI 상태까지 가는가
4. `IBillSocket`가 없으면 바로 죽는가, 아니면 특정 메뉴에서만 문제를 일으키는가
5. 플레이 중 추가 인증이 다시 등장하는가

## 10. 다음에 바로 할 일

우선순위 순서:

1. `adb`가 되는 안드로이드 테스트 환경 준비
2. `놈5.apk`, `lgt-arm기능.apk` 설치
3. 세 가지 조합 실험
4. `logcat` 수집
5. 결과를 표로 정리

## 11. 다음 문서 후보

이 문서 다음에 만들 문서는 아래 둘 중 하나가 좋다.

- `runtime-test-log.md`
  - 실제 실험 결과 기록
- `minimal-boot-patch-plan.md`
  - 최소 패치 포인트 정리

## 12. 현재 결론

지금은 패치보다 실험이 먼저다.

정확히 말하면:

- 목표는 “인증을 완전히 없애는 것”이 아니라
- 먼저 “원본 APK가 무엇을 요구하는지 실제로 확인하는 것”이다.

이 단계가 끝나야 이후 선택이 분명해진다.

- 원본 유지 + 외부 서비스 재현
- 최소 패치로 부팅
- 장기적으로 독립 실행화

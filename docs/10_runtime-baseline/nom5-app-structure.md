# NOM5 (`com.gamevil.nom5.lgu`) App Structure Notes

이 문서는 현재 워크스페이스에 있는 두 APK를 `jadx 1.5.5`로 디컴파일한 뒤 관찰한 내용을 정리한 것이다.

- 대상 APK 1: `놈5(com.gamevil.nom5.lgu)(100).apk`
- 대상 APK 2: `lgt-arm기능.apk`
- 디컴파일 출력:
  - `jadx-out/nom5`
  - `jadx-out/lgt-arm`

이 문서의 목적은 다음과 같다.

- `놈5` APK의 구조를 다른 분석자나 다른 AI에게 빠르게 전달
- 앱이 LGU+ 전용 빌드인지, 어떤 외부 의존성이 있는지 정리
- 시작 시 인증/과금/터치가 왜 꼬이는지 현재까지의 근거 정리
- 향후 패치, 에뮬레이션, 스텁 구현, 네이티브 리버싱의 출발점 제공

주의:

- 아래 내용 중 `관찰`은 코드에서 직접 확인한 사실이다.
- `추론`은 관찰을 바탕으로 한 해석이다.
- 아직 `libgameDSO.so`를 정식 디스어셈블러로 분석한 것은 아니다. 현재 네이티브 쪽은 JNI 심볼과 문자열 스캔 수준까지 진행했다.

## 1. 한 줄 요약

`놈5(com.gamevil.nom5.lgu)`는 일반 범용 안드로이드 빌드라기보다 **LG U+ 인증/과금 환경을 전제로 한 유통 빌드**로 보인다. 자바 계층은 런처, 외부 서비스 바인딩, UI 입력 브리지 역할이 크고, 실제 게임 엔진은 `lib/armeabi/libgameDSO.so`에 들어 있다.

보조 APK인 `lgt-arm기능.apk`는 이름 그대로 **LGU ARM 기능검증 서비스 앱**이며, `놈5` 본체는 이 서비스에 바인드해 인증 결과를 받아 `armPassed` 플래그를 세팅한다.

## 2. 워크스페이스 상태

현재 워크스페이스 루트에는 다음이 있다.

- `놈5(com.gamevil.nom5.lgu)(100).apk`
- `lgt-arm기능.apk`
- `jadx-1.5.5.zip`
- `jadx/`
- `jadx-out/`

`jadx`는 공식 릴리스 `v1.5.5`를 워크스페이스에 설치했다.

## 3. APK 개요

### 3.1 놈5 APK

`jar tf` 기준 주요 구성:

- `AndroidManifest.xml`
- `classes.dex`
- `lib/armeabi/libgameDSO.so`
- 대량의 `assets/`
- `res/`
- `xml/`, `xml_kt_lg/`

관찰:

- 게임 리소스가 상당히 많이 들어 있다.
- 자바 코드는 게임 로직 전부라기보다 안드로이드 셸 + 브리지 성격이 강하다.
- 실제 엔진은 네이티브 라이브러리 `libgameDSO.so`에 있다.

### 3.2 lgt-arm 기능 APK

`jar tf` 기준 주요 구성:

- `AndroidManifest.xml`
- `classes.dex`
- `lib/armeabi/libCPService.so`
- `lib/armeabi/libCPVerify.so`

관찰:

- 이 APK는 게임 리소스가 거의 없고 서비스 앱에 가깝다.
- 이름과 구조상 LGU+ ARM 검증용 도구/서비스다.

## 4. 놈5 APK 매니페스트 구조

참조: [jadx-out/nom5/resources/AndroidManifest.xml](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/AndroidManifest.xml:1>)

핵심 항목:

- 패키지명: `com.gamevil.nom5.lgu`
- 런처 액티비티: `com.gamevil.nom5.lgu.Nom5Launcher`
- 화면 방향: landscape
- `minSdkVersion=3`
- 권한:
  - `READ_PHONE_STATE`
  - `ACCESS_NETWORK_STATE`
  - `INTERNET`
  - `VIBRATE`
  - `KILL_BACKGROUND_PROCESSES`
  - `RESTART_PACKAGES`

관찰:

- 패키지명에 `lgu`가 박혀 있다.
- 전화번호와 단말 정보를 읽는 흐름이 자연스럽다.
- 오래된 안드로이드 세대용 코드다.

추론:

- 이 빌드는 통신사 유통판일 가능성이 매우 높다.

## 5. 놈5 앱의 계층 구조

현재까지 보이는 구조는 대략 다음과 같다.

1. `Nom5Launcher`
   - 앱 시작점
   - 레이아웃 구성
   - ARM/IAP 서비스 바인딩 시작

2. `com.gamevil.nexus2.*`
   - 게임빌 자체 런타임/플랫폼 계층
   - GL surface, renderer, native bridge, UI bridge, 네트워크 브리지, 사운드, 업데이트/뉴스/라이브 웹뷰

3. `com.gamevil.nom5.p001ui.*`
   - 놈5 전용 UI 컨트롤러
   - 풀터치 입력 레이어

4. `com.feelingk.iap.*`
   - 인앱결제/본인인증/주민번호 팝업/구매 다이얼로그

5. `libgameDSO.so`
   - 실제 게임 엔진
   - 렌더, 입력, 스크립트, 스테이지 로직 등

## 6. 시작 시퀀스

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java:20>)
- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:18>)

`Nom5Launcher.onCreate()`의 핵심 흐름:

1. `setContentView(R.layout.main)`
2. `NexusGLSurfaceView`와 `Nom5UIControllerView` 연결
3. `NexusGLRenderer` 설정
4. 사운드 초기화
5. UI listener를 네이티브 브리지에 등록
6. 버전 문자열 표시
7. `armPassed = this.lgUtil.runArmService("AQ00102631")`
8. `Natives.bCanConn = false`
9. `this.lgUtil.bindIAPService()`
10. 게임 해상도 400x240 세팅

중요한 점:

- `runArmService("AQ00102631")`는 **서비스 바인드 성공 여부**를 우선 `armPassed`에 넣는다.
- 실제 인증 성공/실패는 나중에 `armServiceConnection.onServiceConnected()`에서 `executeArm()` 결과로 다시 `setArmPassed()` 된다.
- 즉 앱 시작 직후부터 외부 LGU 서비스에 강하게 의존한다.

## 7. 핵심 런처 클래스

### 7.1 `Nom5Launcher`

참조: [Nom5Launcher.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java:20>)

주요 멤버:

- `private static boolean armPassed`
- `public static boolean isShownAlert`
- `private final String STR_ARM_ID = "AQ00102631"`
- `private LgUtil lgUtil = new LgUtil(this)`

주요 역할:

- 앱 시작/종료 시 외부 서비스 연결 및 해제
- 백키 이벤트를 네이티브 터치 이벤트로 변환
- GL surface와 UI 컨트롤러 연결

의미:

- `AQ00102631`는 게임 쪽 ARM/AID로 보인다.
- 앱 전체가 `armPassed` 플래그를 매우 중요하게 본다.

### 7.2 `LgUtil`

참조: [LgUtil.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:18>)

역할:

- LGU ARM 서비스 바인드
- LGU IAP 서비스 바인드
- 실패 시 다이얼로그 띄우고 종료

주요 바인드 대상:

- `com.lgt.arm.ArmInterface`
- `com.lguplus.common.bill.IBillSocket`

동작:

- ARM 서비스에 연결되면 `executeArm(strArmId)` 호출
- 결과가 `1`이면 `Nom5Launcher.setArmPassed(true)`
- 아니면 오류 다이얼로그 후 종료

중요한 관찰:

- `bindIAPService()`는 실패하면 즉시 일반 에러로 종료하도록 설계되어 있다.
- 따라서 `lgt-arm 기능.apk`만이 아니라 LGU 과금 서비스 부재도 앱 실행 경험에 영향을 줄 수 있다.

### 7.3 `Constants`

참조: [Constants.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Constants.java:16>)

역할:

- `res/raw/message.properties`를 로드해 에러 코드를 사용자 메시지로 바꿈
- 네트워크 관련 알림도 띄움

주요 상수:

- `INT_LGU_ARM_PASSED = 0`
- `INT_LGU_IAP_GENERAL_ERROR = -65536`
- `INT_LGU_IAP_NOT_INSTALLED = -100`

참조 메시지 파일:

- [jadx-out/nom5/resources/res/raw/message.properties](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/res/raw/message.properties:1>)

## 8. 터치 입력이 왜 막히는가

참조: [jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java:11>)

`UIFullTouch.onAction()` 핵심:

- 좌표를 게임 내부 좌표로 변환
- `Nom5Launcher.isArmPassed()`를 확인
- `armPassed == false`면 터치 이벤트를 네이티브 엔진에 전달하지 않음

코드 의미:

- 인증 통과 전에는 화면을 눌러도 `setTouchEvent(...)`가 호출되지 않는다.
- 업로더가 말한 “기능검증설치 안하면 터치가 안 먹어서 실행이 안 된다”는 설명과 정확히 맞는다.

추론:

- 실제 게임 진입 자체는 되더라도, 입력 게이트가 막혀 있어 UI 진행이 불가능한 상태가 된다.

## 9. 놈5 레이아웃 구조

참조: [jadx-out/nom5/resources/res/layout/main.xml](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/res/layout/main.xml:1>)

레이아웃은 큰 `FrameLayout` 위에 여러 레이어를 겹친 구조다.

주요 뷰:

- `NexusGLSurfaceView` (`@id/SurfaceView01`)
- `Nom5UIControllerView` (`@id/UIView01`)
- `UIEditText`, `UITextView`
- 로딩용 `ProgressBar`
- `UIWebView`
- 타이틀 이미지
- 버전 텍스트
- 뉴스 배너 프레임
- `GamevilLiveWebView`

의미:

- 실제 2D/3D 게임 화면은 GL surface가 담당
- 안드로이드 뷰 계층은 입력 오버레이, 팝업, 뉴스/웹뷰, 텍스트 입력용

## 10. `com.gamevil.nexus2` 런타임 계층

이 패키지는 게임빌 내부 공용 엔진/런타임으로 보인다.

주요 클래스:

- `NexusGLActivity`
- `NexusGLSurfaceView`
- `NexusGLRenderer`
- `NexusGLThread`
- `Natives`
- `NativesAsyncTask`
- `NexusSound`
- `NeoUIControllerView`
- `NeoTouchDetector`
- `NexusXmlChecker`
- `GamevilLiveWebView`
- `NewsViewTask`

### 10.1 `NexusGLActivity`

참조: [jadx-out/nom5/sources/com/gamevil/nexus2/NexusGLActivity.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/NexusGLActivity.java:20>)

중요한 사실:

- static 블록에서 `System.loadLibrary("gameDSO")`
- 즉 Java 계층의 모든 핵심 게임 호출은 `libgameDSO.so`로 넘어간다.

### 10.2 `Natives`

참조: [jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java:28>)

주요 필드:

- `public static boolean bCanConn`
- `public static IBillSocket billSock`
- `private static String strAID = "0003572B"`

주요 JNI 메서드:

- `InitializeJNIGlobalRef`
- `NativeInitDeviceInfo`
- `NativeInitWithBufferSize`
- `NativeRender`
- `NativeResize`
- `NativePauseClet`
- `NativeResumeClet`
- `NativeDestroyClet`
- `NativeResponseIAP`
- `handleCletEvent`

중요한 자바 메서드:

- `isNetAvailable()`
- `getPhoneNumber()`
- `netSocket()`
- `netBillcomSocketConnect(...)`
- `netBillcomSocketWrite(...)`
- `netBillcomSocketRead(...)`
- `close()`

의미:

- 네이티브 엔진이 자바 정적 메서드를 다시 호출하는 구조다.
- 게임 엔진이 직접 안드로이드 Java 환경의 전화번호, 네트워크 상태, LGU 과금 소켓에 접근한다.

추론:

- 게임 로직 일부는 `libgameDSO.so` 내부지만, OS 의존 동작은 `Natives`를 콜백 인터페이스처럼 사용한다.

### 10.3 `NativesAsyncTask`

참조: [jadx-out/nom5/sources/com/gamevil/nexus2/NativesAsyncTask.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/NativesAsyncTask.java:7>)

역할:

- 단순 타이머
- `sleep(timeout)` 후 `Natives.NativeAsyncTimerCallBack(timerIndex)` 호출

의미:

- 네이티브 엔진이 자바 쪽 타이머를 요청하는 방식으로 사용될 가능성이 높다.

## 11. 뉴스, 업데이트, 게임빌 라이브

### 11.1 `NexusXmlChecker`

참조: [jadx-out/nom5/sources/com/gamevil/nexus2/xml/NexusXmlChecker.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/xml/NexusXmlChecker.java:22>)

역할:

- 외부 XML을 읽어 프로필/버전/공지/뉴스를 확인
- 결과에 따라 `UPDATE`, `ALERT`, `NEWS` 동작

관찰:

- 캐리어 식별자에 `SKT`, `KTF`, `LGT`, `GLOBAL`, `IOS`가 존재
- 앱 버전과 패키지명을 프로필 XML과 대조
- XML 수정 시간 비슷한 값을 따로 확인

의미:

- 게임이 실행 중 게임빌 서버와 뉴스/업데이트 프로필을 교환하던 구조
- 이 부분은 본체 게임 플레이와는 별개의 부가기능일 가능성이 높다

### 11.2 `update_state.xml`

참조: [jadx-out/nom5/resources/res/xml/update_state.xml](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/res/xml/update_state.xml:1>)

관찰:

- `android.gamevil.com` 관련 URL 다수 존재
- 뉴스 배너와 마켓 콜백 URL 포함

추론:

- 현재는 대부분 죽은 서비스일 가능성이 높다.

## 12. 인앱결제/본인확인 계층

패키지: `com.feelingk.iap.*`

주요 구성:

- `IAPActivity`
- `IAPLib`
- `IAPLibSetting`
- `net/*`
- `gui/*`

### 12.1 `IAPLibSetting`

참조: [jadx-out/nom5/sources/com/feelingk/iap/IAPLibSetting.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/feelingk/iap/IAPLibSetting.java:6>)

매우 단순한 설정 객체:

- `AppID`
- `BP_IP`
- `BP_Port`
- `ClientListener`

### 12.2 `IAPActivity`

참조: [jadx-out/nom5/sources/com/feelingk/iap/IAPActivity.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/feelingk/iap/IAPActivity.java:34>)

관찰:

- SKT와 KT/LG 경로가 분기되어 있음
- KT/LG 쪽은 Danal 및 주민번호 기반 인증 흐름이 보임
- `PopJuminNumberAuth`를 통해 주민번호 입력 팝업 표시 가능
- 네트워크 메시지를 통해 상품정보 조회, 구매, 인증, 전체 인증, 사용 처리

의미:

- 당시 이동통신사/결제망과 연결된 구식 결제 스택이 포함되어 있다.
- 게임 실행 자체와 인앱결제는 완전히 같은 문제는 아니지만, 코드 경계는 공유한다.

### 12.3 `IBillSocket`

참조: [jadx-out/nom5/sources/com/lguplus/common/bill/IBillSocket.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/lguplus/common/bill/IBillSocket.java:10>)

AIDL 인터페이스 메서드:

- `connect(String aid, String addr, int port)`
- `writeBytes(byte[] data)`
- `readBytes(byte[] data)`
- `close()`
- `getLastErrorMsg()`

의미:

- 단순히 “구매 버튼” 수준이 아니라, 앱 외부 서비스가 실제 소켓 통신 브로커 역할을 한다.

## 13. LGU 에러 코드 메시지

참조: [jadx-out/nom5/resources/res/raw/message.properties](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/res/raw/message.properties:1>)

확인한 대표 메시지:

- `0xF0000008`: 사용권한 확인 실패, 다시 시도
- `0xF0000009`: 구매 이력 확인 안 됨
- `0xF000000A`: OZ 스토어 사용권한 미등록
- `0xF0000013`: 서비스 연결 어려움, WiFi/3G 설정 후 재시도
- `0xF0000014`: `com.lgt.arm` 다시 설치 안내
- `0xFFFF0000`: 예상치 못한 오류입니다. 다시 시도해 주세요.

의미:

- 업로더가 본 “예상치 못한 오류”는 실제 코드상 존재하는 일반 오류 메시지다.
- `com.lgt.arm` 재설치 유도 메시지가 따로 있다는 점이 중요하다.

## 14. 보조 APK `lgt-arm기능.apk` 구조

### 14.1 매니페스트

참조: [jadx-out/lgt-arm/resources/AndroidManifest.xml](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/resources/AndroidManifest.xml:1>)

구성:

- 패키지명: `com.lgt.arm`
- 액티비티: `com.lgt.arm.ArmSetting`
- 서비스: `com.lgt.arm.LgtArmService`
- 서비스 액션:
  - `com.lgt.arm.ArmInterface`
  - `com.lgt.arm.LgtArmService`

결론:

- 이 앱은 `놈5`가 찾는 ARM 서비스 구현체다.

### 14.2 `LgtArmService`

참조: [jadx-out/lgt-arm/sources/com/lgt/arm/LgtArmService.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/LgtArmService.java:12>)

핵심:

- `executeArm(String aid)`를 제공
- AID, MDN, IMEI를 확인
- `ArmSetting.nTestCase`에 따라 성공/실패 결과를 반환

중요한 흐름:

- AID 길이가 10자여야 함
- MDN이 비어 있으면 `Util.getTelNumber()`로 시도
- `verifyData` 파일이 있으면 그 값 사용
- `getResult(nCase)`가 결과 코드 리턴

핵심 의미:

- 이 앱은 “정상적인 LGU 인증 서버와 통신해서 진짜 검증한다”기보다, 내부 테스트/검증 도구 성격이 강하다.
- `nTestCase=0`이면 성공 코드 `1`을 리턴한다.

### 14.3 `ArmSetting`

참조: [jadx-out/lgt-arm/sources/com/lgt/arm/ArmSetting.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/ArmSetting.java:19>)

역할:

- 테스트 케이스를 선택해서 `verifyData` 파일에 저장
- 저장 형식: `전화번호|테스트케이스`

테스트 옵션:

- `"1"`
- `"0xF0000008"`
- `"0xF0000009"`
- `"0xF000000A"`
- `"0xF000000E"`
- `"0xF00000011"`
- `"0xF00000012"`
- `"0xF00000013"`
- `"0xF00000014"`

의미:

- 이 APK는 원래부터 ARM 오류 상황을 재현하는 테스트 도구 성격이 있다.

### 14.4 `Util`

참조: [jadx-out/lgt-arm/sources/com/lgt/arm/Util.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/Util.java:13>)

기능:

- 내부 파일 입출력
- 전화번호, IMEI 읽기
- `getEmul()`로 에뮬레이터 여부 비슷한 판단

`verifyData` 관련:

- `writeOpenFile()`는 Base64 인코딩 후 저장
- `readOpenFile()`는 Base64 디코딩 후 읽기

중요한 관찰:

- `getEmul()`은 디컴파일 결과가 약간 흐트러져 있지만, 전화번호나 IMEI가 비정상이면 에뮬레이터로 간주하는 의도가 보인다.
- `LgtArmService.getInitData()`는 `bEmul == false`면 `verify.MDN`을 비운다.

추론:

- 업로더가 말한 “비행기 모드”는 실제 단말 상태를 비정상으로 만들어 `verifyData`에 저장된 테스트 값이 쓰이게끔 유도하는 우회 조건일 가능성이 높다.

### 14.5 `ResultArm`

참조: [jadx-out/lgt-arm/sources/com/lgt/arm/ResultArm.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/ResultArm.java:4>)

대표 상수:

- `ARM_SUCCESS = 1`
- `NETWORK_OPEN_FAIL = -268435437`
- `AID_OBTAIN_FAIL = -268435438`
- `MDN_OBTAIN_FAIL = -268435439`
- `CLICENSE_DENY = -268435448`

의미:

- `놈5` 쪽 에러 메시지 테이블과 잘 대응된다.

## 15. 업로더의 실행 팁을 코드로 해석하면

업로더 요약:

- 안드로이드 4.4.2에서 구동
- `lgt-arm 기능` 설치 필요
- 비행기모드 ON 필요
- 실행 시 “예상치 못한 오류”가 뜰 수 있음
- 뒤로가기로 스킵 가능
- 뒤이어 인증창에서 인증 누르면 진행

현재 해석:

### 15.1 왜 `lgt-arm 기능.apk`가 필요한가

관찰:

- `놈5`는 시작 시 `com.lgt.arm.ArmInterface`에 바인드한다.
- 이 서비스가 없으면 ARM 관련 에러가 날 가능성이 높다.
- 터치 입력도 `armPassed`에 묶여 있다.

결론:

- `lgt-arm 기능.apk`는 사실상 인증 스텁/테스트 서비스다.

### 15.2 왜 비행기모드가 필요하다고 했는가

관찰:

- `LgtArmService`는 전화번호/IMEI/에뮬레이터 판정을 사용한다.
- `verifyData` 경로는 에뮬레이터 혹은 비정상 단말 상태에서 더 쉽게 사용될 가능성이 있다.

추론:

- 비행기모드로 실제 네트워크/통신 상태를 꼬아, 테스트용 성공 경로로 들어가게 만든 것으로 보인다.

### 15.3 왜 “예상치 못한 오류”가 뜨는가

관찰:

- `0xFFFF0000` 메시지가 정확히 존재한다.
- `LgUtil.bindIAPService()` 실패 시 일반 에러로 종료한다.
- ARM 외에도 LGU 과금 서비스 부재가 별도 문제를 만들 수 있다.

추론:

- 업로더가 본 오류는 ARM만의 문제일 수도 있고, IAP 서비스 바인드나 다른 일반 예외일 수도 있다.
- 다만 앱이 완전히 죽지 않고 뒤로가기로 넘길 수 있었다는 진술은, 다이얼로그/상태 전이가 복합적으로 꼬인 결과일 수 있다.

## 16. 네이티브 라이브러리 `libgameDSO.so`

현재는 문자열/심볼 스캔만 했다.

### 16.1 JNI 심볼

문자열 스캔에서 확인한 JNI 엔트리:

- `JNI_OnLoad`
- `Java_com_gamevil_nexus2_Natives_InitializeJNIGlobalRef`
- `Java_com_gamevil_nexus2_Natives_NativeInitDeviceInfo`
- `Java_com_gamevil_nexus2_Natives_NativeInitWithBufferSize`
- `Java_com_gamevil_nexus2_Natives_NativeRender`
- `Java_com_gamevil_nexus2_Natives_NativeResize`
- `Java_com_gamevil_nexus2_Natives_NativePauseClet`
- `Java_com_gamevil_nexus2_Natives_NativeResumeClet`
- `Java_com_gamevil_nexus2_Natives_NativeDestroyClet`
- `Java_com_gamevil_nexus2_Natives_NativeResponseIAP`
- `Java_com_gamevil_nexus2_Natives_handleCletEvent`

결론:

- `Natives.java`에 선언된 native 메서드들이 실제로 구현되어 있다.

### 16.2 네트워크/과금 관련 문자열

확인 문자열:

- `netBillcomSocketConnect`
- `netBillcomSocketWrite`
- `netBillcomSocketRead`
- `netBillcomSocketClose`
- `MC_netBillSocketConnect`
- `MC_netSocketConnect`

의미:

- 네이티브 엔진 내부도 LGU bill socket 경로를 직접 기대한다.

### 16.3 게임 로직 관련 문자열

확인 문자열 일부:

- `CScript`
- `CScriptEngine`
- `CScriptScene`
- `CScriptPopUp`
- `CStageGameScene`
- `CBossScene_GreedKing`
- `CBossScene_Rival`
- `CBossScene_Silkworm`
- `CNom5`
- `popup/popup_connect`
- `popup/popup_network`
- `map/stage_`

의미:

- 게임 스크립트 시스템과 스테이지/보스 구조가 네이티브 엔진 내부에 있다.
- `popup_*` 자산과 강하게 연결된다.

## 17. 리소스 구성

`assets/`는 매우 풍부하다.

확인된 주요 종류:

- `assets/boss/*`
- `assets/map/*`
- `assets/menu/*`
- `assets/popup/*`
- `assets/script/*`
- `assets/stage/*`
- `assets/string/*`
- `assets/table/*`

파일 확장자:

- `.pzx`
- `.mpl`
- `.n5s`
- `.n5m`
- `.scr`
- `.zt1`
- `.ptc`
- `.ft2`

추정:

- `.scr`: 대사/이벤트 스크립트
- `.n5s`, `.n5m`: 스테이지/맵 데이터
- `.pzx`, `.mpl`: 스프라이트/애니메이션/맵 레이아웃 관련 전용 포맷
- `.zt1`: 테이블 데이터
- `.ptc`: 파티클
- `.ft2`: 폰트

이 부분은 아직 포맷 분석 전이다.

## 18. 자바 계층에서 중요한 고정값

현재 확인한 의미 있는 문자열/상수:

- 앱 패키지: `com.gamevil.nom5.lgu`
- ARM ID: `AQ00102631`
- `Natives.strAID`: `0003572B`
- 기본 게임 해상도: `400x240`
- LGU 서비스 인터페이스:
  - `com.lgt.arm.ArmInterface`
  - `com.lguplus.common.bill.IBillSocket`

해석:

- `AQ00102631`와 `0003572B`는 서로 다른 계층에서 쓰는 식별자일 수 있다.
- 하나는 ARM 검증용 AID, 다른 하나는 bill socket 또는 게임 내부 식별용일 수 있다.

## 19. 지금까지의 가장 중요한 결론

1. 이 APK는 LGU+ 유통/인증 환경을 전제로 만들어진 빌드다.
2. `lgt-arm 기능.apk`는 실제로 `놈5`가 찾는 서비스 구현체다.
3. 터치 입력은 `armPassed` 플래그에 묶여 있으므로 인증 미통과 시 조작이 막힌다.
4. 게임의 실제 본체는 `libgameDSO.so`다.
5. ARM 인증 제거와 LGU 과금 서비스 제거는 같은 문제가 아니다.
6. 시작 인증 게이트는 자바 계층에서 비교적 얇게 구현되어 있어 패치 가능성이 높다.

## 20. “인증 절차 제거”에 대한 현재 판단

현재 코드만 보면, 최소한 다음은 가능성이 높다.

- `armPassed`를 강제로 true로 처리
- `runArmService()`를 생략하거나 성공으로 강제
- `bindIAPService()` 실패 시 종료하지 않도록 변경
- ARM/IAP 에러 다이얼로그를 막기

기대 효과:

- `lgt-arm 기능.apk` 없이도 최소 부팅/입력 가능성 상승
- 실제 플레이 구간 진입 가능성 상승

남는 리스크:

- 네이티브 엔진이 실행 중 bill socket을 다시 요구할 수 있음
- 특정 메뉴나 결제 관련 흐름에서 예외가 발생할 수 있음

## 21. `lgt-arm 기능.apk`가 완전히 불필요해질 조건

다음 두 조건이 충족되면 사실상 불필요해질 가능성이 높다.

1. `놈5` 본체가 더 이상 `ArmInterface`를 바인드하지 않음
2. 입력 게이트가 `armPassed`에 묶여 있지 않음

다만 이건 **ARM 검증 우회**에 대한 이야기다.

별도 문제:

- `IBillSocket`는 아직 남는다.
- 따라서 “앱 기동”과 “LGU 외부 의존성 완전 제거”는 다른 목표다.

## 22. 추천 분석 방향

### 방향 A: 최소 부팅 패치

목표:

- 현재 APK를 패치해서 외부 서비스 없이 입력 가능한 상태 만들기

우선 포인트:

- `Nom5Launcher.onCreate()`
- `LgUtil.runArmService()`
- `LgUtil.bindIAPService()`
- `UIFullTouch.onAction()`
- 에러 다이얼로그 표시/종료 경로

장점:

- 결과가 가장 빨리 보인다.

### 방향 B: LGU 스텁 서비스 앱 제작

목표:

- `ArmInterface`, `IBillSocket`를 흉내내는 보조 앱을 직접 작성

장점:

- 원본 앱을 덜 건드리고 동작 관찰 가능
- 다른 LGU 빌드에도 재사용 가능

단점:

- `IBillSocket`의 실제 기대 동작을 더 알아야 함

### 방향 C: `libgameDSO.so` 본격 리버싱

목표:

- 게임 엔진 구조와 자산 포맷을 직접 해석

장점:

- 장기적으로 “구동기” 개발에 필수

단점:

- 진입 비용이 크다

## 23. 아직 모르는 것

현재 미확정 사항:

- `IBillSocket`가 실제 플레이 중 언제 얼마나 호출되는지
- `armPassed` 외에 네이티브 내부에도 추가 인증 체크가 있는지
- `.pzx`, `.mpl`, `.n5s`, `.n5m`, `.zt1` 포맷 구조
- `libCPService.so`, `libCPVerify.so` 내부 검증 로직의 상세
- 업로더가 말한 “뒤로가기 누르면 스킵 가능”이 정확히 어느 다이얼로그/상태 전이인지

## 24. 다음 분석자가 바로 보면 좋은 파일 목록

가장 먼저 읽을 파일:

- [jadx-out/nom5/resources/AndroidManifest.xml](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/AndroidManifest.xml:1>)
- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java:20>)
- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:18>)
- [jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java:11>)
- [jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java](<d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java:28>)
- [jadx-out/nom5/resources/res/raw/message.properties](<d:/Engineering/nom-five-reversing/jadx-out/nom5/resources/res/raw/message.properties:1>)
- [jadx-out/lgt-arm/resources/AndroidManifest.xml](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/resources/AndroidManifest.xml:1>)
- [jadx-out/lgt-arm/sources/com/lgt/arm/LgtArmService.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/LgtArmService.java:12>)
- [jadx-out/lgt-arm/sources/com/lgt/arm/ArmSetting.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/ArmSetting.java:19>)
- [jadx-out/lgt-arm/sources/com/lgt/arm/Util.java](<d:/Engineering/nom-five-reversing/jadx-out/lgt-arm/sources/com/lgt/arm/Util.java:13>)

네이티브 분석 출발점:

- `jadx-out/nom5/resources/lib/armeabi/libgameDSO.so`
- `jadx-out/lgt-arm/resources/lib/armeabi/libCPVerify.so`
- `jadx-out/lgt-arm/resources/lib/armeabi/libCPService.so`

## 25. 현재 추천 결론

구동기 개발이라는 최종 목표를 생각하면, 다음 순서가 가장 실용적이다.

1. 자바 계층에서 ARM 게이트와 IAP 종료 경로를 패치해 최소 실행 상태 확인
2. 필요하면 `IBillSocket` 스텁 서비스 구현
3. 병행해서 `libgameDSO.so`의 JNI 경계와 자산 로더를 리버싱

즉, 지금 단계에서는 `lgt-arm 기능.apk`를 “실행용 필수앱”으로 받아들이기보다, **원본 앱이 어떤 외부 서비스를 기대하는지 보여주는 샘플/스텁**으로 보는 것이 더 유용하다.

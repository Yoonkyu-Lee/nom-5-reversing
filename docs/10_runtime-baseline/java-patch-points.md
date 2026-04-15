# NOM5 Java Patch Points

이 문서는 `최소부팅 패치`를 실제로 적용할 때 자바 계층에서 어디를 어떻게 건드릴지 정리한 작업 메모다.

관련 문서:

- [nom5-app-structure.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/nom5-app-structure.md:1)
- [minimal-boot-patch-plan.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/minimal-boot-patch-plan.md:1)

## 1. 패치 우선순위

현재 우선순위는 아래 순서가 맞다.

1. 시작 시 강제 종료를 막는 패치
2. 입력 게이트 해제
3. 서비스 부재를 허용하는 패치
4. 런타임 네트워크/과금 상태값 완화

이 순서를 어기면, 뒤쪽을 손봐도 앞에서 앱이 죽어서 효과를 확인하기 어렵다.

## 2. 1차 핵심 패치 세트

### 2.1 `Nom5Launcher.onCreate()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java:29)

현재 코드:

```java
armPassed = this.lgUtil.runArmService("AQ00102631");
Natives.bCanConn = false;
this.lgUtil.bindIAPService();
```

문제:

- 앱 시작 직후 외부 ARM/IAP 서비스에 의존한다
- 원본 환경이 아니면 바로 실패 경로로 갈 수 있다

1차 패치 의도:

- `armPassed`를 외부 서비스 결과와 분리
- `bindIAPService()` 실패가 앱 전체 종료로 이어지지 않게 하기

권장 수정 방향:

```java
armPassed = true;
Natives.bCanConn = false;
// this.lgUtil.runArmService("AQ00102631");
// this.lgUtil.bindIAPService();
```

또는 보수적으로:

```java
armPassed = true;
try {
    this.lgUtil.bindIAPService();
} catch (Throwable ignored) {
}
```

의미:

- 이 파일은 “시작 게이트”를 여는 첫 번째 패치 포인트다.

### 2.2 `LgUtil.runArmService()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:73)

현재 코드:

```java
public boolean runArmService(String armId) {
    this.strArmId = armId;
    this.isArmServiceBinding = this.activity.bindService(new Intent(ArmInterface.class.getName()), this.armServiceConnection, 1);
    return this.isArmServiceBinding;
}
```

문제:

- 외부 서비스 부재 시 false
- 시작 시점의 `armPassed`에 그대로 반영됨

1차 패치 의도:

- ARM 서비스 존재 여부를 무시하고 성공처럼 처리

권장 수정 방향:

```java
public boolean runArmService(String armId) {
    this.strArmId = armId;
    return true;
}
```

의미:

- 런처에서 `armPassed = runArmService(...)`를 그대로 두더라도 true로 만들 수 있다.

### 2.3 `LgUtil.bindIAPService()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:85)

현재 코드:

```java
this.isIapServiceBinding = this.activity.bindService(new Intent(IBillSocket.class.getName()), this.iapServiceConnection, 1);
if (!this.isIapServiceBinding) {
    showAlertNShutdown(...);
}
```

문제:

- LGU IAP 서비스가 없으면 바로 종료 경로로 이어짐

1차 패치 의도:

- 서비스가 없어도 앱이 계속 뜨도록 만들기

권장 수정 방향:

```java
public boolean bindIAPService() {
    this.isIapServiceBinding = false;
    Natives.billSock = null;
    Natives.bCanConn = false;
    return false;
}
```

의미:

- 네트워크/과금 기능은 비활성처럼 보이지만 앱은 죽지 않는다.

### 2.4 `LgUtil.armServiceConnection.onServiceConnected()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:44)

현재 코드:

- `executeArm(...)` 호출
- 결과가 `1`이 아니면 `setArmPassed(false)` 후 종료 팝업

문제:

- 혹시 나중에 실수로 서비스가 연결되더라도 실패 결과가 다시 `armPassed=false`를 만들 수 있다

1차 패치 의도:

- ARM 결과와 상관없이 `armPassed`를 유지

권장 수정 방향:

```java
public void onServiceConnected(ComponentName name, IBinder service) {
    Nom5Launcher.setArmPassed(true);
}
```

의미:

- 방어적으로 ARM 실패 콜백을 무력화한다.

### 2.5 `LgUtil.showAlertNShutdown()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:103)

현재 코드:

- 다이얼로그 표시
- `OK` 누르면 `activity.finishApp()`

문제:

- 디버깅과 관찰 전에 앱이 내려간다

1차 패치 의도:

- 종료를 제거하고, 가능하면 로그만 남기기

권장 수정 방향:

```java
public void showAlertNShutdown(final String title, final Integer errorCode, final Integer elseCode) {
    Log.w("NOM5_PATCH", "Suppressed alert: " + title + " / " + errorCode);
}
```

보수적 대안:

- 다이얼로그는 띄우되 `finishApp()` 호출만 제거

의미:

- 실패 메시지는 남기되 앱을 계속 살려둘 수 있다.

### 2.6 `UIFullTouch.onAction()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java:34)

현재 코드:

```java
if (!Nom5Launcher.isArmPassed()) {
    if (Nom5Launcher.isShownAlert) {
        NexusGLActivity.myActivity.finishApp();
    }
} else if (_uiAreaAction == 101) {
    ...
}
```

문제:

- `armPassed=false`면 터치 자체가 막힌다

1차 패치 의도:

- 인증과 무관하게 입력을 통과시킨다

권장 수정 방향:

```java
if (_uiAreaAction == 101) {
    ...
} else if (_uiAreaAction == 102) {
    ...
} else if (_uiAreaAction == 100) {
    ...
}
```

즉:

- `Nom5Launcher.isArmPassed()` 조건문 자체를 제거

의미:

- 이 패치가 없으면 메뉴 관찰이 거의 불가능하다.

## 3. 2차 후보 패치

### 3.1 `Natives.getNetState()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java:357)

현재 코드:

```java
return bCanConn ? 1 : 0;
```

2차 패치 의도:

- 네이티브 엔진이 연결 상태를 너무 빨리 포기하지 않게 완화

후보:

```java
return 1;
```

주의:

- 이건 실제 소켓 연결이 없는 상태를 “있다”고 속이는 셈이라, 부작용 가능성이 있다
- 따라서 1차 패치 후 추가 오류가 나올 때 고려

### 3.2 `Natives.netConnect()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java:361)

현재 코드:

```java
return bCanConn ? 1 : -1;
```

2차 후보:

```java
return 1;
```

### 3.3 `Natives.netSocket()`

참조:

- [jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java:365)

현재 코드:

```java
if (billSock == null) {
    bCanConn = false;
}
return bCanConn ? 1 : 0;
```

2차 후보:

- `billSock == null`이어도 무조건 성공처럼 보이게 할지 검토

주의:

- 네이티브 쪽이 이후 `netBillcomSocketConnect()`를 바로 부르면 다른 오류가 터질 수 있다

## 4. 패치 적용 순서 제안

가장 보수적인 순서:

1. `Nom5Launcher.onCreate()`
2. `LgUtil.runArmService()`
3. `LgUtil.bindIAPService()`
4. `LgUtil.showAlertNShutdown()`
5. `UIFullTouch.onAction()`

그 후 다시 실행:

- 어디까지 가는지 본다
- 추가 오류가 뜨면 그때 `Natives` 2차 패치 검토

## 5. 현재 판단

최소부팅 패치의 핵심은 아래 한 문장으로 요약된다.

- **ARM/IAP 서비스 부재를 이유로 앱이 죽거나 입력이 막히지 않게 만드는 것**

즉:

- 1차 패치는 자바층에서 충분히 정의 가능하다
- 네이티브 패치는 나중 문제다

## 6. 다음 실제 작업

이 문서 다음 단계:

1. APK 수정/재빌드 도구 준비
2. 실제 패치 적용
3. 패치 APK 실행 로그 다시 수집

도구 후보:

- `apktool`
- `apksigner`
- `zipalign`

현재 Android SDK에는 `zipalign`, `apksigner`는 이미 있다.
즉 재패키징 체인에서 남은 핵심은 `apktool` 또는 동등한 APK round-trip 도구다.

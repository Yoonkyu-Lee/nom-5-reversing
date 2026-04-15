# NOM5 Minimal Boot Patch Plan

이 문서는 `놈5`를 **원본 그대로 실행하는 경로가 ABI/에뮬레이터 제약으로 막혔을 때**, 다음 단계로 진행할 `최소부팅 패치`의 개념과 범위를 정리한 문서다.

관련 문서:

- [nom5-app-structure.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/nom5-app-structure.md:1)
- [original-apk-execution-plan.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/original-apk-execution-plan.md:1)
- [runtime-test-log.md](/d:/Engineering/nom-five-reversing/docs/10_runtime-baseline/runtime-test-log.md:1)

## 1. 최소부팅 패치란 무엇인가

`최소부팅 패치`는 `놈5`를 완전히 현대화하거나 전체 구조를 갈아엎는 작업이 아니다.

정확히는 다음 목표를 가진 **응급수술 수준의 최소 수정**이다.

- 외부 LGU 인증/과금 서비스가 없어도 앱이 시작 직후 죽지 않게 만들기
- `armPassed` 같은 입력 게이트를 우회해서 터치/진행이 가능하게 만들기
- 에러 다이얼로그나 강제 종료 경로를 막아서 메뉴나 실제 게임 구간까지 관찰 가능하게 만들기

즉:

- 목표는 “앱을 멋지게 재구성”하는 것이 아니라
- 먼저 “부팅과 관찰이 가능한 상태”를 만드는 것이다

## 2. 최소부팅 패치가 아닌 것

이 단계는 아직 다음을 직접 목표로 하지 않는다.

- 완전한 현대 안드로이드 이식
- 결제/랭킹/온라인 기능 복원
- 네이티브 엔진 전체 포팅
- 최종 독립 실행판 완성

이유:

- 아직 어디까지가 필수 의존성인지 다 알지 못한다
- 게임이 어느 지점까지 살아나는지 먼저 확인해야 한다

비유하면:

- 최소부팅 패치는 **시동이 걸리게 만드는 것**
- 현대화/이식은 **차 전체를 새 플랫폼에 맞게 다시 만드는 것**

## 3. 왜 지금 최소부팅 패치가 필요한가

원본 실행 실험에서 다음이 확인되었다.

- `API 19 x86` 에뮬레이터에서는 `libgameDSO.so`를 로드하지 못하고 즉시 크래시
- `API 19 ARM` 에뮬레이터는 실용적으로 매우 느리거나 부팅이 불안정함
- 따라서 “원본 그대로 + 에뮬레이터” 경로는 생산성이 낮다

즉 지금은:

- 실기기를 별도로 쓰지 않는다면
- **정적 분석과 최소 수정으로 부팅 경계를 해제하는 쪽이 더 효율적**이다

## 4. 최소부팅 패치의 1차 목표

현재 기준 1차 목표는 아래 네 가지다.

1. ARM 인증 게이트 제거
2. IAP 서비스 부재로 인한 종료 방지
3. 터치 입력 차단 해제
4. 에러 팝업/종료 경로 완화

성공 기준:

- 앱이 시작 직후 종료되지 않음
- 메뉴 또는 타이틀까지 진입
- 입력 가능
- 이후 추가 실패 지점을 관찰 가능

## 5. 예상 작업 범위

현재 구조상 최소부팅 패치의 주요 타깃은 **자바 계층**이다.

이유:

- 인증/서비스 연결은 자바에서 시작한다
- `armPassed`도 자바 상태값이다
- 오류 다이얼로그와 종료도 자바에서 제어한다

즉 현재는 네이티브 엔진 전체보다 먼저 자바 런처 계층을 건드리는 것이 맞다.

## 6. 핵심 패치 포인트

### 6.1 `Nom5Launcher`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Nom5Launcher.java:20)

현재 역할:

- 앱 시작점
- `runArmService("AQ00102631")`
- `bindIAPService()`
- `armPassed` 초기화

최소부팅 패치 후보:

- `armPassed`를 시작 시 강제로 `true` 처리
- `runArmService()` 호출 제거 또는 무시
- `bindIAPService()` 실패해도 종료하지 않게 변경

### 6.2 `LgUtil`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/LgUtil.java:18)

현재 역할:

- ARM 서비스 바인드
- IAP 서비스 바인드
- 실패 시 `showAlertNShutdown(...)`

최소부팅 패치 후보:

- `runArmService()`가 항상 성공처럼 보이게 처리
- `bindIAPService()`가 실패해도 `showAlertNShutdown()`를 부르지 않게 처리
- ARM 콜백 결과 실패 시에도 `setArmPassed(true)`로 유지하거나, 최소한 종료하지 않게 변경

### 6.3 `UIFullTouch`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/p001ui/UIFullTouch.java:11)

현재 역할:

- 실제 터치 입력을 네이티브 이벤트로 전달
- `Nom5Launcher.isArmPassed()`가 false면 입력 막음

최소부팅 패치 후보:

- `armPassed` 체크 제거
- 무조건 터치 이벤트 전달

이 파일은 최소부팅 패치에서 가장 직접적인 입력 게이트다.

### 6.4 `Constants`

참조:

- [jadx-out/nom5/sources/com/gamevil/nom5/lgu/Constants.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nom5/lgu/Constants.java:16)

현재 역할:

- LGU 에러 메시지 표시
- 네트워크 경고 표시

최소부팅 패치 후보:

- 필요 시 알림만 뜨고 종료 콜백은 보내지 않도록 조정
- 혹은 단순 로그만 남기고 UI 차단을 최소화

### 6.5 `Natives`

참조:

- [jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java](/d:/Engineering/nom-five-reversing/jadx-out/nom5/sources/com/gamevil/nexus2/Natives.java:28)

현재 역할:

- 네이티브 엔진과 자바 사이 브리지
- `bCanConn`, `billSock`, bill socket 통신 메서드 제공

최소부팅 패치 후보:

- `getNetState()`, `netConnect()`, `netSocket()` 등을 더 관대한 값으로 돌려주는 방법 검토
- bill socket이 없는 상태에서도 네이티브 쪽이 즉시 포기하지 않도록 완화 가능성 검토

주의:

- 이 부분은 네이티브 엔진이 실제로 어떤 반환값을 기대하는지 봐야 한다
- 따라서 자바층 패치 후 추가 증상이 생길 때 건드리는 2차 후보에 가깝다

## 7. 최소부팅 패치의 범위와 단계

### 단계 A: 자바층 인증 게이트 해제

목표:

- 외부 서비스 없이 앱이 떠야 한다

작업:

- `armPassed` 강제 true
- ARM/IAP 서비스 바인딩 실패 무시
- 터치 게이트 제거

### 단계 B: 종료/팝업 완화

목표:

- 실패를 관찰 가능한 상태로 유지

작업:

- `showAlertNShutdown()` 경로 완화
- 강제 종료 대신 로그만 남기기

### 단계 C: 런타임 추가 의존성 대응

목표:

- 메뉴/게임 진입 중 나타나는 새로운 의존성 확인

작업:

- 추가적인 `Natives` 반환값 조정
- bill socket 관련 함수 완화
- 필요 시 스텁 응답 삽입

## 8. 최소부팅 패치와 “현대 안드로이드 호환”의 관계

중요한 점:

- 최소부팅 패치와 현대 안드로이드 호환은 같은 문제가 아니다

현재 분리해서 봐야 할 축:

1. **인증/서비스 의존성**
2. **네이티브 ABI 호환**
3. **현대 권한/플랫폼 변화**

즉 최소부팅 패치는 주로 1번을 겨냥한다.

하지만 높은 버전의 안드로이드에서 실제로 부팅하려면 2번과 3번도 함께 풀어야 할 수 있다.

예시:

- `libgameDSO.so`가 `armeabi`만 포함
- 최신 기기/에뮬레이터는 ABI나 로더 정책이 달라질 수 있음
- `READ_PHONE_STATE`나 전화번호/IMEI 접근 정책도 현대 안드로이드에선 다름

결론:

- 최소부팅 패치는 “높은 버전 안드로이드 완전 호환”과 동일하지 않다
- 그러나 **그 방향으로 가기 위한 첫 관찰 단계**로는 적절하다

## 9. 최소부팅 패치를 하면 기대할 수 있는 것

잘 되면 다음이 가능해진다.

- ARM 인증 없이 앱 시작
- 외부 LGU 서비스 없이 메뉴 진입
- 실제 입력 전달
- 런타임 중 새로운 실패 지점 관찰
- 이후 네이티브 엔진이 추가로 무엇을 요구하는지 파악

즉, 현재 가장 큰 가치는 “완성”이 아니라 **관찰 가능성 확보**다.

## 10. 최소부팅 패치의 한계

다음 문제는 여전히 남을 수 있다.

- ABI 문제
- 실제 네이티브 엔진 내부 인증 체크
- 온라인 기능 의존
- 구형 플랫폼 가정
- 결제/랭킹/뉴스/라이브 웹뷰 관련 예외

따라서 최소부팅 패치 성공은 끝이 아니라 다음 단계의 시작이다.

## 11. 패치 후 가능한 다음 분기

### 분기 A: 자바층 패치만으로 상당히 살아남음

이 경우:

- 독립 실행판에 가까운 방향으로 계속 정리 가능

### 분기 B: 네이티브에서 추가 인증/통신 의존이 계속 나옴

이 경우:

- `Natives` 스텁 강화
- 네이티브 리버싱 강화
- 필요 시 서비스 스텁 구현

### 분기 C: 높은 안드로이드 버전에서 별도 호환 문제가 큼

이 경우:

- ABI/권한/플랫폼 적응 작업을 별도 트랙으로 분리

## 12. 현재 권장 다음 액션

지금 기준으로 가장 합리적인 다음 단계는:

1. 최소부팅 패치 대상 자바 파일을 우선 정리
2. 실제 수정 포인트를 작은 단위로 분해
3. 첫 패치를 적용한 실험용 APK를 만들어서 실행 경계를 다시 확인

즉 다음 문서는 이런 내용이 될 가능성이 높다.

- `java-patch-points.md`
- 또는 바로 패치 작업 브랜치/폴더 진행

## 13. 현재 결론

최소부팅 패치는 다음을 의미한다.

- 인증/과금 의존을 완전히 설계 변경하는 것이 아니라
- 먼저 부팅과 입력을 가로막는 자바 게이트를 해제하는 것

그리고 그 목적은:

- 지금 당장 완성판을 만드는 것이 아니라
- **게임 본체가 어디까지 살아나는지 관찰 가능한 상태를 확보하는 것**이다

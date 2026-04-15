# NOM5 Minimal Boot Patch Implementation

## Status

- Date: 2026-04-13
- Objective: produce a test APK that removes the startup LGU authentication and billing gate with the smallest possible Java/smali change set
- Result: patched APK successfully rebuilt and signed
- Runtime validation status: not yet validated on a compatible ARM Android device

## Why this patch exists

The original execution experiments established two separate blockers:

1. Original APK startup depends on LGU ARM verification and LGU billing service binding.
2. Our API 19 x86 emulator cannot load `lib/armeabi/libgameDSO.so`, so we cannot validate gameplay there even after removing auth.

This patch only addresses blocker `1`.

## Toolchain added

- `tools/apktool.jar`
- `tools/apktool-framework/`
- `tools/debug.keystore`
- reusable build script: `scripts/build/build-nom5-minboot.ps1`

## Round-trip decoded tree

- decoded with apktool into `apktool-out/nom5`
- command shape:

```powershell
java -jar .\tools\apktool.jar d -p .\tools\apktool-framework -f ".\놈5(com.gamevil.nom5.lgu)(100).apk" -o .\apktool-out\nom5
```

## Applied smali changes

### 1. Force ARM pass checks to always succeed

File:
- `apktool-out/nom5/smali/com/gamevil/nom5/lgu/Nom5Launcher.smali`

Change:
- `isArmPassed()` now returns constant `true`

Effect:
- touch/input gates that consult `Nom5Launcher.isArmPassed()` no longer block interaction

### 2. Disable ARM service binding

File:
- `apktool-out/nom5/smali/com/gamevil/nom5/lgu/LgUtil.smali`

Change:
- `runArmService(String)` now stores the ARM id and returns `true` immediately
- no bind to `com.lgt.arm.ArmInterface`

Effect:
- startup no longer depends on `lgt-arm기능.apk`

### 3. Disable IAP service binding

File:
- `apktool-out/nom5/smali/com/gamevil/nom5/lgu/LgUtil.smali`

Change:
- `bindIAPService()` now sets `isIapServiceBinding = false` and returns immediately
- no bind to `com.lguplus.common.bill.IBillSocket`

Effect:
- startup no longer dies solely because LGU billing socket is missing

### 4. Suppress auth-related shutdown alerts

File:
- `apktool-out/nom5/smali/com/gamevil/nom5/lgu/LgUtil.smali`

Change:
- `showAlertNShutdown(...)` is now a no-op

Effect:
- auth/billing failure paths no longer force an alert dialog plus app shutdown

## Build artifacts

- unsigned: `build/nom5-minboot-unsigned.apk`
- aligned: `build/nom5-minboot-aligned.apk`
- signed test APK: `build/nom5-minboot-debug.apk`

## Rebuild command

```powershell
.\scripts\build\build-nom5-minboot.ps1
```

## Important limitation

This patch does **not** solve native ABI compatibility.

- original engine library is still `lib/armeabi/libgameDSO.so`
- x86 emulator still fails before game logic runs
- practical validation still needs one of:
  - an ARM Android device
  - a usable ARM emulator
  - a future native-layer portability strategy

## What this patch does not do yet

- does not patch JNI / native engine logic
- does not fake billing responses beyond skipping the initial bind
- does not patch network checks in `Natives`
- does not make the app compatible with modern Android by itself

## Recommended next step

Install `build/nom5-minboot-debug.apk` on a real ARM Android device first.

If it boots further than the original APK, capture:

- install result
- first visible screen
- any alert text
- `adb logcat`

That tells us whether the next blocker is:

- another Java-side service gate
- a native network/auth check
- a modern Android compatibility break

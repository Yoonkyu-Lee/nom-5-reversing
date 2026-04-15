param(
    [string]$DecodedDir = ".\apktool-out\nom5",
    [string]$OutputDir = ".\build",
    [string]$FrameworkDir = ".\tools\apktool-framework",
    [string]$ApktoolJar = ".\tools\apktool.jar",
    [string]$Keystore = ".\tools\debug.keystore"
)

$ErrorActionPreference = "Stop"

$buildToolsDir = "C:\Users\yoong\AppData\Local\Android\Sdk\build-tools\36.1.0"
$zipalign = Join-Path $buildToolsDir "zipalign.exe"
$apksigner = Join-Path $buildToolsDir "apksigner.bat"

$unsignedApk = Join-Path $OutputDir "nom5-minboot-unsigned.apk"
$alignedApk = Join-Path $OutputDir "nom5-minboot-aligned.apk"
$signedApk = Join-Path $OutputDir "nom5-minboot-debug.apk"

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
New-Item -ItemType Directory -Force -Path $FrameworkDir | Out-Null

if (!(Test-Path $ApktoolJar)) {
    throw "apktool.jar not found: $ApktoolJar"
}

if (!(Test-Path $zipalign)) {
    throw "zipalign.exe not found: $zipalign"
}

if (!(Test-Path $apksigner)) {
    throw "apksigner.bat not found: $apksigner"
}

if (!(Test-Path $Keystore)) {
    keytool -genkeypair `
        -v `
        -keystore $Keystore `
        -storepass android `
        -keypass android `
        -alias androiddebugkey `
        -dname "CN=Android Debug,O=Android,C=US" `
        -keyalg RSA `
        -keysize 2048 `
        -validity 10000
}

java -jar $ApktoolJar b -p $FrameworkDir $DecodedDir -o $unsignedApk
& $zipalign -f -p 4 $unsignedApk $alignedApk
& $apksigner sign `
    --ks $Keystore `
    --ks-pass pass:android `
    --key-pass pass:android `
    --ks-key-alias androiddebugkey `
    --out $signedApk `
    $alignedApk
& $apksigner verify --print-certs $signedApk

Write-Host "Built signed APK: $signedApk"

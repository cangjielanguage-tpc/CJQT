# run.ps1 (精简版，兼容旧版PowerShell)
$currentLocation = Get-Location
$currentPath = $currentLocation.Path
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildDirectory = Join-Path -Path $scriptDirectory -ChildPath "\target\release\bin\"
# powershell -ExecutionPolicy Bypass -File $scriptFile

cd $scriptDirectory

$CUR_DIR = Split-Path -Parent $MyInvocation.MyCommand.Definition
$ARCH = if ([Environment]::Is64BitOperatingSystem) { "x86_64" } else { "aarch64" }

$QT_PLATFORM_URL = Resolve-Path "$CUR_DIR\..\..\native\lib\$ARCH" -ErrorAction SilentlyContinue
if (-not $QT_PLATFORM_URL) { $QT_PLATFORM_URL = Resolve-Path "$CUR_DIR\..\..\native\lib" }

# 设置路径
if ($env:QT_HOME) { $env:Path = "$env:QT_HOME\lib;$env:Path" }
if ($env:CANGJIE_HOME) {
    $env:Path = "$env:CANGJIE_HOME\runtime\lib\linux_${ARCH}_cjnative;$env:Path"
    $env:Path = "$env:CANGJIE_HOME\tools\lib;$env:Path"
}
$env:Path = "$QT_PLATFORM_URL;$CUR_DIR\target\release\cjqt;$env:Path"

# Qt插件路径
$env:QT_QPA_PLATFORM_PLUGIN_PATH = "$QT_PLATFORM_URL\platforms"
$env:QT_PLUGIN_PATH = "$QT_PLATFORM_URL\plugins"
if ($env:QT_HOME -and (Test-Path "$env:QT_HOME\plugins")) {
    $env:QT_PLUGIN_PATH = "$env:QT_HOME\plugins;$QT_PLATFORM_URL\plugins"
}

Set-Location $CUR_DIR
cjpm update
cjpm build

$nativeDllFile = Join-Path -Path $scriptDirectory -ChildPath "\..\..\native\build\libnativeQt.dll"

copy $nativeDllFile $buildDirectory
copy "$env:QT_HOME\bin\Qt5Widgets.dll" $buildDirectory
copy "$env:QT_HOME\bin\Qt5Core.dll" $buildDirectory
copy "$env:QT_HOME\bin\Qt5Gui.dll" $buildDirectory
copy "$env:QT_HOME\bin\Qt5Multimedia.dll" $buildDirectory
copy "$env:QT_HOME\bin\Qt5MultimediaWidgets.dll" $buildDirectory
copy "$env:QT_HOME\bin\Qt5Network.dll" $buildDirectory
copy "$env:QT_HOME\bin\Qt5OpenGL.dll" $buildDirectory

Copy-Item -Path "images" -Destination "$buildDirectory\images" -Recurse -Force
Copy-Item -Path "musics" -Destination "$buildDirectory\musics" -Recurse -Force

.\target\release\bin\main.exe

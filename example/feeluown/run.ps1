$currentLocation = Get-Location
$currentPath = $currentLocation.Path
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildDirectory = Join-Path -Path $scriptDirectory -ChildPath "\target\release\bin\"
# powershell -ExecutionPolicy Bypass -File $scriptFile

cd $scriptDirectory

# cjpm build
cjpm update
cjpm build

$nativeDllFile = Join-Path -Path $scriptDirectory -ChildPath "\..\..\native\build\libnativeQt.dll"
$toolsDllFile = Join-Path -Path $scriptDirectory -ChildPath "\..\..\target\release\cjqt\libcjqt.tools.dll"
$guiDllFile = Join-Path -Path $scriptDirectory -ChildPath "\..\..\target\release\cjqt\libcjqt.gui.dll"
$coreDllFile = Join-Path -Path $scriptDirectory -ChildPath "\..\..\target\release\cjqt\libcjqt.core.dll"
$widgetsDllFile = Join-Path -Path $scriptDirectory -ChildPath "\..\..\target\release\cjqt\libcjqt.widgets.dll"

copy $nativeDllFile $buildDirectory
copy $toolsDllFile $buildDirectory
copy $guiDllFile $buildDirectory
copy $coreDllFile $buildDirectory
copy $widgetsDllFile $buildDirectory

./target/release/bin/main.exe
#cd $buildDirectory
#.\main.exe

#cd $currentPath


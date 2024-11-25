# 获取当前目录的完整信息
$currentLocation = Get-Location
$currentPath = $currentLocation.Path
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildDirectory = Join-Path -Path $scriptDirectory -ChildPath "\build"

cd $buildDirectory
cmake -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_C_COMPILER:FILEPATH=$env:QT_HOME\bin\gcc.exe -DCMAKE_CXX_COMPILER:FILEPATH=$env:QT_HOME\bin\g++.exe -DCMAKE_MAKE_PROGRAM:FILEPATH=$env:QT_HOME\bin\mingw32-make.exe  --no-warn-unused-cli -G "MinGW Makefiles" ..
cmake --build .
cd $currentPath
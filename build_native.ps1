$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$scriptFile = Join-Path -Path $scriptDirectory -ChildPath "\native\make.ps1"
powershell -ExecutionPolicy Bypass -File $scriptFile
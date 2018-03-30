cd .\AppVeyorDotnetSandbox

dotnet build
dotnet xunit -nobuild -framework netcoreapp1.1
dotnet xunit -nobuild -framework netcoreapp2.0 --fx-version 2.0.0
dotnet xunit -nobuild -framework net462
dotnet xunit -nobuild -framework net462 -x86

@echo off
set TEST_DLL_PATH="%~dp0%~1AppVeyorDotnetSandbox\bin\Release\net461\AppVeyorDotnetSandbox.dll"
cd %HOMEPATH%\.nuget\packages\xunit.runner.console\2.3.1\tools\net452\
@echo on
mono .\xunit.console.exe %TEST_DLL_PATH%

cd %~dp0%~1

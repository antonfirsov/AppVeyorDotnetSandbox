cd .\AppVeyorDotnetSandbox

dotnet restore

dotnet xunit -framework netcoreapp1.1
dotnet xunit -framework netcoreapp2.0 --fx-version 2.0.0
dotnet xunit -framework net462
dotnet xunit -framework net462 -x86
rem mono.exe .\xunit.runner.console\2.3.1\tools\net452\xunit.console.exe .\bin\Release\net461\AppVeyorDotnetSandbox.dll

cd ./AppVeyorDotnetSandbox
dotnet xunit -framework netcoreapp1.1
dotnet xunit -framework netcoreapp2.0 --fx-version 2.0.0
dotnet xunit -framework net461
dotnet xunit -framework net461 -x86
mono ./xunit.runner.console/2.3.1/tools/net452/xunit.console.exe ./bin/Release/net461/AppVeyorDotnetSandbox.dll

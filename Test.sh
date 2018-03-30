cd ./AppVeyorDotnetSandbox
dotnet xunit -framework netcoreapp2.0
dotnet xunit -framework netcoreapp1.1
#mono ~/.nuget/packages/xunit.runner.console/2.3.1/tools/net452/xunit.console.exe ./bin/Release/net461/AppVeyorDotnetSandbox.dll

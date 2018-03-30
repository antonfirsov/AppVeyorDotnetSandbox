#!/bin/bash

DOTNETVER_FULL=$(dotnet --version| cut -c 1-5)
DOTNETVER_SHORT=$(dotnet --version| cut -c 1-3)

echo "dotnet version full: " $DOTNETVER_FULL
echo "dotnet version short: " $DOTNETVER_FULL

cd ./AppVeyorDotnetSandbox
dotnet xunit -framework netcoreapp$DOTNETVER_SHORT --fx-version $DOTNETVER_FULL
#mono ~/.nuget/packages/xunit.runner.console/2.3.1/tools/net452/xunit.console.exe ./bin/Release/net461/AppVeyorDotnetSandbox.dll

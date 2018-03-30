#!/bin/bash

DOTNETVER_FULL=$(DOTNET_TO_RUN| cut -c 1-5)
DOTNETVER_SHORT=$(DOTNET_TO_RUN| cut -c 1-3)

echo "dotnet version full: " $DOTNETVER_FULL
echo "dotnet version short: " $DOTNETVER_SHORT

cd ./AppVeyorDotnetSandbox
dotnet xunit -framework netcoreapp$DOTNETVER_SHORT --fx-version $DOTNETVER_FULL
#mono ~/.nuget/packages/xunit.runner.console/2.3.1/tools/net452/xunit.console.exe ./bin/Release/net461/AppVeyorDotnetSandbox.dll

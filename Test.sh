#!/bin/bash

echo "DOTNET_TO_RUN: $DOTNET_TO_RUN"

if [[ "$DOTNET_TO_RUN" = "mono" ]]; then
	echo "!!!! mono !!!!"
	xbuild /p:Configuration=Release ./AppVeyorDotnetSandbox.sln
	#~/.nuget/packages/xunit.runner.console/2.3.1/tools/net452/xunit.console.exe ./bin/Release/net461/AppVeyorDotnetSandbox.dll

else

	DOTNETVER_SHORT=$(echo $DOTNET_TO_RUN| cut -c 1-3)

	echo "DOTNETVER_SHORT: " $DOTNETVER_SHORT

	cd ./AppVeyorDotnetSandbox
	dotnet restore
	dotnet xunit -framework netcoreapp$DOTNETVER_SHORT --fx-version $DOTNET_TO_RUN

fi

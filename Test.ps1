cd .\AppVeyorDotnetSandbox

dotnet build
dotnet xunit -nobuild -framework netcoreapp1.1
dotnet xunit -nobuild -framework netcoreapp2.0 --fx-version 2.0.0
dotnet xunit -nobuild -framework net462
dotnet xunit -nobuild -framework net462 -x86

cd ..
param(
    [string]$targetFramework,
    [string]$is32Bit = "False"
)

if (!$targetFramework){
    Write-Host "Test1.ps1 ERROR: targetFramework is undefined!"
    exit 1
}

cd .\AppVeyorDotnetSandbox

$xunitArgs = "-c Release -framework $targetFramework"

if ($targetFramework -eq "netcoreapp2.0") {
    $xunitArgs += " --fx-version 2.0.0"
}

if ($is32Bit -eq "True") {
    $xunitArgs += " -x86"
}

$testRunnerCmd = "dotnet xunit $xunitArgs"

Write-Host "running:"
Write-Host $testRunnerCmd
Write-Host "..."

Invoke-Expression $testRunnerCmd

cd ..

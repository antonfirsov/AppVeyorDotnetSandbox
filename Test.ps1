cd .\AppVeyorDotnetSandbox

$xunitArgs = "-c Release -framework $TARGET_FRAMEWORK"

if ($TARGET_FRAMEWORK -eq "netcoreapp2.0") {
    $xunitArgs += " --fx-version 2.0.0"
}

if ($IS_32BIT -eq "True") {
    $xunitArgs += " -x86"
}

$testRunnerCmd = "dotnet xunit $xunitArgs"

Write-Host "running:"
Write-Host $testRunnerCmd
Write-Host "..."

Invoke-Expression $testRunnerCmd

cd ..
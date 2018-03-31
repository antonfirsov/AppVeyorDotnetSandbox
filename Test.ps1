param(
    [string]$targetFramework,
    [string]$is32Bit = "False"
)

if (!$targetFramework){
    Write-Host "Test1.ps1 ERROR: targetFramework is undefined!"
    exit 1
}

function VerifyPath($path, $errorMessage) {
    if (!(Test-Path -Path $path)) {
        Write-Host "Test1.ps1 $errorMessage `n $xunitRunnerPath"
        exit 1
    }
}

if ($targetFramework -ne "mono"){
    cd .\AppVeyorDotnetSandbox

    $xunitArgs = "-c Release -framework $targetFramework"

    if ($targetFramework -eq "netcoreapp2.0") {
        $xunitArgs += " --fx-version 2.0.0"
    }

    if ($is32Bit -eq "True") {
        $xunitArgs += " -x86"
    }

    $testRunnerCmd = "dotnet xunit $xunitArgs"
}
else {
    $testDllPath = "${PSScriptRoot}\AppVeyorDotnetSandbox\bin\Release\net461\AppVeyorDotnetSandbox.dll"
    VerifyPath($testDllPath, "test dll missing:")

    $xunitRunnerPath = "${env:HOMEPATH}\.nuget\packages\xunit.runner.console\2.3.1\tools\net452\"
    
    VerifyPath($xunitRunnerPath, "xunit console runner is missing on path:")
    
    cd "$xunitRunnerPath"

    if ($is32Bit -ne "True") {
        $monoPath = "${env:PROGRAMFILES}\Mono\bin\mono.exe"
    }
    else {
        $monoPath = "${env:ProgramFiles(x86)}\Mono\bin\mono.exe"
    }

    VerifyPath($monoPath, "mono runtime missing:")
    
    $testRunnerCmd = "& `"${monoPath}`" .\xunit.console.exe `"${testDllPath}`""
}

Write-Host "running:"
Write-Host $testRunnerCmd
Write-Host "..."

Invoke-Expression $testRunnerCmd

cd $PSScriptRoot

exit $LASTEXITCODE
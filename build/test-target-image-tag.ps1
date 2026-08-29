$ErrorActionPreference = "Stop"

. "$PSScriptRoot/functions-manifest.ps1"

$dockerfileDir = Join-Path $PSScriptRoot "../src/node/24.20.0"
$cases = @(
    @{
        Name = "registry path already contains Aliyun namespace"
        Registry = "registry.cn-chengdu.aliyuncs.com/yoyosoft"
        Namespace = "ltm0203"
        Expected = "registry.cn-chengdu.aliyuncs.com/yoyosoft/node:24.20.0"
    },
    @{
        Name = "registry host requires explicit namespace"
        Registry = "registry.cn-chengdu.aliyuncs.com"
        Namespace = "yoyosoft"
        Expected = "registry.cn-chengdu.aliyuncs.com/yoyosoft/node:24.20.0"
    }
)

foreach ($case in $cases) {
    $actual = GetTargetManifestImageTag `
        -DockerfileDir $dockerfileDir `
        -Registry $case.Registry `
        -Namespace $case.Namespace `
        -SourceNamespace "ltm0203"

    if ($actual -ne $case.Expected) {
        throw "[$($case.Name)] expected '$($case.Expected)', actual '$actual'."
    }

    Write-Host "PASS: $($case.Name) -> $actual" -ForegroundColor Green
}

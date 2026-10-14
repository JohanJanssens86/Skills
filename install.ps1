[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$Destination = $(if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME 'skills' } else { Join-Path $env:USERPROFILE '.codex/skills' }),
    [switch]$InstallGitHubCli
)

$ErrorActionPreference = 'Stop'
$sourceRoot = Join-Path $PSScriptRoot 'skills'
$targetRoot = [IO.Path]::GetFullPath($Destination)
$sourceFull = [IO.Path]::GetFullPath($sourceRoot)
if ($targetRoot.TrimEnd('\', '/') -eq $sourceFull.TrimEnd('\', '/')) {
    throw 'Destination must differ from the source skills directory.'
}
$skillNames = @('domain-modeling', 'grilling', 'grill-me', 'grill-with-docs', 'to-spec', 'setup-matt-pocock-skills', 'implement-spec', 'tdd', 'code-review')
foreach ($name in $skillNames) {
    if (!(Test-Path -LiteralPath (Join-Path $sourceRoot "$name/SKILL.md"))) {
        throw "Missing skill: $name"
    }
}
foreach ($name in $skillNames) {
    $source = Join-Path $sourceRoot $name
    $target = Join-Path $targetRoot $name
    if ($PSCmdlet.ShouldProcess($target, 'Install skill; back up existing version')) {
        New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
        if (Test-Path -LiteralPath $target) {
            $backupRoot = Join-Path (Split-Path $targetRoot -Parent) 'skill-backups'
            New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
            $backup = Join-Path $backupRoot ($name + '-' + [guid]::NewGuid().ToString('N'))
            Move-Item -LiteralPath $target -Destination $backup
            Write-Output "Backed up $name to $backup"
        }
        Copy-Item -LiteralPath $source -Destination $target -Recurse
        Write-Output "Installed $name"
    }
}
if ($InstallGitHubCli -and !(Get-Command gh -ErrorAction SilentlyContinue)) {
    if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
        throw 'winget is unavailable. Install GitHub CLI from https://cli.github.com/.'
    }
    if ($PSCmdlet.ShouldProcess('GitHub CLI', 'Install using winget')) {
        & winget install --id GitHub.cli --exact --source winget --accept-source-agreements --accept-package-agreements --silent
        if ($LASTEXITCODE -ne 0) { throw "GitHub CLI installation failed: $LASTEXITCODE" }
    }
}
Write-Output 'Restart Codex to load the skills. For GitHub Issues, run gh auth login in a new terminal.'

#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$TargetDir = Join-Path $env:USERPROFILE ".agents\skills"
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
}

$LinkPaths = @(
    (Join-Path $env:USERPROFILE ".config\opencode\skills"),
    (Join-Path $env:USERPROFILE ".gemini\config\skills")
)

foreach ($LinkPath in $LinkPaths) {
    $ParentDir = Split-Path -Parent $LinkPath
    if (-not (Test-Path $ParentDir)) {
        New-Item -ItemType Directory -Force -Path $ParentDir | Out-Null
    }

    if (Test-Path $LinkPath) {
        $Item = Get-Item $LinkPath -Force
        if ($Item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            # Hapus junction/symlink lama tanpa menyentuh isi folder target
            [System.IO.Directory]::Delete($LinkPath)
        } else {
            $BackupPath = "$LinkPath.backup-" + (Get-Date -Format "yyyyMMdd-HHmmss")
            Move-Item -Path $LinkPath -Destination $BackupPath -Force
            Write-Host "Folder lama dipindahkan ke: $BackupPath" -ForegroundColor DarkYellow
        }
    }

    New-Item -ItemType Junction -Path $LinkPath -Target $TargetDir | Out-Null
    Write-Host "Junction aktif: $LinkPath -> $TargetDir" -ForegroundColor Green
}

Write-Host "`nSelesai! Restart OpenCode / Antigravity agar semua skill terbaca." -ForegroundColor Cyan

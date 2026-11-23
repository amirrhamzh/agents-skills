#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$SkillsDir = Join-Path $env:USERPROFILE ".agents\skills"
$TempDir   = Join-Path $env:TEMP ("agents-skills-" + [guid]::NewGuid().ToString("N").Substring(0, 8))

function Require-Command($Name) {
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Perintah '$Name' tidak ditemukan. Instal '$Name' terlebih dahulu lalu jalankan ulang skrip ini."
    }
}

Require-Command "git"
Require-Command "npm"

if (-not (Get-Command "python" -ErrorAction SilentlyContinue) -and -not (Get-Command "py" -ErrorAction SilentlyContinue)) {
    Write-Warning "Python 3 tidak terdeteksi. Skill UI/UX Pro Max memerlukan Python 3 saat dijalankan."
}

New-Item -ItemType Directory -Force -Path $SkillsDir, $TempDir | Out-Null

try {
    Write-Host "[1/8] Menginstal farmage/opencode-skills..." -ForegroundColor Cyan
    $FarmageDir = Join-Path $TempDir "opencode-skills"
    git clone --depth 1 https://github.com/farmage/opencode-skills.git $FarmageDir
    Copy-Item (Join-Path $FarmageDir "skills\*") $SkillsDir -Recurse -Force

    Write-Host "[2/8] Menginstal UI/UX Pro Max..." -ForegroundColor Cyan
    npm install -g ui-ux-pro-max-cli
    uipro init --ai universal --global

    Write-Host "[3/8] Menginstal emilkowalski/skills..." -ForegroundColor Cyan
    $EmilDir = Join-Path $TempDir "emilkowalski-skills"
    git clone --depth 1 https://github.com/emilkowalski/skills.git $EmilDir
    Copy-Item (Join-Path $EmilDir "skills\*") $SkillsDir -Recurse -Force

    Write-Host "[4/8] Menginstal Cloudflare Security Audit..." -ForegroundColor Cyan
    $CfDir = Join-Path $TempDir "security-audit-skill"
    git clone --depth 1 https://github.com/cloudflare/security-audit-skill.git $CfDir
    Copy-Item (Join-Path $CfDir "skills\security-audit") $SkillsDir -Recurse -Force

    Write-Host "[5/8] Menginstal obra/superpowers..." -ForegroundColor Cyan
    $SpDir = Join-Path $TempDir "superpowers"
    git clone --depth 1 https://github.com/obra/superpowers.git $SpDir
    Copy-Item (Join-Path $SpDir "skills\*") $SkillsDir -Recurse -Force

    Write-Host "[6/8] Menginstal DietrichGebert/ponytail..." -ForegroundColor Cyan
    $PonyDir = Join-Path $TempDir "ponytail"
    git clone --depth 1 https://github.com/DietrichGebert/ponytail.git $PonyDir
    Copy-Item (Join-Path $PonyDir "skills\*") $SkillsDir -Recurse -Force

    Write-Host "[7/8] Menginstal morluto/rea (skill reverse-engineer-anything)..." -ForegroundColor Cyan
    $ReaDir = Join-Path $TempDir "rea"
    git clone --depth 1 https://github.com/morluto/rea.git $ReaDir
    Copy-Item (Join-Path $ReaDir ".agents\skills\reverse-engineer-anything") $SkillsDir -Recurse -Force

    Write-Host "[8/8] Menginstal amirrhamzh/agents-skills & AGENT_EFFICIENCY.md..." -ForegroundColor Cyan
    if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "skills")) -and (Test-Path (Join-Path $PSScriptRoot "AGENT_EFFICIENCY.md"))) {
        $RepoDir = $PSScriptRoot
    } else {
        $RepoDir = Join-Path $TempDir "agents-skills"
        git clone --depth 1 https://github.com/amirrhamzh/agents-skills.git $RepoDir
    }

    Copy-Item (Join-Path $RepoDir "skills\*") $SkillsDir -Recurse -Force

    $AntigravityRulesDir = Join-Path $env:USERPROFILE ".gemini\config\rules"
    $OpenCodeDir         = Join-Path $env:USERPROFILE ".config\opencode"
    New-Item -ItemType Directory -Force -Path $AntigravityRulesDir, $OpenCodeDir | Out-Null

    $EfficiencySrc  = Join-Path $RepoDir "AGENT_EFFICIENCY.md"
    $EfficiencyText = Get-Content -Path $EfficiencySrc -Raw -Encoding UTF8

    # OpenCode global rules
    Set-Content -Path (Join-Path $OpenCodeDir "AGENTS.md") -Value $EfficiencyText -Encoding UTF8

    # Antigravity global rules (otomatis tambahkan frontmatter trigger: always_on jika belum ada)
    if ($EfficiencyText -notmatch "(?s)^---\s*\r?\n.*?trigger:\s*always_on") {
        $AntigravityText = "---`r`ntrigger: always_on`r`n---`r`n`r`n" + $EfficiencyText
    } else {
        $AntigravityText = $EfficiencyText
    }
    Set-Content -Path (Join-Path $AntigravityRulesDir "AGENT_EFFICIENCY.md") -Value $AntigravityText -Encoding UTF8

    Write-Host "`nMenghubungkan Junction symlink ke OpenCode & Antigravity..." -ForegroundColor Cyan
    $SymlinkScript = Join-Path $RepoDir "setup-symlinks.ps1"
    if (Test-Path $SymlinkScript) {
        & $SymlinkScript
    } else {
        Invoke-Expression (Invoke-RestMethod "https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/setup-symlinks.ps1")
    }

    Write-Host "`nSelesai! Semua skill & symlink aktif di: $SkillsDir" -ForegroundColor Green
    Write-Host "Opsional (Mode Clone REA): jalankan 'npx -y rea-agents@latest setup' (butuh Node.js 22+) lalu restart OpenCode / Antigravity." -ForegroundColor Yellow
}
finally {
    if (Test-Path $TempDir) {
        Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}

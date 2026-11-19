# Vibe Coding Skills (OpenCode & Antigravity)

7 skill modular berbahasa Indonesia + aturan hemat token (`AGENT_EFFICIENCY.md`), terhubung dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills) dan [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill).

## Alur 7 Tahap

| Tahap | Skill | Output di Project | Trigger |
| :--- | :--- | :--- | :--- |
| 1 | `prd` | `.agents/PRD.md` | `"saya punya ide"`, `"buatkan prd"` |
| 2 | `techstack` | `.agents/TECHSTACK.md` | `"pilih tech stack"` |
| 3 | `design` | `.agents/DESIGN.md` | `"desain aplikasi"` |
| 4 | `security` | `.agents/SECURITY.md` | `"security aplikasi"` |
| 5 | `tasks` | `.agents/TASKS.md` & `./AGENTS.md` | `"buat implementasi task"` |
| 6 | `review` | Revisi langsung di kode | `"review hasil"` |
| 7 | `verify` | Laporan audit di chat | `"verifikasi hasil"` |

## Instalasi Lengkap (Windows 11 PowerShell)

### 1. Instal Skill Eksternal ke `~/.agents/skills/`

```powershell
# 1) 67 skill spesialis (hanya folder skills/)
git clone --depth 1 https://github.com/farmage/opencode-skills.git "$env:TEMP\opencode-skills"
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.agents\skills" | Out-Null
Copy-Item "$env:TEMP\opencode-skills\skills\*" "$env:USERPROFILE\.agents\skills" -Recurse -Force
Remove-Item "$env:TEMP\opencode-skills" -Recurse -Force

# 2) UI/UX Pro Max (butuh Node.js & Python 3)
npm install -g ui-ux-pro-max-cli
uipro init --ai universal --global
```

### 2. Salin Skill Repo Ini & Symlink ke OpenCode + Antigravity

```powershell
# Salin 7 skill & aturan hemat token
Copy-Item ".\skills\*" "$env:USERPROFILE\.agents\skills" -Recurse -Force
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\config\rules" | Out-Null
Copy-Item ".\AGENT_EFFICIENCY.md" "$env:USERPROFILE\.gemini\config\rules\AGENT_EFFICIENCY.md" -Force
Copy-Item ".\AGENT_EFFICIENCY.md" "$env:USERPROFILE\.config\opencode\AGENTS.md" -Force

# Hapus folder skills lama lalu buat Junction
Remove-Item "$env:USERPROFILE\.config\opencode\skills", "$env:USERPROFILE\.gemini\config\skills" -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path "$env:USERPROFILE\.config\opencode\skills" -Target "$env:USERPROFILE\.agents\skills"
New-Item -ItemType Junction -Path "$env:USERPROFILE\.gemini\config\skills" -Target "$env:USERPROFILE\.agents\skills"
```

*(Untuk Antigravity, tambahkan `---\ntrigger: always_on\n---` di baris teratas `~/.gemini/config/rules/AGENT_EFFICIENCY.md`).*

## Cara Pakai

Restart OpenCode / Antigravity, buka folder project baru, lalu ketik:

```text
Saya punya ide aplikasi [jelaskan ide singkat], buatkan PRD-nya.
```

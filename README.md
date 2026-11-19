# Vibe Coding Skills (OpenCode & Antigravity)

7 skill modular berbahasa Indonesia + aturan hemat token (`AGENT_EFFICIENCY.md`), terhubung dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills), [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), dan [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill).

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

### 1. Instal Skill Eksternal

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.agents\skills" | Out-Null

# 1) farmage/opencode-skills (67 skill spesialis)
git clone --depth 1 https://github.com/farmage/opencode-skills.git "$env:TEMP\opencode-skills"
Copy-Item "$env:TEMP\opencode-skills\skills\*" "$env:USERPROFILE\.agents\skills" -Recurse -Force
Remove-Item "$env:TEMP\opencode-skills" -Recurse -Force

# 2) UI/UX Pro Max (butuh Node.js & Python 3)
npm install -g ui-ux-pro-max-cli
uipro init --ai universal --global

# 3) Cloudflare Security Audit (butuh Node.js)
git clone --depth 1 https://github.com/cloudflare/security-audit-skill.git "$env:TEMP\security-audit-skill"
Copy-Item "$env:TEMP\security-audit-skill\skills\security-audit" "$env:USERPROFILE\.agents\skills" -Recurse -Force
Remove-Item "$env:TEMP\security-audit-skill" -Recurse -Force
```

*(Alternatif CLI resmi: `npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit --global`, dan untuk macOS/Linux/Git Bash pada `opencode-skills` dapat memakai `./install.sh`).*

### 2. Instal Repo Ini & Symlink Global

```powershell
# 1) Clone repo ini & salin 7 skill + aturan hemat token
git clone --depth 1 https://github.com/amirrhamzh/agents-skills.git "$env:TEMP\agents-skills"
Copy-Item "$env:TEMP\agents-skills\skills\*" "$env:USERPROFILE\.agents\skills" -Recurse -Force

New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\config\rules", "$env:USERPROFILE\.config\opencode" | Out-Null
Copy-Item "$env:TEMP\agents-skills\AGENT_EFFICIENCY.md" "$env:USERPROFILE\.gemini\config\rules\AGENT_EFFICIENCY.md" -Force
Copy-Item "$env:TEMP\agents-skills\AGENT_EFFICIENCY.md" "$env:USERPROFILE\.config\opencode\AGENTS.md" -Force
Remove-Item "$env:TEMP\agents-skills" -Recurse -Force

# 2) Hapus folder skills lama lalu buat Junction ke ~/.agents/skills
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

## Dukungan

Jika kumpulan skill ini membantu alur *vibe coding* Anda, Anda dapat memberi dukungan melalui [Trakteer](https://trakteer.id/amirrhamzh).

## Lisensi

Dirilis di bawah [MIT License](https://www.google.com/search?q=LICENSE). Terintegrasi dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills) (MIT), [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT), dan [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill) (MIT).

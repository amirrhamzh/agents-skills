# Vibe Coding Skills (OpenCode & Antigravity)

7 skill modular berbahasa Indonesia + aturan hemat token (`AGENT_EFFICIENCY.md`), terhubung dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills), [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), [emilkowalski/skills](https://github.com/emilkowalski/skills), dan [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill).

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

## Instalasi Cepat

Prasyarat: `git`, `Node.js` (`npm`), dan `Python 3` (untuk UI/UX Pro Max).

### Windows (PowerShell)

```powershell
# 1) Instal semua skill & aturan hemat token
irm https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/install-skills.ps1 | iex

# 2) Hubungkan Junction symlink ke OpenCode & Antigravity
irm https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/setup-symlinks.ps1 | iex
```

*(Jika sudah clone repo ini, jalankan `.\install-skills.ps1` lalu `.\setup-symlinks.ps1`.)*

### macOS / Linux / Git Bash

```bash
# 1) Instal semua skill & aturan hemat token
curl -fsSL https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/install-skills.sh | bash

# 2) Hubungkan symlink ke OpenCode & Antigravity
curl -fsSL https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/setup-symlinks.sh | bash
```

*(Jika sudah clone repo ini, jalankan `chmod +x install-skills.sh setup-symlinks.sh && ./install-skills.sh && ./setup-symlinks.sh`. Folder lama yang bukan symlink akan otomatis di-backup).*

> Alternatif CLI resmi per repo: `npx skills@latest add emilkowalski/skills` dan `npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit --global`.

## Cara Pakai

Restart OpenCode / Antigravity, buka folder project baru, lalu ketik:

```text
Saya punya ide aplikasi [jelaskan ide singkat], buatkan PRD-nya.
```

## Dukungan

Jika kumpulan skill ini membantu alur *vibe coding* Anda, Anda dapat memberi dukungan melalui [Trakteer](https://www.google.com/search?q=https://trakteer.id/amirrhamzh).

## Lisensi

Dirilis di bawah [MIT License](https://www.google.com/search?q=LICENSE). Terintegrasi dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills) (MIT), [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT), [emilkowalski/skills](https://github.com/emilkowalski/skills) (MIT), dan [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill) (MIT).

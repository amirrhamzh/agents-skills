# Vibe Coding Skills (OpenCode & Antigravity)

7 skill modular berbahasa Indonesia + aturan hemat token (`AGENT_EFFICIENCY.md`), terintegrasi dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills), [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), [emilkowalski/skills](https://github.com/emilkowalski/skills), [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill), [obra/superpowers](https://github.com/obra/superpowers), [dietrichgebert/ponytail](https://github.com/dietrichgebert/ponytail), dan [morluto/rea](https://github.com/morluto/rea).

## Alur 7 Tahap

| Tahap | Skill | Output di Project | Trigger |
| :--- | :--- | :--- | :--- |
| 1 | `prd` | `.agents/PRD.md` | `"saya punya ide"`, `"buatkan prd"`, `"clone web/app ini dan buatkan prd"` |
| 2 | `techstack` | `.agents/TECHSTACK.md` | `"pilih tech stack"` |
| 3 | `design` | `.agents/DESIGN.md` | `"desain aplikasi"` |
| 4 | `security` | `.agents/SECURITY.md` | `"security aplikasi"` |
| 5 | `tasks` | `.agents/TASKS.md` & `./AGENTS.md` | `"buat implementasi task"` |
| 6 | `review` | Revisi langsung di kode | `"review hasil"` |
| 7 | `verify` | Laporan audit di chat | `"verifikasi hasil"` |

### Aturan Koeksistensi & Hierarki

- **Sumber Kebenaran Utama**: 5 file di `.agents/` (`PRD.md`, `TECHSTACK.md`, `DESIGN.md`, `SECURITY.md`, `TASKS.md`) selalu menjadi prioritas tertinggi.
- **`obra/superpowers`**: Berjalan sebagai lapisan disiplin eksekusi (*brainstorming*, TDD, *systematic debugging*, *code review*, dan *verification-before-completion*) tanpa menduplikasi dokumen di `docs/plans/`.
- **`dietrichgebert/ponytail`**: Aktif dalam mode default (`lite`/`full`) sebagai disiplin YAGNI untuk mencegah *over-engineering* dan *bloat* tanpa menimpa `./AGENTS.md` proyek. Aturan minimalisme Ponytail tidak boleh memangkas komponen UI/4 state layar di `DESIGN.md`, library terkunci di `TECHSTACK.md`, maupun validasi & keamanan di `SECURITY.md`. Pada tahap `verify`, `/ponytail-review` atau `/ponytail-audit` dapat dijalankan secara opsional sebagai pembersihan akhir *dead code* & *technical debt*.
- **`morluto/rea` (`reverse-engineer-anything`)**: Bersifat kondisional — hanya aktif otomatis di tahap `prd` saat diminta meng-clone/membedah web atau aplikasi target (*Mode Clone*), dan **tidak dipanggil** pada pembuatan PRD normal maupun implementasi rutin.

## Instalasi Cepat

Prasyarat: `git`, `Node.js` (disarankan `22+` untuk REA MCP), `npm`, dan `Python 3` (untuk UI/UX Pro Max).

> Skrip instalasi **otomatis menjalankan `setup-symlinks`** di akhir, sehingga instalasi skill, aturan global `AGENT_EFFICIENCY.md`, dan penghubungan symlink ke OpenCode & Antigravity cukup dilakukan dalam **1 langkah**.

### Windows — 1x Klik (Rekomendasi)

1. Clone atau unduh (ZIP) repositori ini lalu ekstrak.
2. Klik ganda **`CLICK-TO-INSTALL.bat`**.
3. Tunggu hingga selesai — semua skill, aturan hemat token, dan Junction symlink ke OpenCode & Antigravity akan langsung aktif.

### Windows — PowerShell (1 Perintah)

```powershell
irm https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/install-skills.ps1 | iex
```

*(Jika sudah clone repo ini, jalankan `.\install-skills.ps1`. Jika suatu saat hanya ingin menghubungkan ulang symlink, jalankan `.\setup-symlinks.ps1`.)*

### macOS / Linux / Git Bash

```bash
curl -fsSL https://raw.githubusercontent.com/amirrhamzh/agents-skills/main/install-skills.sh | bash
```

*(Jika sudah clone repo ini, jalankan sekali `chmod +x install-skills.sh setup-symlinks.sh`, setelah itu cukup klik ganda `install-skills.sh` atau jalankan `./install-skills.sh`. Folder lama yang bukan symlink akan otomatis di-backup.)*

### Aktivasi MCP Server REA (Opsional — Khusus Mode Clone Web/App)

Agar fitur bedah web/app di tahap `prd` dapat mengakses MCP server REA secara lokal, jalankan sekali perintah berikut setelah instalasi lalu restart OpenCode / Antigravity:

```bash
npx -y rea-agents@latest setup
```

> Alternatif CLI/plugin resmi: `npx skills@latest add emilkowalski/skills`, `npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit --global`, `npx skills add dietrichgebert/ponytail -g`, `npx skills add morluto/rea --skill reverse-engineer-anything -g`, atau plugin native Superpowers (`agy plugin install https://github.com/obra/superpowers` di Antigravity).

## Cara Pakai

Restart OpenCode / Antigravity, buka folder project baru, lalu ketik:

```text
# Mode Normal (tanpa memanggil REA):
Saya punya ide aplikasi [jelaskan ide singkat], buatkan PRD-nya.

# Mode Clone / Bedah Web & App (otomatis memanggil REA):
Coba clone web/app ini [URL atau path aplikasi] dan buatkan PRD-nya.
```

## Dukungan

Jika kumpulan skill ini membantu alur *vibe coding* Anda, Anda dapat memberi dukungan melalui [Trakteer](https://trakteer.id/amirrhamzh).

## Lisensi

Dirilis di bawah [MIT License](LICENSE). Terintegrasi dengan [farmage/opencode-skills](https://github.com/farmage/opencode-skills) (MIT), [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT), [emilkowalski/skills](https://github.com/emilkowalski/skills) (MIT), [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill) (MIT), [obra/superpowers](https://github.com/obra/superpowers) (MIT), [dietrichgebert/ponytail](https://github.com/dietrichgebert/ponytail) (MIT), dan [morluto/rea](https://github.com/morluto/rea) (MIT).

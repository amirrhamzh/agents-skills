---
name: tasks
description: Pecah spesifikasi .agents/ menjadi rencana kerja ./.agents/TASKS.md lalu buat ./AGENTS.md di root project dengan disiplin YAGNI dari Ponytail & Superpowers. Gunakan saat user menulis "buat implementasi task", "buatkan task", "pecah task", "rencana implementasi", "daftar tugas coding", atau "mulai implementasi".
metadata:
  version: "2.4.0"
---
# Tasks & AGENTS.md (Tahap 5)

## Koneksi Skill Eksternal

- **Perencanaan & Eksekusi (Superpowers)**: Ikuti standar granular `writing-plans` (path file & kriteria uji jelas), lalu eksekusi dengan `executing-plans` (inline/hemat token) atau `subagent-driven-development` (subagent + review 2 tahap) disertai `test-driven-development` (RED-GREEN-REFACTOR). Opsional: `using-git-worktrees` untuk branch terisolasi.
- **Disiplin YAGNI (Ponytail)**: Aktifkan `ponytail` mode default (`lite`/`full`) untuk mencegah *over-engineering* & abstraksi prematur, dan memprioritaskan *standard library* / kode eksisting selama tidak melanggar `TECHSTACK.md`.
- **Implementasi & Audit Spesialis**: `fullstack-guardian` + skill bahasa/framework/DB dari `./.agents/TECHSTACK.md`, `secure-code-guardian` (+ `api-designer`), `test-master` (+ `playwright-expert`), `systematic-debugging` + `debugging-wizard`, `requesting-code-review`, dan `devops-engineer`.

## Alur Kerja

1. **Baca Konteks**: Baca `./AGENTS.md` (jika ada) paling awal, lalu `./.agents/PRD.md`, `./.agents/TECHSTACK.md`, `./.agents/DESIGN.md`, dan `./.agents/SECURITY.md`.
2. **Buat `./.agents/TASKS.md`** (jangan buat file plan duplikat di `docs/plans/`): Susun tugas atomik & *testable* dalam 5 milestone berurutan:
   - **M1: Inisialisasi CLI, Security Dasar & Token Desain** (WAJIB pakai CLI resmi dari `TECHSTACK.md` — dilarang tulis boilerplate manual; buat `.geminiignore`, `.env.example`, security headers, token desain).
   - **M2: Skema Database & Validasi Input** (migrasi, relasi, seed, validator server).
   - **M3: Backend, Auth & Proteksi Endpoint** (auth, RBAC/anti-IDOR, rate limit, API fitur Must-Have).
   - **M4: UI, Sanitasi & 4 Kondisi Layar** (halaman, form, aksesibilitas, state *Normal/Loading/Empty/Error*).
   - **M5: Integrasi Akhir & Persiapan Review** (uji alur end-to-end, responsivitas).
   - Format tiap task: `- [ ] **T-X.Y: Nama Task** | Skill: <nama-skill> | Acuan: ... | File: ... | Kriteria Selesai: ...`
3. **Buat `./AGENTS.md` di Root Project** (**DILARANG menimpa `./AGENTS.md` proyek** dengan template `AGENTS.md` bawaan `dietrichgebert/ponytail`), wajib memuat:
   - **Aturan Baca Pertama**: Wajib membaca `./AGENTS.md` paling awal sebelum file di `./.agents/`.
   - **Hierarki Sumber Kebenaran**: 5 file di `.agents/` (`1. PRD.md` -> `2. TECHSTACK.md` -> `3. DESIGN.md` -> `4. SECURITY.md` -> `5. TASKS.md`) selalu prioritas tertinggi. Dilarang membuat file duplikat di `docs/plans/`, `REVIEW.md`, atau `VERIFY.md`.
   - **Peran & Batas Minimalisme Ponytail**: Ponytail (`lite`/`full`) adalah panduan gaya coding YAGNI, **bukan** pengganti spesifikasi, dan **tidak boleh** memotong: (1) validasi, *error handling*, & kontrol `SECURITY.md`, (2) library di `TECHSTACK.md`, (3) UI, *micro-interaction*, aksesibilitas, & 4 state layar di `DESIGN.md`, maupun (4) fitur/AC di `PRD.md` & `TASKS.md`.
   - **Daftar Skill Aktif**: Skill stack terpilih dari `TECHSTACK.md` + `executing-plans`, `subagent-driven-development`, `test-driven-development`, `ponytail` (`lite`/`full`), `systematic-debugging`, `secure-code-guardian`, `code-reviewer`, `security-reviewer`, `security-audit`, `verification-before-completion`. (Catat bahwa `reverse-engineer-anything`/REA hanya untuk Mode Clone di `prd`, bukan implementasi normal).
   - **Daftar Ignore (DILARANG Dibaca)** & **Aturan CLI**: `node_modules/`, `.next/`, `dist/`, `build/`, `.git/`, `vendor/`, `__pycache__/`, `.venv/`, `target/`, `coverage/`, `*.lock`, plus perintah `dev`/`build`/`lint`/`test`.
4. **Eksekusi & Handoff**: Muat skill di tiap task, ubah status `- [/]` lalu `- [x]` setelah teruji. Saat semua task `- [x]`, arahkan user ke `"review hasil"` (`review`).

---
name: tasks
description: Pecah rencana implementasi ke .agents/TASKS.md lalu buat AGENTS.md di root project. Gunakan saat user menulis "buat implementasi task", "buatkan task", "pecah task", "rencana implementasi", "daftar tugas coding", atau "mulai implementasi".
metadata:
  version: "2.2.0"
---
# Tasks & AGENTS.md (Tahap 5)

## Koneksi Skill Eksternal

Saat memecah & mengeksekusi task, hubungkan setiap pekerjaan ke skill spesialis yang sesuai:
- **Implementasi Fitur**: `fullstack-guardian` + skill bahasa/framework/DB dari `./.agents/TECHSTACK.md`.
- **Auth & Proteksi API**: `secure-code-guardian` (+ `api-designer` jika membangun REST/OpenAPI).
- **Testing & Debugging**: `test-master` (+ `playwright-expert` untuk E2E web) dan `debugging-wizard` saat muncul error.
- **Deploy & Infra**: `devops-engineer`.

## Alur Kerja

1. **Baca Konteks**: Baca `./AGENTS.md` (jika ada) paling awal, lalu `./.agents/PRD.md`, `./.agents/TECHSTACK.md`, `./.agents/DESIGN.md`, dan `./.agents/SECURITY.md`.
2. **Buat `./.agents/TASKS.md`**: Susun daftar tugas dalam 5 milestone berurutan:
   - **M1: Inisialisasi CLI, Security Dasar & Token Desain** (WAJIB pakai perintah CLI resmi dari `TECHSTACK.md` seperti `npx create-next-app@latest` / `npm install` — dilarang tulis boilerplate manual; buat `.geminiignore`, `.env.example`, security headers, token desain).
   - **M2: Skema Database & Validasi Input** (migrasi, relasi, seed, validator server).
   - **M3: Backend, Auth & Proteksi Endpoint** (auth, RBAC/anti-IDOR, rate limit, API fitur Must-Have).
   - **M4: UI, Sanitasi & 4 Kondisi Layar** (halaman, form, state *Normal/Loading/Empty/Error* sesuai token desain).
   - **M5: Integrasi Akhir & Persiapan Review** (uji alur end-to-end, responsivitas).
   - Format tiap task: `- [ ] **T-X.Y: Nama Task** | Skill: <nama-skill> | Acuan: ... | File: ... | Kriteria Selesai: ...`
3. **Buat `./AGENTS.md` di Root Project**: Segera setelah 5 file di `.agents/` selesai, buat `./AGENTS.md` berisi:
   - **Aturan Baca Pertama**: Wajib membaca `./AGENTS.md` paling awal sebelum file di `./.agents/`.
   - **Urutan Baca `.agents/`**: `1. PRD.md` -> `2. TECHSTACK.md` -> `3. DESIGN.md` -> `4. SECURITY.md` -> `5. TASKS.md` (tanpa file review/verify di `.agents/`).
   - **Skill Spesialis Aktif**: Daftar skill eksternal terpilih dari `TECHSTACK.md` + `fullstack-guardian`, `secure-code-guardian`, `debugging-wizard`, `test-master`, `code-reviewer`, `security-reviewer`.
   - **Daftar Ignore (DILARANG Dibaca)**: `node_modules/`, `.next/`, `dist/`, `build/`, `.git/`, `vendor/`, `__pycache__/`, `.venv/`, `target/`, `coverage/`, dan `*.lock`.
   - **Aturan CLI & Guardrail**: Wajib pakai CLI resmi framework/library, perintah `dev`/`build`/`lint`/`test`, dan ringkasan guardrail Desain & Security.
4. **Eksekusi & Handoff**: Muat skill yang tercantum di task, kerjakan bertahap (ubah status `- [/]` lalu `- [x]` di `./.agents/TASKS.md` setelah diuji). Saat semua task `- [x]`, arahkan user meninjau hasil: `"review hasil"` (`review`).

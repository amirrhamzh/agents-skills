---
name: verify
description: Verifikasi hasil akhir aplikasi (build, test, PRD, Tech Stack, Design, Security, plus opsi pembersihan bloat Ponytail) dengan membaca AGENTS.md paling awal tanpa membuat file di .agents/. Gunakan saat user menulis "verifikasi hasil", "verify project", "cek hasil akhir", "audit aplikasi", atau "apakah sudah sesuai prd".
metadata:
  version: "2.5.0"
---
# Verify (Tahap 7)

## Koneksi Skill Eksternal

Muat skill audit berikut secara berurutan:
- `verification-before-completion` (Superpowers) -> wajib jalankan perintah verifikasi dan cek output aktual sebelum mengklaim lulus.
- `test-master` (+ `playwright-expert` untuk E2E web) & `systematic-debugging` + `debugging-wizard` (jika ada error).
- `requesting-code-review` (Superpowers) + `code-reviewer` -> audit kualitas, keterbacaan, dan *edge cases*.
- `security-reviewer` & `security-audit` (`cloudflare/security-audit-skill`) -> audit kepatuhan terhadap `./.agents/SECURITY.md`.
- `ponytail-review` / `ponytail-audit` (opsional, hanya setelah langkah 1–3 lulus) -> pembersihan *bloat* & *dead code*.
- `devops-engineer` & `finishing-a-development-branch` (Superpowers, opsional saat siap rilis/merge) -> cek kesiapan deploy & penyelesaian branch/PR.

## Alur Kerja

1. **Baca Konteks & Cek Review**: Wajib baca `./AGENTS.md` di root project paling awal, lalu baca `./.agents/PRD.md`, `./.agents/TECHSTACK.md`, `./.agents/DESIGN.md`, `./.agents/SECURITY.md`, dan `./.agents/TASKS.md`. Jika user belum meninjau hasil aplikasi, jalankan `review` terlebih dahulu.
2. **Verifikasi Bukti Nyata (`verification-before-completion`)**:
   - Jalankan `build`, `typecheck`, `lint`, `test`, dan audit kerentanan dependensi secara nyata di terminal project (bukan asumsi).
   - Jika ada error, muat `systematic-debugging` + `debugging-wizard`, perbaiki langsung, dan jalankan ulang hingga kode keluar `0`.
   - Pastikan seluruh item `./.agents/TASKS.md` bertanda `- [x]` dan seluruh fitur Must-Have di `./.agents/PRD.md` terpenuhi.
3. **Audit Desain, Tech Stack, Kode & Keamanan**:
   - **Design & Stack** (`code-reviewer`): Patuh pada `./.agents/TECHSTACK.md` & `./.agents/DESIGN.md` (token desain, komponen UI, 4 state layar *Normal/Loading/Empty/Error*, *micro-interaction*, aksesibilitas/kontras/ARIA, `tabular-nums`, responsif).
   - **Security** (`security-reviewer` & `security-audit`): Patuh pada `./.agents/SECURITY.md` (validasi input server, auth/RBAC/anti-IDOR, anti-injeksi/XSS/CSRF, security headers, proteksi secret/env, *error handling* aman).
4. **Opsional — Pembersihan Bloat (`ponytail-review` / `ponytail-audit`)**:
   - Jalankan hanya setelah langkah 1–3 **lulus**, khusus untuk memangkas *bloat*, *dead code*, duplikasi, dan abstraksi berlebihan.
   - **Guardrail Ketat**: Dilarang menghapus/melemahkan validasi data, *error handling*, kontrol `SECURITY.md`, aksesibilitas/*micro-interaction*/komponen/4 state layar dari `DESIGN.md`, atau fitur & tes dari `PRD.md`/`TASKS.md`.
   - Jika ada perubahan dari pembersihan ini, **wajib jalankan ulang `build` dan `test`** (`verification-before-completion`) untuk memastikan nol regresi.
5. **Sajikan Laporan Akhir di Chat**: Tampilkan status `LULUS VERIFIKASI (PASSED)`, hasil aktual `build`/`lint`/`test`, kepatuhan 5 dokumen `.agents/`, temuan & perbaikan `code-reviewer`/`security-reviewer`/`security-audit`, ringkasan `ponytail-review`/`ponytail-audit` (jika dijalankan), serta opsi `finishing-a-development-branch` atau perintah deploy.

## Aturan

- **DILARANG** membuat file `VERIFY.md` di dalam folder `.agents/`.
- Jangan pernah klaim lulus tanpa benar-benar menjalankan perintah verifikasi di terminal.
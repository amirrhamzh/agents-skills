---
name: verify
description: Verifikasi hasil akhir aplikasi (build, test, PRD, Tech Stack, Design, Security) dengan membaca AGENTS.md paling awal tanpa membuat file di .agents/. Gunakan saat user menulis "verifikasi hasil", "verify project", "cek hasil akhir", "audit aplikasi", atau "apakah sudah sesuai prd".
metadata:
  version: "2.2.0"
---
# Verify (Tahap 7)

## Koneksi Skill Eksternal

Muat skill audit berikut secara berurutan saat memverifikasi hasil akhir:
- `test-master` (+ `playwright-expert` jika aplikasi web perlu uji E2E) -> validasi unit, integrasi, dan E2E test.
- `code-reviewer` -> audit kualitas, kerapian, dan potensi bug pada kode.
- `security-reviewer` -> audit celah keamanan terhadap `./.agents/SECURITY.md`.
- `devops-engineer` (opsional saat siap rilis) -> cek kesiapan konfigurasi build & deployment.

## Alur Kerja

1. **Baca Konteks & Cek Review**: Wajib baca `./AGENTS.md` di root project paling awal, lalu baca `./.agents/PRD.md`, `./.agents/TECHSTACK.md`, `./.agents/DESIGN.md`, `./.agents/SECURITY.md`, dan `./.agents/TASKS.md`. Jika user belum meninjau hasil aplikasi, jalankan `review` terlebih dahulu.
2. **Jalankan Pemeriksaan Teknis**:
   - Jalankan `build`, `typecheck`, `lint`, `test`, dan audit kerentanan dependensi di terminal project.
   - Jika ada error, muat `debugging-wizard`, perbaiki kode langsung, dan jalankan ulang hingga kode keluar `0`.
3. **Audit Kesesuaian Spesifikasi**:
   - **PRD & Tasks**: Semua fitur Must-Have berfungsi penuh dan seluruh ceklis `./.agents/TASKS.md` bertanda `- [x]`.
   - **Tech Stack & Security** (`security-reviewer`): Sesuai `./.agents/TECHSTACK.md` & `./.agents/SECURITY.md` (validasi input server, anti-injeksi, anti-XSS/CSRF/IDOR, security headers, tanpa hardcoded secret).
   - **Design Anti-AI-Slop** (`code-reviewer`): Sesuai `./.agents/DESIGN.md`, 4 state layar lengkap (*Normal/Loading/Empty/Error*), `tabular-nums`, dan responsif.
4. **Sajikan Laporan Akhir di Chat**: Tampilkan status `LULUS VERIFIKASI (PASSED)`, ringkasan hasil build/test, tabel keterlacakan fitur PRD, checklist kepatuhan Design & Security, serta perintah deploy.

## Aturan

- **DILARANG** membuat file `VERIFY.md` di dalam folder `.agents/`.
- Jangan pernah klaim lulus tanpa benar-benar menjalankan perintah verifikasi di terminal.
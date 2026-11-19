---
name: security
description: Buat standar keamanan aplikasi sebelum tahap Task dan simpan ke .agents/SECURITY.md. Gunakan saat user menulis "security aplikasi", "keamanan aplikasi", "buatkan security", "amankan aplikasi", "standar keamanan", atau "lanjut security".
metadata:
  version: "2.3.0"
---
# Security (Tahap 4)

## Koneksi Skill Eksternal

- Muat `secure-code-guardian` untuk standar implementasi aman & mitigasi OWASP sesuai `./.agents/TECHSTACK.md`.
- Gunakan `security-audit` (mode *guidance*) untuk memetakan *trust boundaries* & *attack classes* relevan (auth, client-side, data isolation, cloud, atau AI/LLM) ke dalam `./.agents/SECURITY.md`.
- Tetapkan `security-reviewer` (audit cepat) dan `security-audit` (audit mendalam berbasis bukti) untuk tahap `verify`.

## Alur Kerja

1. **Baca Konteks**: Baca `./AGENTS.md` (jika ada) paling awal, lalu `./.agents/PRD.md`, `./.agents/TECHSTACK.md`, dan `./.agents/DESIGN.md`.
2. **Tanyakan Pilihan Keamanan**: Beri 1 rekomendasi terbaik sesuai arsitektur project:
   1. **Autentikasi & Otorisasi**: A) Cookie `HttpOnly` + `Secure` + `SameSite` & RBAC/Ownership Check | B) OAuth/Passkeys + Validasi Sesi Server | C) Short-Lived JWT + Refresh Rotation | D) Aplikasi Publik/Lokal (Proteksi input & storage)
   2. **Proteksi Endpoint & API**: A) Rate Limiting per IP/User + CSRF + Batas Payload | B) HMAC Webhook Verification + CORS Ketat | C) Validasi Skema Internal
   3. **Keamanan Data & Upload**: A) Password Hash (`Argon2id`/`bcrypt`) + RLS/Filter Kepemilikan + Masking PII | B) Validasi Upload (MIME magic bytes, batas ukuran, UUID filename) | C) Enkripsi Kolom Sensitif
   4. **Headers & Secrets**: A) Security Headers Lengkap (CSP, HSTS, X-Frame-Options DENY, nosniff) + Pisah Env Server/Publik | B) Audit CVE Dependensi + Validasi `.env` saat start
3. **Buat `./.agents/SECURITY.md`**:
   - Peta *trust boundaries*, kebijakan auth, matriks akses, skema validasi, rate limit, security headers, dan checklist keamanan untuk `./.agents/TASKS.md`.
4. **Handoff**: Setelah tersimpan, arahkan ke tahap berikutnya: `"buat implementasi task"` (`tasks`).

## Aturan Keamanan Mutlak

- **Anti-Injeksi**: Wajib Parameterized Queries / ORM; dilarang menyambung string input ke SQL atau shell `exec`.
- **Zero-Trust Input & Anti-XSS**: Validasi semua input di server (Zod/Pydantic/setara) dan larang render HTML mentah tanpa sanitasi.
- **Anti-IDOR & Secrets**: Cek kepemilikan data di tiap query mutasi/baca, larang hardcode secret di kode/frontend (`NEXT_PUBLIC_`/`VITE_`), dan sembunyikan stack trace dari respons klien.
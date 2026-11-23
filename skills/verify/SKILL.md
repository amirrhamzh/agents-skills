---
name: verify
description: Tahap 7 pipeline — Verifikasi menyeluruh sebelum penyelesaian terhadap seluruh dokumen .agents/, review kode & keamanan, serta langkah opsional pembersihan bloat menggunakan Ponytail.
---

# Skill: Verify (Tahap Verifikasi Akhir)

## Tujuan
Memastikan seluruh implementasi benar-benar selesai, teruji, aman, dan patuh 100% terhadap seluruh spesifikasi di `./.agents/` sebelum pekerjaan dinyatakan selesai.

## Urutan Pemeriksaan Wajib

### 1. Verifikasi Bukti Nyata (`verification-before-completion`)
- Jalankan ulang *build*, *typecheck*, *linter*, dan seluruh *test suite* secara nyata (bukan asumsi).
- Pastikan seluruh item di `./.agents/TASKS.md` telah tuntas dan sesuai dengan `./.agents/PRD.md`.

### 2. Pemeriksaan Desain & Kepatuhan Stack
- Verifikasi implementasi UI terhadap `./.agents/DESIGN.md`:
  - Token desain dan komponen UI sesuai spesifikasi.
  - Seluruh **4 state layar** (*Normal*, *Loading*, *Empty*, *Error*) berfungsi dengan benar.
  - *Micro-interaction* dan aksesibilitas (navigasi keyboard, kontras, ARIA) terpenuhi.
- Verifikasi bahwa dependensi dan arsitektur mematuhi `./.agents/TECHSTACK.md`.

### 3. Review Kode & Audit Keamanan
- Jalankan **`code-reviewer`** untuk memeriksa kualitas kode, keterbacaan, dan *edge cases*.
- Jalankan **`security-reviewer`** dan **`security-audit`** (`cloudflare/security-audit-skill`) untuk memverifikasi kepatuhan terhadap `./.agents/SECURITY.md` (validasi input, autentikasi/otorisasi, proteksi rahasia/env, dan *error handling* aman).

### 4. Langkah Opsional Pembersihan Akhir (`ponytail-review` / `ponytail-audit`)
Setelah seluruh pemeriksaan di langkah 1–3 **lulus**, jalankan `/ponytail-review` atau `/ponytail-audit` secara opsional dengan pembagian peran yang tegas:
- **Fokus Pembersihan**: Khusus untuk mendeteksi dan memangkas *bloat*, *dead code*, duplikasi tidak perlu, abstraksi berlebihan, dan *technical debt*.
- **Guardrail Ketat (Dilarang Dilanggar)**: Pembersihan Ponytail **tidak boleh** menghapus atau melemahkan:
  - Validasi data dan *error handling*.
  - Kontrol keamanan yang disyaratkan `./.agents/SECURITY.md`.
  - Aksesibilitas, *micro-interaction*, komponen UI terkunci, atau 4 state layar dari `./.agents/DESIGN.md`.
  - Fitur atau skenario pengujian yang diwajibkan di `./.agents/PRD.md` dan `./.agents/TASKS.md`.
- Jika ada perubahan dari langkah pembersihan ini, **wajib jalankan ulang test dan build** (`verification-before-completion`) untuk memastikan tidak ada regresi.

## Format Laporan Verifikasi
Sajikan ringkasan hasil verifikasi yang mencakup:
1. Status *build*, *lint*, dan *test* (beserta hasil eksekusi aktual).
2. Status kepatuhan terhadap `PRD.md`, `TECHSTACK.md`, `DESIGN.md`, `SECURITY.md`, dan `TASKS.md`.
3. Temuan `code-reviewer`, `security-reviewer`, dan `security-audit` (serta perbaikannya).
4. Ringkasan hasil `/ponytail-review` / `/ponytail-audit` (jika dijalankan).
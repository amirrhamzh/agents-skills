---
name: tasks
description: Tahap 5 pipeline — Memecah spesifikasi .agents/ menjadi rencana kerja ./.agents/TASKS.md dan menghasilkan ./AGENTS.md di root proyek dengan disiplin YAGNI dari Ponytail.
---

# Skill: Tasks (`./.agents/TASKS.md` & `./AGENTS.md`)

## Tujuan
Menyusun daftar tugas terstruktur yang dapat dieksekusi secara bertahap di `./.agents/TASKS.md` sekaligus menghasilkan `./AGENTS.md` di root proyek sebagai sumber kebenaran utama (*single source of truth*) bagi seluruh agen selama fase implementasi.

## Prasyarat
Baca seluruh dokumen spesifikasi di `./.agents/` sebelum membuat rencana kerja:
1. `./.agents/PRD.md`
2. `./.agents/TECHSTACK.md`
3. `./.agents/DESIGN.md`
4. `./.agents/SECURITY.md`

## Output Wajib
1. **`./.agents/TASKS.md`**:
   - Pecah pekerjaan menjadi fase/milestone kecil yang atomik, terurut berdasarkan dependensi, dan dapat diuji (*testable*).
   - Sertakan kriteria penerimaan (*acceptance criteria*) untuk tiap tugas, mencakup fungsionalitas (`PRD.md`), 4 state layar & aksesibilitas (`DESIGN.md`), serta kontrol keamanan (`SECURITY.md`).
2. **`./AGENTS.md` (Root Proyek)**:
   - Wajib dibuat di root proyek sebagai panduan utama agen.
   - **Dilarang menimpa `./AGENTS.md` proyek** dengan file `AGENTS.md` bawaan milik `dietrichgebert/ponytail`.
   - Catat secara eksplisit hierarki sumber kebenaran, alur eksekusi, dan daftar skill aktif.

## Panduan Eksekusi & Integrasi Skill
- Jalankan implementasi tugas menggunakan **`executing-plans`** atau **`subagent-driven-development`** disertai disiplin **TDD** (*Test-Driven Development*) dari `obra/superpowers`.
- Aktifkan **`dietrichgebert/ponytail`** dalam **mode default (`lite` atau `full`)** sebagai disiplin YAGNI saat menulis kode:
  - Hindari *over-engineering*, abstraksi prematur, dan kode membengkak.
  - Prioritaskan *standard library* dan kode eksisting selama tidak melanggar `TECHSTACK.md`.

## Hierarki Aturan & Guardrail (Wajib Dicantumkan di `./AGENTS.md`)
Pastikan `./AGENTS.md` yang dihasilkan memuat blok aturan prioritas berikut:

1. **Sumber Kebenaran Utama**: 5 dokumen di `./.agents/` (`PRD.md`, `TECHSTACK.md`, `DESIGN.md`, `SECURITY.md`, `TASKS.md`) **selalu memiliki prioritas tertinggi**.
2. **Peran Ponytail**: Ponytail (`lite`/`full`) aktif sebagai panduan gaya coding YAGNI, **bukan** pengganti spesifikasi proyek.
3. **Batas Minimalisme**: Aturan minimalisme Ponytail **tidak boleh** memotong:
   - Validasi input, *error handling*, dan kontrol keamanan dari `SECURITY.md`.
   - Library/dependensi yang sudah dikunci di `TECHSTACK.md`.
   - Komponen UI, *micro-interaction*, aksesibilitas, dan 4 state layar (*Normal/Loading/Empty/Error*) dari `DESIGN.md`.
   - Fitur atau *acceptance criteria* dari `PRD.md` dan `TASKS.md`.
4. **Daftar Skill Aktif**: Cantumkan skill yang dipakai di proyek (termasuk `executing-plans`, `subagent-driven-development`, `ponytail` mode `lite`/`full`, `secure-code-guardian`, `code-reviewer`, `security-reviewer`, `security-audit`, dan `verification-before-completion`).

## Kriteria Selesai
- `./.agents/TASKS.md` mencakup seluruh kebutuhan dari 4 dokumen `.agents/` tanpa celah.
- `./AGENTS.md` terbuat di root proyek, memuat hierarki aturan di atas, dan tidak tertimpa oleh template eksternal mana pun.
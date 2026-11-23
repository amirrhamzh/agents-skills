---
name: design
description: Tahap 3 pipeline — Menyusun spesifikasi UI/UX, token desain, komponen, aksesibilitas, micro-interaction, dan 4 state layar ke dalam ./.agents/DESIGN.md dengan aturan koeksistensi Ponytail.
---

# Skill: Design (`./.agents/DESIGN.md`)

## Tujuan
Menghasilkan spesifikasi desain antarmuka dan pengalaman pengguna yang lengkap, konsisten, dan siap dieksekusi di `./.agents/DESIGN.md` berdasarkan `./.agents/PRD.md` dan `./.agents/TECHSTACK.md`.

## Prasyarat
- Baca `./.agents/PRD.md` untuk memahami fitur, alur pengguna (*user flow*), dan batasan produk.
- Baca `./.agents/TECHSTACK.md` untuk mematuhi framework frontend, styling, dan library UI yang sudah dikunci (mis. Tailwind CSS, `shadcn/ui`, Radix, dll.).

## Integrasi Skill Pendukung
- Gunakan **`ui-ux-pro-max`** untuk merancang sistem desain, tipografi, palet warna, hierarki visual, dan tata letak responsif.
- Gunakan **`emilkowalski/skills`** untuk menyusun panduan *micro-interaction*, transisi halus, dan detail *polish* antarmuka.

## Struktur Wajib `./.agents/DESIGN.md`
1. **Prinsip Desain & Identitas Visual**: Arah estetika, kontras, dan konsistensi lintas halaman.
2. **Design Tokens**: Warna (termasuk *light/dark mode* jika relevan), tipografi, *spacing*, *border radius*, *shadow*, dan *z-index*.
3. **Library & Komponen UI**: Daftar komponen standar (mis. `shadcn/ui` atau komponen kustom) serta varian dan propertinya.
4. **Layout & Responsivitas**: *Breakpoint*, struktur navigasi, dan perilaku *mobile-first* / *desktop*.
5. **4 State Layar Wajib** (untuk setiap halaman/modul utama):
   - **Normal** (data tersedia dan siap digunakan)
   - **Loading** (*skeleton* / indikator proses tanpa *layout shift*)
   - **Empty** (pesan informatif + *call-to-action* yang jelas)
   - **Error** (pesan ramah pengguna + opsi *retry* / pemulihan)
6. **Micro-Interaction & Animasi**: Durasi, *easing*, *hover/focus/active states*, dan preferensi `prefers-reduced-motion`.
7. **Aksesibilitas (WCAG)**: Kontras warna, navigasi keyboard, *focus ring*, label ARIA, dan struktur semantik HTML.

## Aturan Koeksistensi dengan `dietrichgebert/ponytail`
- **Prioritas Spesifikasi**: Seluruh token desain, library UI terkunci (`shadcn/ui`, dsb.), *micro-interaction*, standar aksesibilitas, dan **4 state layar** yang ditetapkan di `./.agents/DESIGN.md` **selalu menang** di atas aturan minimalisme Ponytail.
- **Larangan Mode Agresif**: **Jangan gunakan mode `/ponytail ultra`** pada pekerjaan UI/frontend yang berpotensi memangkas komponen UI wajib, animasi, atau *state handling*.
- **Larangan Penggantian Native Sepihak**: Jangan mengganti komponen UI yang sudah dikunci di `DESIGN.md` (mis. *date picker* atau *select* dari `shadcn/ui`) menjadi elemen native browser standar (`<input type="date">`, `<select>`) hanya demi mengurangi baris kode, kecuali memang diizinkan secara eksplisit di `DESIGN.md`.

## Kriteria Selesai
- File `./.agents/DESIGN.md` tersimpan rapi dan konsisten dengan `PRD.md` serta `TECHSTACK.md`.
- Seluruh 4 state layar (*Normal*, *Loading*, *Empty*, *Error*) dan standar aksesibilitas terdokumentasi dengan jelas.
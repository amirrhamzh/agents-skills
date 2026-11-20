---
name: design
description: Buat sistem desain Anti-AI-Slop interaktif selaras standar UI/UX Pro Max dan simpan ke .agents/DESIGN.md. Gunakan saat user menulis "desain aplikasi", "buatkan design", "sistem desain", "ui ux aplikasi", "styling aplikasi", atau "agar design tidak ai-slop".
metadata:
  version: "2.4.0"
---
# Design Anti-AI-Slop (Tahap 3)

## Koneksi Skill Eksternal

- Jika `ui-ux-pro-max` terpasang, gunakan untuk mencari rekomendasi palet, tipografi, pola industri (`--design-system` / `--stack`), dan preset animasi (`--domain gsap` opsional untuk landing page/interaksi kompleks), lalu simpan hasilnya ke `./.agents/DESIGN.md`.
- Selaraskan pola komponen & styling dengan skill frontend/mobile di `./.agents/TECHSTACK.md` (`nextjs-developer`, `react-expert`, `vue-expert`, `angular-architect`, `react-native-expert`, `flutter-expert`).

## Alur Kerja

1. **Baca Konteks**: Baca `./AGENTS.md` (jika ada) paling awal, lalu `./.agents/PRD.md` dan `./.agents/TECHSTACK.md`.
2. **Tanyakan Pilihan Visual**: Beri 1 rekomendasi terbaik sesuai karakter produk:
   1. **Gaya Visual**: A) Swiss Minimalist (1px border, kontras tinggi ala Linear/Stripe) | B) Warm Editorial (kertas hangat, serif judul ala Claude/Notion) | C) Neo-Brutalist (border 2px, hard shadow ala Gumroad) | D) Precision Dark (dark slate, monospace data)
   2. **Tipografi**: A) Plus Jakarta/Geist Sans + JetBrains Mono | B) Instrument Serif/Playfair + Inter/DM Sans | C) Space Grotesk + Work Sans | D) Kustom
   3. **Palet Warna**: A) Monokrom Tinta + 1 Aksen Tajam (Cobalt/Emerald/Orange) | B) Warm Earth (`#FAF8F5`, teks `#1C1917`, aksen Terracotta/Forest) | C) Dark Slate (`#0B0F17`, surface `#111827`, aksen Cyan/Amber) | D) Brand Hex Kustom
   4. **Layout & Navigasi**: A) Sidebar Ringkas + Workspace | B) Top Bar + Konten Terpusat (`max-w-1120px`) | C) Split View / Bento | D) Mobile-First Bottom Nav
3. **Buat `./.agents/DESIGN.md`**:
   - Token warna (hex), skala tipografi, spacing, radius, durasi/easing animasi, perintah CLI komponen UI (`npx shadcn@latest add ...` jika pakai), dan aturan komponen inti.
   - Checklist wajib Anti-AI-Slop & UI/UX Pro Max (lihat di bawah).
4. **Handoff**: Setelah tersimpan, arahkan ke `"lanjut security aplikasi"` (`security`).

## Aturan Anti-AI-Slop & Pre-Delivery Checklist

- **DILARANG**: Gradien neon ungu-biru/pink AI (`from-purple-500 to-blue-500`), hero 3 kolom ikon bulat generik, tumpukan `backdrop-blur` + `shadow-2xl` berlebihan, dan **emoji sebagai ikon UI** (wajib 1 set SVG konsisten: Lucide/Heroicons).
- **WAJIB Aksesibilitas & Interaksi**: Kontras teks `>=4.5:1` (WCAG), `focus-visible` keyboard jelas, `cursor-pointer` di elemen klik, touch target minimal `44x44px`, dan badge tidak mengandalkan warna saja.
- **WAJIB Motion & Animasi**: Transisi mikro ringkas `150–250ms` (`ease-out` untuk masuk, `ease-in` untuk keluar), hanya animasikan properti GPU-friendly (`transform`, `opacity`), dilarang bounce/animasi berlebihan atau pemicu layout shift (CLS), dan selalu hormati `prefers-reduced-motion`.
- **WAJIB Layout & State**: Pakai `tabular-nums` untuk angka/tabel, teks/chip wrap rapi tanpa terpotong, microcopy spesifik (bukan *"Submit"*), 4 state layar (*Normal*, *Loading*, *Empty*, *Error*), dan responsif di `375px`, `768px`, `1024px`, `1440px`.

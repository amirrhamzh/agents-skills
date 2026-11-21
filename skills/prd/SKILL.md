---
name: prd
description: Buat PRD interaktif dan simpan ke .agents/PRD.md. Gunakan saat user menulis "saya punya ide", "buatkan prd", "bikin prd", "saya mau buat aplikasi", "ide aplikasi", "rancang aplikasi", atau "mulai project baru".
metadata:
  version: "2.3.0"
---
# PRD (Tahap 1)

## Koneksi Skill Eksternal

- Gunakan `brainstorming` (Superpowers) untuk menggali kebutuhan secara interaktif, lalu muat `feature-forge` untuk mempertajam spesifikasi & acceptance criteria (atau `spec-miner` jika proyek berbasis kode yang sudah ada).
- Opsional: gunakan `the-fool` untuk menguji asumsi ide agar ruang lingkup MVP tetap tajam.

## Alur Kerja

1. **Baca Konteks**: Jika `./AGENTS.md` ada di root project, baca paling awal sebelum file di `./.agents/`.
2. **Tanya Singkat (3-4 Poin)**: Jika ide masih umum, tanyakan cepat beserta saran default:
   - Masalah utama & target pengguna.
   - Alur inti (core loop) aplikasi.
   - Batas fitur MVP vs fitur nanti.
   - Kebutuhan khusus (login, pembayaran, AI/API, atau lokal).
3. **Buat `./.agents/PRD.md`**: Buat folder `.agents/` jika belum ada, lalu tulis:
   - **Visi & Masalah**: Deskripsi singkat & problem statement.
   - **Peran Pengguna & User Journey**: Tipe user dan alur langkah utama.
   - **Fitur (MoSCoW)**: Must-Have (MVP), Should-Have, Could-Have, Won't-Have.
   - **User Stories & Acceptance Criteria**: Format *Sebagai [peran], saya ingin [aksi] agar [manfaat]* + kriteria sukses & edge cases.
   - **State UI Wajib**: Definisi state *Loading*, *Empty*, dan *Error*.
4. **Handoff**: Minta konfirmasi user. Jika disetujui, arahkan ke tahap berikutnya: `"lanjut pilih tech stack"` (`techstack`).

## Aturan

- Simpan output hanya di `./.agents/PRD.md` pada project aktif (jangan buat dokumen duplikat di `docs/plans/`).
- Jangan menulis kode, memilih tech stack, atau lompat ke `writing-plans` sebelum tahap `techstack`, `design`, dan `security` selesai.
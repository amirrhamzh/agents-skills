---
name: prd
description: Buat PRD interaktif dan simpan ke .agents/PRD.md. Gunakan saat user menulis "saya punya ide", "buatkan prd", "bikin prd", "saya mau buat aplikasi", "ide aplikasi", "rancang aplikasi", "mulai project baru", atau "clone web/app ini dan buatkan prd".
metadata:
  version: "2.4.0"
---
# PRD (Tahap 1)

## Koneksi Skill Eksternal

- **Mode Normal** (ide baru / *"buatkan PRD"* tanpa target web/app untuk di-clone): Gunakan `brainstorming` (Superpowers) + `feature-forge` (atau `spec-miner` untuk kode sumber yang sudah ada). **DILARANG** memanggil `reverse-engineer-anything` (REA) di mode ini.
- **Mode Clone / Bedah Web & App** (HANYA jika user meminta *"clone web/app ini"*, *"tiru fitur dari..."*, atau menyertakan URL/aplikasi target untuk dibedah): **Otomatis muat `reverse-engineer-anything` (REA MCP)** terlebih dahulu untuk menginspeksi alur fitur, struktur halaman/komponen, interaksi, dan pola API/network secara lokal berbasis bukti, lalu jadikan temuannya bahan utama `./.agents/PRD.md`.
- Opsional: gunakan `the-fool` untuk menguji asumsi ide agar ruang lingkup MVP tetap tajam.

## Alur Kerja

1. **Baca Konteks & Deteksi Mode**: Jika `./AGENTS.md` ada di root project, baca paling awal sebelum file di `./.agents/`. Tentukan apakah permintaan masuk **Mode Normal** atau **Mode Clone** (jika Mode Clone dan REA MCP belum aktif, sarankan `npx -y rea-agents@latest setup`).
2. **Gali Kebutuhan**:
   - **Mode Normal**: Jika ide masih umum, tanyakan singkat 3–4 poin beserta saran default (masalah & target user, alur inti, batas MVP vs nanti, kebutuhan khusus seperti login/pembayaran/API).
   - **Mode Clone**: Jalankan investigasi target dengan `reverse-engineer-anything` (REA), ringkas fitur & batasan yang ditemukan, lalu konfirmasi singkat fitur mana yang masuk MVP dan apa yang ingin diubah/disesuaikan.
3. **Buat `./.agents/PRD.md`**: Buat folder `.agents/` jika belum ada, lalu tulis:
   - **Visi & Masalah**: Deskripsi singkat & problem statement (plus ringkasan referensi target jika Mode Clone).
   - **Peran Pengguna & User Journey**: Tipe user dan alur langkah utama.
   - **Fitur (MoSCoW)**: Must-Have (MVP), Should-Have, Could-Have, Won't-Have.
   - **User Stories & Acceptance Criteria**: Format *Sebagai [peran], saya ingin [aksi] agar [manfaat]* + kriteria sukses & edge cases.
   - **State UI Wajib**: Definisi state *Loading*, *Empty*, dan *Error*.
4. **Handoff**: Minta konfirmasi user. Jika disetujui, arahkan ke tahap berikutnya: `"lanjut pilih tech stack"` (`techstack`).

## Aturan

- Simpan output hanya di `./.agents/PRD.md` pada project aktif (jangan buat dokumen duplikat di `docs/plans/`).
- Jangan menulis kode, memilih tech stack, atau lompat ke `writing-plans` sebelum tahap `techstack`, `design`, dan `security` selesai.
- Pada Mode Clone, pastikan target adalah aplikasi milik sendiri atau yang sah dianalisis sesuai hukum.
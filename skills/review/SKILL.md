---
name: review
description: Pandu peninjauan hasil (User Review) dan revisi interaktif sebelum verifikasi akhir tanpa membuat file di .agents/. Gunakan saat user menulis "review hasil", "cek dulu hasilnya", "lihat hasilnya", "ada yang kurang", "ubah tampilan", atau "revisi fitur".
metadata:
  version: "2.3.0"
---
# Review (Tahap 6)

## Koneksi Skill Eksternal

- Gunakan `receiving-code-review` (Superpowers) untuk memproses masukan user secara terstruktur, dan muat `systematic-debugging` + `debugging-wizard` jika user menemukan bug saat mencoba hasil.
- Saat menerapkan revisi kode/UI, muat skill framework aktif dari `./AGENTS.md` (dan `secure-code-guardian` jika perubahan menyentuh auth/API/data).

## Alur Kerja

1. **Baca Konteks**: Wajib baca `./AGENTS.md` di root project paling awal, lalu periksa `./.agents/PRD.md`, `./.agents/TECHSTACK.md`, `./.agents/DESIGN.md`, `./.agents/SECURITY.md`, dan `./.agents/TASKS.md`.
2. **Tampilkan Preview & Tanyakan Masukan**:
   - Berikan perintah/URL untuk mencoba aplikasi beserta ringkasan fitur yang siap diuji.
   - Tanyakan 3 hal: (1) Apakah ada alur/fitur yang kurang pas? (2) Apakah ada UI/UX yang ingin diubah? (3) Apakah ada tambahan kecil?
3. **Eksekusi Revisi Langsung**:
   - Jika ada revisi dari user, perbarui butir task di `./.agents/TASKS.md` dan langsung ubah kode di project (tetap patuhi `./.agents/DESIGN.md` & `./.agents/SECURITY.md`).
   - Pastikan server/build bersih dari error, lalu minta user mencoba kembali hingga puas.
4. **Handoff**: Setelah user menyatakan hasil sudah pas, arahkan ke tahap penutup: `"verifikasi hasil"` (`verify`).

## Aturan

- **DILARANG** membuat file `REVIEW.md` di dalam folder `.agents/`.
- Jangan lanjut ke `verify` selama masih ada revisi user yang belum selesai.

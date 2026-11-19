---
name: techstack
description: Pilih Tech Stack lewat pertanyaan pilihan ganda dan simpan ke .agents/TECHSTACK.md. Gunakan saat user menulis "pilih tech stack", "buatkan techstack", "tentukan tech stack", "pakai bahasa apa", "pakai framework apa", atau "mau deploy dimana".
metadata:
  version: "2.2.0"
---
# Tech Stack (Tahap 2)

## Koneksi Skill Eksternal

- Muat `architecture-designer` (plus `api-designer` / `cloud-architect` jika kompleks) untuk memvalidasi arsitektur.
- Petakan skill spesialis yang sesuai pilihan stack ke dalam `./.agents/TECHSTACK.md` untuk dipakai di tahap `tasks`:
  - **Bahasa**: `typescript-pro`, `python-pro`, `go-pro`, `php-pro`, `rust-engineer`, `sql-pro`
  - **Frontend/Mobile**: `nextjs-developer`, `react-expert`, `vue-expert`, `angular-architect`, `react-native-expert`, `flutter-expert`
  - **Backend**: `nestjs-expert`, `fastapi-expert`, `django-expert`, `laravel-specialist`, `rails-expert`, `spring-boot-engineer`
  - **DB & Infra**: `postgres-pro`, `database-optimizer`, `devops-engineer`, `kubernetes-specialist`, `terraform-engineer`

## Alur Kerja

1. **Baca Konteks**: Baca `./AGENTS.md` (jika ada) paling awal, lalu baca `./.agents/PRD.md`.
2. **Tanyakan Pilihan Ganda**: Beri 1 rekomendasi terbaik per nomor agar user cukup menjawab singkat (contoh: `1A, 2A, 3B, 4A, 5A`):
   1. **Bahasa & Runtime**: A) TypeScript (Node/Bun) | B) Python | C) Go | D) PHP/Rust/Dart/Lainnya
   2. **Framework**: A) Fullstack Web (Next.js/Nuxt/SvelteKit) | B) SPA + API (React+Vite + Hono/FastAPI/Go) | C) Monolith (Laravel/Django/Rails) | D) Mobile/Desktop/CLI (Expo/Flutter/Tauri)
   3. **Database & ORM**: A) PostgreSQL + Drizzle/Prisma | B) SQLite/Turso | C) MySQL/MariaDB | D) NoSQL/LocalStorage
   4. **Autentikasi**: A) Auth Siap Pakai (Better Auth/Auth.js/Clerk/Supabase) | B) JWT/Session Kustom | C) Tanpa Auth
   5. **Deployment**: A) Serverless/Edge (Vercel/Cloudflare/Netlify) | B) Container PaaS (Railway/Fly.io/Render) | C) VPS + Docker | D) Lokal/Self-Hosted
3. **Buat `./.agents/TECHSTACK.md`**:
   - Tabel keputusan stack inti, library utama, dan **daftar skill spesialis terpilih**.
   - **Perintah CLI Inisialisasi Resmi** (contoh: `npx create-next-app@latest`, `npm create vite@latest`, `npx shadcn@latest init`, `composer create-project`, `uv init`, `go mod init`) agar tidak menulis boilerplate manual.
   - Struktur folder project (`AGENTS.md`, `.agents/`, `.geminiignore`, `src/`, `tests/`), variabel `.env.example`, dan perintah CLI (`dev`, `build`, `lint`, `test`).
4. **Handoff**: Setelah tersimpan, arahkan ke tahap berikutnya: `"lanjut desain aplikasi"` (`design`).

## Aturan

- Jika sebagian stack sudah disebut user di awal, kunci otomatis dan tanyakan sisanya saja.
- Simpan output hanya di `./.agents/TECHSTACK.md` pada project aktif.

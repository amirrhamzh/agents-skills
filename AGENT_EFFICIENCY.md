# Aturan Hemat Token AI Agent (Ignore List & CLI Scaffolding)

Simpan file ini di root project (atau gabungkan ke `AGENTS.md`) agar AI Agent tidak membuang token membaca folder dependensi dan tidak menulis file boilerplate secara manual.

## 1. Folder & File yang DILARANG Dibaca AI Agent

Kecualikan direktori dan file berikut dari pencarian (`grep`, `glob`, `find`, `read`) serta cantumkan ke dalam `.geminiignore` / `.aiignore`:

* **Dependensi & Package**: `node_modules/`, `vendor/`, `.pnpm-store/`, `.venv/`, `venv/`, `env/`, `__pycache__/`, `.pytest_cache/`

* **Hasil Build & Cache**: `.next/`, `.nuxt/`, `.svelte-kit/`, `dist/`, `build/`, `out/`, `target/`, `.turbo/`, `.vercel/`, `.cache/`, `coverage/`

* **Git & Lockfiles**: `.git/`, `package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`, `bun.lockb`, `composer.lock`, `poetry.lock`, `Cargo.lock`

* **Aset Biner & Log**: `*.log`, `*.png`, `*.jpg`, `*.jpeg`, `*.webp`, `*.mp4`, `*.pdf`, `*.zip`, `*.sqlite`, `*.db`

> **Tips**: Saat inisialisasi project, buat file `.geminiignore` (atau `.aiignore`) berisi daftar folder di atas agar IDE/Agent otomatis melewatinya.

## 2. Wajib Pakai Perintah CLI Resmi (Dilarang Tulis Manual)

Saat menginisialisasi framework, library, atau komponen UI, **wajib jalankan perintah CLI resminya** di terminal daripada membuat `package.json`, `tsconfig.json`, atau file konfigurasi satu per satu secara manual:

| Kebutuhan / Stack | Perintah CLI Resmi | 
| ----- | ----- | 
| **Next.js** | `npx create-next-app@latest . --typescript --tailwind --eslint --app` | 
| **Vite (React / Vue / Svelte)** | `npm create vite@latest . -- --template react-ts` | 
| **SvelteKit / Nuxt** | `npx sv create .` / `npx nuxi@latest init .` | 
| **shadcn/ui (Komponen)** | `npx shadcn@latest init` & `npx shadcn@latest add button input card` | 
| **Laravel** | `composer create-project laravel/laravel .` | 
| **Python (uv / FastAPI / Django)** | `uv init` / `django-admin startproject config .` | 
| **Go** | `go mod init <module-name>` | 
| **Expo (React Native)** | `npx create-expo-app@latest .` | 
| **Flutter** | `flutter create .` | 
| **Prisma / Drizzle** | `npx prisma init` / instal via `npm i drizzle-orm` | 

## 3. Aturan Tambahan Hemat Token

* Gunakan `npm install <paket>` / `pnpm add <paket>` / `uv add <paket>` — jangan tulis versi paket secara manual di `package.json` atau `pyproject.toml`.

* Baca hanya file yang relevan dengan task aktif; jangan membaca seluruh isi folder proyek sekaligus.
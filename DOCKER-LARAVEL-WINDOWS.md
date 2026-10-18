# Laravel dan Docker di Windows

## Status pada perangkat ini

Pemeriksaan lokal menunjukkan Docker CLI/Engine `29.8.2` dan Docker Compose `v5.6.0` tersedia. Docker Desktop release notes menyebut 4.95.0 (12 Oktober 2026) dengan Engine 29.8.1. Jadi CLI yang terpasang sudah lebih baru daripada Engine yang tercantum dalam rilis Desktop terakhir; tidak perlu memasang binary ke folder proyek. Ada peringatan akses pada `C:\Users\User\.docker\config.json`, jadi periksa hak baca konfigurasi/user Docker sebelum pull image.

## Jalur setup saat koneksi registry tersedia

Laravel 13 adalah major terkini pada tanggal riset (18 Oktober 2026); Laravel 13 memerlukan PHP 8.3+. Gunakan Laravel Sail sebagai lingkungan Docker resmi proyek, jangan mengambil image `latest` tanpa pin versi.

```powershell
# Jalankan dari folder proyek ini ketika akses internet aktif.
composer create-project laravel/laravel laravel-app "^13.0"
Set-Location .\laravel-app
php artisan sail:install --with=mysql,redis,mailpit
Copy-Item .env.example .env
# Jika Sail belum menghasilkan APP_KEY:
php artisan key:generate
# Compose Sail default memakai service laravel.test:
docker compose up -d --build
# Periksa status dan log:
docker compose ps
docker compose logs -f laravel.test
```

Jika Composer tidak tersedia, instal Laravel melalui PHP/Laravel installer sesuai [dokumentasi resmi](https://laravel.com/framework/docs). Di Windows, Docker Desktop memakai backend WSL 2 untuk alur Linux container yang disarankan; periksa virtualisasi, WSL 2, RAM (panduan Docker menyarankan 8 GB), lalu buka Docker Desktop dan aktifkan integrasi distro WSL. Simpan sumber kerja di filesystem distro Linux untuk bind-mount yang lebih cepat bila Anda memakai WSL.

## Catatan keamanan dan operasi

- Jangan commit `.env`, token, data klien, backup, atau file upload privat.
- Pakai secret lokal dan secret manager di produksi; batasi akses DB dan adminer/phpMyAdmin hanya lokal.
- Untuk production, konfigurasi `APP_DEBUG=false`, HTTPS, storage privat, backup terenkripsi, dan jalankan restore drill.
- Pisahkan staging dan produksi; jangan menguji payment callback pada transaksi uang nyata sebelum webhook idempotency/reconciliation siap.
- Gunakan `docker compose down` untuk berhenti. Hindari `docker compose down -v` kecuali memang ingin menghapus data volume lokal.

## Kendala sesi ini

Docker telah terpasang. Pembuatan aplikasi Laravel memerlukan Composer/akses ke Packagist dan image registry, tetapi jaringan terminal menolak koneksi keluar ke GitHub pada sesi ini. Folder sumber masih kosong. Tidak ada klaim bahwa Laravel sudah terpasang atau berjalan.

## Referensi resmi

- [Docker Desktop Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
- [Docker Desktop release notes](https://docs.docker.com/desktop/release-notes/)
- [Docker WSL 2 backend](https://docs.docker.com/desktop/features/wsl/)
- [Laravel 13 installation](https://laravel.com/framework/docs)
- [Laravel 13 release/support notes](https://laravel.com/framework/docs/releases)
- [Laravel Sail](https://laravel.com/framework/docs/13.x/sail)

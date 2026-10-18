$ErrorActionPreference = 'Stop'

$projectPath = Join-Path $PSScriptRoot 'laravel-app'
if (Test-Path -LiteralPath $projectPath) {
    throw "Folder '$projectPath' sudah ada. Pindahkan atau tinjau folder itu secara manual sebelum menjalankan bootstrap."
}
if (-not (Get-Command composer -ErrorAction SilentlyContinue)) {
    throw 'Composer tidak ditemukan di PATH. Instal PHP 8.3+ dan Composer sesuai panduan Laravel, lalu jalankan lagi.'
}
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw 'Docker CLI tidak ditemukan di PATH.'
}

composer create-project laravel/laravel $projectPath '^13.0' --no-interaction
if ($LASTEXITCODE -ne 0) { throw 'Composer gagal membuat Laravel 13. Periksa jaringan dan ulangi setelah kendala diperbaiki.' }

Push-Location $projectPath
try {
    php artisan sail:install --with=mysql,redis,mailpit
    if ($LASTEXITCODE -ne 0) { throw 'Instalasi Laravel Sail gagal.' }
    php artisan key:generate
    if ($LASTEXITCODE -ne 0) { throw 'Pembuatan APP_KEY gagal.' }
    docker compose up -d --build
    if ($LASTEXITCODE -ne 0) { throw 'Docker Compose gagal. Pastikan Docker Desktop berjalan dan registry dapat diakses.' }
    docker compose ps
}
finally {
    Pop-Location
}

# Roadmap 12 minggu

Estimasi ini untuk satu tim kecil (1 PM, 1 designer, 2 developer) dengan keputusan mingguan. Kalender aktual bergantung pada akses vendor dan hasil pilot.

| Minggu | Fokus | Hasil / gerbang |
|---:|---|---|
| 1 | Discovery 8-12 UMKM, 3 kategori; wawancara masalah, alternatif, willingness-to-pay | Problem statement dan catatan teranonimkan; lanjut bila pola berulang muncul pada ≥5 responden |
| 2 | Definisi paket, scope, harga awal, biaya vendor, KPI baseline | Katalog draft dan unit economics; PM menyetujui asumsi dan pengecualian |
| 3 | Journey, wireframe, wizard rekomendasi, kalkulator | Prototype clickable; 5 calon klien dapat menyelesaikan tugas tanpa bantuan mayor |
| 4 | Arsitektur Laravel 13, data model, role matrix, threat model, setup Docker | Repo dan pipeline dev; tidak menyimpan rahasia plaintext; backup/restore direncanakan |
| 5 | Landing page, katalog, FAQ, CTA, kalkulator estimasi | Uji paket/add-on, total harga, dan penjelasan rekomendasi |
| 6 | Auth, klien, order, brief, unggah aset | Brief dapat diisi, disimpan dan dilanjutkan; validasi tipe/ukuran file |
| 7 | Admin order, status, invoice manual, aturan DP/pelunasan | Demo alur tanpa gateway live; audit status dan bukti pembayaran |
| 8 | Portal klien dan 5 milestone, demo URL, approval/sign-off | Klien melihat riwayat dan memberi persetujuan formal |
| 9 | Ticket revisi, kuota, notifikasi email, role access | Tes alur kuota habis dan revisi berbayar; akses lintas klien tertolak |
| 10 | QA, aksesibilitas, mobile, performa, backup/restore, UAT | Daftar defect severity; jangan go-live dengan P0/P1 terbuka |
| 11 | Pilot 3 UMKM dengan persetujuan dan kontrak, support harian | Catatan usability, biaya/jam aktual, keberatan, dan KPI funnel |
| 12 | Evaluasi, perubahan prioritas, deployment staging/produksi | Keputusan: lanjut, ubah paket, atau hentikan fitur; SOP operasi dan rencana 90 hari |

## Urutan implementasi dari PRD

**Must:** katalog + kalkulator, order + brief + ketentuan, invoice dasar, portal milestone, kontrol akses, audit trail, Docker/deployment.  
**Should:** revisi berkuota dan notifikasi.  
**Could/validasi lanjutan:** gateway otomatis, vault kredensial, laporan profitabilitas dan ekspor.

Gerbang penting: integrasi gateway produksi baru setelah proses refund, rekonsiliasi, callback/webhook idempotency, dan pemilihan PSP selesai. Vault kredensial baru setelah tinjauan keamanan; MVP menghindari mengumpulkan password hosting/domain.

## Cadence pengukuran

- Harian selama pilot: order yang tersendat, error, pertanyaan support.
- Mingguan: funnel, waktu onboarding, approval, jam per proyek, biaya langsung.
- Akhir pilot: bandingkan baseline, per kategori dan paket; jangan simpulkan kausalitas dari sampel tiga proyek.

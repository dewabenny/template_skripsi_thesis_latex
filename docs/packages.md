# Paket (Packages)

Dokumen ini mendokumentasikan paket yang dimuat oleh framework, alasannya,
dan kebijakan penambahannya.

## Kebijakan Paket

Sebelum menambahkan paket baru, verifikasi:

1. **Kebutuhan** — apakah benar-benar diperlukan? Bisa tidak diganti dengan
   perintah bawaan?
2. **Kompatibilitas** — apakah berjalan dengan LuaLaTeX?
3. **Status pemeliharaan** — paket yang aktif dipelihara lebih disukai.
4. **Hindari paket usang** — paket lama yang digantikan pustaka modern.

## Daftar Paket (`preamble/packages.tex`)

| Paket | Fungsi | Keterangan |
|-------|--------|------------|
| `geometry` | Margin & ukuran kertas (A4, 4-3-3-3 cm) | |
| `xcolor` | Dukungan warna (dibutuhkan tema) | |
| `fontspec` | Pemilihan font Unicode (LuaLaTeX) | Wajib LuaLaTeX |
| `babel` | Bahasa dokumen (Indonesia) | `[indonesian]` |
| `setspace` | Jarak baris (1,5 spasi) | |
| `graphicx` | Penyisipan gambar | |
| `booktabs` | Tabel berkualitas (garis horizontal) | |
| `array` | Format tabel lanjutan | |
| `titlesec` | Format judul bab/section | |
| `caption` | Format keterangan gambar & tabel | |
| `csquotes` | Manajemen tanda kutip | |
| `microtype` | Kerning/tipografi halus | |
| `amsmath` | Notasi matematika | |
| `chngcntr` | Penomoran ulang gambar/tabel per bab | |
| `biblatex` | Sitasi & daftar pustaka | Gaya Vancouver, backend Biber |
| `hyperref` | Tautan internal PDF + metadata | Dimuat via `setting/hyperlink.tex` |

## biblatex

Dimuat dengan konfigurasi:

```latex
\usepackage[
  backend=biber,
  style=vancouver,
  sorting=none,
  citestyle=numeric-comp,
  language=english
]{biblatex}
```

- Gaya **Vancouver** — umum untuk karya ilmiah kedokteran/kesehatan.
- `sorting=none` — daftar pustaka disusun sesuai urutan kemunculan sitasi.
- Biber sebagai backend — bukan BibTeX lama.

## hyperref

Konfigurasi hyperref dipindah ke `preamble/setting/hyperlink.tex` agar
seluruh metadata PDF (`pdftitle`, `pdfauthor`, dll.) dapat membaca nilai
dari `metadata.tex`.

## Perlu Menambah Paket?

Ikuti alur berikut:

1. Periksa apakah paket sudah dimuat oleh paket lain (hindari duplikasi).
2. Pastikan paket mendukung LuaLaTeX.
3. Tambahkan ke `preamble/packages.tex` dengan komentar singkat.
4. Update dokumentasi ini dan `CHANGELOG.md`.
5. Bangun ulang minimal 3× berturut-turut (LuaLaTeX → Biber → LuaLaTeX → LuaLaTeX).

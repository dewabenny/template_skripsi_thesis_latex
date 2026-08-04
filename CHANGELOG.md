# Changelog

Semua perubahan penting pada Template LaTeX Penulisan Ilmiah akan dicatat di berkas ini.

Format mengikuti [Keep a Changelog](https://keepachangelog.com/id-ID/1.1.0/) dan versi mengikuti [Semantic Versioning](https://semver.org/lang/id/).

## [1.0.0] - 2026-08-04

### Ditambahkan
- Struktur proyek standar penulisan ilmiah Bahasa Indonesia:
  - `preamble/` (metadata, package, setting, command)
  - `frontmatter/` (cover, abstract, toctables)
  - `chapters/` (bab I–VI) dengan panduan penulisan berupa komentar
  - `bibliography/references.bib` dengan gaya sitasi Vancouver (biblatex/biber)
- Halaman judul, abstrak + kata kunci, daftar isi, daftar gambar, dan daftar tabel.
- Format khas dokumen ilmiah: margin A4 (4-3-3-3 cm), font Times New Roman, spasi 1,5, penomoran bab Romawi, penomoran gambar/tabel per bab.
- Konfigurasi build VS Code (LaTeX Workshop): `LuaLaTeX → biber → LuaLaTeX×2`.
- `README.md` lengkap: struktur proyek, dependensi, cara penggunaan, cara pengisian, auto-sync Zotero (Better BibTeX), dan FAQ.
- `LICENSE` (MIT) dan `CITATION.cff`.
- `Makefile` dan `.latexmkrc` untuk build via baris perintah.

### Berubah
- Konten bab diganti menjadi kerangka template dengan panduan komentar.
- `preamble/metadata.tex` menggunakan nilai placeholder (harus diisi pengguna).

# Changelog

Semua perubahan penting pada Template LaTeX Penulisan Ilmiah akan dicatat di berkas ini.

Format mengikuti [Keep a Changelog](https://keepachangelog.com/id-ID/1.1.0/) dan versi mengikuti [Semantic Versioning](https://semver.org/lang/id/).

## [Unreleased]

### Ditambahkan
- `docs/images/` berisi preview halaman (cover, daftar isi, bab, gambar, tabel, daftar pustaka).
- `AGENTS.md` (aturan arsitektur & kualitas untuk kontributor/agen AI) dan `ai/AGENT_TASKS.md` (roadmap refactoring).
- `preamble/setting/` — modul pengaturan terpisah: `spacing`, `typography`, `chapter`, `section`, `numbering`, `caption`, `toc`, `bibliography`, `hyperlink`.
- Metadata `docSubtitle`, `docStudentID`, `docCosupervisor`, `docLogo` di `preamble/metadata.tex`.
- Metadata PDF (`pdftitle`, `pdfauthor`, `pdfsubject`, `pdfkeywords`) otomatis mengikuti `\doc*` di `setting/hyperlink.tex`.
- Perintah reusable `\makecover` (judul opsional + jenis dokumen opsional) di `preamble/command.tex`.
- Perintah reusable `\Figure`, `\Table`, `\Equation`, `\Appendix`, `\Source` di `preamble/command.tex`.
- Sistem tema di `themes/` (`classic`, `modern`, `minimal`, `book`) dengan perintah `\usetheme{...}` di `preamble/command.tex`.
- Paket `xcolor` di `preamble/packages.tex` (dibutuhkan tema).
- Dokumentasi Markdown di `docs/`: `index`, `installation`, `architecture`, `packages`, `settings`, `metadata`, `bibliography`, `themes`, `chapters`, `troubleshooting`, `faq`.
- Target Makefile baru: `make pdf`, `make watch`, `make release`, `make lint`.
- GitHub Actions: `.github/workflows/compile.yml` (compile + upload artifact) dan `.github/workflows/release.yml` (release otomatis saat tag `v*`).
- Contoh di `examples/`: `proposal`, `thesis`, `dissertation`, `book` (memakai framework yang sama; build dengan `make examples`).
- Dokumentasi website MkDocs Material: `mkdocs.yml`, `docs/requirements.txt`, halaman `commands.md` dan `examples.md`.
- Halaman dokumentasi `docs/chapters.md` — panduan menyusun, menambah, dan memisah bab (mis. Hasil & Pembahasan terpisah).
- Bagian "Referensi Font" di `docs/installation.md` dengan tautan kredibel (LaTeX Font Catalogue, dokumentasi `fontspec`, LaTeX Project, TeX Gyre, Google Fonts); FAQ dan Troubleshooting merujuk ke sana.
- GitHub Actions `.github/workflows/docs.yml` untuk deploy situs dokumentasi ke GitHub Pages.
- Class file `academic-id.cls` — membungkus seluruh framework (metadata, packages, settings, command) sehingga cukup `\documentclass{academic-id}`.
- Contoh `examples/class/` untuk pemakaian class file.

### Berubah
- `main.tex` memanggil `\usetheme{classic}` (default).
- Seluruh `\input` internal framework memakai `\frameworkRoot` (kosong di root, `../../` di contoh) sehingga framework dapat dikompilasi dari direktori mana pun.
- `metadata.tex`: nilai `\docLogo` dan `\docBibliography` tanpa spasi/baris (menghindari spasi tak diinginkan pada path).
- Contoh non-class (`proposal`, `thesis`, `dissertation`, `book`) dikompilasi dari foldernya masing-masing; contoh `class` dikompilasi dari root.
- Makefile lama diperluas mendukung latexmk penuh (`-pvc`, `-c`, `-C`) dan validasi log.
- README merujuk ke `docs/` untuk dokumentasi detail.
- `make examples` mencakup contoh `class`.
- `main.tex` memakai `\include` (bukan `\input`) untuk bab-bab dan menyediakan `\includeonly` (komentar) untuk kompilasi cepat.
- `chapters/03_metode_penelitian.tex` memakai `\Equation` dan `chapters/04_hasil_pembahasan.tex` memakai `\Figure`/`\Table` sebagai contoh.
- `preamble/package.tex` → `preamble/packages.tex` dan `preamble/setting.tex` → `preamble/settings.tex` (konsistensi penamaan sesuai AGENTS.md).
- `preamble/settings.tex` kini hanya meng-*import* modul di `preamble/setting/` (satu tanggung jawab per modul).
- Konfigurasi `hyperref` dipindah dari `packages.tex` ke `setting/hyperlink.tex`.
- Metadata digeneralisasi: `\Program`→`\docProgram`, `\Faculty`→`\docFaculty`, `\University`→`\docUniversity`, `\Department`→`\docDepartment`, `\Hospital`→`\docHospital`, `\Location`→`\docLocation`, `\SubmissionYear`→`\docYear`, `\Pembimbing`→`\docSupervisor`. Nama lama tetap tersedia sebagai alias (backward compatible).
- `cover.tex` memakai `\docLogo` dan `\doc*` dari metadata.
- `cover.tex` menjadi pemanggil `\makecover` (layout cover sepenuhnya reusable di `command.tex`).
- `README.md` ditulis ulang: gambaran umum, fitur, pemasangan, mulai cepat, build, struktur proyek, screenshot, roadmap, kontribusi, dan FAQ.

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

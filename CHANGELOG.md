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

### Berubah
- `preamble/package.tex` → `preamble/packages.tex` dan `preamble/setting.tex` → `preamble/settings.tex` (konsistensi penamaan sesuai AGENTS.md).
- `preamble/settings.tex` kini hanya meng-*import* modul di `preamble/setting/` (satu tanggung jawab per modul).
- Konfigurasi `hyperref` dipindah dari `packages.tex` ke `setting/hyperlink.tex`.
- Metadata digeneralisasi: `\Program`→`\docProgram`, `\Faculty`→`\docFaculty`, `\University`→`\docUniversity`, `\Department`→`\docDepartment`, `\Hospital`→`\docHospital`, `\Location`→`\docLocation`, `\SubmissionYear`→`\docYear`, `\Pembimbing`→`\docSupervisor`. Nama lama tetap tersedia sebagai alias (backward compatible).
- `cover.tex` memakai `\docLogo` dan `\doc*` dari metadata.
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

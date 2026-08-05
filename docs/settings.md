# Pengaturan (Settings)

Dokumen ini menjelaskan modul-modul pengaturan di `preamble/setting/` dan
cara menyesuaikannya.

## Struktur

`preamble/settings.tex` hanya meng-import modul:

```latex
\input{preamble/setting/spacing}
\input{preamble/setting/typography}
\input{preamble/setting/chapter}
\input{preamble/setting/section}
\input{preamble/setting/numbering}
\input{preamble/setting/caption}
\input{preamble/setting/toc}
\input{preamble/setting/bibliography}
\input{preamble/setting/hyperlink}
```

Setiap modul memiliki satu tanggung jawab (lihat [Arsitektur](architecture.md)).

## Modul & Pengaturan Penting

### `spacing.tex` — Jarak baris & paragraf

```latex
\onehalfspacing                 % 1,5 spasi
\setlength{\parindent}{1.27cm}  % indentasi paragraf
\setlength{\parskip}{0pt}       % jarak antar paragraf
```

Ubah `\onehalfspacing` → `\singlespacing` atau `\doublespacing` sesuai kebutuhan.

### `typography.tex` — Nama bagian

```latex
\renewcommand{\contentsname}{DAFTAR ISI}
\renewcommand{\listfigurename}{DAFTAR GAMBAR}
\renewcommand{\listtablename}{DAFTAR TABEL}
\renewcommand{\bibname}{DAFTAR PUSTAKA}
\renewcommand{\figurename}{Gambar}
\renewcommand{\tablename}{Tabel}
```

### `chapter.tex` — Judul BAB

```latex
\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[display]
{\centering\bfseries\fontsize{16pt}{20pt}\selectfont}
{BAB~\thechapter}
{0.5em}
{\MakeUppercase}
```

- Nilai kedua `\fontsize{16pt}{20pt}` = jarak antar baris judul.
- Teks "BAB" dapat diganti/dihilangkan (lihat tema `book`).

### `section.tex` — Judul section/subsection

Penomoran mengikuti `bab.section.subsection`:

```latex
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
```

Ukuran dan jarak diatur per level (`\titleformat` + `\titlespacing*`).

### `numbering.tex` — Penomoran gambar/tabel

```latex
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
```

Menghasilkan nomor seperti `Gambar 4.1`, `Tabel 3.2`.

### `caption.tex` — Keterangan gambar/tabel

```latex
\captionsetup{
  font=small, labelfont=bf, labelsep=space,
  justification=justified, singlelinecheck=false, skip=8pt}
```

### `toc.tex` — Daftar isi/gambar/tabel

Mendefinisikan ulang format heading DAFTAR ISI, DAFTAR GAMBAR, DAFTAR TABEL
(judul terpusat, tebal, 16pt).

### `bibliography.tex` — Heading daftar pustaka

Format judul DAFTAR PUSTAKA + memastikan masuk ke daftar isi.

### `hyperlink.tex` — hyperref & metadata PDF

```latex
\usepackage[
  colorlinks=true,
  pdftitle={\docTitle},
  pdfauthor={\docAuthor},
  pdfsubject={\docSubject},
  pdfkeywords={\docKeywords}
]{hyperref}
```

## Menyesuaikan Tema

Untuk perubahan tampilan yang lebih besar (warna, layout), gunakan sistem
tema (`\usetheme{name}`) daripada mengubah setting bawaan. Lihat
[Themes](themes.md).

## Checklist Setelah Mengubah Setting

- [ ] Bangun ulang minimal 3× (LuaLaTeX → Biber → LuaLaTeX → LuaLaTeX)
- [ ] Tidak ada error
- [ ] TOC/LOF/LOT tetap benar
- [ ] Penomoran halaman benar

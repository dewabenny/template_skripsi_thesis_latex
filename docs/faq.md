# FAQ

## Umum

### Apakah harus menggunakan LuaLaTeX?

**Ya.** Framework memakai `fontspec` untuk memilih font Unicode (Times New
Roman). `fontspec` hanya bekerja di LuaLaTeX (atau XeLaTeX).

### Bisakah memakai Overleaf?

Bisa. Pilih compiler **LuaLaTeX**, dan pastikan `references.bib` ter-upload.
Cek juga bahwa Biber tersedia sebagai backend (Overleaf sudah mendukung).

### Bagaimana cara mengganti font?

Buka `preamble/packages.tex`:

```latex
\setmainfont{Times New Roman}
```

Ganti dengan font yang terpasang (mis. `TeX Gyre Termes`, `Liberation Serif`,
`Georgia`).

## Penulisan

### Bagaimana cara mengubah margin?

Di `preamble/packages.tex` (baris `geometry`):

```latex
\usepackage[a4paper,left=4cm,right=3cm,top=3cm,bottom=3cm]{geometry}
```

### Bagaimana cara memasukkan gambar?

```latex
\Figure{figures/nama_file}{Keterangan gambar.}{fig:label}
```

### Bagaimana cara memasukkan tabel?

```latex
\Table{tab:label}{
  \begin{tabular}{ll}
  \toprule
  A & B \\
  \bottomrule
  \end{tabular}
}{Keterangan tabel.}
```

### Bagaimana cara menambah sitasi?

Tulis `\supercite{key}` di teks; tambahkan entri ke `references.bib`.

## Layout & Penomoran

### Penomoran gambar/tabel per bab?

Diaktifkan lewat `\numberwithin{figure}{chapter}` dan `\numberwithin{table}{chapter}`
di `preamble/setting/numbering.tex`.

### Halaman Romawi di bagian depan, Arab di isi?

Diatur di `frontmatter/toctables.tex`:

```latex
\pagenumbering{roman}
...
\pagenumbering{arabic}
```

## Build

### Mengapa PDF tidak berubah setelah mengedit?

- Jalankan build **penuh** (bukan kompilasi tunggal) — referensi silang
  butuh ≥ 2× LuaLaTeX.
- Bila memakai `\includeonly`, nonaktifkan untuk build akhir.

### Bagaimana membersihkan artefak build?

```bash
make clean      # hapus artefak (PDF tetap)
make cleanall   # hapus artefak + folder output/
```

## Tema

### Bagaimana mengganti tema?

Di `main.tex`:

```latex
\usetheme{modern}
```

Pilihan: `classic`, `modern`, `minimal`, `book`. Lihat [Themes](themes.md).

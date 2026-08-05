# Tema (Themes)

Sistem tema memungkinkan mengubah tampilan dokumen tanpa menyentuh setting
bawaan.

## Pemilihan Tema

Di `main.tex`:

```latex
\usetheme{classic}   % default
\usetheme{modern}
\usetheme{minimal}
\usetheme{book}
```

`\usetheme{name}` memuat `themes/name.tex`.

## Daftar Tema

| Tema | Deskripsi |
|------|-----------|
| `classic` | Tampilan klasik khas dokumen ilmiah; tautan hitam netral. **Default.** |
| `modern` | Aksen warna biru pada tautan dan judul bab/section. |
| `minimal` | Ukuran & jarak judul lebih rapat; tampilan ringkas. |
| `book` | Gaya buku akademik; judul bab tanpa kata "BAB" (langsung nomor Romawi). |

## Struktur File Tema

Setiap file tema hanya berisi **override tampilan**:

```latex
% themes/modern.tex
\hypersetup{
  colorlinks=true,
  linkcolor=blue!70!black,
  citecolor=blue!70!black,
  urlcolor=blue!70!black
}

\titleformat{\chapter}[display]
{\centering\bfseries\color{blue!60!black}\fontsize{16pt}{20pt}\selectfont}
{BAB~\thechapter}
{0.5em}
{\MakeUppercase}
```

## Membuat Tema Baru

1. Buat `themes/<nama>.tex`.
2. Override konfigurasi yang diinginkan (`\hypersetup`, `\titleformat`,
   `\titlespacing*`, dst.).
3. Gunakan `\usetheme{<nama>}` di `main.tex`.
4. Update dokumentasi ini dan `CHANGELOG.md`.

> Tema dimuat **setelah** `preamble/`, sehingga dapat menimpa setting bawaan.

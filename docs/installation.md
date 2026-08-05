# Pemasangan

Panduan ini menjelaskan cara memasang dan mempersiapkan lingkungan untuk
menggunakan **Indonesian Academic LaTeX Framework**.

## 1. TeX Distribution

Framework ini membutuhkan **LuaLaTeX** dan **Biber**. Keduanya tersedia di
distribusi TeX modern.

### macOS

Pasang [MacTeX](https://tug.org/mactex/) (versi lengkap) atau **BasicTeX**
+ `tlmgr install` untuk paket yang diperlukan. MacTeX sudah mencakup
LuaLaTeX, Biber, dan seluruh paket standar.

```bash
# Verifikasi setelah instalasi
lualatex --version
biber --version
```

### Windows

Pasang [MiKTeX](https://miktex.org/). Saat pertama kali mengompilasi,
MiKTeX akan menawarkan pemasangan paket yang belum ada — pilih *Yes*
untuk memasang otomatis.

### Linux (Debian/Ubuntu)

```bash
sudo apt update
sudo apt install texlive-lualatex texlive-bibtex-extra biber latexmk
```

Untuk Fedora:

```bash
sudo dnf install texlive-scheme-full
```

## 2. Font

Tema default memakai **Times New Roman** bawaan sistem. Jika tidak tersedia,
ganti di `preamble/packages.tex`:

```latex
\setmainfont{Times New Roman}
```

Alternatif gratis yang kompatibel:

- `TeX Gyre Termes` — mirip Times
- `Liberation Serif` — mirip Times

> Gunakan **LuaLaTeX** — `fontspec` tidak bekerja dengan pdfLaTeX.

## 3. Alat Bantu (Opsional)

- **VS Code** + ekstensi [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop).
  Konfigurasi build sudah tersedia di `.vscode/settings.json`.
- **latexmk** — sudah termasuk dalam MacTeX/MiKTeX/TeX Live.

## 4. Verifikasi Lingkungan

Jalankan dari root proyek:

```bash
latexmk -lualatex -outdir=output main.tex
```

Jika berhasil, file `output/main.pdf` akan dihasilkan tanpa error.

## Pemecahan Masalah

| Gejala | Penyebab | Solusi |
|--------|----------|--------|
| `fontspec` error | Memakai pdfLaTeX | Gunakan LuaLaTeX |
| Font tidak ditemukan | Font tidak terpasang | Ganti `\setmainfont` |
| Biber tidak jalan | Biber belum terpasang | Pasang biber |
| Paket hilang | Distribusi belum lengkap | `tlmgr install <paket>` atau instal penuh |

Lihat juga [Troubleshooting](troubleshooting.md) untuk detail lebih lanjut.

# Troubleshooting

Kumpulan masalah umum saat membangun dokumen dan solusinya.

## Masalah Saat Kompilasi

### `fontspec` / `\setmainfont` error

**Penyebab:** memakai pdfLaTeX, bukan LuaLaTeX.

**Solusi:**

```bash
latexmk -lualatex -outdir=output main.tex
```

Atau di VS Code, pastikan recipe yang dipilih adalah `LuaLaTeX -> biber -> LuaLaTeX×2`.

### Font "Times New Roman" tidak ditemukan

**Penyebab:** font tidak terpasang di sistem.

**Solusi:** ganti di `preamble/packages.tex`:

```latex
\setmainfont{TeX Gyre Termes}    % gratis, mirip Times
\setmainfont{Liberation Serif}   % gratis, mirip Times
```

Cek daftar font terpasang:

```bash
fc-list | grep -i times
```

### `Biber` tidak dijalankan / undefined citations

**Penyebab:** alur build tidak menjalankan Biber.

**Solusi:** gunakan `latexmk` (otomatis) atau jalankan manual:

```bash
lualatex -output-directory=output main.tex
biber  --output-directory=output main
lualatex -output-directory=output main.tex
lualatex -output-directory=output main.tex
```

### Paket tidak ditemukan (`! LaTeX Error: File 'xxx.sty' not found`)

**Penyebab:** distribusi TeX tidak lengkap.

**Solusi (TeX Live):**

```bash
tlmgr install <nama-paket>
```

atau pasang distribusi lengkap (`texlive-full` / MacTeX / MiKTeX).

### `Emergency stop` / file rusak

Coba bersihkan artefak build lalu bangun ulang:

```bash
latexmk -C -outdir=output
latexmk -lualatex -outdir=output main.tex
```

## Masalah Hasil (Output)

### Daftar isi tidak lengkap

**Penyebab:** build kurang dari 2× LuaLaTeX (referensi silang belum stabil).

**Solusi:** jalankan build penuh minimal 2× (atau gunakan `latexmk`).

### Penomoran halaman/gambar aneh

- Pastikan sudah build ≥ 2×.
- Untuk dokumen yang diedit dengan `\includeonly`, nomor halaman bisa
  berubah; lakukan build penuh untuk hasil akhir.

### Tabel/gambar tidak muncul di tempatnya

Biasanya karena penempatan `[ht]` — LaTeX menggeser float. Tambahkan `[htbp]`
atau `[H]` (dengan paket `float`) bila perlu, atau periksa urutan teks.

### Font di PDF tampak berbeda dengan teks editor

- Pastikan memakai LuaLaTeX (fontspec).
- Nama font harus persis seperti yang dikenal sistem (`fc-list`).

## Referensi Silang

Jika masih menemui masalah, cek:

- [Pemasangan](installation.md)
- [Pengaturan](settings.md)
- [Bibliografi](bibliography.md)

Untuk pertanyaan umum, lihat [FAQ](faq.md).

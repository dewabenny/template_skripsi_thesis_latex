# Perintah (Commands)

Framework menyediakan beberapa perintah reusable di `preamble/command.tex`
untuk menghindari pengulangan format. Gunakan perintah-perintah ini daripada
menulis lingkungan (environment) secara manual bila memungkinkan.

## Daftar Perintah

| Perintah | Fungsi |
|----------|--------|
| `\makecover` | Halaman sampul reusable (judul & jenis dokumen opsional) |
| `\usetheme{name}` | Pilih tema: `classic`, `modern`, `minimal`, `book` |
| `\Figure{file}{caption}{label}` | Sisipkan gambar |
| `\Table{label}{isi}{caption}` | Sisipkan tabel |
| `\Equation{label}{persamaan}` | Sisipkan persamaan bernomor |
| `\Appendix*{judul}` / `\Appendix{judul}` | Mulai bagian lampiran |
| `\Source{teks}` | Catatan sumber gambar/tabel |
| `\HRule` | Garis horizontal tebal |

## \makecover

Membaca seluruh identitas dari `metadata.tex`.

```latex
\makecover                              % judul dari \docTitle
\makecover[Judul Pengganti]             % override judul
\makecover[][Proposal Penelitian]       % + jenis dokumen
```

## \Figure

```latex
\Figure{figures/logo_institusi.png}{Keterangan gambar.}{fig:logo}
```

Menghasilkan lingkungan `figure` dengan caption dan label. Ukuran gambar
default `0.8\linewidth` (ubah di definisi `\Figure` bila perlu).

## \Table

Isi tabel ditulis dalam argumen kedua (gaya `booktabs`):

```latex
\Table{tab:contoh}{
  \begin{tabular}{ll}
  \toprule
  A & B \\
  \bottomrule
  \end{tabular}
}{Keterangan tabel.}
```

## \Equation

```latex
\Equation{eq:model}{P(x) = \frac{1}{1 + e^{-x}}}
```

Menghasilkan lingkungan `equation` bernomor dengan label.

## \Appendix

```latex
\Appendix{Lampiran A}    % bab lampiran biasa
\Appendix*{Lampiran}     % lampiran tanpa nomor bab baru
```

## \Source

```latex
\Figure{figures/x.png}{Keterangan.}{fig:x}
\Source{Diadaptasi dari: Author (2020).}
```

Menampilkan catatan kecil di bawah elemen (biasanya setelah gambar/tabel).

## \HRule

```latex
\HRule
```

Garis horizontal setebal 0,5 mm (umum dipakai untuk hiasan judul).

> Semua perintah memakai `\NewDocumentCommand` dari kernel LaTeX — tidak
> memerlukan paket tambahan.

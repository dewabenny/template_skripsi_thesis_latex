# Contoh (Examples)

Folder `examples/` berisi dokumen contoh yang siap dikompilasi untuk
berbagai jenis karya ilmiah. Semua contoh **memakai framework yang sama**
dari root — tidak ada duplikasi preamble.

## Daftar Contoh

| Contoh | Jenis | Tema |
|--------|-------|------|
| `examples/proposal/` | Proposal penelitian | classic |
| `examples/thesis/` | Tesis (master's thesis) | modern |
| `examples/dissertation/` | Disertasi | book |
| `examples/book/` | Buku akademik | book |

## Build Semua Contoh

Dari root proyek:

```bash
make examples
```

Hasil:

```
output/proposal-example.pdf
output/thesis-example.pdf
output/dissertation-example.pdf
output/book-example.pdf
```

## Build Satu Contoh

```bash
latexmk -lualatex -outdir=output examples/thesis/main.tex
```

## Memakai Contoh sebagai Titik Awal

1. Salin folder contoh (mis. `cp -r examples/thesis proyek-saya`).
2. Sesuaikan `metadata` (judul, penulis, pembimbing, institusi).
3. Tulis isi bab.
4. Tambahkan referensi ke `bibliography/references.bib`.
5. Build dengan `make pdf`.

> Contoh memanggil `\input{preamble/...}` dari root. Jika memindahkan
> contoh ke luar repo, salin juga folder `preamble/`, `frontmatter/`,
> `figures/`, dan `bibliography/` yang dibutuhkan.

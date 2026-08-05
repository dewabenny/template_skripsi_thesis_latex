# Contoh (Examples)

Folder `examples/` berisi dokumen contoh yang siap dikompilasi untuk
berbagai jenis karya ilmiah. Semua contoh **memakai framework yang sama**
dari root — tidak ada duplikasi preamble.

Setiap contoh non-class mandiri di foldernya: mendefinisikan
`\frameworkRoot` = `../../` sehingga path ke `preamble/`, `frontmatter/`,
`figures/`, dan `bibliography/` mengarah ke framework root. Ini membuat
contoh dapat dikompilasi dari dalam foldernya sendiri (mis. VS Code).

## Daftar Contoh

| Contoh | Jenis | Tema | Kompilasi dari |
|--------|-------|------|----------------|
| `examples/class/` | Penggunaan class file `academic-id` | classic | root proyek |
| `examples/proposal/` | Proposal penelitian | classic | folder contoh |
| `examples/thesis/` | Tesis (master's thesis) | modern | folder contoh |
| `examples/dissertation/` | Disertasi | book | folder contoh |
| `examples/book/` | Buku akademik | book | folder contoh |

## Build Semua Contoh

Dari root proyek:

```bash
make examples
```

Hasil:

```
output/class-example.pdf
output/proposal-example.pdf
output/thesis-example.pdf
output/dissertation-example.pdf
output/book-example.pdf
```

## Build Satu Contoh

Contoh non-class — kompilasi **dari dalam foldernya**:

```bash
cd examples/thesis
latexmk -lualatex -outdir=output main.tex
```

Khusus `examples/class/` — kompilasi **dari root** (agar `academic-id.cls`
ditemukan):

```bash
latexmk -lualatex -outdir=output examples/class/main.tex
```

## Memakai Contoh sebagai Titik Awal

1. Salin folder contoh (mis. `cp -r examples/thesis proyek-saya`).
2. Sesuaikan `metadata` (judul, penulis, pembimbing, institusi).
3. Tulis isi bab.
4. Tambahkan referensi ke `bibliography/references.bib`.
5. Build dengan `latexmk -lualatex -outdir=output main.tex`.

> Contoh memanggil `\input{\frameworkRoot preamble/...}`. Bila contoh
> dipindahkan ke luar repo, salin juga folder `preamble/`, `frontmatter/`,
> `figures/`, dan `bibliography/`, lalu sesuaikan nilai `\frameworkRoot`.

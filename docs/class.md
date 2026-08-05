# Class File (`academic-id.cls`)

Tujuan jangka panjang framework ini adalah menyediakan **class file**
sehingga pengguna cukup menulis:

```latex
\documentclass{academic-id}
```

tanpa meng-import beberapa file preamble secara manual.

## Status

`academic-id.cls` tersedia di root proyek. Saat ini class tersebut
**membungkus modul framework yang sudah ada** (meng-*input* `preamble/`)
— bukan class yang mandiri sepenuhnya.

## Pemakaian

```latex
\documentclass{academic-id}

\begin{document}
\makecover
\input{frontmatter/abstract}
\include{chapters/01_pendahuluan}
% ...
\end{document}
```

- Identitas dokumen tetap diisi di `preamble/metadata.tex`.
- Seluruh perintah reusable (`\makecover`, `\Figure`, `\Table`,
  `\Equation`, `\Appendix`, `\Source`) tersedia otomatis.
- Tema dipilih dengan `\usetheme{name}` di dalam dokumen.

## Kompilasi

Class membaca modul relatif terhadap struktur framework, sehingga kompilasi
dilakukan **dari root proyek**:

```bash
latexmk -lualatex -outdir=output examples/class/main.tex
```

## Batasan & Arah Masa Depan

- Class saat ini **bergantung pada struktur folder framework** (`preamble/`,
  `frontmatter/`, `figures/`, `bibliography/`).
- Roadmap: membuat class **self-contained** sehingga hanya satu file
  `academic-id.cls` yang dibutuhkan, tanpa bergantung pada folder luar.
- Konfigurasi metadata, tema, dan pengaturan akan tersedia sebagai opsi
  class (mis. `\documentclass[theme=modern]{academic-id}`).

## Lihat Juga

- [Contoh class file](../examples.md)
- [Arsitektur](architecture.md)

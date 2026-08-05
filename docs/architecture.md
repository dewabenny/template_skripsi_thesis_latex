# Arsitektur

Bagian ini menjelaskan **mengapa** framework disusun dengan cara tertentu,
bukan hanya bagaimana cara kerjanya.

## Prinsip Dasar

Framework mengikuti **Single Responsibility Principle** (SRP): setiap file
memiliki satu tanggung jawab yang jelas. Ini bertujuan agar:

- mudah dipelihara (perubahan terlokalisasi),
- mudah dipakai ulang (modul kecil independen),
- mudah dites (setiap bagian dapat diverifikasi terpisah).

```
metadata   →  commands   →  styles   →  content
  (data)       (API)        (tampilan)   (dokumen)
```

Alur ini memastikan **data tidak tercampur dengan tampilan**. Identitas
dokumen (judul, penulis, institusi) hanya hidup di `metadata.tex`, sehingga
mengganti informasi tidak perlu menyentuh file layout.

## Alur Kompilasi

```
main.tex
  ├── preamble/metadata.tex     ← data dokumen (\doc*)
  ├── preamble/packages.tex     ← pemuatan paket
  ├── preamble/settings.tex     ← import modul setting/
  ├── preamble/command.tex      ← perintah reusable (\makecover, \Figure, ...)
  ├── themes/<theme>.tex        ← tema tampilan (melalui \usetheme)
  └── \begin{document}
        ├── frontmatter/cover.tex     ← \makecover
        ├── frontmatter/abstract.tex
        ├── frontmatter/toctables.tex
        ├── chapters/*.tex            ← konten (via \include)
        └── \end{document}
```

## Modul-Modul Kunci

### `preamble/`

| File | Tanggung jawab |
|------|----------------|
| `metadata.tex` | Definisi seluruh metadata dokumen (`\docTitle`, `\docAuthor`, dst.) |
| `packages.tex` | Pemuatan paket + biblatex + font |
| `settings.tex` | Induk pengaturan; hanya meng-import modul `setting/` |
| `command.tex`  | Perintah reusable: `\makecover`, `\usetheme`, `\Figure`, `\Table`, `\Equation`, `\Appendix`, `\Source`, `\HRule` |

### `preamble/setting/`

| File | Tanggung jawab |
|------|----------------|
| `spacing.tex` | Jarak baris & paragraf |
| `typography.tex` | Nama bagian (DAFTAR ISI, DAFTAR GAMBAR, dst.) |
| `chapter.tex` | Format judul BAB |
| `section.tex` | Format section/subsection/subsubsection |
| `numbering.tex` | Penomoran gambar & tabel per bab |
| `caption.tex` | Format keterangan gambar/tabel |
| `toc.tex` | Daftar isi, daftar gambar, daftar tabel |
| `bibliography.tex` | Format heading daftar pustaka |
| `hyperlink.tex` | Konfigurasi hyperref + metadata PDF |

### `themes/`

Tema tampilan: `classic` (default), `modern`, `minimal`, `book`. Dipilih
melalui `\usetheme{name}` di `main.tex`.

### `frontmatter/` dan `chapters/`

- `frontmatter/` — bagian awal dokumen (cover, abstrak, daftar isi/gambar/tabel).
- `chapters/` — konten per bab, dimuat dengan `\include` (mendukung `\includeonly`).

## Aturan Penamaan

- Konvensi `doc*` untuk metadata: `\docTitle`, `\docAuthor`, `\docProgram`,
  `\docFaculty`, `\docUniversity`, `\docSupervisor`, `\docLogo`, `\docYear`, dst.
- Jangan hardcode nilai metadata di luar `metadata.tex`.

## Path Framework (`\frameworkRoot`)

Semua `\input` internal framework diawali `\frameworkRoot` — makro yang
didefinisikan oleh entry point dokumen:

| Entry point | Nilai `\frameworkRoot` |
|-------------|------------------------|
| `main.tex` (root) | kosong |
| `examples/<jenis>/main.tex` | `../../` |

Dengan mekanisme ini, framework dapat dikompilasi dari direktori mana pun
(root maupun folder contoh) tanpa mengubah path di dalam modul.

## Mengapa Bukan Satu File Besar?

Satu file besar (monolith) terasa cepat saat awal, tetapi:

- sulit dibaca dan dicari,
- perubahan kecil berisiko merusak bagian lain,
- sulit dipakai ulang untuk dokumen berbeda.

Modularitas lebih mahal sedikit di awal, tetapi menghemat jauh lebih banyak
di siklus hidup proyek.

# Template LaTeX Penulisan Ilmiah

Template LaTeX untuk penulisan karya ilmiah Bahasa Indonesia (proposal penelitian, laporan penelitian, tesis, atau laporan fellowship) dengan format khas dokumen ilmiah: halaman judul, abstrak, daftar isi/gambar/tabel, bab-bab terstruktur, dan daftar pustaka gaya Vancouver.

## Penulis

**dr. Dewa Gede Benny Raharja Prabawa, M.Biomed, Sp.M**

## Lisensi

Distributed under the **MIT License**. Lihat berkas `LICENSE` untuk detail lengkap.

## Struktur Proyek

```
.
├── main.tex                  # Berkas utama (menggabungkan seluruh bagian)
├── preamble/
│   ├── metadata.tex          # Judul, penulis, pembimbing, institusi, tahun
│   ├── package.tex           # Daftar paket LaTeX yang digunakan
│   ├── setting.tex           # Format/spacing/penomoran/kustomisasi tampilan
│   └── command.tex           # Perintah (command) khusus
├── frontmatter/
│   ├── cover.tex             # Halaman sampul
│   ├── abstract.tex          # Abstrak + kata kunci
│   └── toctables.tex         # Daftar isi, daftar gambar, daftar tabel
├── chapters/
│   ├── 01_pendahuluan.tex    # BAB I Pendahuluan
│   ├── 02_tinjauan_pustaka.tex
│   ├── 03_metode_penelitian.tex
│   ├── 04_hasil_pembahasan.tex
│   ├── 05_penutup.tex
│   └── 06_daftar_pustaka.tex
├── bibliography/
│   └── references.bib        # Database referensi (format BibTeX)
├── figures/                  # Simpan berkas gambar di sini
└── .vscode/
    └── settings.json         # Konfigurasi build LaTeX Workshop
```

## Dependensi (Dependency)

### Sistem / TeX Distribution

- **TeX Live** (disarankan versi terbaru) atau distribusi TeX lain dengan **LuaLaTeX**.
- **Biber** (untuk pemrosesan daftar pustaka).
- **Font "Times New Roman"** terpasang di sistem (dibutuhkan `fontspec`).

### Paket LaTeX

Paket berikut dimuat otomatis di `preamble/package.tex`:

| Paket | Fungsi |
|-------|--------|
| `geometry` | Pengaturan margin halaman (A4: kiri 4cm, kanan 3cm, atas/bawah 3cm) |
| `fontspec` | Pemilihan font (Times New Roman) — butuh LuaLaTeX |
| `babel` | Bahasa dokumen (Indonesia) |
| `setspace` | Jarak baris 1,5 spasi |
| `graphicx` | Penyisipan gambar |
| `booktabs` | Tabel berkualitas (garis horizontal) |
| `array` | Format tabel lanjutan |
| `titlesec` | Format judul bab/section |
| `caption` | Format keterangan gambar & tabel |
| `csquotes` | Manajemen tanda kutip |
| `microtype` | Kerning/tipografi halus |
| `amsmath` | Notasi matematika |
| `chngcntr` | Penomoran ulang gambar/tabel per bab |
| `biblatex` (gaya `vancouver`) | Sitasi & daftar pustaka |
| `hyperref` | Tautan/link internal PDF |

### Alat Bantu (Opsional, Disarankan)

- **VS Code** + ekstensi **LaTeX Workshop** (konfigurasi build sudah tersedia di `.vscode/settings.json`).

## Cara Penggunaan (Usage)

### Opsi 1 — VS Code (LaTeX Workshop)

1. Buka folder proyek ini di VS Code.
2. Buka `main.tex`.
3. Jalankan build dengan tombol **Build LaTeX project** (▷) di sidebar LaTeX Workshop.
4. Ekstensi akan otomatis menjalankan: `LuaLaTeX → biber → LuaLaTeX ×2`.
5. Hasil PDF tersimpan di folder `output/main.pdf` (dibuat otomatis).

### Opsi 2 — Baris Perintah (Command Line)

Jalankan dari folder proyek (root):

```bash
lualatex -output-directory=output main.tex
biber  --output-directory=output main
lualatex -output-directory=output main.tex
lualatex -output-directory=output main.tex
```

Atau dengan `latexmk`:

```bash
latexmk -lualatex -outdir=output main.tex
```

> Catatan: gunakan **LuaLaTeX** (bukan pdfLaTeX) karena dokumen memakai `fontspec` untuk font Times New Roman.

## Cara Pengisian (Filling)

### 1. Identitas dokumen — `preamble/metadata.tex`

Ganti semua nilai di berkas ini:

- `\docTitle` — judul penelitian (dalam huruf kapital otomatis).
- `\docAuthor` — nama penulis.
- `\Pembimbing` — nama pembimbing (boleh lebih dari satu).
- `\Program`, `\Department`, `\Faculty`, `\Hospital`, `\University`, `\Location`, `\SubmissionYear` — identitas institusi.
- `\docSubject`, `\docKeywords` — metadata PDF.

### 2. Halaman sampul — `frontmatter/cover.tex`

- Ganti logo dengan meng-*overwrite* `figures/logo_institusi.png` atau sesuaikan perintah `\includegraphics[width=4cm,height=4cm,keepaspectratio]{figures/logo_institusi.png}`.
- Logo bawaan (`logo_institusi.png`) adalah contoh logo institusi pembuat template dan bersifat opsional. Untuk institusi lain, ganti berkas logo Anda; jika tidak ingin logo, hapus baris `\includegraphics` di `cover.tex`.

### 3. Abstrak — `frontmatter/abstract.tex`

Tulis ringkasan masalah, metode, hasil, dan kesimpulan. Perbarui bagian **Kata kunci**.

### 4. Isi bab — `chapters/*.tex`

Setiap berkas bab sudah berisi **panduan berupa komentar `%`** yang menjelaskan isi dan cara menulis masing-masing bagian. Cara pengisian:

1. Baca komentar panduan di setiap `\section`/`\subsection`.
2. Ganti/ketik narasi Anda di bawah judul bagian tersebut (komentar tidak ikut tercetak di PDF).
3. Hapus atau biarkan komentar contoh — komentar tidak memengaruhi hasil akhir.
4. Sisipkan gambar di folder `figures/` lalu gunakan lingkungan `figure`, dan tabel dengan `table` (contoh tersedia di `chapters/04_hasil_pembahasan.tex`).

### 5. Sitasi dan daftar pustaka

1. Tambahkan referensi pada `bibliography/references.bib` (format BibTeX).
2. Di dalam teks, kutip dengan `\supercite{keyReferensi}` (gaya Vancouver/angka), contoh:

   ```latex
   Trauma okuli merupakan penyebab utama kebutaan.\supercite{keyReferensi1,keyReferensi2}
   ```

3. Bangun ulang dokumen (lihat bagian Cara Penggunaan). Daftar pustaka akan tampil otomatis di Bab VI.

> Catatan: nomor sitasi dan daftar pustaka dihasilkan otomatis oleh biber/biblatex, jadi cukup tulis key-nya saja.

## Sitasi Otomatis dengan Zotero (Auto-Sync)

Sitasi pada template ini memakai biblatex/biber yang membaca `bibliography/references.bib`. Anda dapat menghubungkan **Zotero** agar berkas `references.bib` diperbarui otomatis setiap kali koleksi referensi berubah, sehingga pengelolaan referensi cukup dilakukan di Zotero — tanpa mengedit `.bib` secara manual.

### 1. Persiapan

1. Pasang **Zotero** (<https://www.zotero.org>).
2. Pasang ekstensi **Better BibTeX for Zotero** (<https://retorque.re/zotero-better-bibtex>) — diperlukan untuk fitur auto-export.
3. Mulai ulang (restart) Zotero setelah ekstensi terpasang.

### 2. Buat koleksi di Zotero

1. Di panel kiri Zotero, buat **koleksi** (collection) khusus dokumen ini, misal `Proposal Glaukoma`.
2. Masukkan semua referensi yang dibutuhkan ke dalam koleksi tersebut.

### 3. Set auto-export ke references.bib

**Cara A — lewat Preferences (disarankan):**

1. Buka **Zotero → Preferences/Setelan → tab Better BibTeX → Export**.
2. Pada bagian **Automatic export**, klik **+** untuk menambah baris:
   - **Collection**: pilih koleksi (mis. `Proposal Glaukoma`).
   - **Format**: pilih `Better BibTeX` (atau `BibLaTeX`).
   - **File**: arahkan ke `bibliography/references.bib` di folder proyek ini.
3. Klik **OK**. Zotero kini menulis ulang `references.bib` otomatis pada setiap perubahan referensi.

**Cara B — lewat Export Collection (alternatif cepat):**

1. Klik kanan koleksi → **Export Collection...**.
2. Pilih format **Better BibTeX**, lalu centang **Keep updated** (auto-export).
3. Simpan ke `bibliography/references.bib`.

### 4. Mengutip di dokumen

- **Cite key** dibuat otomatis oleh Better BibTeX dengan pola `penulisTahunJudul`, contoh `ngTraumaticGlaucoma2026` (sama dengan format key pada template ini).
- Salin key dengan klik kanan item di Zotero → **Better BibTeX → Copy citation key**.
- Kutip di teks dengan `\supercite{}`:

  ```latex
  Trauma okuli merupakan penyebab utama kebutaan.\supercite{ngTraumaticGlaucoma2026,negrelGlobalImpactEye1998a}
  ```

- Setelah menambah/mengubah referensi di Zotero, **bangun ulang dokumen** (LuaLaTeX → biber → LuaLaTeX×2) agar nomor sitasi dan daftar pustaka ikut diperbarui.

### 5. Catatan penting

- Saat auto-export aktif, **jangan mengedit `references.bib` secara manual** — berkas akan ditimpa oleh Zotero.
- Pastikan path export sama dengan `\addbibresource{bibliography/references.bib}` di `preamble/package.tex`, dan jalankan build dari folder proyek (root).
- Bila sitasi yang ditulis tidak ditemukan (peringatan *undefined citations* dari biber), pastikan referensinya sudah masuk koleksi dan auto-export sudah berjalan.

## FAQ

### 1. Cara mengganti font

Buka `preamble/package.tex`, ubah baris berikut:

```latex
\setmainfont{Times New Roman}
```

Ganti `Times New Roman` dengan nama font yang terpasang di sistem Anda, misalnya:

```latex
\setmainfont{Georgia}
\setmainfont{Times New Roman}      % default template
\setmainfont{TeX Gyre Termes}      % alternatif gratis, mirip Times
\setmainfont{Liberation Serif}     % alternatif gratis, mirip Times
```

- Nama font harus persis seperti yang dikenal sistem (cek daftar font dengan perintah `fc-list` di terminal).
- Ukuran font dasar diatur pada `main.tex` baris 1: `\documentclass[12pt]{report}` (ganti `12pt` → `11pt` atau `10pt`).
- Ukuran font khusus untuk judul bab/section diatur terpisah di `preamble/setting.tex` (`\fontsize{...}{...}` pada `\titleformat`).
- Setelah mengubah font, **gunakan LuaLaTeX** (fontspec tidak bekerja dengan pdfLaTeX).

### 2. Cara mengubah margin

Margin diatur di `preamble/package.tex` baris 1:

```latex
\usepackage[a4paper,left=4cm,right=3cm,top=3cm,bottom=3cm]{geometry}
```

- `left`/`right`/`top`/`bottom` = margin dalam sentimeter (bisa juga `mm`/`in`).
- Contoh margin 2,5 cm semua sisi:

  ```latex
  \usepackage[a4paper,margin=2.5cm]{geometry}
  ```

- Untuk ukuran kertas lain, ganti `a4paper` → `letterpaper`, `a5paper`, atau `legalpaper`.

### 3. Cara memasukkan gambar dan tabel

**Gambar:**

1. Simpan berkas gambar ke folder `figures/` (format PNG/JPG/PDF; SVG perlu dikonversi dulu).
2. Sisipkan dengan lingkungan `figure`:

   ```latex
   \begin{figure}[ht]
   \centering
   \includegraphics[width=0.8\linewidth]{figures/nama_file_gambar}
   \caption{Keterangan gambar di sini.}
   \label{fig:contoh}
   \end{figure}
   ```

3. Rujuk di teks dengan `Gambar~\ref{fig:contoh}`. Nomor gambar dibuat otomatis (mis. Gambar 4.1).

> Tips: kendalikan ukuran dengan `width=`/`height=` (dalam `\linewidth` atau `cm`). Contoh lengkap ada di `chapters/04_hasil_pembahasan.tex`.

**Tabel:**

Gunakan paket `booktabs` (garis `\toprule`, `\midrule`, `\bottomrule`):

```latex
\begin{table}[ht]
\centering
\begin{tabular}{ll}
\toprule
Variabel & Keterangan \\
\midrule
A & Contoh data A \\
B & Contoh data B \\
\bottomrule
\end{tabular}
\caption{Keterangan tabel di sini.}
\label{tab:contoh}
\end{table}
```

Rujuk di teks dengan `Tabel~\ref{tab:contoh}`. Nomor tabel dibuat otomatis (mis. Tabel 4.1).

### 4. Cara mengatur halaman / layout dokumen

Pengaturan utama tersebar di `preamble/setting.tex` dan `preamble/package.tex`:

| Pengaturan | Lokasi | Cara mengubah |
|------------|--------|---------------|
| Spasi baris | `setting.tex` | `\onehalfspacing` → `\singlespacing` atau `\doublespacing` |
| Indentasi paragraf | `setting.tex` | `\setlength{\parindent}{1.27cm}` |
| Jarak antar paragraf | `setting.tex` | `\setlength{\parskip}{0pt}` |
| Format & ukuran judul bab | `setting.tex` | Blok `\titleformat{\chapter}...` (ubah `\fontsize{16pt}{20pt}`, teks "BAB", `\MakeUppercase`) |
| Format section/subsection | `setting.tex` | Blok `\titleformat{\section}` / `\subsection` |
| Ukuran & jenis kertas, margin | `package.tex` | `geometry` (lihat FAQ no. 2) |
| Penomoran gambar/tabel per bab | `setting.tex` | `\numberwithin{figure}{chapter}` / `\numberwithin{table}{chapter}` |
| Penomoran halaman (romawi/arab) | `frontmatter/toctables.tex` | `\pagenumbering{roman}` / `\pagenumbering{arabic}` |
| Jarak baris ganda antar-baris judul | `setting.tex` | Nilai kedua pada `\fontsize{ukuran}{jarak}` |

Setelah mengubah pengaturan apa pun, **bangun ulang dokumen** (LuaLaTeX → biber → LuaLaTeX×2).

## Catatan

- Judul bab, nomor halaman, daftar isi, dan penomoran gambar/tabel dibuat otomatis — tidak perlu diatur manual.
- Jika font "Times New Roman" tidak tersedia, ganti `\setmainfont{Times New Roman}` di `preamble/package.tex` dengan font yang tersedia (mis. `Liberation Serif` atau `TeX Gyre Termes`).

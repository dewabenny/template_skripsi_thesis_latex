# Bab (Chapters)

Dokumen ini menjelaskan struktur bab, bagaimana penomoran bekerja, dan cara
menyesuaikan susunan bab — termasuk **memisah Bab "Hasil dan Pembahasan"
menjadi dua bab terpisah** (Hasil, lalu Pembahasan), **menambah bab**,
serta **menghapus bab atau section**.

## Struktur Bab

Isi dokumen berada di `chapters/`. Setiap bab adalah satu file yang dimulai
dengan `\chapter{...}`:

| File | Isi |
|------|-----|
| `chapters/01_pendahuluan.tex` | BAB I — Pendahuluan |
| `chapters/02_tinjauan_pustaka.tex` | BAB II — Tinjauan Pustaka |
| `chapters/03_metode_penelitian.tex` | BAB III — Metode Penelitian |
| `chapters/04_hasil_pembahasan.tex` | BAB IV — Hasil dan Pembahasan |
| `chapters/05_penutup.tex` | BAB V — Penutup |
| `chapters/06_daftar_pustaka.tex` | Daftar Pustaka (via `\printbibliography`) |

Bab-bab di-*include* di `main.tex` **dalam urutan yang menentukan penomoran**:

```latex
\include{\frameworkRoot chapters/01_pendahuluan}
\include{\frameworkRoot chapters/02_tinjauan_pustaka}
\include{\frameworkRoot chapters/03_metode_penelitian}
\include{\frameworkRoot chapters/04_hasil_pembahasan}
\include{\frameworkRoot chapters/05_penutup}
\include{\frameworkRoot chapters/06_daftar_pustaka}
```

> Nomor bab (I, II, III, ...) **dihasilkan otomatis** dari urutan `\include`.
> Anda tidak perlu menulis angka secara manual.

## Menambah Bab Baru

1. Buat file baru, mis. `chapters/07_lampiran.tex`:

   ```latex
   \chapter{Lampiran}
   % Isi lampiran di sini.
   ```

2. Tambahkan ke `main.tex` sesuai posisi yang diinginkan:

   ```latex
   \include{\frameworkRoot chapters/07_lampiran}
   ```

3. Bangun ulang — nomor bab dan daftar isi diperbarui otomatis.

## Memisah Bab "Hasil dan Pembahasan"

Bila format karya ilmiah Anda mengharuskan **Hasil** dan **Pembahasan** menjadi
bab terpisah, lakukan langkah berikut.

### 1. Buat dua file bab baru

**`chapters/04_hasil.tex`** — hanya berisi hasil (objektif, tanpa interpretasi):

```latex
\chapter{Hasil Penelitian}

\section{Karakteristik Subjek}

% Sajikan distribusi demografis dan klinis subjek.

\Table{tab:karakteristik}{
  \begin{tabular}{ll}
  \toprule
  Variabel & Keterangan \\
  \midrule
  Usia & Rata-rata (SD) \\
  \bottomrule
  \end{tabular}
}{Karakteristik subjek penelitian.}
```

**`chapters/05_pembahasan.tex`** — interpretasi dan kaitan dengan teori:

```latex
\chapter{Pembahasan}

\section{Interpretasi Hasil Utama}

% Tafsirkan temuan dan kaitkan dengan teori serta penelitian sebelumnya.

\section{Keterbatasan Penelitian}

% Akui keterbatasan desain, sampel, atau potensi bias.
```

> Pindahkan konten `\section{Pembahasan}` dan `\section{Keterbatasan Penelitian}`
> dari bab hasil lama ke file pembahasan ini.

### 2. Perbarui `main.tex`

Ganti `\include` bab hasil-pembahasan lama dengan dua `\include` baru, lalu
geser nomor bab berikutnya (penutup, daftar pustaka):

```latex
\include{\frameworkRoot chapters/04_hasil}
\include{\frameworkRoot chapters/05_pembahasan}
\include{\frameworkRoot chapters/06_penutup}
\include{\frameworkRoot chapters/07_daftar_pustaka}
```

### 3. (Opsional) Rename file lama

Untuk menjaga keteraturan, ubah nama file agar sesuai urutan baru:

```bash
mv chapters/04_hasil_pembahasan.tex chapters/04_hasil.tex
# buat chapters/05_pembahasan.tex
mv chapters/05_penutup.tex chapters/06_penutup.tex
mv chapters/06_daftar_pustaka.tex chapters/07_daftar_pustaka.tex
```

Sesuaikan `\include` di `main.tex` dengan nama file yang baru.

### 4. Bangun ulang

```bash
make pdf   # atau: latexmk -lualatex -outdir=output main.tex
```

Hasilnya:

- BAB IV — Hasil Penelitian
- BAB V — Pembahasan
- BAB VI — Penutup
- Daftar Pustaka

Nomor bab, daftar isi, dan referensi silang diperbarui otomatis.

## Menghapus Bab

Untuk menghapus sebuah bab:

1. **Hapus `\include`-nya di `main.tex`** — bab tidak lagi muncul, nomor bab
   berikutnya otomatis mundur. Ini langkah paling penting.

   ```latex
   % sebelum: lima bab
   \include{\frameworkRoot chapters/03_metode_penelitian}
   \include{\frameworkRoot chapters/04_hasil_pembahasan}
   \include{\frameworkRoot chapters/05_penutup}

   % setelah: bab metode dihapus -> hasil menjadi BAB III
   \include{\frameworkRoot chapters/04_hasil_pembahasan}
   \include{\frameworkRoot chapters/05_penutup}
   ```

2. **Hapus (atau arsipkan) file bab** di `chapters/` agar tidak menumpuk:

   ```bash
   rm chapters/03_metode_penelitian.tex
   ```

   Bila ragu, pindahkan ke folder arsip alih-alih menghapus permanen:

   ```bash
   mkdir -p chapters/_arsip
   mv chapters/03_metode_penelitian.tex chapters/_arsip/
   ```

3. **(Opsional) penomoran ulang nama file** agar urut:

   ```bash
   # mis. setelah menghapus bab 3:
   mv chapters/04_hasil_pembahasan.tex chapters/03_hasil_pembahasan.tex
   mv chapters/05_penutup.tex chapters/04_penutup.tex
   mv chapters/06_daftar_pustaka.tex chapters/05_daftar_pustaka.tex
   ```

   Sesuaikan `\include` di `main.tex` dengan nama file yang baru.

4. **Bangun ulang** dan periksa daftar isi serta nomor bab.

> Peringatan: menghapus bab yang dirujuk file lain akan membuat referensi
> silang (`\ref`) ke bab tersebut menjadi `??`. Periksa kembali sebelum build.

## Menghapus Section

Untuk menghapus sebuah section (atau subsection/subsubsection) di dalam bab,
cukup hapus blok `\section{...}` (beserta isinya) dari file bab:

```latex
\chapter{Metode Penelitian}
\section{Desain Penelitian}
% isi section desain ...

\section{Tempat dan Waktu Penelitian}   % <- hapus seluruh blok ini
% isi ...

\section{Populasi dan Sampel}           % <- tersisa; menjadi section berikutnya
```

Setelah dihapus, nomor section berikutnya otomatis mundur
(2.3 → 2.2) dan daftar isi ikut diperbarui. Tidak ada perubahan lain yang
diperlukan.

### Menghapus sebagian isi (bukan seluruh section)

Bila hanya ingin mengosongkan isi tetapi tetap menyisakan judul, kosongkan
isinya atau beri komentar:

```latex
\section{Tempat dan Waktu Penelitian}
% Isi dihapus sementara.
```

> Komentar `%` tidak tercetak di PDF, jadi Anda dapat menonaktifkan isi tanpa
> menghapusnya.

## Merujuk Section dari Bagian Lain

Saat menghapus section, periksa apakah ada `\ref` ke label-nya. Bila ya,
hapus kalimat yang merujuknya atau ganti dengan label section lain:

```latex
% menghapus section ini juga mengharuskan kalimat berikut diperbaiki
Metode dijelaskan pada Bagian~\ref{sec:tempat}.   % label tidak ada lagi -> ??
```

## Referensi Silang Antar Bab

Gunakan `\label`/`\ref` untuk merujuk bagian bab lain:

```latex
% di bab hasil
\label{sec:karakteristik}

% di bab pembahasan
Karakteristik subjek telah disajikan pada Bagian~\ref{sec:karakteristik}.
```

## Kompilasi Cepat Satu Bab

Untuk menghemat waktu saat menulis, aktifkan `\includeonly` di `main.tex`:

```latex
\includeonly{\frameworkRoot chapters/04_hasil}
```

> Catatan: nomor halaman/sitasi dapat berubah saat `\includeonly` aktif —
> lakukan build penuh untuk hasil akhir.

## Checklist

- [ ] Setiap bab dimulai dengan `\chapter{...}`.
- [ ] Urutan `\include` di `main.tex` sesuai susunan bab yang diinginkan.
- [ ] File bab dinomori (`01_`, `02_`, ...) sesuai urutan.
- [ ] Setelah memisah/menambah bab, build penuh (LuaLaTeX → biber → LuaLaTeX×2).
- [ ] TOC dan nomor bab tampil benar.

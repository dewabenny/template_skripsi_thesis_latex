# Bibliografi

Framework memakai **biblatex** dengan backend **Biber** dan gaya **Vancouver**.

## Alur Kerja

1. Tambahkan referensi ke `bibliography/references.bib` (format BibTeX).
2. Kutip di teks dengan `\supercite{key}`.
3. Bangun ulang dokumen: **LuaLaTeX → Biber → LuaLaTeX → LuaLaTeX**.

Daftar pustaka otomatis tampil di Bab VI (`chapters/06_daftar_pustaka.tex`),
yang berisi:

```latex
\printbibliography[
    title={Daftar Pustaka}]
```

## Menambahkan Referensi

Contoh entri di `references.bib`:

```bibtex
@article{santosoKarakteristikGlaukomaTraumatik2020,
  author        = {Santoso, Budi and Wijaya, Andi},
  title         = {Karakteristik Klinis Pasien Glaukoma Traumatik di Rumah Sakit Pusat Contoh},
  journaltitle  = {Jurnal Oftalmologi Indonesia},
  date          = {2020},
  volume        = {16},
  number        = {2},
  pages         = {85--92},
  doi           = {10.1234/joi.2020.16.2.85}
}
```

## Mengutip di Teks

```latex
Trauma okuli merupakan penyebab utama kebutaan.\supercite{keyReferensi1,keyReferensi2}
```

- Beberapa referensi sekaligus: `\supercite{key1,key2}`.
- Nomor sitasi dibuat otomatis sesuai urutan kemunculan (`sorting=none`).

## Gaya Vancouver

- `style=vancouver` di `preamble/packages.tex`.
- `sorting=none` — daftar pustaka urut sesuai urutan sitasi.
- Umum dipakai untuk karya ilmiah bidang kedokteran/kesehatan.

## Sinkronisasi Zotero (Better BibTeX)

1. Pasang [Zotero](https://www.zotero.org) + [Better BibTeX](https://retorque.re/zotero-better-bibtex).
2. Buat koleksi (mis. `Proposal Glaukoma`).
3. **Zotero → Preferences → Better BibTeX → Export → Automatic export (+)**:
   - Collection: pilih koleksi,
   - Format: `Better BibTeX`,
   - File: `bibliography/references.bib`.
4. Salin cite key dari Zotero dan kutip dengan `\supercite{key}`.

> Saat auto-export aktif, **jangan mengedit `references.bib` manual** — berkas
> akan ditimpa oleh Zotero.

## Pemecahan Masalah Umum

| Gejala | Solusi |
|--------|--------|
| `undefined citations` | Biber belum dijalankan, atau key tidak ada di `.bib` |
| Daftar pustaka kosong | Tidak ada `\supercite{}` aktif di teks |
| Urutan referensi salah | Pastikan `sorting=none` aktif |

Lihat juga [Troubleshooting](troubleshooting.md).

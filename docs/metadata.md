# Metadata

Dokumen ini menjelaskan **satu-satunya sumber informasi dokumen**:
`preamble/metadata.tex`.

## Mengapa Metadata Terpusat?

Saat judul, penulis, atau institusi diubah, perubahan harus terjadi **di satu
tempat** saja. Pendekatan ini mencegah:

- inkonsistensi (judul berbeda antara cover dan PDF metadata),
- duplikasi (nilai yang sama ditulis berkali-kali),
- kesalahan saat mengganti identitas untuk dokumen lain.

## Konvensi Penamaan

Semua metadata memakai awalan `doc*` (kecuali alias lama untuk backward
compatibility):

| Perintah | Deskripsi |
|----------|-----------|
| `\docTitle` | Judul dokumen |
| `\docSubtitle` | Subjudul (opsional, kosong bila tidak ada) |
| `\docAuthor` | Nama penulis |
| `\docStudentID` | NIM/NIP (opsional) |
| `\docSupervisor` | Nama pembimbing |
| `\docCosupervisor` | Nama pembimbing pendamping (opsional) |
| `\docProgram` | Program studi |
| `\docDepartment` | Departemen |
| `\docFaculty` | Fakultas |
| `\docHospital` | Rumah sakit |
| `\docUniversity` | Universitas |
| `\docLocation` | Kota |
| `\docYear` | Tahun |
| `\docLogo` | Path berkas logo |
| `\docSubject` | Subjek (untuk metadata PDF) |
| `\docKeywords` | Kata kunci (untuk metadata PDF) |

## Pemakaian di Dokumen

Semua komponen membaca nilai dari sini:

- `\makecover` — judul, subjudul, penulis, pembimbing, institusi, logo, tahun.
- `setting/hyperlink.tex` — `pdftitle`, `pdfauthor`, `pdfsubject`, `pdfkeywords`.
- Bagian lain memakai `\doc*` sesuai kebutuhan.

## Contoh Pengisian

```latex
\newcommand{\docTitle}{Hubungan Tekanan Intraokular dengan ...}
\newcommand{\docAuthor}{dr. Nama Lengkap}
\newcommand{\docSupervisor}{dr. Pembimbing, Sp.M}
\newcommand{\docProgram}{PROGRAM STUDI ILMU PENYAKIT MATA}
\newcommand{\docFaculty}{FAKULTAS KEDOKTERAN}
\newcommand{\docUniversity}{UNIVERSITAS CONTOH}
\newcommand{\docHospital}{RUMAH SAKIT UMUM CONTOH}
\newcommand{\docLocation}{DENPASAR}
\newcommand{\docYear}{2026}
\newcommand{\docLogo}{figures/logo_institusi.png}
```

## Aturan Emas

- **Jangan hardcode** nilai metadata di luar `metadata.tex`.
- Jangan mengubah nama `\doc*` tanpa memperbarui seluruh pemakai.
- Untuk dokumen baru, salin `metadata.tex` dan ganti nilainya saja.

## Backward Compatibility

Nama lama tersedia sebagai alias (`\let`):

```latex
\let\Pembimbing\docSupervisor
\let\Program\docProgram
\let\Department\docDepartment
\let\Faculty\docFaculty
\let\Hospital\docHospital
\let\University\docUniversity
\let\Location\docLocation
\let\SubmissionYear\docYear
```

Dokumen lama yang memakai `\Program`, `\Faculty`, dst. tetap dapat dikompilasi.
Untuk dokumen baru, gunakan penamaan `doc*`.

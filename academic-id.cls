% ================================================================
% academic-id.cls
% Indonesian Academic LaTeX Framework
% ================================================================
% Class file yang membungkus seluruh framework sehingga pengguna cukup
% menulis:
%
%   \documentclass{academic-id}
%   \begin{document}
%   \makecover
%   ...
%   \end{document}
%
% Semua identitas dokumen tetap diisi lewat preamble/metadata.tex.
% Class ini meng-input modul framework yang sama (metadata, packages,
% settings, command) — tidak menduplikasi logika.
%
% Catatan: class mengharapkan struktur folder framework standar dan
% dikompilasi dari ROOT proyek (atau path preamble tersedia).
% ================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academic-id}[2026/08/06 v0.2.0 Indonesian Academic LaTeX Framework]

% Prefix path menuju akar framework. Kosong bila dokumen di root;
% untuk proyek turunan (mis. examples/<jenis>/) gunakan "../../".
\newcommand{\frameworkRoot}{}

% Teruskan opsi ke kelas dasar (report), kecuali ukuran font default.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% Opsi ukuran font: default 12pt bila tidak diberikan.
\ifx\@ptsize\@undefined
  \PassOptionsToClass{12pt}{report}
\fi

\LoadClass{report}

% ================================================================
% FRAMEWORK MODULES
% Muat seluruh modul framework (urutan sama seperti main.tex):
%   metadata -> packages -> settings -> command
% ================================================================

\input{\frameworkRoot preamble/metadata}
\input{\frameworkRoot preamble/packages}
\input{\frameworkRoot preamble/settings}
\input{\frameworkRoot preamble/command}

\endinput

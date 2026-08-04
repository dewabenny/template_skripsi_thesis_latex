$pdf_mode = 1;
$latex = 'lualatex %O -interaction=nonstopmode -synctex=1 -halt-on-error %S';
$bibtex = 'biber %O %B';
$biber = 'biber %O %B';
$makeindex = 'makeindex %O -o %D %S';
$out_dir = 'output';
@default_files = ('main.tex');

.PHONY: all build clean cleanall

all: build

build:
	latexmk -lualatex -outdir=output main.tex

clean:
	latexmk -c -outdir=output

cleanall:
	latexmk -C -outdir=output
	rm -rf output

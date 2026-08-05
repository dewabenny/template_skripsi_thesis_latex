# ================================================================
# Indonesian Academic LaTeX Framework — Build System
# ================================================================
# Targets:
#   make            alias untuk pdf
#   make pdf        build PDF dengan latexmk (LuaLaTeX + Biber)
#   make watch      build berulang saat file berubah (latexmk -pvc)
#   make clean      hapus artefak build (PDF tetap di output/)
#   make cleanall   hapus artefak + folder output/
#   make release    build penuh + salin PDF ke root
#   make lint       pemeriksaan cepat (compile + cek error)
# ================================================================

MAIN       = main
OUTDIR     = output
LATEXMK    = latexmk
LUALATEX   = lualatex

.PHONY: all pdf watch clean cleanall release lint examples

all: pdf

pdf:
	$(LATEXMK) -lualatex -outdir=$(OUTDIR) $(MAIN).tex

watch:
	$(LATEXMK) -lualatex -pvc -outdir=$(OUTDIR) $(MAIN).tex

clean:
	$(LATEXMK) -c -outdir=$(OUTDIR)

cleanall:
	$(LATEXMK) -C -outdir=$(OUTDIR)
	rm -rf $(OUTDIR)

release: pdf
	cp $(OUTDIR)/$(MAIN).pdf ./$(MAIN).pdf

lint:
	$(LATEXMK) -lualatex -outdir=$(OUTDIR) $(MAIN).tex
	@if grep -q '^!' $(OUTDIR)/$(MAIN).log; then \
		echo "ERROR: terdapat error pada log."; \
		grep '^!' $(OUTDIR)/$(MAIN).log | head -5; \
		exit 1; \
	else \
		echo "OK: tidak ada error kompilasi."; \
	fi

# Build semua contoh di examples/ (masing-masing ke output/<nama>-example.pdf)
EXAMPLES = proposal thesis dissertation book

examples:
	@for ex in $(EXAMPLES); do \
		echo "== Membangun contoh: $$ex =="; \
		$(LATEXMK) -lualatex -outdir=$(OUTDIR) -jobname=$$ex-example \
		  examples/$$ex/main.tex || exit 1; \
	done
	@echo "Semua contoh berhasil dibangun di $(OUTDIR)/*-example.pdf"

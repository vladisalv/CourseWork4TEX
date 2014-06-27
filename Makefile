FILE = termpaper
TEX = pdflatex
BIB = bibtex
PDF_VIEW = evince

FILE_TEX = $(addprefix $(FILE), .tex)
FILE_AUX = $(addprefix $(FILE), .aux)
FILE_PDF = $(addprefix $(FILE), .pdf)

.PHONY: all view clean vim print

all: build view

build:
	@$(TEX) $(FILE_TEX)
	@$(TEX) $(FILE_TEX)
	@$(BIB) $(FILE_AUX)
	@$(TEX) $(FILE_TEX)

view:
	@$(PDF_VIEW) $(FILE_PDF)

clean:
	@find $(FILE).* | grep -v tex | xargs rm -f

vim:
	@vim -s .vimopen

print:
	@echo "FILE = $(FILE)"
	@echo "FILE_TEX = $(FILE_TEX)"
	@echo "FILE_AUX = $(FILE_AUX)"

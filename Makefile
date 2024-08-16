TARGET=thesis

.PHONY: all clean cleanall pdf thesis

thesis: $(TARGET).pdf

all: thesis

$(TARGET).pdf:
	latexmk -pdflatex=lualatex -pdf -shell-escape $(TARGET).tex

clean:
	latexmk -c
	rm -f *.vim *~ *.bak
	rm -f *.aux *.auxlock *.idx *.ind *.ilg *.log *.nav *.out *.snm *.toc $(TARGET).vrb $(TARGET).run.xml *.bbl *syn *synctex.gz
	rm -f *.dvi

cleanall: clean
	rm -f $(TARGET).pdf

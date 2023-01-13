all:
	lualatex -file-line-error -synctex=1 -interaction=nonstopmode -halt-on-error paper.tex
clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.out *.toc *.fls *.lot *.lol *.lof *.synctex.gz *.fdb_latexmk 
distclean: clean
	rm -f paper.pdf

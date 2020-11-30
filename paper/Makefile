all:
	ptex2pdf -u -l -ot '-synctex=1 -halt-on-error -file-line-error' paper.tex
clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.out *.toc *.fls *.lot *.lol *.lof *.synctex.gz *.fdb_latexmk 
distclean: clean
	rm -f paper.pdf

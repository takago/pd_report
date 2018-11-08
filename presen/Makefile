all:
	ptex2pdf -u -l -ot '-synctex=1 -halt-on-error -file-line-error' main.tex
	pdfnup --scale 0.96 --frame true --no-landscape --nup 2x4 main.pdf >& /dev/null
clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.out *.toc *.fls *.lot *.lol *.lof *.synctex.gz *.fdb_latexmk 
distclean: clean
	rm -f main.pdf
	rm -f main-nup.pdf


all:
	ptex2pdf -s -l -ot '-synctex=1 -halt-on-error -file-line-error' main.tex
pdf:
	ptex2pdf -l -ot '-synctex=1 -halt-on-error -file-line-error' main.tex
clean:
	rm -fr qt_temp.* *.synctex.gz *~ *.aux *.log *.dvi
distclean:
	rm -fr main.pdf




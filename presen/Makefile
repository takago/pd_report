all:
	latexmk
pdf:	all
	dvipdfmx -v -O 3 main.dvi
	pdfnup --scale 0.96 --frame true --no-landscape --nup 2x4 main.pdf >& /dev/null
clean:
	latexmk -c
distclean:
	latexmk -C
	rm -fr main-nup.pdf


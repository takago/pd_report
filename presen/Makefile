# NUP = "2x4"
NUP = "2x5"
# NUP = "1x2"

all: typeset

typeset:
	ptex2pdf -u -l -ot '-synctex=1 -halt-on-error -file-line-error' presen.tex
	ptex2pdf -u -l -ot '-synctex=1 -halt-on-error -file-line-error' presen.tex

hiragino:
	ptex2pdf -u -l -ot '-synctex=1 -halt-on-error -file-line-error' -od '-f otf-up-hiragino-pron.map' presen.tex

nup: presen.pdf
	pdfjam --scale 0.96 --frame true --no-landscape --nup ${NUP} presen.pdf -o presen-nup.pdf

clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.out *.toc *.fls *.lot *.lol *.lof *.synctex.gz *.fdb_latexmk

distclean: clean
	rm -f presen.pdf
	rm -f presen-nup.pdf


# NUP = "2x4"
NUP = "2x5"
# NUP = "1x2"

all: typeset

kitlogo:
	mkdir -p fig/logo
	wget --no-proxy http://mercury.kanazawa-it.ac.jp/koho/kitlogo/img/eps/kit_landscape1.eps -O fig/logo/kit_landscape1.eps
	epspdf fig/logo/kit_landscape1.eps

typeset:
	lualatex -file-line-error -synctex=1 -interaction=nonstopmode -halt-on-error presen.tex
	lualatex -file-line-error -synctex=1 -interaction=nonstopmode -halt-on-error presen.tex

handout: presen.pdf
	pdfjam --scale 0.96 --frame true --no-landscape --nup ${NUP} presen.pdf -o handout-10up.pdf
	pdfjam --scale 0.96 --frame true --no-landscape --nup "1x2" --offset '0mm 15mm' --delta '0mm 30mm' presen.pdf -o handout-2up.pdf
	pdfjam --scale 0.96 --frame true --landscape --nup "2x2" --offset '0mm 8mm' --delta '0mm 20mm' presen.pdf -o presen-4up.pdf

clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.out *.toc *.fls *.lot *.lol *.lof *.synctex.gz *.fdb_latexmk

distclean: clean
	rm -f presen.pdf
	rm -f presen-nup.pdf


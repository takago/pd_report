CWD	= `pwd`
all:
	make pdf -C abstract
	make pdf -C paper
	make pdf -C paperback
	make pdf -C presen
	make pdf -C doc
	cp abstract/main.pdf abstract.pdf
	cp paper/main.pdf paper.pdf
	cp paperback/main.pdf paperback.pdf
	cp presen/main.pdf presen.pdf
	cp doc/main.pdf doc.pdf

clean:
	find . -name "*~" | xargs rm -f
	make clean -C abstract
	make clean -C paper
	make clean -C paperback
	make clean -C presen
	make clean -C doc
distclean:
	rm -fr *.pdf
	find . -name "*~" | xargs rm -f
	make distclean -C abstract
	make distclean -C paper
	make distclean -C paperback
	make distclean -C presen	
	make distclean -C doc
backup: all distclean
	@cd ..;\
	tar cvfz "thesis`date -I`.tar.gz" thesis
	@echo バックアップをとりました．

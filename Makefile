CWD =  $(shell basename `pwd`) 
BACKUP = pd3repo-`date -I`.tar.gz
all:
	make -C abstract
	make -C paper
	make -C paperback
	make -C presen
	make -C presen nup
	mv abstract/main.pdf abstract.pdf
	mv paper/main.pdf paper.pdf
	mv paperback/main.pdf paperback.pdf
	mv presen/main.pdf presen.pdf
	mv presen/main-nup.pdf presen-nup.pdf

clean:
	find . -name "*~" | xargs rm -f
	make clean -C abstract
	make clean -C paper
	make clean -C paperback
	make clean -C presen

distclean:
	rm -fr *.pdf
	find . -name "*~" | xargs rm -f
	make distclean -C abstract
	make distclean -C paper
	make distclean -C paperback
	make distclean -C presen	

backup: distclean
	@echo "クリーニング完了"
	@cd ..;	tar cz --exclude-vcs -f ${BACKUP} ${CWD}
	@echo "アーカイブ生成：${BACKUP}"

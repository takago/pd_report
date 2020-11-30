CWD =  $(shell basename `pwd`) 
BACKUP = pd3repo-`date -I`.tar.gz
all:
	make -C abstract
	make -C paper
	make -C paperback
	make -C presen
	make -C presen nup
	mv abstract/abstract.pdf ./
	mv paper/paper.pdf ./
	mv paperback/paperback.pdf ./
	mv presen/presen.pdf ./
	mv presen/presen-nup.pdf ./

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

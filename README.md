# pd_report

鷹合研メンバー向けの，(1)卒論本文，(2)アブストラクト，(3)プレゼンスライドのTeXソース（雛形），の3点セット．
- アブストラクトは学部・修士に両方に対応．
- lualatex-jaでタイプセットしてください．
- プレゼンスライドのタイプセットにはCTANにある foiltex が必要（ https://www.ctan.org/pkg/foiltex ）
- TeX環境は，http://golem.info.kanazawa-it.ac.jp/vbox で配布しているLinuxを利用すると楽（texstudioの設定も済ませてあるのですぐに使える）

- 印刷はWindowsのAdobe Readerで印刷するとよい．ただし，「実際のサイズ」というチェックボタンを選択してから印刷すること（Adobe Readerはデフォルトのままだと「合わせる」になっているので96%くらいになってしまうので注意する）．
- また，プリンタの設定で「用紙節約」などを無効にすること．例えば，学内プリンタで印刷するときは印刷設定を「プロパティ」→「項目別設定」→「両面/集約/製本」で「白紙を節約」を無効にする必要がある．

 foiltexの導入

$ cd presen
$ wget http://mirrors.ctan.org/macros/latex/contrib/foiltex.zip
$ unzip foiltex.zip 
$ cd foiltex
$ latex foiltex.ins 
$ cp foils.cls fltfonts.def foil25.clo ../presen
$ cd ..
$ rm -fr foiltex


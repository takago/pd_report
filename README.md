# pd_report

鷹合研メンバー向けの，(1)卒論本文，(2)背表紙，(3)アブストラクト，(4)プレゼンスライドのTeXソース（雛形），の4点セット．
- uplatexでタイプセットしてください．
- Hironori Kitagawa氏の plistings (MITライセンス) が必要( https://github.com/h-kitagawa )
- プレゼンスライドのタイプセットにはCTANにある foiltex が必要（ https://www.ctan.org/pkg/foiltex ）
- TeX環境は，http://golem.info.kanazawa-it.ac.jp/vbox で配布しているLinuxを利用すると楽（texstudioの設定も済ませてあるのですぐに使える）

- 印刷はWindowsのAdobe Readerで印刷するとよい．ただし，「実際のサイズ」というチェックボタンを選択してから印刷すること（Adobe Readerはデフォルトのままだと「合わせる」になっているので96%くらいになってしまうので注意する）．

## Linuxパッケージを使わず，TeXLiveのインストールスクリプトで環境構築する方法

7GB程度はディスクを消費します（ディスク消費を節約したい場合はLinuxパッケージのほうが良いでしょう）

```
$ cd /tmp
$ wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
$ tar xvf install-tl-unx.tar.gz
$ cd ./install-tl-20201020/
$ sudo ./install-tl -no-gui -repository http://mirror.ctan.org/systems/texlive/tlnet/
  I をタイプ
$ sudo /usr/local/texlive/2020/bin/x86_64-linux/tlmgr path add
$ sudo tlmgr update --self --all

 foiltexの導入

$ cd /usr/local/texlive/texmf-local/tex/latex/local
$ sudo wget http://mirrors.ctan.org/macros/latex/contrib/foiltex.zip
$ sudo unzip foiltex.zip 
$ cd foiltex
$ sudo latex foiltex.ins 
$ sudo mktexlsr

 plistingsの導入

$ cd /usr/local/texlive/texmf-local/tex/latex/local
$ sudo git clone https://github.com/h-kitagawa/plistings.git
$ sudo mktexlsr
 
  （必要に応じて）原の味フォントを埋め込むように設定

$ sudo kanji-config-updmap-sys --jis2004 haranoaji
```

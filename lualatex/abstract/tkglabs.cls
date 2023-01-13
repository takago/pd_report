% TEX STUDIO MAGIC-COMMAND
% !TeX document-id = {21ffa6e2-6c8f-4532-897c-386dc477f19a}
% !TeX root = abstract.tex
% !TeX encoding = utf8
% !TeX TXS-program:compile = lualatex -file-line-error -synctex=1 -interaction=nonstopmode -halt-on-error %.tex
% !TeX TXS-program:quick = txs:///compile | txs:///view-pdf-internal --embedded
%%%-------------------------------------------------------------------------
%%% PD3予稿集用クラスファイル (tkglabs.cls)
%%% 作成： 金沢工大・情報工学科・鷹合研究室(2017,12/6)
%%%-------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      基本設定(クラス用)
%ここから ------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tkglabs}[2020/11/26]
\LoadClass[10pt,twoside]{ltjsarticle} %% ベースにするクラス
% Wordで9ptという指定でも，TeXなら10ptのままでよい
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      基本設定(2020,11/26変更)
%ここから ------------------------------------------------------------------
\usepackage[truedimen,top=20truemm,bottom=20truemm,left=20truemm,right=20truemm,a4paper]{geometry} % 余白
\usepackage{graphicx} % 図の挿入
\usepackage{multirow} % 表における縦方向の連結
\usepackage{arydshln} % 表における点線
\renewcommand{\baselinestretch}{0.75} % 行間のつめ具合
\usepackage{xurl}      % 折り返しできるURLの挿入
\usepackage{setspace} % 部分的に行間を変える

% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      箇条書きの余白を削る
%ここから ------------------------------------------------------------------
\usepackage{enumitem} % 箇条書き環境
\setlist[itemize]{noitemsep, topsep=0pt}
\setlist[enumerate]{noitemsep, topsep=0pt}
\setlist[description]{noitemsep, topsep=0pt}
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   2段組の中に図表を配置できるようにする(Figure/Table環境)
%ここから ------------------------------------------------------------------
\usepackage{multicol}
% \caption{}だとキャプションがつかないので，\captionof{}を使う
\usepackage[tablename=表,figurename=図,labelsep=space]{caption}

% figure環境の登録（書き換え）
\renewenvironment{figure}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}

% table環境の登録（書き換え）
\renewenvironment{table}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}
% ここまで -----------------------------------------------------------------


\newcommand{\figcap}[3]{
\vspace{-5mm}
\captionof{figure}{#1}\label{#3}\vspace{-3mm}{Fig.\ref{#3}~~#2}\\
}

\newcommand{\tabcap}[3]{
\captionof{table}{#1}\label{#3}\vspace{-2mm}{Table \ref{#3}~~#2}\\
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       フォントの設定
%ここから ------------------------------------------------------------------
\usepackage[no-math,deluxe,expert,haranoaji]{luatexja-preset}
\setmainfont{TeX Gyre Termes} % 欧文フォントを変更

% ここまで -----------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       セクションタイトルの変更
%ここから ------------------------------------------------------------------
\usepackage{titlesec}
\titleformat{\section}{\fontsize{10.5}{10}\bfseries}{\thesection.}{1\zw}{}
\titleformat*{\subsection}{\fontsize{10.5}{10}\bfseries}
\titleformat*{\subsubsection}{\fontsize{10.5}{0}\bfseries}
%セクション番号が消えるバグの修正（https://tex.stackexchange.com/questions/299969/titlesec-loss-of-section-numbering-with-the-new-update-2016-03-15）
\usepackage{etoolbox}
\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
\makeatother
% セクションの上下にできる余白の調整
\titlespacing{\section}{0pt}{10pt}{0pt}
\titlespacing{\subsection}{0pt}{10pt}{0pt}
\titlespacing{\subsubsection}{0pt}{10pt}{0pt}
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       ヘッダ・フッタの変更
%ここから ------------------------------------------------------------------
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyhf{} % ページスタイルの消去
\renewcommand{\headrulewidth}{0.0pt}
% 基数ページ，偶数ページのヘッダを用意
\fancyhead[LO]{\vspace{2mm}\begin{spacing}{0.8}\begin{tabular}{|p{2cm};{1pt/1pt}p{1.7cm}|}\hline \small\hfil テーマ番号\hfil & \hfil\small\THEMEID \hfil \\\hline\end{tabular}\end{spacing}}
\fancyhead[RE]{\vspace{2mm}\begin{spacing}{0.8}\begin{tabular}{|p{2cm};{1pt/1pt}p{1.7cm}|}\hline \small\hfil テーマ番号\hfil & \hfil\small \THEMEID \hfil \\\hline\end{tabular}\end{spacing}}
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      documentの開始と終わりの変更
%ここから ------------------------------------------------------------------
\AtBeginDocument{
  \thispagestyle{empty} % 最初のページはヘッダを使わない%  
}
\AtEndDocument{
}
% ここまで -----------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      タイトルの設定
%ここから ------------------------------------------------------------------
\renewcommand{\maketitle}{
%%%% プロジェクトテーマ，プロジェクトメンバーなどの表
\null\vspace{-8mm}
\begin{table*}[h] 
\noindent
\begin{spacing}{0.8}
\begin{tabular}{|p{1.75cm};{1pt/1pt}p{1.48cm}|}\hline \hfil\scalebox{0.8}{テーマ番号} \hfil& \hfil\small \THEMEID\hfil\\\hline\end{tabular}
\newline 
\vspace{-10\lineskip} % プロジェクトテーマ番号の箱の位置（要調整）
\newline
\noindent
\begin{tabular}{|c;{1pt/1pt}c;{1pt/1pt}c|c;{1pt/1pt}c|}
\hline
 \multirow{\CENTERADJ}{*}{\begin{minipage}[c]{1.75cm}\begin{center}
\scalebox{0.8}{プロジェクト}\\\scalebox{0.8}{テーマ}
\end{center}\end{minipage}}  &
\begin{minipage}[c]{0.4cm}\scalebox{0.7}{和文}\end{minipage} &\begin{minipage}{8.6cm}\vspace{1mm}\TITLEJP\vspace{1mm}\end{minipage} & 
 \multirow{\CENTERADJ}{*}{\begin{minipage}[c]{1.3cm}\begin{center}
\scalebox{0.8}{指導教員}
\end{center}\end{minipage}} & \multirow{\CENTERADJ}{*}{\scalebox{0.9}\PROFNAME} \\
\cdashline{2-3}[1pt/1pt]   &\begin{minipage}[c]{0.4cm}\scalebox{0.7}{英文}\end{minipage} & \begin{minipage}{8.6cm}\vspace{1mm}\small\TITLEEN\vspace{1mm}\end{minipage}& & \\
\hline
\multicolumn{2}{|c;{1pt/1pt}}{
	\begin{minipage}{2cm}\begin{center}\scalebox{0.8}{プロジェクト}\\\vspace{-1mm}\scalebox{0.8}{メンバー}\end{center}\end{minipage}}
				 &
				\multicolumn{3}{l|}{
	\begin{minipage}{13.5cm}\begin{center}\vspace{1mm}\scalebox{0.9}{\AUTHORS}\vspace{0mm}\\\end{center}\end{minipage}}  \\
		 \hline
\end{tabular}
\end{spacing}

%%%% アブストラクト（行間は狭めに）
\vspace{5mm}\noindent 
\begin{spacing}{0.6}
\textbf{Abstract}\hspace{3mm} {\small\ABSTRACT}
\end{spacing}

%%%% キーワード 
\vspace{5mm}\noindent \textbf{Keywords}\hspace{3mm}  \small\KEYWORDS
\end{table*}
\vspace{-5mm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 表で使える太い線
\newcommand{\Hline}{\noalign{\hrule height .8pt}} % 太い横線の定義
% ここまで ------------------------------------------------------------------

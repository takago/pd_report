%%%-------------------------------------------------------------------------
%%% PD3予稿集用クラスファイル (tkglabs.cls)
%%% 作成： 金沢工大・情報工学科・鷹合研究室(2017,12/6)
%%%-------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      基本設定(クラス用)
%ここから ------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tkglabs}[2017/12/05]
\LoadClass[dvipdfmx,9pt,twoside]{jsarticle} %% ベースにするクラス
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      基本設定
%ここから ------------------------------------------------------------------
\usepackage[top=20truemm,bottom=20truemm,left=20truemm,right=20truemm]{geometry} % 余白
\usepackage[dvipdfmx]{graphicx} % 図の挿入
\usepackage{multirow} % 表における縦方向の連結
\usepackage{arydshln} % 表における点線
\usepackage{url}      % URLの挿入
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
%                       2段組と図表の設定
%ここから ------------------------------------------------------------------
\usepackage{multicol,caption}
%図表のキャプションフォーマットの変更
\captionsetup[figure]{labelsep=space, name=Fig.}
\captionsetup[table]{labelsep=space, name=Table}
% Figure環境の登録
\newenvironment{Figure}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}
% Table環境の登録
\newenvironment{Table}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       フォントの設定
%ここから ------------------------------------------------------------------
\usepackage{txfonts}
\usepackage[expert, deluxe]{otf}
% ここまで -----------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       セクションタイトルの変更
%ここから ------------------------------------------------------------------
\usepackage{titlesec}
\titleformat*{\section}{\fontsize{10}{20}\bfseries}
\titleformat*{\subsection}{\fontsize{10}{10}\bfseries}
\titleformat*{\subsubsection}{\fontsize{10}{0}\bfseries}
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
\ifx\RHEADER\undefined
\fancyhead[RO]{\begin{tabular}{|p{2cm};{1pt/1pt}p{2cm}|}\hline \hfil テーマ番号\hfil & \hfil \THEMEID \hfil \\\hline\end{tabular}}
\fancyhead[LE]{\begin{tabular}{|p{2cm};{1pt/1pt}p{2cm}|}\hline \hfil テーマ番号\hfil & \hfil \THEMEID \hfil \\\hline\end{tabular}}
\else
\fancyhead[LO]{\begin{tabular}{|p{2cm};{1pt/1pt}p{2cm}|}\hline \hfil テーマ番号\hfil & \hfil \THEMEID \hfil \\\hline\end{tabular}}
\fancyhead[RE]{\begin{tabular}{|p{2cm};{1pt/1pt}p{2cm}|}\hline \hfil テーマ番号\hfil & \hfil \THEMEID \hfil \\\hline\end{tabular}}
\fi
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
\ifx\RHEADER\undefined
\hfill\begin{tabular}{|p{1.295cm};{1pt/1pt}p{2.495cm}|}\hline \scalebox{0.8}{テーマ番号}& \hfil \THEMEID \hfil\\\hline\end{tabular}
\else
\begin{tabular}{|p{2cm};{1pt/1pt}p{2cm}|}\hline \hfil テーマ番号 \hfil& \hfil\THEMEID\hfil\\\hline\end{tabular}
\fi
\newline
\vspace{-11\lineskip}
\newline
\noindent
\begin{tabular}{|c;{1pt/1pt}c;{1pt/1pt}c|c;{1pt/1pt}c|}
\hline
 \multirow{\CENTERADJ}{*}{\begin{minipage}{2cm}\begin{center}プロジェクト\\テーマ\end{center}\end{minipage}}  &\scalebox{0.8}{和文} &\begin{minipage}{10.2cm}\vspace{2mm}\TITLEJP\vspace{2mm}\end{minipage} &
 \multirow{\CENTERADJ}{*}{指導教員} & \multirow{\CENTERADJ}{*}{\PROFNAME} \\
\cdashline{2-3}[1pt/1pt]   &\scalebox{0.8}{英文} & \begin{minipage}{10.2cm}\vspace{2mm}\TITLEEN\vspace{2mm}\end{minipage}& & \\
\hline
\multicolumn{2}{|c;{1pt/1pt}}{
	\begin{minipage}{2cm}\begin{center}プロジェクト\\メンバー\end{center}\end{minipage}}
				 &
				\multicolumn{3}{l|}{
	\begin{minipage}{14.75cm}\begin{center}\AUTHORS\end{center}\end{minipage}}  \\
		 \hline
\end{tabular}\\

%%%% アブストラクト 
\vspace{1mm}\noindent \textbf{Abstract}\hspace{3mm} \ABSTRACT

%%%% キーワード 
\vspace{1mm}\noindent \textbf{Keywords}\hspace{3mm}  \KEYWORDS
\end{table*}
\vspace{-5mm}
}
% ここまで ------------------------------------------------------------------









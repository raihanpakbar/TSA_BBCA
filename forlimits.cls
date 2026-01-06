% forlimits.cls - Kelas LaTeX untuk jurnal "Limits"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{forlimits}[2025/03/26 untuk jurnal Limits]


\newif\if@draft
\newif\if@review

\DeclareOption{draft}{\@drafttrue}
\DeclareOption{final}{\@draftfalse \@reviewfalse}
\DeclareOption{review}{\@drafttrue \@reviewtrue}

\ProcessOptions\relax
\newcommand{\kodenaskah}[1]{%
  \gdef\@kodenaskah{#1}%
}
\def\@kodenaskah{[Kode Naskah]}

\RequirePackage{fancyhdr}
\LoadClass[a4paper,12pt,twoside]{article}

\RequirePackage[indonesian]{babel}
\RequirePackage[T1]{fontenc}
\IfFileExists{XCharter.sty}{\RequirePackage{XCharter}}{\RequirePackage{times}}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{tabularx,enumerate}
\RequirePackage{etoolbox}
\RequirePackage{amsmath, amsfonts, amssymb, mathrsfs}

\RequirePackage{caption} 
\captionsetup[table]{skip=.5ex}

\geometry{left=2.5cm, right=2.5cm, top=2.5cm, bottom=2cm}

\RequirePackage{authblk}
\newcommand{\journalinfo}[5]{%
	\def\journalvol{#1}%
	\def\journalno{#2}%
	\def\journalmonth{#3}%
	\def\journalpages{#4}%
	\def\journaldoi{#5}%
}

\newcommand{\correspondingauthor}[2]{%
	\def\corrauthor{#1}%
	\def\corremail{#2}%	``	
}


\renewcommand{\maketitle}{%
  \vspace*{-2cm}
  \thispagestyle{plain}
  \begin{flushleft}
    \rule{11cm}{3pt}\\[-2.3ex]
    \rule{11cm}{.4pt}\\
    \if@draft
      \textbf{Kode Naskah: \@kodenaskah}%
    \else
      \if@review
        \textbf{Kode Naskah: \@kodenaskah}%
      \else
        \IfFileExists{logolimits.png}{%
          \includegraphics[width=32mm,height=15mm]{logolimits.png}%
        }{%
          \fbox{\parbox[c][15mm][c]{32mm}{\centerline{\rotatebox{20}{R e v i e w}}}}
        }%
      \fi
    \fi
    \mbox{}\\
    \textbf{Limits: Journal of Mathematics and Its Applications}\\
    E-ISSN: 2579-8936 \qquad P-ISSN: 1829-605X\\
    Vol. \journalvol, No. \journalno, \journalmonth, hal. \journalpages\\
    DOI: \url{\journaldoi}\\[-1.5ex]
    \rule{11cm}{.4pt}\\[-1.85ex]
    \rule{11cm}{3pt}\\
  \end{flushleft}
  \vspace{10pt}
  {\centering \textbf{\Large \@title} \par}\vspace{5pt}
  \if@review
    % tidak tampilkan penulis
  \else
    \begin{center} \@author \end{center}
    \begin{center} \textsuperscript{*}e-mail: \texttt{\corremail} \end{center}
  \fi
  \mbox{}\hrulefill\\
  \@date\\[-1ex]
  \mbox{}\hrulefill\\
  \vspace{10pt}
}


\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{*3}{*1}
\titleformat{\section}{\large\scshape}{\thesection.}{1em}{}
\titlespacing{\subsection}{0pt}{*2}{*0.5}
\titleformat{\subsection}{\bfseries} {\thesubsection.}{1em}{}

\renewcommand{\Authands}{, }
\renewcommand{\Affilfont}{\itshape\small}

\newcommand{\tanggalpengajuan}[3]{Diajukan: #1\hfill Diperbaiki: #2 \hfill Diterima: #3}

\newenvironment{abstrak}{%
		\linespread{1}\small\selectfont
	\centerline{\bfseries Abstrak}
	}{\par\normalfont}
\newcommand{\katakunci}[1]{\small\noindent\textbf{Kata kunci:~} #1}

\renewenvironment{abstract}{%
	\bigskip 
	\linespread{1}\small\selectfont
	\centerline{\textit{\textbf{Abstract}}}
	\itshape
}{\par\normalfont}
\newcommand{\keywords}[1]{\small\noindent\textit{\textbf{Key words:~}#1}
\par\normalfont\normalsize\linespread{1.15}\small\normalsize}

\newcommand{\shortauthors}[1]{%
	\gdef\customshortauthors{#1}%
}

\newcommand{\shorttitle}[1]{%
	\gdef\customshorttitle{#1}%
}

\RequirePackage{amsthm}

\newtheorem{theorem}{Teorema}[section]
\newtheorem{lemma}[theorem]{Lema}
\newtheorem{proposition}[theorem]{Proposisi}
\newtheorem{corollary}[theorem]{Akibat}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definisi}
\newtheorem{example}[theorem]{Contoh}

\theoremstyle{remark}
\newtheorem{remark}[theorem]{Catatan}

\pagestyle{fancy}
\fancyhf{} 

\fancyhead[LE]{\small \thepage}
\fancyhead[CE]{\small \customshorttitle}

\fancyhead[RO]{\small \thepage}
\fancyhead[CO]{\small \customshortauthors}

\fancyfoot{}

\if@review
\pagestyle{fancy}
\fancyhf{} 
\fancyhead[LE]{\small \thepage}
\fancyhead[CE]{\small \customshorttitle}
\fancyhead[RO]{\small \thepage}
\fancyhead[CO]{\@kodenaskah}
\fi

\newcommand{\terimakasih}[1]{%
	\section*{Ucapan Terima Kasih}%
	#1%
}

\RequirePackage{hyperref}

% Ganti label default dari \autoref
\renewcommand{\figureautorefname}{Gambar}
\renewcommand{\tableautorefname}{Tabel}
\renewcommand{\sectionautorefname}{Bagian}
\renewcommand{\subsectionautorefname}{Subbagian}
\renewcommand{\equationautorefname}{Persamaan}
\renewcommand{\theoremautorefname}{Teorema}

\renewenvironment{thebibliography}[1]
{\section*{\refname}%
	\sloppy
	\linespread{1}\selectfont  
	\begin{list}{[\arabic{enumi}]}%
		{\usecounter{enumi}%
			\setlength{\leftmargin}{3em}%
			\setlength{\labelsep}{0.5em}%
			\setlength{\labelwidth}{2.5em}%
			\setlength{\itemsep}{0pt}%
			\setlength{\parsep}{.5em}}}
	{\end{list}\linespread{1.15}\selectfont}
	
\AtBeginDocument{%
	\hyphenpenalty=1000
	\exhyphenpenalty=1000
    \linespread{1.15}
	\pagestyle{fancy}
	\ifx\customshortauthors\undefined
	\gdef\customshortauthors{Tuliskan singkat daftar nama penulis, tidak lebih satu baris } % 
	\fi
	\ifx\customshorttitle\undefined
	\gdef\customshorttitle{Tuliskan judul singkat, tidak lebih dari satu baris} % 
	\fi
}



% Copyright (c) 2015 Svante Kvarnström <sjk@ankeborg.nu>. All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% 1. Redistributions of source code must retain the above copyright notice,
% this list of conditions and the following disclaimer.
%
% 2. Redistributions in binary form must reproduce the above copyright notice,
% this list of conditions and the following disclaimer in the documentation
% and/or other materials provided with the distribution.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{shhpaper}[2015/03/27 SHH Paper class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper, 12pt, twoside]{article}

\RequirePackage{amssymb}            % Symbols
\RequirePackage{amsmath}            % More symbols
\RequirePackage[swedish]{babel}     % Swedish hyphenation
\RequirePackage{txfonts}            % Using the Times font is required 
\RequirePackage[utf8]{inputenc}     % For åäö
\RequirePackage[T1]{fontenc}        % Attempt to make pdf copy pastable
\RequirePackage{sectsty}            % To change section headings etc
\RequirePackage{graphicx}
\RequirePackage[yyyymmdd]{datetime} % For date in the right format.
\renewcommand{\dateseparator}{-}
\RequirePackage[hmargin={2.5cm,3cm},vmargin=2.5cm,a4paper]{geometry}
\usepackage[normalem]{ulem}         % Underlining of subsubsections.
\usepackage{fixltx2e}                % For \textsubscript etc
\usepackage{booktabs}
\usepackage{csquotes}               % Required by biblatex
\usepackage[style=apa,backend=biber,sortlocale=sv_SE]{biblatex}
\DeclareLanguageMapping{swedish}{swedish-apa}

\DefineBibliographyStrings{swedish}{
    references = {REFERENSER},
    bibliography={REFERENSER},
}

%\usepackage[pdftex,
%    bookmarks,
%    linktocpage,
%    colorlinks=false,
%    hyperindex=true,
%    hyperfigures
%]{hyperref}                     % For clickable links and TOC etc

% Declarations
%%%%%%%%%%%%%%
%
\newcommand{\course}[1]{\newcommand{\@course}{#1}}
\newcommand{\tutor}[1]{\newcommand{\@tutor}{#1}}
\newcommand{\subtitle}[1]{\newcommand{\@subtitle}{#1}}

% Make sure list of authors lines up vertically
\renewcommand{\and}{\\ & }

% Font sizes etc
%%%%%%%%%%%%%%%%

% Section headers are uppercase, 12 pt and bold.
\sectionfont{\normalsize\normalfont\bfseries\MakeUppercase}

% Subsections are 12 pt and bold
\subsectionfont{\normalsize\normalfont\bfseries}

% Subsubsections are 12 pt and underlined.
\subsubsectionfont{\normalsize\normalfont\underline}

\setcounter{secnumdepth}{-2}

% Define commands
%%%%%%%%%%%%%%%%%
%
% Define command for printing the shh logo
\newcommand{\shhlogo}{\includegraphics[]{images/logo.png}}

% Title page layout
%%%%%%%%%%%%%%%%%%%
%
\newcommand{\@shh@maketitle}{\maketitle}
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \newgeometry{margin=2.5cm}

    \begin{flushright}
        Stockholm \today\\
    \end{flushright}

    \vspace{2cm}

    \begin{center}
        \shhlogo%

        \vspace{2cm}

        \ifdefined\@title
            {\large \textbf{\MakeUppercase{\@title}}\\}
        \fi
        \ifdefined\@subtitle
            {\normalsize \textbf{\@subtitle\\}}
        \fi
    \end{center}
    
    \vspace{9cm}

    \begin{flushleft}
        Specialistsjuksköterskeprogrammet,\\
        inriktning hjärtsjukvård, 60 högskolepoäng\\
        Avancerad nivå, Kurs
        \ifdefined\@course
            \@course
        \fi
    \end{flushleft}
    
    \vspace{1cm}

    \noindent
    \begin{minipage}[t]{.5\textwidth}
        \begin{flushleft}
            \begin{tabular}[t]{@{}ll}%
                Författare: & \@author
            \end{tabular}
        \end{flushleft}
    \end{minipage}
    \begin{minipage}[t]{.5\textwidth}
        \begin{flushright}
            \begin{tabular}[t]{ll}
                Lärare: & \@tutor
            \end{tabular}
        \end{flushright}
    \end{minipage}
    \restoregeometry%
    \@thanks
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\@subtitle\@empty
    \global\let\subtitle\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
    \@shh@maketitle
    \setcounter{page}{1}
}

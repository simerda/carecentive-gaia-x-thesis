\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{maddoc}[2022-03-10 v4.2 MaD Lab Thesis Template]
\def\BaseClass{report}
\LoadClass[twoside,12pt,a4paper]{\BaseClass}     % 12 pt base class report
\RequirePackage[left=2.0cm,right=2.8cm,top=3.8cm,bottom=4cm,bindingoffset=0cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{bm}        % standard math notation (fonts)
\RequirePackage{fixmath}        % standard math notation (fonts)
\RequirePackage{amsmath}            % standard math notation (vectors/sets/...)
\RequirePackage{graphicx}        % eps graphics support
\RequirePackage{times}           % scalable fonts
\RequirePackage{setspace}  % set correct baselinestretch
\RequirePackage[ngerman,english,main=english]{babel}
\RequirePackage{csquotes}
\RequirePackage{hyperref}
\RequirePackage{acronym}
\RequirePackage{microtype}
\RequirePackage{eso-pic}
\RequirePackage{emptypage} % will remove header and footer from empty pages between chapters
\RequirePackage{etoolbox}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\BaseClass}}
\ProcessOptions\relax

\RequirePackage[ngerman]{datetime}

% Define a german formatted date for the preamble
\newcommand{\todayPreamble}{\the\day. \monthnamengerman[\the\month] \the\year}


\RequirePackage{blindtext}

% Only use first three letters of first author + year for citation
\RequirePackage[
backend=biber,
style=alphabetic,
maxalphanames=1,
maxnames=99
]{biblatex}
% Remove plus sign in alphabetic label for more than one author
\renewcommand*{\labelalphaothers}{}

% Configure Style for first page on chapter
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}
\pretocmd{\chapter}{\cleardoublepage}{}{}

% Set general configurations
\onehalfspacing
\pagestyle{headings}
\DeclareGraphicsRule{.ps.gz}{eps}{.ps.bb}{`gunzip -c #1}
\DeclareGraphicsRule{.cps.gz}{eps}{.cps.bb}{`gunzip -c #1}
\DeclareGraphicsRule{.eps.gz}{eps}{.eps.bb}{`gunzip -c #1}
\DeclareGraphicsRule{.ps.Z}{eps}{.ps.bb}{`gunzip -c #1}
\DeclareGraphicsRule{.cps.Z}{eps}{.cps.bb}{`gunzip -c #1}
\DeclareGraphicsRule{.eps.Z}{eps}{.eps.bb}{`gunzip -c #1}
\DeclareGraphicsExtensions{.ps,.eps,.ps.Z,.eps.Z,.ps.gz,.eps.gz,.ps.bb,.eps.bb}

\def\Titel#1{\gdef\@Titel{#1}}
\def\ThesisType#1{\gdef\@ThesisType{#1}}
\def\StudyProgramme#1{\gdef\@StudyProgramme{#1}}
\def\LastName#1{\gdef\@LastName{#1}}
\def\FirstName#1{\gdef\@FirstName{#1}}
\def\Birthplace#1{\gdef\@Birthplace{#1}}
\def\DateOfBirth#1{\gdef\@DateOfBirth{#1}}
\def\Advisors#1{\gdef\@Advisors{#1}}
\def\Start#1{\gdef\@Start{#1}}
\def\Ende#1{\gdef\@Ende{#1}}
\def\PartnerInstitute#1{\gdef\@PartnerInstitute{#1}}

\def\deckblatt{
\bgroup\def\baselinestretch{1.0}%
\newgeometry{left=2.8cm,right=2.8cm}
\clearpage
\thispagestyle{empty}
\vspace*{1.6cm}

\AddToShipoutPicture*{%
  \setlength{\unitlength}{1mm}% needed for the \put command that sets the seal
  \AtPageUpperLeft{%
    \raisebox{-2.4cm}{
        \hspace{1in}\hspace{\hoffset}\hspace{\oddsidemargin}%%
        \begin{minipage}{0.39\textwidth} % 0.42 + spacing
            \includegraphics[width=0.8\textwidth]{img/mad_logo.pdf}
            % 375mm x 100mm
        \end{minipage}
        \hfill
        \begin{minipage}{0.61\textwidth} % 0.58 + spacing
            \hfill
            {\includegraphics[width=0.8\textwidth]{img/fau_logo.pdf}}
            %% 514mm x 100mm
        \end{minipage}
    }
  }
}

\begin{center}
\Large
{\bfseries \@Titel}\\[20mm]
\large
{\bfseries \@ThesisType\ in\ \@StudyProgramme } \\[10mm]
\normalsize
submitted \\
by \\
\vskip 0.8cm plus 0.2cm minus 0.5cm\relax
\end{center}
\begin{center}
\@FirstName\ \@LastName \\[2mm]
born
\@DateOfBirth\ in \@Birthplace \\% [45mm]
\vfill
\end{center}
\begin{center}
  Written at
\\[5mm]
Machine Learning and Data Analytics Lab\\
Department Artificial Intelligence in Biomedical Engineering \\
Friedrich-Alexander-Universität Erlangen-Nürnberg (FAU)\\[5mm]
\ifdefined\@PartnerInstitute%
    in Cooperation with
    \\[5mm]
        \@PartnerInstitute
    \\[10mm]
\else
\fi
\end{center}
\begin{flushleft}
\makebox[2cm]{Advisors:\hfill} \@Advisors \\[2mm]
\makebox[2cm]{Started:\hfill} \@Start \\[2mm]
\makebox[2cm]{Finished:\hfill} \@Ende \\
\end{flushleft}
\clearpage
\restoregeometry
\egroup}


\AtBeginDocument{\deckblatt
\clearpage
\cleardoublepage
Ich versichere, dass ich die Arbeit ohne fremde Hilfe und ohne Benutzung
anderer als der angegebenen Quellen angefertigt habe und dass die Arbeit
in gleicher oder ähnlicher Form noch keiner anderen Prüfungsbehörde
vorgelegen hat und von dieser als Teil einer Prüfungsleistung
angenommen wurde. Alle Ausführungen, die wörtlich oder sinngemäß
übernommen wurden, sind als solche gekennzeichnet.
\\
Die Richtlinien des Lehrstuhls für Bachelor- und Masterarbeiten
habe ich gelesen und anerkannt, insbesondere die Regelung des
Nutzungsrechts. \\[15mm]
Erlangen, den \todayPreamble \hspace{6.0cm} \\[10mm]
\cleardoublepage}

\endinput
%%
%% End of file `maddoc.cls'.

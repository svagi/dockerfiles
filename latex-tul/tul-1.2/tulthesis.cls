\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tulthesis}[2015/11/12 TUL thesis class version 1.2]
% Licence: CC BY

\newcommand{\TUL@levelCZ}{Bakal\'{a}\v{r}sk\'{a} pr\'{a}ce}
\newcommand{\TUL@levelEN}{Bachelor thesis}
\newcommand{\TUL@kat}{BP}

\DeclareOption{EN}{\PassOptionsToPackage{\CurrentOption}{EN}}
\DeclareOption{BP}{}
\DeclareOption{DP}{
    \renewcommand{\TUL@levelCZ}{Diplomov\'{a} pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Master thesis}
    \renewcommand{\TUL@kat}{DP}}
\DeclareOption{Dis}{
    \renewcommand{\TUL@levelCZ}{Diserta\v cn\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Dissertation}
    \renewcommand{\TUL@kat}{Dis}}
\DeclareOption{RP}{
    \renewcommand{\TUL@levelCZ}{Ro\v cn\'\i kov\'y projekt}
    \renewcommand{\TUL@levelEN}{Project report}
    \renewcommand{\TUL@kat}{RP}}
\DeclareOption{MP}{
    \renewcommand{\TUL@levelCZ}{Magistersk\'y projekt}
    \renewcommand{\TUL@levelEN}{Project report}
    \renewcommand{\TUL@kat}{MP}}
\DeclareOption{FS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FT}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FP}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{EF}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FA}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FM}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{UZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{CXI}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bwtitles}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bw}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{report}

\RequirePackage[noheader]{tul}
\noTULfooter

\RequirePackage{ifthen}
\RequirePackage{tabularx}

\newcommand{\TULthesisType}[2]{\renewcommand{\TUL@levelCZ}{#1}%
\renewcommand{\TUL@levelEN}{#2}}

\newcommand{\TUL@nazevCZ}{Chyb\'\i\ \textbackslash TULtitle\{\v{c}esky\}\{anglicky\}}
\newcommand{\TUL@nazevEN}{English title}
\newcommand{\TULtitle}[2]{\renewcommand{\TUL@nazevCZ}{#1}%
\renewcommand{\TUL@nazevEN}{#2}}

\newcommand{\TUL@autor}{Chyb\'\i\ \textbackslash TULauthor\{jm\'eno\}}
\newcommand{\TULauthor}[1]{\renewcommand{\TUL@autor}{#1}}

\newcommand{\TUL@vedouci}{Chyb\'\i\ \textbackslash TULsupervisor\{jm\'eno\}}
\newcommand{\TULsupervisor}[1]{\renewcommand{\TUL@vedouci}{#1}}

\newcommand{\TUL@programCZ}{Chyb\'\i\ \textbackslash TULprogramme\{k\'od\}\{\v{c}esky\}\{anglicky\}}
\newcommand{\TUL@programEN}{Study Programme}
\newcommand{\TULprogramme}[3]{\renewcommand{\TUL@programCZ}{#1 -- #2}%
\renewcommand{\TUL@programEN}{#1 -- #3}}

\newcounter{TUL@bor}
\setcounter{TUL@bor}{0}
\newcounter{TULc@unter}
\newcommand{\i@TULoborCZ}{Chyb\'\i\ \textbackslash TULbranch\{k\'od\}\{\v{c}esky\}\{anglicky\}}
\newcommand{\i@TULoborEN}{Study Branches}
\newcommand{\TULbranch}[3]{%
  \stepcounter{TUL@bor}
  \@namedef{\roman{TUL@bor}@TULoborCZ}{#1 -- #2}%
  \@namedef{\roman{TUL@bor}@TULoborEN}{#1 -- #3}%
}

\newcommand{\TUL@rok}{\the\year}
\newcommand{\TULyear}[1]{\renewcommand{\TUL@rok}{#1}}

\newcommand{\TULid}[1]{\newcommand{\TUL@id}{#1}}

% podpurne prikazy
\newcommand{\@ddel}{\hspace{0.5em}\rule[-0.2em]{0.75pt}{1.2em}\hspace{0.5em}}

\newenvironment{uzky@text}{\begin{center}\begin{minipage}{0.80\textwidth}
\setlength{\parskip}{0.5\baselineskip}}{\end{minipage}\end{center}}


% rozmery stranky a styl zapati
\setlength{\oddsidemargin}{10mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{150mm}
\setlength{\topmargin}{0mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\textheight}{230mm}
\setlength{\footskip}{15mm}
\fancyfoot{}
\fancyfootoffset{0pt}
\if@twoside
    \fancyfoot[RO,LE]{\textbf{\thepage}}
\else
    \fancyfoot[R]{\thepage}
\fi
\newlength{\title@line}


\newcommand{\ThesisTitle}[1]{{\thispagestyle{empty}\sffamily
\noindent\ifthenelse{\equal{#1}{EN}}{\ENlogo}{\CZlogo}

\vfill

\begin{center}
\LARGE\bfseries
\ifthenelse{\equal{#1}{EN}}{\TUL@nazevEN}{\TUL@nazevCZ}
\par
\end{center}

\vfill

\begin{center}
\Large\bfseries\color{\tulcolor}
\ifthenelse{\equal{#1}{EN}}{\TUL@levelEN}{\TUL@levelCZ}
\ifthenelse{\isundefined{\TUL@id}}{}{\par {\normalsize\mdseries\color{tulgray}\TUL@id}}
\end{center}

\vfill

\newcommand{\t@nd}{&}%
\noindent\begin{tabularx}{\linewidth}{@{}lX@{}}
\small\itshape\color{tulgray}%
\ifthenelse{\equal{#1}{EN}}{Study programme}{Studijn\'\i\ program}: &
\ifthenelse{\equal{#1}{EN}}{\TUL@programEN}{\TUL@programCZ} \\
\small\itshape\color{tulgray}%
\ifthenelse{\equal{#1}{EN}}{Study branch\ifnum\theTUL@bor>1\relax es\fi}%
{Studijn\'\i\ obor\ifnum\theTUL@bor>1\relax y\fi}:
 & \ifthenelse{\equal{#1}{EN}}{\raggedright\arraybackslash\i@TULoborEN}{\raggedright\arraybackslash\i@TULoborCZ}\\
\setcounter{TULc@unter}{1}%
\whiledo{\value{TULc@unter} < \value{TUL@bor}}%
{\stepcounter{TULc@unter}\t@nd % zamaskovaný "&"
\ifthenelse{\equal{#1}{EN}}{\raggedright\arraybackslash\@nameuse{\roman{TULc@unter}@TULoborEN}}%
{\raggedright\arraybackslash\@nameuse{\roman{TULc@unter}@TULoborCZ}}\\} \\[-\medskipamount]
\small\itshape\color{tulgray}%
\ifthenelse{\equal{#1}{EN}}{Author}{Autor pr\'ace}: &
\bfseries\TUL@autor \\
\small\itshape\color{tulgray}%
\ifthenelse{\equal{#1}{EN}}{Supervisor}{Vedouc\'\i\ pr\'ace}: &
\TUL@vedouci \\
\end{tabularx}

\vfill

\setlength{\title@line}{\linewidth}%
\addtolength{\title@line}{-1cm}%
\noindent{\color{\tulcolor}\rule{\title@line}{1pt}}%
\raisebox{-2.5pt}[0pt][0pt]\spojovaci\\
\raisebox{1pt}{Liberec \TUL@rok}
\vspace*{-2cm}
\cleardoublepage}}


\newcommand{\Assignment}{
\mbox{}
\vfill

\begin{center}
\LARGE
\ifthenelse{\equal{\TUL@nguage}{EN}}%
{This page has to be replaced\\[0.5em]by original of an assignment.}%
{Tento list nahra\v{d}te\\[0.5em]origin\'alem zad\'an\'\i.}
\thispagestyle{empty}
\end{center}

\vfill
\cleardoublepage
}

\newcommand{\DeclarationCZ}[1]{
\section*{Prohl\'a\v sen\'\i}

Byl\ifthenelse{\equal{#1}{female}}{a}{}
jsem sezn\'amen\ifthenelse{\equal{#1}{female}}{a}{}
s~t\'{\i}m, \v ze na
\ifthenelse{\equal{\TUL@kat}{BP}}{mou bakal\'a\v rskou pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{DP}}{mou diplomovou pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{Dis}}{mou diserta\v cn\'{\i} pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{RP}}{m\r uj ro\v cn\'{\i}kov\'y projekt}{%
m\r uj magistersk\'y projekt}}}} se pln\v e vztahuje
z\'akon \v c.~121/2000 Sb., o~pr\'avu autorsk\'em, zejm\'ena
\S~60~-- \v skoln\'{\i} d\'{\i}lo.

Beru na v\v edom\'{\i}, \v ze Technick\'a univerzita v~Liberci (TUL) nezasahuje
do m\'ych autorsk\'ych pr\'av u\v zit\'{\i}m
\ifthenelse{\equal{\TUL@kat}{BP}}{m\'e bakal\'a\v rsk\'e pr\'ace}{%
\ifthenelse{\equal{\TUL@kat}{DP}}{m\'e diplomov\'e pr\'ace}{%
\ifthenelse{\equal{\TUL@kat}{Dis}}{m\'e diserta\v cn\'{\i} pr\'ace}{%
\ifthenelse{\equal{\TUL@kat}{RP}}{m\'eho ro\v cn\'{\i}kov\'eho projektu}{%
m\'eho magistersk\'eho projektu}}}}
pro vnit\v rn\'{\i} pot\v rebu TUL.

U\v ziji-li
\ifthenelse{\equal{\TUL@kat}{BP}}{bakal\'a\v rskou pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{DP}}{diplomovou pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{Dis}}{diserta\v cn\'{\i} pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{RP}}{ro\v cn\'{\i}kov\'y projekt}{%
magistersk\'y projekt}}}}
nebo poskytnu-li licenci
k~\ifthenelse{\equal{\TUL@kat}{RP} \or \equal{\TUL@kat}{MP}}{jeho}{jej\'{\i}mu}
vyu\v zit\'{\i}, jsem si
v\v edom\ifthenelse{\equal{#1}{female}}{a}{} povinnosti informovat
o~t\'eto skute\v cnosti TUL; v~tomto p\v r\'{\i}pad\v e m\'a TUL pr\'avo ode mne
po\v zadovat \'uhradu n\'aklad\r u, kter\'e vynalo\v zila na vytvo\v ren\'{\i} d\'{\i}la,
a\v z do jejich skute\v cn\'e v\'y\v se.

\ifthenelse{\equal{\TUL@kat}{BP}}{Bakal\'a\v rskou pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{DP}}{Diplomovou pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{Dis}}{Diserta\v cn\'{\i} pr\'aci}{%
\ifthenelse{\equal{\TUL@kat}{RP}}{Ro\v cn\'{\i}kov\'y projekt}{%
Magistersk\'y projekt}}}}
jsem vypracoval\ifthenelse{\equal{#1}{female}}{a}{}
samostatn\v e s~pou\v zit\'{\i}m uveden\'e literatury a
na z\'aklad\v e konzultac\'{\i} s~vedouc\'{\i}m
\ifthenelse{\equal{\TUL@kat}{BP}}{m\'e bakal\'a\v rsk\'e pr\'ace}{%
\ifthenelse{\equal{\TUL@kat}{DP}}{m\'e diplomov\'e pr\'ace}{%
\ifthenelse{\equal{\TUL@kat}{Dis}}{m\'e diserta\v cn\'{\i} pr\'ace}{%
\ifthenelse{\equal{\TUL@kat}{RP}}{m\'eho ro\v cn\'{\i}kov\'eho projektu}{%
m\'eho magistersk\'eho projektu}}}}
a konzultantem.

Sou\v casn\v e \v cestn\v e prohla\v suji, \v ze ti\v st\v en\'a verze pr\'ace se
shoduje s~elektronickou verz\'{\i}, vlo\v zenou do IS STAG.

\vspace{1cm}
\noindent Datum:

\vspace{1cm}
\noindent Podpis:
}

\newcommand{\ThesisType@EN}{%
\ifthenelse{\equal{\TUL@kat}{BP}}{bachelor thesis}{%
\ifthenelse{\equal{\TUL@kat}{DP}}{master thesis}{%
\ifthenelse{\equal{\TUL@kat}{Dis}}{dissertation}{%
\ifthenelse{\equal{\TUL@kat}{RP}}{bachelor project}{%
master project}}}}}

%\newcommand{\ThesisType@EN}{%
%\ifthenelse{\equal{\TUL@kat}{BP}}{bachelor thesis}{jina}}


\newcommand{\DeclarationEN}{
\section*{Declaration}

I hereby certify that I have been informed that Act 121/2000,
the Copyright Act of the Czech Republic, namely Section~60, Schoolwork,
applies to my \ThesisType@EN\ in full scope. I acknowledge that
the Technical University of Liberec (TUL) does not infringe my copyrights
by using my \ThesisType@EN\ for TUL's internal purposes.

I am aware of my obligation to inform TUL on having used or licensed
to use my \ThesisType@EN\ in which event TUL may require compensation
of costs incurred in creating the work at up to their actual amount.

I have written my \ThesisType@EN\ myself using literature listed therein
and consulting it with my supervisor and my tutor.

I hereby also declare that the hard copy of my \ThesisType@EN\ is identical
with its electronic form as saved at the IS STAG portal.

\vspace{1cm}
\noindent Date:

\vspace{1cm}
\noindent Signature:
}


\newcommand{\Declaration}[1]{\vspace*{2cm}
\thispagestyle{empty}
\begin{uzky@text}
\ifthenelse{\equal{\TUL@nguage}{EN}}{\DeclarationEN}{\DeclarationCZ{#1}}
\end{uzky@text}
\cleardoublepage
}


\newcommand{\ThesisStart}[1]{
\ifthenelse{\equal{\TUL@nguage}{EN}}{\ThesisTitle{EN} \ThesisTitle{CZ}}{\ThesisTitle{CZ} \ThesisTitle{EN}}
\Assignment
\Declaration{#1}
}


\newenvironment{abstractCZ}[1][narrow]{\ifthenelse{\equal{#1}{wide}}%
{\renewcommand{\endabstractCZ}{\par}}% široký abstrakt na konci nedělá nic
{\begin{uzky@text}\renewcommand{\endabstractCZ}{\end{uzky@text}}}% úzký abstrakt
\section*{Abstrakt}}{}

\newenvironment{abstractEN}[1][narrow]{\ifthenelse{\equal{#1}{wide}}%
{\renewcommand{\endabstractEN}{\par}}% široký abstrakt na konci nedělá nic
{\begin{uzky@text}\renewcommand{\endabstractEN}{\end{uzky@text}}}% úzký abstrakt
\section*{Abstract}}{}

\newenvironment{acknowledgement}[1][narrow]{\ifthenelse{\equal{#1}{wide}}%
{\renewcommand{\endacknowledgement}{\clearpage}}% široké poděkování na konci jen odstránkuje
{\begin{uzky@text}\renewcommand{\endacknowledgement}{\end{uzky@text}\clearpage}}% úzké
\ifthenelse{\equal{\TUL@nguage}{EN}}%
{\section*{Acknowledgements}}%
{\section*{Pod\v ekov\'an\'{\i}}}}{}

\newenvironment{abbrList}{\ifthenelse{\equal{\TUL@nguage}{EN}}%
{\section*{List of abbreviations}\addcontentsline{toc}{section}{List of abbreviations}}%
{\section*{Seznam zkratek}\addcontentsline{toc}{section}{Seznam zkratek}}
\noindent\tabularx{\linewidth}{@{}lX@{}}}
{\endtabularx
\clearpage}

\titleformat{\chapter}%
{\normalfont\sffamily\LARGE\bfseries\color{\titlecolor}}{\thechapter}{1em}{}


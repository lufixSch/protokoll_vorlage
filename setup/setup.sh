#!/bin/bash

#****************************************
# $1 => Lecturename
# $2 => Lecturename short
# $3 => Protocolname
# $4 => Protocolcount
#****************************************

DATE=`date +"%d.%m.%Y"`

mv main.tex $2_lab$4_protokoll.tex

cat > data.tex << EOF
\newcommand{\documenTitle}{Laborübung $4~-~$3}
\newcommand{\firstStudent}{Lukas Schüttler}
\newcommand{\secondStudent}{Tim Schmid}

\newcommand{\lecture}{$1}
\newcommand{\semester}{4. Semester}

\newcommand{\lectureDate}{$DATE}
\newcommand{\finishedDate}{---}
EOF

echo "Protokoll $4 aus dem Fach $1 ($2) wurde mit dem Namen $3 initialisiert"
#!/bin/bash

#****************************************
# $1 => Lecturename
# $2 => Lecturename short
# $3 => Protocolname
# $4 => Protocolcount
# $5 => Optional, Repository Link
#****************************************

read -p "Name der Vorlesung: " LV_NAME
read -p "Abkürzung: " LV_SHORT
read -p "Protokollname: " PROTOCOL
read -p "Nummer des Protokolls: " PROT_COUNT
read -p "Link zu neuem Repository: " REPO

DATE=`date +"%d.%m.%Y"`

mv main.tex ${LV_SHORT}_lab${PROT_COUNT}_protokoll.tex

cat > params.tex << EOF
\newcommand{\documenTitle}{Laborübung ${PROT_COUNT}~-~${PROTOCOL}}
\newcommand{\firstStudent}{Lukas Schüttler}
\newcommand{\secondStudent}{Tim Schmid}

\newcommand{\lecture}{${LV_NAME}}
\newcommand{\semester}{4. Semester}

\newcommand{\lectureDate}{$DATE}
\newcommand{\finishedDate}{---}
EOF

echo "Protokoll ${PROT_COUNT} aus dem Fach ${LV_NAME} (${LV_SHORT}) mit dem Namen ${PROTOCOL} initialisiert"

git remote rename origin vorlage
git branch -m master vorlage-master

if [ ${REPO} ]; then
  git remote add origin ${REPO}

  git checkout -b master origin/master
  git push
else
  git checkout -b master
  echo "Keine neue remote Branch übergeben"
fi

echo "Repository strukturiert"
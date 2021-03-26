#!/bin/bash

#****************************************
# $1 => Lecturename
# $2 => Lecturename short
# $3 => Protocolname
# $4 => Protocolcount
# $5 => Optional, Repository Link
#****************************************

if [ "$1" ]; then
  LV_NAME=$1
else
  read -p "Name der Vorlesung: " LV_NAME
fi

if [ $2 ]; then
  LV_SHORT=$2
else
  read -p "Abkürzung: " LV_SHORT
fi

if [ $3 ]; then
  PROTOCOL=$3
else
  read -p "Protokollname: " PROTOCOL
fi

if [ $4 ]; then
  PROT_COUNT=$4
else
  read -p "Nummer des Protokolls: " PROT_COUNT
fi

if [ $5 ]; then
  REPO=$5
else
  read -p "Link zu neuem Repository: " REPO
fi


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
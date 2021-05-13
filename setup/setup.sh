#!/bin/bash

#****************************************
# $1 => Lecturename
# $2 => Lecturename short
# $3 => Protocolname
# $4 => Protocolcount
# $5 => Optional, Repository Link
#****************************************


# get setup configuration
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

# rename main.text and update filename in Makefile
FILENAME=`${LV_SHORT}_lab${PROT_COUNT}_protokoll.tex`

mv main.tex ${FILENAME}
sed -i '' 's/%ENTRYPOINT%/.\/main.tex/g' Makefile

# create date
DATE=`date +"%d.%m.%Y"`

# update params.tex
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

# setup git
git remote rename origin vorlage
git branch -m master vorlage-master

# add new remote repository
if [ ${REPO} ]; then
  git remote add origin ${REPO}

  git checkout -b master
  git push --set-upstream origin master
else
  git checkout -b master
  echo "Keine neue remote Branch übergeben"
fi

# initialize private sign repository
read -p "Unterschriften laden (J/n): " SIGN

if [ $SIGN == "J" ]; then
  git submodule init
  git submodule update

  echo "Privates Submodule initialisiert"
fi


echo "Repository strukturiert"
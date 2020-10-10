#!/bin/bash

latexmk main.tex  -synctex=! -interaction=nonstopmode -file-line-error -pdf -outdir=./build -f
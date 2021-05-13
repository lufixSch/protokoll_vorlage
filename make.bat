@ECHO OFF

pushd %~dp0

REM Command file for Latex protocol template

set OUTDIR      	?= ./build
set DOC						?= $ENTRYPOINT$

if "%1" == "" goto help

:pdf
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=%OUTDIR% %DOC%
goto end

:clean
	REM delete buildfolder and run make pdf
goto end

:push
	git push
	git push --mirror "git@github.com:lufixSch/protokoll_vorlage.git"
goto end

:setup
	python3 setup\setuppy
goto end

:help


:end
popd
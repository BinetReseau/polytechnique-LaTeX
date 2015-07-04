@echo off
cd source
pdflatex polytechnique.dtx
makeindex -s gind.ist -o polytechnique.ind polytechnique.idx
pdflatex polytechnique.dtx
del *.aux
del *.glo
del *.idx
del *.ilg
del *.ind
del *.log
del *.toc
del *.out
kpsewhich -var-value TEXMFLOCAL > temp.txt
set /p installdir=<temp.txt
del temp.txt
md "%installdir%/tex/latex/polytechnique"
md "%installdir%/tex/latex/polytechnique/resources
md "%installdir%/source/latex/polytechnique"
md "%installdir%/source/latex/polytechnique/resources"
md "%installdir%/doc/latex/polytechnique"
copy polytechnique.dtx "%installdir%/source/latex/polytechnique"
copy polytechnique.sty "%installdir%/tex/latex/polytechnique"
copy polytechnique.pdf "%installdir%/doc/latex/polytechnique"
copy *.eps "%installdir%/source/latex/polytechnique/resources"
copy *.pdf "%installdir%/source/latex/polytechnique/resources"
copy *.eps "%installdir%/tex/latex/polytechnique/resources"
copy *.pdf "%installdir%/tex/latex/polytechnique/resources"
echo ************************************************
echo * La base de donnees des packages est en train *
echo * d'etre mise a jour. Cela peut prendre un peu *
echo * de temps. Merci de patienter.                *
echo ************************************************
initexmf --update-fndb
echo ************************************************
echo * Le package a ete installe ! La documentation *
echo * se trouve a l'emplacement suivant :          *
echo %installdir%/doc/latex/polytechnique
echo * Les fichiers sources et resources  a         *
echo * l'endroit suivant :                          *
echo %installdir%/source/latex/polytechnique
echo * Et le .sty a l'endroit suivant :             *
echo %installdir%/tex/latex/polytechnique
echo * Bonne utilisation !                          *
echo ************************************************
pause
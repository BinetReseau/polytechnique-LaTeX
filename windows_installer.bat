@echo off
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
kpsewhich article.cls> temp.txt
set /p installdir=<temp.txt
set installdir=%installdir:~0,-16%
del temp.txt
md "%installdir%polytechnique"
md "%installdir%polytechnique/ressources"
copy polytechnique.dtx "%installdir%polytechnique"
copy polytechnique.sty "%installdir%polytechnique"
md "%installdir:~0,-10%doc/polytechnique"
copy polytechnique.pdf "%installdir:~0,-10%doc/polytechnique"
del polytechnique.sty
cd ressources
copy *.eps "%installdir%polytechnique/ressources"
copy *.pdf "%installdir%polytechnique/ressources"
echo ************************************************
echo * La base de donnees des packages est en train *
echo * d'etre mise a jour. Cela peut prendre un peu *
echo * de temps. Merci de patienter.                *
echo ************************************************
initexmf --update-fndb
echo ************************************************
echo * Le package a ete installe ! La documentation *
echo * se trouve a l'emplacement suivant :          *
echo %installdir:~0,-10%doc/polytechnique
echo * Bonne utilisation !                          *
echo ************************************************
pause
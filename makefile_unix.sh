#! /bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "Vous devez posséder les droits administrateurs pour installer ce package."
  echo "Veuillez utiliser la commande « sudo sh unix_installer.sh »."
  exit 1
fi

pdflatex polytechnique.dtx >> /dev/null
makeindex -q -s gind.ist -o polytechnique.ind polytechnique.idx >> /dev/null
pdflatex polytechnique.dtx >> /dev/null
rm *.aux *.glo *.idx *.ilg *.ind *.log *.toc >> /dev/null
chemindist=$(kpsewhich -var-value TEXMFMAIN)
chemintex=${chemindist}/tex/latex/polytechnique
cheminsource=${chemindist}/source/latex/polytechnique
cheminsourceresources=${chemindist}/source/latex/polytechnique/resources
chemindoc=${chemindist}/doc/latex/polytechnique
mkdir ${chemintex}
mkdir ${cheminsource}
mkdir ${cheminsourceresources}
mkdir ${chemindoc}
cp polytechnique.dtx ${cheminsource}
cp polytechnique.sty ${chemintex}
cp polytechnique.pdf ${chemindoc}
rm -f polytechnique.sty
cd resources
cp *.eps ${cheminsourceresources}
cp *.eps ${chemintex}
cp *.pdf ${cheminsourceresources}
cp *.pdf ${chemintex}
echo "************************************************"
echo "* La base de donnees des packages est en train *"
echo "* de se mettre à jour. Cela peut prendre un    *"
echo "* peu de temps. Merci de patienter.            *"
echo "************************************************"
texhash >> /dev/null
echo "************************************************"
echo "* Le package a ete installe ! La documentation *"
echo "* se trouve a l'emplacement suivant :          *"
echo ${chemindoc}
echo "* Les fichiers sources et resources a          *"
echo "* l'endroit suivant :                          *"
echo ${cheminsource}
echo "* Et le .sty a l'endroit suivant :             *"
echo ${chemintex}
echo "* Bonne utilisation !                          *"
echo "************************************************"

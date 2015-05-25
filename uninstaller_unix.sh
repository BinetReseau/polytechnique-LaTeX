#! /bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "Vous devez posséder les droits administrateurs pour désinstaller ce package."
  echo "Veuillez utiliser la commande « sudo sh unix_uninstaller.sh »."
  exit 1
fi

chemindist=$(kpsewhich -var-value TEXMFMAIN)
chemintex=${chemindist}/tex/latex/polytechnique
cheminsource=${chemindist}/source/latex/polytechnique
cheminsourceresources=${chemindist}/source/latex/polytechnique/resources
chemindoc=${chemindist}/doc/latex/polytechnique

rm -rf ${chemindoc}
rm -rf ${chemintex}
rm -rf ${cheminsource}

echo "************************************************"
echo "* La base de donnees des packages est en train *"
echo "* de se mettre à jour. Cela peut prendre un    *"
echo "* peu de temps. Merci de patienter.            *"
echo "************************************************"
texhash >> /dev/null

echo "Le package a été désinstallé"
#!/bin/bash

#debut de la fonction help

function help {

  echo "Bonjour, ce guide vous permettra d'utiliser aisement notre script"
  echo ""
  echo "notre script permet de generer un petit blog html "
  echo ""
  echo "- ./script.sh permet d'executer le script "
  echo ""
  echo "- ./script.sh --debug permet d'afficher le debug "
  echo ""
  echo "- ./script.sh build -target- permet de faire le build du projet dans le dossier de votre choix"
  echo ""
  echo "- ./script.sh add_image -le chemain de l'image- permet d'ajouter une image au blog"
  echo ""
  echo "- ./script.sh delete_image -le nom de l'image- permet de supprimer une image du blog"
  echo ""
  echo "- ./script.sh add_article -le chemain de l'article- permet d'ajouter un article"
  echo ""
  echo "- ./script.sh add_article -le chemain de l'article- add_image -le chemain de l'image- permet d'ajouter un article lié à une image"
  echo ""
  echo "- ./check.sh permet de verifier (ou recré) au besoin les fichiers necessaires pour le bon fonctionnement du script."

}

#fin de la fonction help

#appel à la fonction

help
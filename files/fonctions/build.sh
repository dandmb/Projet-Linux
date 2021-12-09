#!/bin/bash

#fonction pour faire le build

function build {

  dossier=$BUILD_PATH

if [[ -d "$dossier" ]]; then  
  wget -q --spider http://google.com
  if [ $? -eq 0 ]; then
  :
  else
  sleep 5s
  echo "Veuillez vous connecter à internet pour executer ce script"
  exit 0
  fi
   
   cp "check.sh" "$dossier"
   cp "script.sh" "$dossier"
   cp -avr "files/fonctions" "$dossier" 
   cd "$dossier" || exit
   
   ./check.sh

   mv "fonctions" "files" 

  # create   
  
   if [ -e "files/fonctions/create.sh" ];then
    /bin/bash ./files/fonctions/create.sh
    else
    echo "Fichier create.sh introuvable"
    exit 0
  fi
  
  else
   echo "dossier $dossier introuvable"
fi
}

#fin de la fonction du build

#appel à la fonction

build
#!/bin/bash

#en cas d'execution du script

case $# in

  0) 
  if [ -e "files/fonctions/create.sh" ];then
    /bin/bash ./files/fonctions/create.sh
    else
    echo "Fichier create.sh introuvable"
    exit 0
  fi ;;
  #  create;;
  1)
     if [ "$1" = "--help" ] || [ "$1" = "-h" ]
       then
          #help

          if [ -e "files/fonctions/help.sh" ];then
            /bin/bash files/fonctions/help.sh
          else
            echo "Fichier help.sh introuvable"
          exit 0
          fi 

     elif [ "$1" = "--debug" ]
       then
          ./files/debug.sh
    elif [ "$1" = "add_img" ]
       then
          echo "il manque un argument! veuillez indiquer le chemin de l'image"
    elif [ "$1" = "add_article" ]
       then
          echo "il manque un argument! "
    elif [ "$1" = "build" ]
       then
          echo "il manque un argument! veuillez indiquer le chemin du dossier "
     else
       echo  "Arguments inconnue ou erreur de syntaxe"
     fi;;
     
     2) 

    if [ "$1" = "add_img" ]
      then

       # add_image "$2" "images/"

        IMG_PATH=$2
        IMGDIR_PATH="images/"
        export IMG_PATH
        export IMGDIR_PATH

       if [ -e "files/fonctions/add_image.sh" ];then
        /bin/bash files/fonctions/add_image.sh
       else
         echo "Fichier add_image.sh introuvable"
       exit 0
       fi 

    elif [ "$1" = "add_article" ]
      then

        #add_article "$2"

        ARTICLE_PATH=$2
        export ARTICLE_PATH

        if [ -e "files/fonctions/add_article.sh" ];then
        /bin/bash files/fonctions/add_article.sh
       else
         echo "Fichier add_article.sh introuvable"
       exit 0
       fi 
    
    elif [ "$1" = "build" ]
      then

        #build "$2"

        BUILD_PATH=$2
        export BUILD_PATH

        if [ -e "files/fonctions/build.sh" ];then
        /bin/bash files/fonctions/build.sh
       else
         echo "Fichier build.sh introuvable"
       exit 0
       fi


    else
       echo "Arguments inconnu ou erreur de syntaxe"
     fi;; 
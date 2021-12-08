#!/bin/bash

# fonction d'ajout d'un article lié à une image

function add_article_with_img { 
  article=$ARTICLE_PATH
  
  if [ -e "$article" ];then
    ext=${article##*.}
    declare -a extensions=( "txt" "csv" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$ARTICLE_PATH" files/articles/
        nom_fichier=$(basename "${ARTICLE_PATH}")
        nom_image=$(basename "${IMG_PATH}")
        echo "$nom_fichier;$nom_image">>files/data.csv
        echo "Article ajouté. "

       # add_image "$2" "$3"
        

        if [ -e "files/fonctions/add_image.sh" ];then
        /bin/bash files/fonctions/add_image.sh
       else
         echo "Fichier add_image.sh introuvable"
       exit 0
       fi 

      else
        echo "Veuillez mettre le lien d'un fichier txt ou csv"
      fi
    else
    echo "Fichier $IMG_PATH introuvable"
  fi
}

#fin de la fonction d'ajout

#appel à la fonction

add_article_with_img
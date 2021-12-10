#!/bin/bash

# fonction d'ajout d'un article

function add_article { 
  article=$ARTICLE_PATH
  
  if [ -e "$article" ];then
    ext=${article##*.}
    declare -a extensions=( "txt" "csv" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$ARTICLE_PATH" files/articles/
        nom_fichier=$(basename "${1}")
        echo "$nom_fichier;null">>files/data.csv
        echo "Article ajouté."

        if [ -e "files/fonctions/create.sh" ];then
        /bin/bash files/fonctions/create.sh
       else
         echo "Fichier create.sh introuvable"
       fi

      else
        echo "Veuillez mettre le lien d'un fichier txt ou csv"
      fi
    else
    echo "Fichier $ARTICLE_PATH introuvable"
  fi
}

#fin de la fonction d'ajout

#appel à la fonction

add_article
#!/bin/bash

# fonction d'ajout d'un article lié à une image

function add_article_with_img {
  article=$ARTICLE_PATH
  
  if [ -e "$article" ];then
    ext=${article##*.}
    declare -a extensions=( "txt" "csv" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then

        #On commence par essayer d'ajouter l'image , s'il y a un souci, on arrête tout, sinon (image rajoutée correctement) on rajoute l'article

        # add_image "$2" "$3"

        if [ -e "files/fonctions/add_image.sh" ];then
        /bin/bash files/fonctions/add_image.sh
       
       retval=$?
       if [ "$retval" == 0 ]; then
        exit 0
        else :
       fi

       else
         echo "Fichier add_image.sh introuvable"
       exit 0
       fi 

        cp "$ARTICLE_PATH" files/articles/
        nom_fichier=$(basename "${ARTICLE_PATH}")
        nom_image=$(basename "${IMG_PATH}")
        echo "$nom_fichier;$nom_image">>files/data.csv
        echo "Article ajouté. "

      else
        echo "Veuillez mettre le lien d'un fichier txt ou csv"
      fi
    else
    echo "Fichier $ARTICLE_PATH introuvable"
  fi
}

#fin de la fonction d'ajout

#appel à la fonction

add_article_with_img
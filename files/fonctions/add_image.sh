#!/bin/bash

# fonction d'ajout d'une image

function add_image {
  retval=0

  img=$IMG_PATH
  if [ -e "$img" ];then
    ext=${img#*.}
    declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$IMG_PATH" "$IMGDIR_PATH"
        retval=1
        echo "Photo ajoutée."

        if [ -e "files/fonctions/create.sh" ];then
        /bin/bash files/fonctions/create.sh
       else
         echo "Fichier create.sh introuvable"
       fi
       
      else
        echo "Veuillez mettre le lien d'une image de type PNG,JPEG ou JPG"
      fi
    else
    echo "Fichier $IMG_PATH introuvable"
  fi
  
return "$retval"
}

#appel de la fonction

add_image
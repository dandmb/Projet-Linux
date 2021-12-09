#!/bin/bash

# fonction d'ajout d'une image

function add_image {
  img=$IMG_PATH
  if [ -e "$img" ];then
    ext=${img#*.}
    declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$IMG_PATH" "$IMGDIR_PATH"
        echo "Photo ajoutée."
      else
        echo "Veuillez mettre le lien d'une image de type PNG,JPEG ou JPG"
      fi
    else
    echo "Fichier $IMG_PATH introuvable"
    exit 0
  fi
}

#fin de la fonction d'ajout

#appel de la fonction

add_image
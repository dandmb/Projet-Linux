#!/bin/bash

# fonction de suppression d'une image

function delete_image {
  retval=0

  img=$IMG_PATH
  if [ -e "$img" ];then

        rm "$IMG_PATH"
        retval=1
        echo "Photo supprimée."

        if [ -e "files/fonctions/create.sh" ];then
        /bin/bash files/fonctions/create.sh
       else
         echo "Fichier create.sh introuvable"
       fi
       
    else
    echo "Fichier $IMG_PATH introuvable"
  fi
  
return "$retval"
}

#fin de la fonction de suppression

#appel de la fonction

delete_image

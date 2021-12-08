function add_image { 
  img=$1
  if [ -e "$img" ];then
    ext=${img#*.}
    declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$1" "$2"
        echo "Photo ajoutée."
      else
        echo "Veuillez mettre le lien d'une image de type PNG,JPEG ou JPG"
      fi
    else
    echo "Fichier $1 introuvable"
    exit 0
  fi
}
#!/bin/bash

#debut de la fonction de dreation du site

function create {
  if [ -e "web.html" ]; then
   rm web.html
  fi  
  touch web.html  
  cat files/header.txt >> web.html  

  declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
  for f in  images/*.*
  do
    fichier="$f"
    ext=${fichier#*.}
    if [[ " ${extensions[*]} " =~ $ext ]]; then      
      echo "<div class='col col-md-4' >" >> web.html            
      echo "<img style='height: 300px; width: 300px;margin: 10px;'  src='""$fichier""'>" >> web.html  
      echo "</div>" >> web.html  
      echo "<br>" >> web.html  
    fi  
  done

  echo "</div>
        <br>
      <h1>les articles</h1>
      <div class='container row'>">>web.html

      nb_ligne=$(wc -l < files/data.csv)
      declare -a tab_article
      declare -a tab_photo
      for ((i=1; i<=$nb_ligne; i++)) ;
      do 
      tab_article[$i]=$(awk 'BEGIN{FS=";";OFS="\n"} FNR=='$i'{print $1;exit}' files/data.csv)
      tab_photo[$i]=$(awk 'BEGIN{FS=";";OFS="\n"} FNR=='$i'{print $2;exit}' files/data.csv)
      done      

      for ((i=1; i<=$nb_ligne; i++)) ;
      do
        echo "<div class='col col-md-4' >">>web.html  

      if [ ${tab_photo[$i]}==null ];then :
       else 
        echo "<img style='height: 300px; width: 300px;margin: 10px;'  src='""files/articles/images/${tab_photo[$i]}""'>">>web.html 
       fi

        echo "<p  style=' width: 300px;margin: 10px;'>">>web.html
        cat "files/articles/${tab_article[$i]}" >> web.html
        echo "</p>">>web.html
        echo "</div>">>web.html
        echo "<br>">>web.html
      

      done    


  echo "</div>">>web.html

  cat files/footer.txt >> web.html 
}

#fin de la fonction de creation du site

#appel de la fonction

create
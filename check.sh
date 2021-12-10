#!/bin/bash



function create_header {
  touch header.txt  
echo "<!doctype html>
<html lang='en'>
<head>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <meta name='description' content=''>
  <meta name='author' content='Mark Otto, Jacob Thornton, and Bootstrap contributors'>
  <meta name='generator' content='Hugo 0.87.0'>
  <title>TP LINUX</title>  
  <!-- Bootstrap CSS -->
  <link rel='stylesheet' href='files/bootstrap/css/bootstrap.min.css' > 
  <script src='files/bootstrap/js/bootstrap.min.js' ></script>
 </head>

<body class='d-flex flex-column h-100'>

  <header>
    <nav class='navbar navbar-expand-md navbar-dark fixed-top bg-dark'>
      <div class='container-fluid'>
        <a class='navbar-brand' href=''>TP LINUX</a>
      </div>       
    </nav>
  </header><br><br>

  <div class='d-flex flex-row-reverse bd-highlight loginEtLogout' style='margin-top: 20px;'>
    <div class='p-2 bd-highlight'><a class='btn btn-outline-dark' href='logout.php' role='button'>Déconnexion</a> </div>
  </div>    

  </div>
  <main class='flex-shrink-0'>
    <div class='container homeContainer'>
        <h1>les photos</h1>
        <div class='container row'>" >header.txt
}

function create_footer {
  touch footer.txt
  echo "        </div>        
    </div>
  </main>

  <br>
  <br>
  <br>
  <footer class='footer mt-auto py-3 bg-light'>
      <div class='container'>
      <p class='float-end'><a href='#'>Back to top</a></p>
      <p class='text-dark'>&copy; 2021–2025 M1 Web Full Stack, Dev. &middot; <a href='#'>Privacy</a> &middot; <a href='#'>Terms</a></p>
      </div>
  </footer>
  </body>
  <script src='files/bootstrap/js/bootstrap.min.js' ></script>
  </html>" >footer.txt
  
}

function create_bootstrap {
  wget https://github.com/twbs/bootstrap/releases/download/v4.0.0/bootstrap-4.0.0-dist.zip
  unzip bootstrap-4.0.0-dist.zip -d bootstrap
}

wget -q --spider http://google.com
if [ $? -eq 0 ]; then
:
else
echo "Veuillez vous connecter à internet pour executer ce script"
exit 0
fi

if [ -d "files" ];then
  #au cas ou le dossier file existe on verifier l'existance de ses sous dossiers
  cd files || exit
  if [ -e "header.txt" ];then
  :
  else
  create_header
  fi

  if [ -e "data.csv" ];then
  :
  else
  touch data.csv
  fi

  if [ -e "footer.txt" ];then
  :
  else
  create_footer
  fi

  if [ -d "bootstrap" ];then
  :
  else

    if [ -e "bootstrap-4.0.0-dist.zip" ];then
    unzip bootstrap-4.0.0-dist.zip -d bootstrap
    else
    create_bootstrap
    fi
  fi

  if [ -d "articles" ];then

    if [ -d "articles/images" ];then
    :
    else
    mkdir articles/images
    fi

  else
  mkdir -p articles/images
  fi
  
  if [ -d "fonctions" ];then
  :
  else
  mkdir fonctions
  fi
  #fin de la verification des sous dossiers

else
  
  echo "Création du dossier fils et de son contenu "      
  mkdir files 
  cd files || exit       
  create_bootstrap
  create_header
  create_footer
  mkdir -p articles/images
  if [ -e "data.csv" ];then
  :
  else
  touch data.csv
  fi
  

  echo "Dossier crée avec succès" 

fi


cd .. 
if [ -d "images" ];then
:
else
 mkdir images
fi


function build {
  dossier=$1
if [[ -d "$dossier" ]]; then  
  wget -q --spider http://google.com
  if [ $? -eq 0 ]; then
  :
  else
  sleep 5s
  echo "Veuillez vous connecter à internet pour executer ce script"
  exit 0
  fi
   
   cp "check.sh" "$dossier"
   cp "script.sh" "$dossier" 
   cd "$dossier" || exit
   ./check.sh
   create   
  else
   echo "dossier $dossier introuvable"
fi
}
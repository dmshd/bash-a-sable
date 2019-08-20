#!/bin/sh
separatorContent="\n(⌒▽⌒) - - - - - -  (⌒▽⌒)\n"
echo "🔥 Hello World 👋"
separator() {
  echo $separatorContent
}

# paramètres et variables
  #  le répertoire depuis on exécute ${PWD}
echo "🔥 La commande st exécutée depuis : ${PWD}"
  #  la localisation du fichier script
echo "🔥 Le script est localisé là-bas : ${BASEDIR}"
separator
echo "🔥 Paramètres passés (jusqu'à 9 possibles)"
echo '🔥 $0 = ' $0
if [ "$1" != "" ]
then
  echo "🔥 Super tu as entré un paramètre ✅"
else
  echo "❌  Tu dois entrer 1 paramètre."
fi
echo '🔥 $1 = ' $1
# echo '$2 = ' $2
# echo '$3 = ' $3
# ...
separator

  # Détecter le nombre d'argumaents

# functions
  # déclarer la function
Hello() {
  echo "🔥 Hello iMio 👋"
}
  # l'utiliser
Hello
separator
# rendre le script executable
  # chmod +x bash_drills.sh
# executer le script
  # ./bash_drilles.sh
# actual terminal output
  # Hello World
  # La commande st exécutée depuis : /home/daniel/bash-a-sable
  # Le script est localisé là-bas : 
  # Hello iMio

# case 

# ts_tool() {
#   case "$1" in
#     "cdusr")
#       cd usr/share/publik/themes/imio/static/
#       ;;
#     "cdopt")
#       #
#       ;;
#     "sass")
#       #
#       ;;
#     "restore")
#       #
#       ;;
#     "save")
#       #
#       ;;
#     *)
#       echo "fin"
#       ;;
#   esac
# }
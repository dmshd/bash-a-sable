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


# options de ligne de commande quand on execute le script
# msgs retour utilisateur
msgOutil="🛠️  Outil local_téléservice >"
listeOption="\n   Les options sont : \n      🔥  -s | --save \n      🔥  -r | --restore \n      🔥  -ss | --sass"
# visuals elements
bold=$(tput bold)
normal=$(tput sgr0)
er="❌ "
ok="✅ "


# check if arg != 0
check_arg() {
  if [ "$2" = "" ]; then
        echo "$msgOutil $er Il manque un argument."
  fi
}

if [ "$1" != "" ]; then
  case $1 in 
    -s | --save )
      check_arg
      ;;
    -r | --restore )
      check_arg
      ;;
    -ss | --sass )
      if [ ! -e style.scss ]
      then
        echo "$er Il n'y a pas de 📄 ${bold}style.scss${normal} dans 📂 ${bold}${PWD}${normal}"
      else 
        sass styles.scss style.css
      fi
      ;;
    * )
      echo "$msgOutil $er Il manque une option ou l'option n'est pas reconnue. $listeOptions"
      break
      ;;
  esac
else 
 echo "$msgOutil $er L'option n'est pas reconnue. $listeOptions"
fi
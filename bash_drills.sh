#!/bin/sh
echo "Hello World"
# paramètres et variables
  #  le répertoire depuis on exécute ${PWD}
echo "La commande st exécutée depuis : ${PWD}"
  #  la localisation du fichier script
echo "Le script est localisé là-bas : ${BASEDIR}"
# functions
  # déclarer la function
Hello() {
  echo "Hello iMio"
}
  # l'utiliser
Hello
# rendre le script executable
  # chmod +x bash_drills.sh
# executer le script
  # ./bash_drilles.sh
# actual terminal output
  # Hello World
  # La commande st exécutée depuis : /home/daniel/bash-a-sable
  # Le script est localisé là-bas : 
  # Hello iMio

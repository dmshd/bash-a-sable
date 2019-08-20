#!/bin/bash
# options de ligne de commande quand on execute le script

  # feedbacks
  msgOutil="🛠️  Outil local_téléservices >"
  ## listeOptions="\n   Les options sont : \n      🔥  -s | --save \n      🔥  -r | --restore \n      🔥  -ss | --sass"
  eropt="$msgOutil $er Je ne reconnais pas cette option."
  ernoopt=""
  erarg="$msgOutil $er Il manque un argument."
  ## visual feedbacks
  bold=$(tput bold)
  normal=$(tput sgr0)
  er="❗ "
  ok="✅ "

#si option on boucle
if [ "$1" != "" ]; then
  case $1 in 
    -s | --save )
      if [ ! -z $2 ]; then
        if [ -e /usr/share/publik/themes/imio/static/$2 ]; then
          if [ grep "@import '../../../publik-base/static/includes/publik';" ]; then
            echo "$ok Je restore le chemin d'import du styles.scss ..."
            sed -i "s|../../../publik-base/|../../publik-base-theme/|g" /usr/share/publik/themes/imio/static/$2/style.scss
            sleep 1s
          fi
          echo "$ok \n Copie de : /usr/share/publik/themes/imio/static/${bold}$2${normal} \n vers : /opt/publik/scripts/imio-publik-themes/static/ "
          sleep 0.5
          cp /usr/share/publik/themes/imio/static/$2 /opt/publik/scripts/imio-publik-themes/static/$2
        else
          echo "$msgOutil $er /usr/share/publik/themes/imio/static/${bold}$2${normal} n'existe pas"
        fi
      else
        echo $erarg
      fi
      ;;
    -r | --restore )
      if [ ! -z $2 ]; then
        if [ -e /opt/publik/scripts/imio-publik-themes/static/$2 ]; then
          echo "$ok \n Copie de : /opt/publik/scripts/imio-publik-themes/static/${bold}$2${normal} \n vers : /usr/share/publik/themes/imio/static/ "
          sleep 0.5
          cp /opt/publik/scripts/imio-publik-themes/static/$2 /usr/share/publik/themes/imio/static/$2
        else
          echo "$msgOutil $er 📂  /usr/share/publik/themes/imio/static/${bold}$2${normal} n'existe pas"
        fi
      else
        echo $erarg
      fi
      ;;
    -e | --edit )
      if [ ! -z $2 ]; then
        if [ grep "@import '../../publik-base-theme/static/includes/publik';" /usr/share/publik/themes/imio/static/$2/style.scss ]; then
          sed -i "s|../../publik-base-theme/|../../../publik-base/|g" /usr/share/publik/themes/imio/static/$2/style.scss
          echo "$ok le chemin de l'import de ../../publik-base-theme/ dans 📄  styles.scss a été modifié en ../../../publik-base/"
        else 
          echo "je ne trouve pas l'occurence   @import '../../publik-base-theme/static/includes/publik';   dans  📂 /usr/share/publik/themes/imio/static/$2/style.scss "
        fi
      else 
        echo $erarg
      fi
      ;;
    -i | --install )
      if [ ! -z $2 ]; then
        if [ "$2" = "sass" ]; then
          apt-get install rubygems && apt-get install rubygems-integration && apt install ruby-sass
        else 
           echo "$msgOutil $er Pour le moment je sais uniquement installer sass."
        fi
      else
       echo "$erarg"
      fi
      ;;
    #-ss | --sass )
    #  if [ ! -e style.scss ]
    #  then
    #    echo "$er Il n'y a pas de 📄 ${bold}style.scss${normal} dans 📂 ${bold}${PWD}${normal}"
    #  else 
    #    sass styles.scss style.css
    #  fi
    #  ;;
    * )
      echo $eropt
      break
      ;;
  esac
else 
 echo "$msgOutil $er Entre une option (--help si tu as besoin d'aide)"
fi
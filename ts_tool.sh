#!/bin/bash
## Je l'écris comme je le pense
# Switch 
#   case cdusr
#   case cdopt
#   case sass
#       si style.scss existe, 
#         sass style.scss style.css
#       else
#         echo 'pas de style.scss dans ' 
#   case restore
#       # $2 = paramètre 2 est sensé être une ville donc on vérifie si le dossier est bien existant
#       si -d /opt/publik/scripts/imio-publik-themes/static/$2 
#         cp /opt/publik/scripts/imio-publik-themes/static/$2 /usr/share/publik/themes/imio/static
#       else
#         echo 'pas de $2 dans le répertoire static (/opt/publik/scripts/imio-publik-themes/static/)'
#   case save
#       #check faute de frappe
#       si -d /usr/share/publik/themes/imio/static/$2
#         cp /usr/share/publik/themes/imio/static/$2 /opt/publik/scripts/imio-publik-themes/static/$2
#   default 
#     echo
#     Faciliter l\'utilisation de sass
#       /n cdusr='cd /usr/share/publik/themes/imio/static' 
#       /n cdopt='cd /opt/publik/scripts/imio-publik-themes/static/'
#       /n sass='sass style.scss style.css'
echo "coucou"
ts_tool() {
  case "$1" in
    "cdusr")
      cd usr/share/publik/themes/imio/static/
      ;;
    "cdopt")
      #
      ;;
    "sass")
      #
      ;;
    "restore")
      #
      ;;
    "save")
      #
      ;;
    *)
      echo "fin"
      ;;
  esac
}
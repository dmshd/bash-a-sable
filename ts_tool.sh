#essai 1
#Je laisse tomber ceci et repars de zéro en privilégiant l'utilisant d'un switch
# #!/bin/bash
# function ts_tool() {
# # feedbacks strings (DRY)
# err="> Erreur : "
# ok="> Succès : "
# # si il n'y a pas 2 parametres
# if [[ $# != 2 ]]; then
# 	# installer sass ?
# 	if [[ $1 == isass ]]; then
#         apt-get install rubygems && apt-get install rubygems-integration && apt install ruby-sass
#     	else
#     	echo "$err Tu dois entrer deux paramètres (./$0.sh [commande] [parametre])."
# 	fi
# # si deux parametres
# elif [[ $# == 2 ]]; then

#     # paramètre sass
#     if [[ $1 == "sass" ]]; then

#         # si le répertoire existe
#         if [[ -e /usr/share/publik/themes/imio/static/$2 ]]; then

#             # si style.scss exite dans le rép
#             if [[ -e /usr/share/publik/themes/imio/static/$2/style.scss ]]; then
#                # mais que sass n'est pas installé 
#                 if ! type "sass" > /dev/null; then

#                     echo "$err sass n'est pas installé. (./$0.sh isass     pour l'installer)"
#                 else
#                     sass /usr/share/publik/themes/imio/static/$2/style.scss /usr/share/publik/themes/imio/static/$2/style.css
#                 fi
#             # pas de style.scss 
#             else
#                 echo "$err pas de style.scss dans le theme de /$2"
#             fi
#         # nom de ville pas trouvé
#         else
#             echo "$err pas de    /$2    dans    /usr/share/publik/themes/imio/static/"
#         fi
#     fi
# fi
# }



## essai 2
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
#
## idées d'amelioration
## utiliser rsync au lieu de tout cp pour save

ts_tool()
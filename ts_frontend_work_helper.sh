#!/bin/bash

# feedbacks strings (DRY)
err="> Erreur : "
ok="> Succès : "

# si il n'y a pas 2 parametres
if [[ $# != 2 ]]; then
	# installer sass ?
	if [[ $1 == isass ]]; then
        apt-get install rubygems && apt-get install rubygems-integration && apt install ruby-sass
    	else
    	echo "$err Tu dois entrer deux paramètres (./$0.sh [commande] [parametre])."
	fi
# si deux parametres
elif [[ $# == 2 ]]; then

    # paramètre sass
    if [[ $1 == "sass" ]]; then

        # si le répertoire existe
        if [[ -e /usr/share/publik/themes/imio/static/$2 ]]; then

            # si style.scss exite dans le rép
            if [[ -e /usr/share/publik/themes/imio/static/$2/style.scss ]]; then
               # mais que sass n'est pas installé 
                if ! type "sass" > /dev/null; then

                    echo "$err sass n'est pas installé. (./$0.sh isass     pour l'installer)"
                else
                    sass /usr/share/publik/themes/imio/static/$2/style.scss /usr/share/publik/themes/imio/static/$2/style.css
                fi
            # pas de style.scss 
            else
                echo "$err pas de style.scss dans le theme de /$2"
            fi
        # nom de ville pas trouvé
        else
            echo "$err pas de    /$2    dans    /usr/share/publik/themes/imio/static/"
        fi
    fi
fi

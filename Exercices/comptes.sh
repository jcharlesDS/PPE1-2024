#!/usr/bin/bash

dossier="/home/jcharles_dsilva/Exercice1/ann2/2016"

compteur=0

for fichier in "$dossier"/* .ann; do

        count=$(grep -c "Location" "$fichier")
        compteur=$((compteur + count))
    done

echo "Nombre de locations dans ce dossier : $compteur"

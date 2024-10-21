#!/usr/bin/bash

dossier="/home/jcharles_dsilva/Exercice1/ann2/2016"

compteur=0

echo "Entrer le type d'entité recherché"

read recherche

for fichier in "$dossier"/* .ann; do

        count=$(grep -c "$recherche" "$fichier")
        compteur=$((compteur + count))
    done

echo "$compteur"

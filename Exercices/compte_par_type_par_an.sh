#!/usr/bin/bash

dossier1="/home/jcharles_dsilva/Exercice1/ann2/2016"
dossier2="/home/jcharles_dsilva/Exercice1/ann2/2017"
dossier3="/home/jcharles_dsilva/Exercice1/ann2/2018"

compteur1=0
compteur2=0
compteur3=0

echo "Entrer le type d'entité recherché"

read recherche

for fichier in "$dossier1"/* .ann; do

        count1=$(grep -c "$recherche" "$fichier")
        compteur1=$((compteur1 + count1))
    done

echo "Nombres d'entités de '$recherche' pour l'année 2016 :  $compteur1"

for fichier in "$dossier2"/* .ann; do

        count2=$(grep -c "$recherche" "$fichier")
        compteur2=$((compteur2 + count2))
    done

echo "Nombres d'entités de '$recherche' pour l'année 2017 :  $compteur2"

for fichier in "$dossier3"/* .ann; do

        count3=$(grep -c "$recherche" "$fichier")
        compteur3=$((compteur3 + count3))
    done

echo "Nombres d'entités de '$recherche' pour l'année 2018 :  $compteur3"

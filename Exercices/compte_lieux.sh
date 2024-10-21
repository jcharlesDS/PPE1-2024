#!/usr/bin/bash

dossier1="/home/jcharles_dsilva/Exercice1/ann2/2016"
dossier2="/home/jcharles_dsilva/Exercice1/ann2/2017"
dossier3="/home/jcharles_dsilva/Exercice1/ann2/2018"

echo "1 pour le dossier 2016, 2 pour le dossier 2017 et 3 pour le dossier 2018"
read choice

if [ "$choice" -eq 1 ]
then
grep "Location" "$dossier1"/*.ann | cut -f 3 | sort | uniq -c | sort -n

elif [ "$choice" -eq 2 ]
then
grep "Location" "$dossier2"/*.ann | cut -f 3 | sort | uniq -c | sort -n

elif [ "$choice" -eq 3 ]
then
grep "Location" "$dossier3"/*.ann | cut -f 3 | sort | uniq -c | sort -n

else
echo "It's dangerous to go alone! Read the rules!"

fi

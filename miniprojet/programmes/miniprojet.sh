#!/usr/bin/bash

output_file="/home/jcharles_dsilva/Git/PPE1-2024/miniprojet/tableaux/tableau-fr.tsv"

echo "Entrer l'adresse de votre fichier contenant vos liens"
read links_files

input_file="$links_files"

if [[ ! -f "$input_file" ]]; then
    echo "Le fichier $input_file n'existe pas."
    exit 1
fi

line_number=1

if [[ ! -f "$output_file" || ! -s "$output_file" ]]; then
    echo -e "Numéro\tNom du Site\tURL\tCode HTTP\tEncodage\tNombre de Mots" > "$output_file"
fi

while IFS= read -r url; do
    if [[ -n "$url" ]]; then

        site_name=$(echo "$url" | awk -F[/:] '{print $4}' | sed 's/^www\.//')

        response=$(curl -s -I "$url" -w "%{http_code}" -o /dev/null)
        http_code="${response: -3}"

        headers=$(curl -s -I "$url")
        encoding=$(echo "$headers" | grep -i "Content-Type" | sed -E 's/.*charset=([a-zA-Z0-9_-]+).*/\1/' | head -n1)
        encoding=${encoding:-"Unknown"}

        word_count=$(curl -s "$url" | lynx -stdin -dump -nolist | wc -w)

        echo -e "${line_number}\t${site_name}\t${url}\t${http_code}\t${encoding}\t${word_count}" >> "$output_file"

        ((line_number++))

    fi
done < "$input_file"

echo "Les informations ont été enregistrés dans le fichier : $output_file"


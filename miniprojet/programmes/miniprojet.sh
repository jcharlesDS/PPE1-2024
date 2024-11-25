#!/usr/bin/bash

# Demande où se trouve le fichier .txt contenant les informations
echo "Entrez le chemin du fichier contenant vos liens :"
read links_files

input_file="$links_files"

# Vérifie si le fichier d'entrée existe
if [[ ! -f "$input_file" ]]; then
    echo "Le fichier $input_file n'existe pas."
    exit 1
fi

echo "Entrez le chemin et le nom de votre fichier de sortie TSV (exemple: /chemin/vers/fichier/tableau.tsv) :"
read output_file

# Vérifie si le fichier de sortie TSV existe, sinon le crée
if [[ ! -f "$output_file" || ! -s "$output_file" ]]; then
    echo -e "Numéro\tNom du Site\tURL\tCode HTTP\tEncodage\tNombre de Mots" > "$output_file"
fi

# Demande à l'utilisateur où enregistrer le fichier HTML
echo "Entrez le chemin et le nom de votre fichier de sortie HTML (exemple: /chemin/vers/fichier/tableau-fr.html) :"
read html_output_file

line_number=1

# Lecture du fichier d'entrée ligne par ligne
while IFS= read -r url; do
    if [[ -n "$url" ]]; then

        # Ajoute "https://" si l'URL ne le contient pas
        if [[ ! "$url" =~ ^https?:// ]]; then
            url="https://$url"
        fi

        site_name=$(echo "$url" | awk -F[/:] '{print $4}' | sed 's/^www\.//')

        # Obtient les en-têtes HTTP
        response=$(curl -s -I "$url")
        http_code=$(echo "$response" | grep -i "^HTTP" | awk '{print $2}')

        # Si le code HTTP est 200, récupére l'encodage et compter les mots
        if [ "$http_code" = "200" ]; then
            # Extrait l'encodage de l'en-tête Content-Type
            encodage=$(echo "$response" | grep -i "^Content-Type" | cut -d'=' -f2 | head -n 1)
            encodage=${encodage:-"Unknown"}

            # Récupère le contenu de la page et compte les mots
            word_count=$(curl -s "$url" | lynx -stdin -dump -nolist | wc -w)

        else
            # Si le code HTTP n'est pas 200, utilise des valeurs par défaut
            encodage="Unknown"
            word_count=0
        fi

        # Enregistrement des résultats dans le fichier .tsv
        echo -e "${line_number}\t${site_name}\t${url}\t${http_code}\t${encodage}\t${word_count}" >> "$output_file"

        ((line_number++))

    fi
done < "$input_file"

echo "Les informations ont été enregistrées dans le fichier : $output_file"

# Demande à l'utilisateur s'il souhaite convertir en HTML
echo "Voulez-vous convertir ces informations en fichier HTML ? (oui/non)"
read convert_to_html

if [[ "$convert_to_html" == "oui" ]]; then
    # Création du fichier HTML
    echo "<!DOCTYPE html>
<html lang='fr'class='has-background-dark'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Tableau test du miniprojet</title>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css'>
</head>

<nav class='navbar is-light'>
    <div class='navbar-brand'>
        <a class='navbar-item' href='index.html'>
            <h1 class='title is-4'>Mini-Projet</h1>
        </a>
    </div>
</nav>

<body>

  <section class='section is-fullheight'>
    <div class='container mt-5'>
        <h1 class='title has-text-centered has-text-light is-2'>Tableau de test</h1>
        <table class='table is-striped is-bordered is-hoverable is-fullwidth'>
                <thead>
                    <tr>
                        <th>Numéro</th>
                        <th>Nom du Site</th>
                        <th>URL</th>
                        <th>Code HTTP</th>
                        <th>Encodage</th>
                        <th>Nombre de Mots</th>
                    </tr>
                </thead>
                <tbody>" > "$html_output_file"

    # Lecture du fichier .tsv et conversion des lignes en HTML
    while IFS=$'\t' read -r line_number site_name url http_code encoding word_count; do
        if [[ "$line_number" != "Numéro" ]]; then
            echo "                <tr>
                    <td>${line_number}</td>
                    <td>${site_name}</td>
                    <td><a href='${url}' target='_blank'>${url}</a></td>
                    <td>${http_code}</td>
                    <td>${encoding}</td>
                    <td>${word_count}</td>
                </tr>" >> "$html_output_file"
        fi
    done < "$output_file"

    # Fin du fichier HTML
    echo "      </tbody>
        </table>
    </div>
</section>
</body>
</html>" >> "$html_output_file"

    echo "Les informations ont été converties et enregistrées dans le fichier HTML : $html_output_file"
fi

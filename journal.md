Journal de bord du projet encadré

# Rules are meant to be broken


## Manipulation sur Git

J'ai crée un repositoy sur Github.
- cloner et récupérer le git sur mon ordinateur (avec les commandes, git clone, git status, git fetch et git pull).
Par la suite, j'ai crée un journal de bord sur Git, vérifier si mon dossier était à jour comparé au dossier Git en ligne (git log et git status) et je suis en train de remplir mon journal de bord du projet encadré.

## Exercices de pipelines

L'exercice concernant les pipelines était un calvaire pour moi. J'ai pris énormement de temps, particuliérement pour le passage du classement des 15 lieux les plus cités pour chaque année. Je n'arrivais pas à trouver la bonne formule. Soit j'avais des élements en trop, soit je n'avais que les occurences mais pas le reste. Au bout de plusieurs heures, j'ai pu trouver quelque chose et en testant pas mal d'options, trouver une solution à peu près correcte. J'avais pas mal de difficultés à comprendre les effets de mes ligne puis en essayant petit à petit pour comprendre, ça finit par rentrer. Le bash, c'est pas si simple que ça. La chose que j'aurai retenu de cet exercice, c'est que l'ordre des commandes à son importance.

## Et c'est la correction d'erreurs (Erreurs et conflits Git)

Pour l'instant l'exercice a l'air plus simple que celui des pipelines. Espérons que cela continue ainsi.
J'ai utilisé un git show et un git revert commit afin d'avancer dans l'exercice.
J'ai par la suite, rempli mon journal de bord de mes instructions sur cette exercice, git add, git commit plusieurs fois.
J'ai ensuite git reset tag afin de revenir à la progression du Git lié au tag.
Après, j'ai effacé le fichier oups.md, récupérer mon avancement, git add, git commit et push.
Je dirais que la différence entre les deux méthodes de récupération se trouvent dans le facteur risque. Le git reset semble plus dangeureux à l'utilisation.
Vers la fin de cet exercice, j'ai modifié le journal de bord en ligne puis sur ma version local, essayer de recupérer les modifications en ligne du Git (git fecth, git status), risque de conflit.
J'ai git stash push -m "Conservation des changements séance" afin de mettre de côté mes changements sans les push, puis j'ai git stash list, pour voir la liste des modifications mis de cotés non push.
Git stash show (pour voir la modification en question)
git stash pop (pour appliquer les modifications et supprimer par la suite le stash)
J'aurai pu aussi utiliser git stash drop (pour supprimer manuellement le stash) mais j'ai préféré utilisé la première formule.
Finalement, j'ai rempli mon journal de bord, git add, git commit et git push le tout, en n'oubliant pas de rajouter le tag à la fin et de le push.

Cette ligne sera mise de coté pour plus tard.

## Explication de code

La première instruction cherche à déterminer s'il y plus d'un argument. Si cela est le cas, le message "ce programme demande un argument" s'affichera. Ensuite, c'est une déclaration de variable (FICHIER_URLS=$1, OK=O, NOK=0).
La boucle while elle lit ligne par ligne le FICHIER_URLS et enregistre en variable un URL écrit par l'utilisateur pour ensuite avec l'instruction suivante if, vérifier si l'adresse ressemble au format d'une adresse URL valide (https://), si c'est le cas, un message s'affiche (ressemble à une URL valide) et enregistre la ligne valide (par la ligne OK et la fonction expr). Inversement, si le script détermine que l'URL ne ressemble pas à une URL valide, elle l'enregistre également (avec la ligne NOK).
Finalement, le script arrête sa lecture du fichier et envoie les résultats sur l'écran de l'utilisateur montrant le nombre de lignes "valide" et le nombre de lignes douteuses.

## Exercices de scripts BASH
Alors, j'ai particuliérement apprécié cet exercie. Pas spécialement parce que je l'ai réussi, je sais que pas mal de mes rendus ne sont pas exactement ce que la consigne demande. Mais c'est le fait d'avoir réussi à produire quelque chose qui fonctionne, rentrant à peu près dans le cadre de l'exercice et d'avoir compris ce que j'ai produis.

## Projet de groupe - prémice

Création du Git du projet de groupe, modification des READMEs avec les liens des githubs personnels. Lien du Github du groupe dans mon Readme.


## Miniprojet - 1

La fonction cat peut être utilisé pour les liens html mais, elle nous donnera pas la même forme que la page web, simplement la forme texte brut avec les balises html. Elle n'interprète pas le html.

Mettre le fichier "urls/fr.txt" en variable "input_file" (dans mon cas, ici, donner l'adresse du fichier avec le terminal) puis verifier si le fichier existe ou pas. Si il n'existe pas, le programme écrit un message d'erreur et s'arrête. Si le fichier existe, le programme continue.

Créer une variable "line_number" et l'augmenter de 1 à la fin du script, puis utiliser cette variable avec la fonction echo afin de formatter le résultat écrit dans le fichier de sortie du script et afficher le numéro à l'avant. A chaque fois que le script lira une ligne avec un url, il augmentera la variable "line_number" et l'associera au lien utilisé. On utilise également la commande "\t" pour la tabulation.

## Miniprojet - 2

PLutôt clair, plutôt simple. Pas grand chose à dire de plus pour cet exercice.



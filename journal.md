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
FInalement, j'ai rempli mon journal de bord, git add, git commit et git push le tout, en n'oubliant pas de rajouter le tag à la fin et de le push.

Cette ligne sera mise de coté pour plus tard.

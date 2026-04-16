Le premier commit de ce répertoire a été effectué le 15/04/2026 à 09h13.

Suite de commandes git permettant d’obtenir l’historique demandé :

git checkout master
git commit -m "commit A"
git checkout -b branch1
git commit -m "commit B"
git checkout master
git commit -m "commit C"
git merge branch1
git commit -m "commit D"

#!/bin/bash

#Script qui permet de sauvegarder les fichiers existants dans le dossier

#Stocker la liste des elements presents dans le dossier
list=($(ls -F)) #permet de distinguer les dossiers des fichiers avec /
typeset -i compteur=0

for fichier in "${list[@]}"; do
	test="${fichier:(-1)}" #Récupère le dernier caractère de l'élément
	existe="${fichier:(-4)}" #Récupère les 4 derniers caractères de l'élément

#SI l objet n est pas un dossier
#ET SI ce n est pas deja une sauvegarde
#ET SI un fichier .bak n existe pas deja
	if [[ "$test" != "/" && "$existe" != ".bak" && ! -e "$fichier".bak ]]; then
#ALORS on créé une sauvegarde dans le même dossier
		cp ./"$fichier" ./"$fichier".bak
		compteur=compteur+1
	fi
done
#Afficher le nombre de fichiers sauvegardes
echo "$compteur fichier(s) sauvegardé(s)"

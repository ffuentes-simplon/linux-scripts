#!/bin/bash

# Creer un dossier ayant pour nom l argument

#un dossier a la fois
if (("$#" > 1)); then
	echo "Veuillez rentrer un seul argument."
elif (("$#" == 0)); then
	echo "Veuillez saisir un argument."
else
	mkdir ./"$1" #mkdir detecte seul l existence d un dossier existant
	echo "Dossier créé = $1" # afficher le nom du dossier cree
	touch "$1"/README.md "$1"/change.log #creer les fichiers souhaites dans le nouveau dossier
fi
ls -hal "$1" #afficher le contenu du nouveau dossier

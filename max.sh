#!/bin/bash

# Trouver le plus grand des nombres en arguments
args=("$@")

if [[ "${args[@],,}" =~ [a-z] ]]; then #vérifier s il y a des lettres (tout passé en minuscule)
	echo "Veuillez ne saisir que des nombres"
	exit 22 #Code erreur Invalid argument
else
	#Indiquer au shell de prendre le retour chariot comme separateur de mots
	#afin de pouvoir la commande complete avec les pipes
	IFS=$'\n'

	#Afficher la premiere valeur (head) de la table (args) rangee par ordre
	#decroissant (sort -nr)
	echo "${args[*]}" | sort -nr | head -n1
fi

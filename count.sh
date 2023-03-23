#!/bin/bash

# Script qui compte jusqu'au nombre "argument"
# Pour tout i entre 1 et "argument", incrémenté de 1

if [[ $# == 1 && $1 =~ [0-9] ]];then # Vérifier s il y a un seul argument, et que c est un nombre
	for ((i = 1 ; i <= "$@" ; i++)); do
		echo "$i" #Afficher "i"
	done
else
	echo "Veuillez entrer un argument numérique"
	exit 22 #Code erreur Invalid argument
fi

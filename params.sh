#!/bin/bash

#Script qui retourne son nom, le chemin, et les arguments en entree

#Récupérer le nom du script et l'attribuer a une variable
nom=$(basename "$0") #basename pour ne pas avoir le chemin d'appel dans le nom
echo "Nom : $nom"

#Afficher le chemin du script
chemin=$(dirname "$0") #dirname pour récupérer le chemin du fichier
echo "Chemin : $chemin"

#Compter les arguments
#Tableau d'arguments
arg=("$@")

#Boucle de 1 jusqu au nombre d arguments
for ((i=1 ; i<="$#" ; i++)); do
  echo "Argument $i : ${arg[$i-1]}" # "$i-1" car les tableaux sont indexes a partir de 0
done

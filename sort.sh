#!/bin/bash

# Ranger les arguments par ordre alphabetique

# Récupérer la liste des arguments
args=("$@")
# le séparateur que considérera le shell (retour chariot)
IFS=$'\n'
# ranger les arguments par ordre alphabétique
args=($(sort -f <<<"${args[*]}")) # l'opérateur <<< permet de donner le tableau args en entrée standard de sort qui attend normalement un fichier
# afficher le résultat
echo "${args[@]}"

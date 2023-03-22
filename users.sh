#!/bin/bash
IFS=$'\n'
# Récupérer la liste des processus utilisés
# Garder la première colonne avec les utilisateurs
# Retirer l'en-tête (USER)
# Ranger par ordre alphabétique
users=$(ps aux | awk '{print $1}' | tail -n +2 | sort -u)
# Afficher résultats
echo "${users[@]}"

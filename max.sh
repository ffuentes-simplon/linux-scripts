#!/bin/bash

# Trouver le plus grand des nombres en arguments
args=("$@")

#Indiquer au shell de prendre le retour chariot comme separateur de mots
#afin de pouvoir la commande complete avec les pipes
IFS=$'\n'

#Afficher la premiere valeur (head) de la table (args) rangee par ordre
#decroissant (sort -nr)
echo "${args[*]}" | sort -nr | head -n1

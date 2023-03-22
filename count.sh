#!/bin/bash

# Script qui compte jusqu'au nombre "argument"
# Pour tout i entre 1 et "argument", incrémenté de 1
for ((i = 1 ; i <= "$@" ; i++)); do
  echo "$i" #Afficher "i"
done

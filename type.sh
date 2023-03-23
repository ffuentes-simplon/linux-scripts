#!/bin/bash

#Tester les types de caracteres de l'argument

# Tester la presence de chiffres
if [[ "$1" =~ [0-9] ]]; then
	Rep1="Chiffre "
fi

# Tester la presence de voyelles
if [[ "${1,,}" =~ [a,e,i,o,u,y] ]]; then # Convertir en minuscule pour alléger l'écriture
	Rep2="Voyelle "
fi

# Tester la présence de consonnes
if [[ "${1,,}" =~ [b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,z] ]]; then
	Rep3="Consonne"
fi
# Afficher la reponse
echo "Le mot contient : $Rep1$Rep2$Rep3"

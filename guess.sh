#!/bin/bash

#Deviner le nombre gagnant entre 1 et 1000 en 10 essais

# initialisation des valeurs
guess=-1
typeset -i num=0
typeset -i tries=10
typeset -i left=tries
echo -e "----Trouvez le nombre entre 0 et 1000----\n"

# Générer un nombre entre 1 et 1000
(( answer = RANDOM % 999 + 1 )) #RANDOM fourni une réponse à partir de 0, pour éviter ce cas, nous rajoutons 1

#Règles du jeu
while (( guess != answer && num < tries)); do
	num=num+1
	read -p "Entrez un nombre entre 1 et 1000 : " guess
	if [[ $guess =~ [0-9] ]]; then
		if (( guess < answer )); then
			echo "Le nombre est plus grand."
                	left="$tries-$num"
                	echo "Il vous reste $left essais"
		elif (( guess > answer )); then
			echo "Le nombre est plus petit."
                	left="$tries-$num"
                	echo "Il vous reste $left essais"
		fi
	else
		echo "Veuillez n'entrer que des nombres"
		exit 22 # Code erreur Invalid argument
	fi
done
	if ((guess == answer)); then
		echo -e "Vous avez gagné en $num tentatives\n"
	elif ((num>=tries)); then
		echo -e "Vous avez perdu. La bonne réponse était $answer\n"
	fi

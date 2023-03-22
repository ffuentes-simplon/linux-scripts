#!/bin/bash

#Deviner le nombre gagnant entre 1 et 1000 en 10 essais

# initialisation des valeurs
guess=-1
typeset -i num=0
typeset -i tries=10
typeset -i left=tries
echo -e "----Trouvez le nombre entre 0 et 1000----\n"

### Generate random number
(( answer = RANDOM % 1000 + 1 ))

### Play game
while (( guess != answer && num < tries)); do
	num=num+1
	read -p "Entrez un nombre entre 1 et 1000 : " guess
	if (( guess < answer )); then
		echo "Le nombre est plus grand."
                left="$tries-$num"
                echo "Il vous reste $left essais"
	elif (( guess > answer )); then
		echo "Le nombre est plus petit."
                left="$tries-$num"
                echo "Il vous reste $left essais"
	fi
done
if ((guess == answer)); then
   echo -e "Vous avez gagné en $num tentatives\n"
elif ((num>=tries)); then
   echo -e "Vous avez perdu. La bonne réponse était $answer\n"
fi

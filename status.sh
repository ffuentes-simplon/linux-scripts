#!/bin/bash

#Autoriser un seul argument
if (("$#">1)); then
	echo "Un seul argument à la fois"
elif (("$#"==0)); then
	echo "Entrer un argument"
else
	isService=$(service --status-all | grep -F "$1") # Lister tous les services et vérifier que l argument est dans la liste
	if [[ -n "$isService" ]]; then # si l'argument est dans la liste
		status=${isService:1:5} # Récupérer le statut [ + ] ou [ - ]
		if [[ "$status" == "[ + ]" ]]; then # si le statut est [ + ] le service est actif
			echo "Le service $1 est présent et actif"
		elif [[ "$status" == "[ - ]" ]]; then # si le statut est [ - ] le service est inactif ou masqué
			echo "Le service $1 est présent et inactif ou masqué"
		fi
	else
		echo "Le service $1 n'est pas présent"
	fi
fi

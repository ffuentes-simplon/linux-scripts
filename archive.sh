#!/bin/bash

# Vérifier les droits admin
if (($(id -u) != 0)); then #id -u différent de 0 indique l absence de privilège admin
	echo "Vous devez disposer des droits administrateurs pour lancer ce script"
	exit 13 #Code erreur Permission denied
fi

#Déclaration des variables
target="192.168.56.5" # adresse du serveur distant par défaut
account="simplon" # compte recevant les infos côté serveur de sauvegarde par défaut

dateISO=$(date --iso-8601='minutes') # obtenir la date dans un format standard

if (("$#"==0)); then #si aucun argument est renseigné, en demander 1
	echo "Veuillez saisir un argument"
	exit 22 #Code erreur Invalid argument
elif (("$#">1)); then # s il y a trop d arguments
	echo "Veuillez entrer un seul argument"
	exit 7 #Code erreur Argument list too long
else
	listHome=$(ls /home | grep "$1") # Vérifier si le dossier existe
	if [[ -z "$listHome" ]]; then #Si le dossier n existe pas, informer l utilisateur
		echo "Aucun dossier personnel trouvé"
		exit 2
	else
		read -p "Adresse IPv4 du serveur de sauvegarde (par défaut 192.168.56.5)" cible #Permet à l utilisateur de rentrer l adresse de son serveur
		if [[ -z $cible ]]; then # si l utilisateur laisse vide, remplir avec l adresse par défaut
			cible=$target
		fi

		read -p "Compte à utiliser sur le serveur (par défaut simplon)" compte #Permet à l utilisateur d utiliser un compte particulier sur le serveur
		if [[ -z $compte ]]; then # si l utilisateur laisse vide, remplir avec le compte par défaut
			compte=$account
		fi

		echo "Sauvegarde du dossier '/home/$1' en cours..."
		echo "Création de la sauvegarde '/backup/$1-$dateISO.tar.gz'"
		tar -czf /backup/$1-$dateISO.tar.gz /home/$1 &>/dev/null; fin=$? #Archiver et compresser l ensemble du dossier, sans affichage à l écran
		if (("$fin" == 0)); then # Vérifier la bonne exécution de la sauvegarde
			echo "Sauvegarde terminée avec succès"
		else
			echo "La sauvegarde a rencontré un problème. Code erreur $fin"
			exit $fin
		fi

		echo "Transfert de la sauvegarde sur le serveur de sauvegarde ..."
		scp /backup/$1-$dateISO.tar.gz $compte@$cible:/home/$compte/ &>/dev/null; fin=$? #tranférer l archive vers le serveur de sauvegarde
		if (($fin == 0)); then #Vérifier la bonne execution transfert
			echo "Transfert terminé avec succès"
			exit 0
		else
			echo "La sauvegarde a rencontré un problème. Code erreur $fin"
			exit $fin
		fi
	fi
fi

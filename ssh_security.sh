#!/bin/bash

# Vérifier les droits admin
if (($(id -u) != 0)); then #id -u différent de 0 indique l absence de privilège admin
	echo "Vous devez disposer des droits administrateurs pour lancer ce script"
	exit 13 #Code erreur Permission denied
fi
eval echo ~$USER
echo "UsePrivilegeSeparation sandbox" | tee -a /home/simplon/scripts/sshd_config
sed -i "s/^PasswordAuthentication.*/PasswordAuthentication no/" /home/simplon/scripts/sshd_config
echo "ListenAddress 192.168.56.2" | tee -a /home/simplon/scripts/sshd_config

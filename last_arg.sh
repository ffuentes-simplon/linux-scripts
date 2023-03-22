#!/bin/bash

# Trouver et afficher le dernier argument
if (("$#"==0)); then #en cas d absence d argument
	echo "Il n'y a aucun argument renseigné"
else
	args=("$@")
	echo "${args[-1]}"
fi

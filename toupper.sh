#!/bin/bash

if (("$#">0)); then
	echo "${@^^}"
else
	echo "Il n'y a pas d'argument"
	exit 22 #Code erreur Invalid argument
fi

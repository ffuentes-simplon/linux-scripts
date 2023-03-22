#!/bin/bash

if (("$#">0)); then
	echo "$@" | tr '[:lower:]' '[:upper:]'
fi

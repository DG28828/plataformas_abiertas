#!/bin/bash

#Parametros de entrada
usuario=$1
grupo=$2
ruta=$3

if [[ $EUID -ne 0 ]]; then #Verifica si el usuario actual no es root (si es root $EUID=0, si no es 1000)
    echo "ERROR: El usuario actual no es el usuario root. Ejecute el script desde el usuario root"
    exit 2
fi

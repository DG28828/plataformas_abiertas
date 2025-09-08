#!/bin/bash

#Parametros de entrada
usuario=$1
grupo=$2
ruta=$3

#Crear archivo .log (eliminando el existente)
if [[ -e registro_ejecucion.log ]]; then
    sudo rm registro_ejecucion.log #Elimina el archivo si existe
fi
touch registro_ejecucion.log #Crea el archivo log para la ejecucion actual

#Verificar usuario ROOT
if [[ $EUID -ne 0 ]]; then #Verifica si el usuario actual no es root (si es root $EUID=0, si no es 1000)
    echo "ERROR: El usuario actual no es el usuario root. Ejecute el script desde el usuario root"
    echo "ERROR: El usuario actual no es el usuario root. Finalizando ejecución" >> registro_ejecucion.log
    exit 2
fi

#Verificar si la ruta al archivo existe
if ![[ -e $ruta ]]; then
    echo "ERROR: La ruta no existe"
    echo "ERROR: La ruta no existe. Finalizando ejecución" >> registro_ejecucion.log
fi


#Verificar si el grupo existe


#Verificar si el usuario existe



#!/bin/bash

# Script que imprime informacion relevante del sistema

# Imprime texto inicial.
echo ""
echo "Informacion del sistema:"
echo ""

#Imprime la cantidad de CPUs de la computadora.
echo " Numero de CPU's: `nproc`"
echo ""

#Imprime informacion sobre la memoria RAM
echo " Memoria RAM: "
echo " `vmstat -s --unit M | grep memory`"
echo ""

#Imprime el espacio disponible en disco y porcentaje de uso
echo " Espacio libre en disco: "
df -h | awk 'BEGIN {OFS = " "} {print "   ", $1, $4, $5}' | column -s ' ' -t
echo ""

#Imprime la version del kernel de Linux
echo " Version del kernel de Linux: `uname -r` "
echo ""

#Imprime el tiempo de actividad del sistema
echo " Tiempo de actividad del sistema: `uptime -p`"
echo ""

#Imprime informacion acerca del sistema operativo
echo " Informacion sobre el sistema operativo:"
echo "    - `lsb_release -i` "
echo "    - `lsb_release -r`"
echo ""

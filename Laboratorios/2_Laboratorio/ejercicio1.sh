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
echo "## Registro de ejecución del script ##" >> registro_ejecucion.log
echo "Fecha de creación: `date`" >> registro_ejecucion.log
echo " " >> registro_ejecucion.log

#Verificar usuario ROOT
if [[ $EUID -ne 0 ]]; then #Verifica si el usuario actual no es root (si es root $EUID=0, si no es 1000)
    echo "ERROR: El usuario actual no es el usuario root. Finalizando ejecución"  | tee -a registro_ejecucion.log
    exit 2
fi

#Verificar si la ruta al archivo existe
if ! [[ -e $ruta ]]; then
    echo "ERROR: La ruta no existe. Finalizando ejecución" | tee -a registro_ejecucion.log
    exit 2
fi

#Verificar si el grupo existe
verificar_grupo=`getent group $grupo`
if [[ $verificar_grupo = "" ]]; then
    echo "El grupo $grupo no existe." | tee -a registro_ejecucion.log
    echo "Creando grupo" | tee -a registro_ejecucion.log
    sudo addgroup $grupo | tee -a registro_ejecucion.log
else
    echo "El grupo $grupo existe. Información del grupo: $verificar_grupo"  | tee -a registro_ejecucion.log
fi

#Verificar si el usuario existe
verificar_usuario=`getent passwd $usuario`
if [[ $verificar_usuario = "" ]]; then
    echo "El usuario $usuario no existe." | tee -a registro_ejecucion.log
    echo "Creando usuario" | tee -a registro_ejecucion.log
    sudo adduser $usuario | tee -a registro_ejecucion.log
else
    echo "El usuario $usuario existe. Información del usuario: $verificar_usuario"  | tee -a registro_ejecucion.log
fi

sudo usermod -a -G $grupo $usuario  | tee -a registro_ejecucion.log #Se agrega el usuario al grupo

#Modificar pertenencia del archivo
echo "Modificando pertenencia del archivo $ruta al usuario $usuario y el grupo $grupo"
sudo chown $usuario:$grupo $ruta
echo "Modificando permisos a la siguiente configuración:"
echo "    Usuario: Lectura, Escritura y Ejecución"
echo "    Grupo: Lectura"
echo "    Otros: -ninguno-"
chmod 740 $ruta

#!/bin/bash

while getopts "hf:t:" opt; do
    case ${opt} in
	h)
	    # Descripcion del script (al escribir -h)
	    echo ""
	    echo "Uso del script: ejercicio.sh [archivo]"
	    echo ""
	    echo "EL script muestra lo siguiente sobre el archivo indicado: "
	    echo "     - Muestra la cantidad de lineas"
	    echo "     - Muestra el contenido de las primeras tres lineas."
	    echo "     - Muestra las y rutas (paths) mas repetidos"
	    echo ""
	    echo "Si no se indica un archivo, el archivo no existe o no tiene permisos de lectura, se produce una salida de error de 1 y se muestra el siguiente mensaje de error:"
	    echo "     - ERROR: Archivo no existe o no tiene permiso de lectura"
	    echo ""
	    echo "Ejemplo de uso del codigo:"
	    echo "  $./ejercicio2.sh access-2025-05.log"
	    echo ""
	    echo "     Lineas: 8000"
	    echo "     Primeras 3 lineas: "
	    echo "     203.0.113.174 - - [01/May/2025:00:00:57 +0530] GET /search?q=coffee HTTP/1.1 200 1522"
	    echo "     127.0.0.1 - - [01/May/2025:00:01:37 -0700] OPTIONS /home HTTP/1.1 200 8232"
	    echo "     172.20.252.24 - - [01/May/2025:00:04:18 +0100] GET /search?q=guitar HTTP/1.1 400 1119"
	    echo ""
	    echo "     Rutas mas repetidas:"
	    echo "        1581 /home"
	    echo "         608 /contact"
	    echo "         500 /pricing"
	    echo "         474 /about"
	    echo "         228 /api/users"
	    exit 0
	    ;;
	f)
	    if [[ ${OPTARG} = "path" ]]; then
		echo "PATH"
	    elif [[ ${OPTARG} = "ip" ]]; then
		echo "IP"
	    elif [[ ${OPTARG} = "status" ]]; then
		echo "STATUS"
	    else
		echo "Argumento para -f no especificado o incorrecto, utilizando PATH por defecto"
	    fi
	    ;;
	*)
	    echo "Error"
	    ;;
    esac 
done 

echo ""
echo "Rutas mas repetidas:"
awk '{print $7}' $nombre_arch | sort | uniq -c | sort -n -r | head -n 5

#Se guarda el nombre del archivo en una variable
nombre_arch="$1"

# Lectura de archivo con manejo de errores
if [[ -e $nombre_arch && -r $nombre_arch ]]; then
    #Se imprime el numero de lineas en el archivo
    echo ""
    echo "Lineas: `cat $nombre_arch | wc -l`"
    #Se imprimen las primeras 3 lineas del archivo
    echo "Primeras 3 lineas: "
    echo "` head -n 3  $nombre_arch`"
else
    # Mensaje de error en caso de que no exista o no tenga permiso de lectura
    echo "ERROR: Archivo no existe o no tiene permiso de lectura"
    exit 1
fi

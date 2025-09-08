#!/bin/bash

# Descripcion del script (al escribir -h)
ayuda() {   
	    echo ""
	    echo "Uso del script: ejercicio.sh [opciones] [archivo]"
	    echo ""
	    echo "EL script muestra lo siguiente sobre el archivo indicado: "
	    echo "     - Muestra la cantidad de lineas"
	    echo "     - Muestra el contenido de las primeras tres lineas."
	    echo "     - Muestra los primeros n path, ip o status mas repetidos"
	    echo ""
	    echo "Si no se indica un archivo, el archivo no existe o no tiene permisos de lectura, se produce una salida de error de 1 y se muestra el siguiente mensaje de error:"
	    echo "     - ERROR: Archivo no existe o no tiene permiso de lectura"
	    echo ""
	    echo "Opciones disponibles:"
	    echo ""
	    echo "     -f,        Permite escoger entre path, ip o status"
	    echo "     -t,        Permite escoger la cantidad de resultados a mostrar"
	    echo ""
	    echo "Ejemplo de uso del codigo:"
	    echo "  $./ejercicio2.sh access-2025-06.log"
	    echo "  $./ejercicio2.sh -f status access-2025-06.log"
	    echo "  $./ejercicio2.sh -t 12 access-2025-06.log"
	    echo "  $./ejercicio2.sh -f ip -t 7 access-2025-06.log"
	    exit 0
}

# Variables por defecto
variable_extraer="path"
columna=7
cantidad=5
var_spec=0
cant_spec=0

while getopts "hf:t:" opciones; do
    case ${opciones} in
	h)
	    ayuda
	    ;;
	f)
	    variable_extraer=$OPTARG
	    var_spec=1
	    ;;
	t)
	    cantidad_resultados=$OPTARG
	    cant_spec=1
	    ;;
	\?)
	    echo "Error opción invalida. Utilice -h para leer la descripción del programa."
	    exit 1
	    ;;
	:)
	    echo "Error, debe ingresar un argumento para la opción."
	    exit 1
	    ;;
    esac 
done 

#Restaura los argumentos posicionales tras completar lo procesado por getopt.
shift $((OPTIND - 1))

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

#Cambiar variable columna si se usa la bandera -f
if [[ $var_spec = 1 ]]; then
   if [[ $variable_extraer = "path" ]]; then
       columna=7
   elif [[ $variable_extraer = "ip" ]]; then
       columna=1
   elif [[ $variable_extraer = "status" ]]; then
       columna=9
   else
       echo ""
       echo "Argumento para -f no especificado o incorrecto, utilizando path por defecto"
       echo "Posibles opciones: path, ip, status."
       variable_extraer="path"
   fi
fi

#Cambiar variable cantidad si se usa la bandera
if [[ $cant_spec = 1 ]]; then
    cantidad=$cantidad_resultados
fi

echo ""
echo "Verificación de los primeros $cantidad $variable_extraer mas repetidos:"

echo ""
awk '{print $'$columna'}' $nombre_arch | sort | uniq -c | sort -n -r | head -n $cantidad

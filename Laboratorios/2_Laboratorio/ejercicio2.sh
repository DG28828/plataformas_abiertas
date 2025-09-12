#!/bin/bash

#Crear archivos .log (eliminando el existente)
if [[ -e consumo_cpu.log ]]; then
    rm consumo_cpu.log #Elimina el archivo si existe
fi
touch consumo_cpu.log #Crea el archivo log para la ejecucion actual

if [[ -e consumo_mem.log ]]; then
    rm consumo_mem.log #Elimina el archivo si existe
fi
touch consumo_mem.log #Crea el archivo log para la ejecucion actual

proceso=$1

#Ejecutar proceso
$proceso &  #Ejecuta el proceso
PID=$!      #Guarda el PID del proceso

while [[ -d /proc/$PID ]]; do
    echo "`date +%T` `ps -p $PID -o %cpu --no-headers`" >> consumo_cpu.log #Imprime consumo de %CPU
    echo "`date +%T` `ps -p $PID -o %mem --no-headers`" >> consumo_mem.log #Imprime consumo de %mem
    sleep 1 #Pausa cada segundo
done 

gnuplot <<EOF
set title "Consumo de %CPU del proceso: $proceso"
set xlabel "Tiempo (H:M:S)"
set ylabel "Consumo de CPU"
set xdata time
set timefmt '%H:%M:%S'
#set grid
plot "consumo_cpu.log" using 1:2 with lines title "Consumo de CPU"
pause mouse
EOF

gnuplot <<EOF
set title "Consumo de Memoria del proceso: $proceso"
set xlabel "Tiempo (H:M:S)"
set ylabel "Consumo de Memoria"
set xdata time
set timefmt '%H:%M:%S'
#set grid
plot "consumo_mem.log" using 1:2 with lines title "Consumo de Memoria"
pause mouse
EOF


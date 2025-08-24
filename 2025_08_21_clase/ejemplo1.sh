#!/bin/bash

variable1=3

# Verificar que se han pasado exactamente 3 argumentos
if [ $variable1 -eq 3 ]; then
 echo "Uso: $0 {sum|subtract|multiply|divide} num1 num2"
 exit 1
fi

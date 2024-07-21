#!/bin/bash

# Este script simplemente debe chequear que haya conexión a internet.
# Asegúrese de retornar un valor de salida acorde a la situación.
# Puede que necesite modificar el archivo Dockerfile.


# Dirección ip o dominio a probar (Google DNS)
TARGET="8.8.8.8"

# Enviar un ping y verificar el resultado, redirigiendo la salida y los errores a /dev/null
if ping -c 1 $TARGET &> /dev/null
then
 echo "Conexión a internet establecida"
 echo 0	
else
 echo "No hay conexión a internet"
 echo 1
fi

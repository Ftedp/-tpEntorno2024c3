#!/bin/bash

# Este script es un programa interactivo que no recibe argumentos.
# Debe preguntarle al usuario que etiqueta desea buscar y mostrar por
# pantalla todas las imágenes que tengan esa etiqueta.

#pedimos el nombre de etiqueta por pantalla al usuario
read -p "Ingrese la etiqueta que desea buscar: " etiqueta
imagenes=()

#Iteramos los archivos tag, y guardamos el nombre (sin el tag), si existe la etiqueta buscada.
for archivo in *.tag; do

    if grep -q "$etiqueta" "$archivo"; then
	imagenes+=("${archivo%.*}")
    fi

done
 
#Chequeamos que la lista imagenes no este vacia.
if [ ${#imagenes[@]} -eq 0 ]; then
    echo "No se encontro ninguna imagen con esta etiqueta." && exit 1
fi

#iteramos la lista imagenes y ejecutamos el comando jp2a para representarlas por pantalla.
for imagen in "${imagenes[@]}"; do
    echo "                                                                                    "
    echo "Nombre del archivo: $imagen.jpg" 
    echo "                                                                                    "
    jp2a --chars=" .:-=+*#%@" --term-fit "$imagen.jpg"
    echo "------------------------------------------------------------------------------------"
done

exit 0

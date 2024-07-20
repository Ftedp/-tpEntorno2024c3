#!/bin/bash

# Este script es un programa interactivo que no recibe argumentos.
# Debe preguntarle al usuario que etiqueta desea buscar y mostrar por
# pantalla todas las imágenes que tengan esa etiqueta.

read -p "Ingrese la etiqueta que desea buscar: " etiqueta
imagenes=()

for archivo in *.tag; do

    if grep -q "$etiqueta" "$archivo"; then
	imagenes+=("${archivo%.*}")
    fi

done

if [ ${#imagenes[@]} -eq 0 ]; then
    echo "No se encontro ninguna imagen con esta etiqueta." && exit 1
fi

echo "Imagenes encontradas."

for imagen in "${imagenes[@]}"; do
    echo "$imagen.jpg"
    jp2a "$imagen.jpg"
done

exit 0

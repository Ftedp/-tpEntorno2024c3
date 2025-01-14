#!/bin/bash

# Este script trabaja sobre archivos de la carpeta actual que terminan en .jpg,
# clasificándolos usando YOLO:
#
# Debe crearse un archivo con el mismo nombre que la imagen, pero extensión .tag
# donde se guardan las etiquetas. Por ejemplo, un archivo .tag podría tener:
# 2 persons, 1 potted plant, 1 laptop, 2 books
#
# Asegúrese de devolver un valor de salida acorde a la situación.

#yolo predict source=/imagen.jpg

#Itero todas las fotos en la carpeta.
for foto in *.jpg; do

    #Saco el .jpg del nombre de la foto.
    nombre="${foto%.*}"
    
    echo "Aguarde un momento..."
    #llamo a Yolo, filtro las etiquetas identificadas por yolo y genero un nuevo archivo con ellas.
    yolo predict source=$foto > archivo 2>/dev/null
    grep .jpg archivo | cut -d " " -f5- | rev | cut -d " " -f2- | rev > $nombre.tag 

    #Reviso la correcta ejecucion del yolo
    if [ $? -ne 0 ]; then
	echo "Error al crear el archivo .tag"
	exit 1
    fi

    echo "                                                                              "
    echo "Archivo tag generado correctamente"
    echo "------------------------------------------------------------------------------"
    echo "                                                                              "

done
rm archivo

echo "Los archivos .tag se crearon correctamente." && exit 0


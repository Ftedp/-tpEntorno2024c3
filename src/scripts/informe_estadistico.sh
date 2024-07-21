#!/bin/bash

#Informe estadistico actual

contador_imagenes=0
total_espacio_utilizado=0
contador_archivos_tag=0

cd ../imagenes

for imagen in *.jpg; do

    #elimino el .jpg del nombre
    nombre="${imagen%.*}" 

    #inicializo contador de imagenes
    contador_imagenes=$(( contador_imagenes + 1 ))    

    echo "Nombre del archivo: ${nombre}.jpg"

    espacio=$(ls -lh "${imagen}" | awk '{print $5}')

    echo "Espacio ocupado en disco: ${espacio}"

    ultima_modificacion=$(ls -lh "${imagen}" | awk '{print $6,$7,$8}')

    echo "Ultima modificacion: ${ultima_modificacion}."

    etiquetas=$(cat "${nombre}.tag" 2>/dev/null)
    
    #imprimo por pantalla las etiquetas encontradas dentro de la imagen
    if [ $? -eq 0 ]; then
	echo "Los objetos encontrados en esta imagen son: ${etiquetas}"
	contador_archivos_tag=$(( contador_archivos_tag + 1 ))
    else
	echo "Esta imagen no tiene archivo tag"
    fi

    echo "                                                                      "
    echo "----------------------------------------------------------------------"
    echo "                                                                      "

done

total_espacio_utilizado=$(du -ch *.jpg | grep total)
echo "Espacio total utilizado por las imagenes es ${total_espacio_utilizado}"
echo "Cantidad total de imagenes ${contador_imagenes}"
echo "Cantidad total de archivos tag ${contador_archivos_tag}"
exit 0

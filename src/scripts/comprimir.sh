#!/bin/bash

# Este script comprime todo el contenido de la carpeta actual y además, genera
# una suma de verificación del archivo resultante en un archivo separado.

echo "Comprimiendo todos los archivos dentro de archivo tar..."
#Creamos un archivo tar(c) usando gzip(g)  especificando el nombre del archivo(f) y mostramos el progreso(v)
tar -czvf archivo_comprimido.tar.gz *
echo "                                                                            "

#Generamos numero hash del archivo comprimido y redirigimos la salida al nuevo archivo.
echo "Generando numero hash."
sha256sum archivo_comprimido.tar.gz > hash_archivo_comprimido.sha256

echo "                                                                                "

if [ $? -eq 0 ]; then
    echo "Archivo generado correctamente." && exit 0
fi



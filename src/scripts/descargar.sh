
#!/bin/bash

# Este script debe descargar una sola imagen desde internet en la carpeta actual.
# Puede recibir un argumento opcional indicando la clase de la imagen.
# El nombre del archivo deberá ser su suma de verificación y debe terminar en .jpg
# Asegúrese de devolver un valor de salida acorde a la situación.

CLASE="$1"

CARPETA_DESTINO="../../imagenes"

URL="https://image.pollinations.ai/prompt/a%20photo%20of%20a%20${CLASE}?seed=1"

ARCHIVO_TEMPORAL="${CARPETA_DESTINO}/${CLASE}_imagen_descargada.jpg"

wget -O "$ARCHIVO_TEMPORAL" "$URL"


if [ $? -eq 0 ]; then
 CHECKSUM=$(sha256sum "$ARCHIVO_TEMPORAL" | awk '{ print $1 }')

 mv "$ARCHIVO_TEMPORAL" "${CARPETA_DESTINO}/${CHECKSUM}.jpg"

 echo "Imagen descargada con exitosamente."
 
 echo 0

else

 echo "Hubo un problema al descargar la imagen."

 echo 1

fi 

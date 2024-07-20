#!/bin/bash

# Este script comprime todo el contenido de la carpeta actual y además, genera
# una suma de verificación del archivo resultante en un archivo separado.

tar -czvf archivo_comprimido.tar.gz *

sha256sum archivo_comprimido.tar.gz > hash_archivo_comprimido.sha256

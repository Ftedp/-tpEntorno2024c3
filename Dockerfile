# syntax = edrevo/dockerfile-plus
INCLUDE+ .Dockerfile.base

# Instalar los programas necesarios
RUN apt-get update && apt-get install -y wget iputils-ping coreutils jp2a gawk

# Configuracion de la aplicación
ENV TERM=xterm
ENV COLORTERM=24bit
COPY ["src/", "/app/"]
COPY ["src/scripts/", "/app/"]
RUN chmod +x /app/scripts/internet.sh
RUN chmod +x /app/scripts/descargar.sh 
RUN chmod +x /app/scripts/etiquetar.sh
RUN chmod +x /app/scripts/comprimir.sh 
RUN chmod +x /app/scripts/mostrar.sh
RUN chmod +x /app/scripts/comprimir.sh
RUN chmod +x /app/scripts/informe_estadistico.sh
WORKDIR /app
ENTRYPOINT ["/app/main.sh"]

# syntax = edrevo/dockerfile-plus
INCLUDE+ .Dockerfile.base

# Instalar los programas necesarios
RUN apt-get update && apt-get install -y iputils-ping coreutils gawk 

# Configuracion de la aplicación
ENV TERM=xterm
ENV COLORTERM=24bit
COPY ["src/", "/app/"]
COPY ["src/scripts/", "/app/"]
RUN chmod +x /app/scripts/informe_estadistico.sh
WORKDIR /app
ENTRYPOINT ["/app/main.sh"]

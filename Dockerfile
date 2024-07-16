# syntax = edrevo/dockerfile-plus
INCLUDE+ .Dockerfile.base

# Instalar los programas necesarios
RUN apt-get update && apt-get install -y wget iputils-ping coreutils

# Configuracion de la aplicación
ENV TERM=xterm
ENV COLORTERM=24bit
COPY ["src/", "/app/"]
COPY ["src/scripts/", "/app/"]
WORKDIR /app
ENTRYPOINT ["/app/main.sh"]

# syntax = edrevo/dockerfile-plus
INCLUDE+ .Dockerfile.base

# Instalar los programas necesarios
RUN apt-get update && update apt-get install -y wget iputils-ping coreutils jp2a

# Configuracion de la aplicación
ENV TERM=xterm
ENV COLORTERM=24bit
COPY ["src/", "/app/"]
COPY ["src/scripts/", "/app/"]
Run chmod +x /app/scripts/mostrar.sh
WORKDIR /app
ENTRYPOINT ["/app/main.sh"]

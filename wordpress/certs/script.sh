#!/bin/bash

# Desinstalar versiones antiguas de Docker
apt-get remove docker docker-engine docker.io containerd runc -y

# Añadir repositorio Docker
apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    -y

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker Engine
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

# Instalar Docker Compose
apt install docker-compose -y

# Genera los certificados autofirmados
openssl genrsa -out nginx.key 2048
openssl req -new -key nginx.key -out nginx.csr
openssl x509 -req -in nginx.csr -signkey nginx.key -out nginx.crt

# Encuentra el archivo daemon.json en la carpeta wordpress
file_path=$(find / -name "daemon.json" -path "*/wordpress/*" -print -quit 2>/dev/null)

if [ -z "$file_path" ]; then
    echo "No se encontró el archivo daemon.json en la carpeta wordpress."
    exit 1
fi

# Mueve el archivo daemon.json a la ubicación /etc/docker/
destination="/etc/docker/"
mv "$file_path" "$destination"

# Descargar imagenes necesarias para Docker
docker-compose pull

# Reinicia el servicio Docker para que haga efecto la configuracion del fichero daemon.json
service docker stop
service docker start

# Crea las carpetas necesarias y cambia los permisos para la carpeta del volumen de Grafana, ya que no lo hace automaticamente
mkdir ../grafana_data && mkdir ../prometheus_data
chmod -R 777 ../grafana_data ../prometheus_data

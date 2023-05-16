#!/bin/bash

# Certificados de Nginx
# Genera los certificados autofirmados
openssl genrsa -out nginx.key 2048
openssl req -new -key nginx.key -out nginx.csr
openssl x509 -req -in nginx.csr -signkey nginx.key -out nginx.crt

# Fichero daemon.json (Si ya hay un fichero daemon.json se sustituira con este)
# Encuentra el archivo daemon.json en la carpeta wordpress
file_path=$(find / -name "daemon.json" -path "*/wordpress/*" -print -quit 2>/dev/null)

if [ -z "$file_path" ]; then
    echo "No se encontró el archivo daemon.json en la carpeta wordpress."
    exit 1
fi

# Mueve el archivo daemon.json a la ubicación /etc/docker/
destination="/etc/docker/"
mv "$file_path" "$destination"

# Aplicacion Web con Respaldo de Datos y Monitorización en Docker 🐳
Repositorio para mi Proyecto Integrado de ASIR, Aplicación Web con Respaldo de Datos y Monitorización en Docker. Realizado por Jose Ponce.
<hr>

## Descripción del proyecto 📋

<p align="justify">
aaa.
</p>

## Funcionalidades ⚙️

✅ `Utilidad 1:` Portabilidad y fácil despliegue gracias a la tecnología Docker. <br>
✅ `Utilidad 2:` Aplicación web contenerizada con datos persistentes. <br>
✅ `Utilidad 3:` Administración de base de datos a través de cliente web. <br>
✅ `Utilidad 4:` Respaldo de datos. <br>
✅ `Utilidad 5:` Monitorización de contenedores. <br>
✅ `Utilidad 6:` Visualización datos de monitorización a través de cliente web. <br>

## Tecnologías utilizadas 🛠️

* [Docker](https://www.docker.com/) - Aplicaciones contenerizadas
* [Nginx](https://www.nginx.com/) - Proxy Inverso
* [WordPress](https://wordpress.com/es/) - CMS (Sistema de Gestión de Contenidos)
* [MariaDB](https://mariadb.org/) - Base de datos
* [phpMyAdmin](https://www.phpmyadmin.net/) - Administrar BBDD por web
* [Duplicati](https://www.duplicati.com/) - Respaldo de datos
* [Prometheus](https://prometheus.io/) - Sistema de monitorización
* [Grafana](https://grafana.com/) - Visualización de datos
* [cAdvisor](https://hub.docker.com/r/google/cadvisor/) - Monitorización de recursos de contenedores

## Páginas disponibles

- WordPress (dominio configurado en `/etc/hosts`): https://www.wordpress-jose.com
- Prometheus: http://10.0.2.15:9090
- Grafana: http://10.0.2.15:3000
- Duplicati: http://10.0.2.15:8200
- phpMyAdmin: http://10.0.2.15:9000
- Cadvisor: http://10.0.2.15:8080
- pushgateway: http://10.0.2.15:9091

## Despliegue 👨‍💻

A continuación, se muestran los pasos necesarios para desplegar este proyecto. El proyecto y los siguientes pasos tienen la finalidad de desplegar una aplicación web utilizando [Docker Compose](https://docs.docker.com/compose/) en un equipo **recién instalado**, sin ninguna configuración previa.
<br>
<details><summary>En equipos que no han sido recién instalados ℹ️ </summary>Si ya tienes Docker instalado en tu sistema simplemente revisa los pasos 1, 2 y 4, y comprueba que se ajusta a tu situación. (Dirección IP correctamente configurada, puertos ocupados, cerrados o bloqueados por el firewall, existencia del fichero daemon.json para configurar el daemon de Docker, etc...)
<br>
El script del paso 3 instala Docker y Docker Compose en el sistema, además de mover el fichero daemon.json a la ubicación de Docker necesaria, sobreescribiendo cualquier fichero de configuración daemon.json anterior. También genera los certificados autofirmados necesarios para acceder a WordPress a través de https de forma local y realiza un pull de las imagenes necesarias.
</details>
<br>

***Los siguientes pasos están pensados para realizarse con permisos de superusuario `sudo`***

**1. Configuración de red:** Configurar IP fija para nuestro equipo servidor y añadir *IP del equipo* y *nombre de dominio* en el fichero hosts. <br>
```shell
nano /etc/hosts
```

<br>

> Una vez dentro del fichero añadir la dirección IP del equipo y el nombre de dominio que prefieras:

```shell
10.0.2.15 www.wordpress-jose.com
```

<br>

**2. Clonar repositorio:** Ahora clonamos este repositorio a nuestro equipo utilizando el comando `git`. <br>
```shell
git clone https://github.com/J0sePonce/PI-Aplicacion-Web-Docker.git
```

<br>

**3. Ejecutar script:** En la carpeta /wordpress/certs, ejecutar el comando. <br>
```shell
bash script.sh
```

<br>

**4. Lanzar los contenedores:** En la carpeta /wordpress utilizar el comando. <br>
```shell
docker-compose up -d
```

<br>

**5. Acceder a los servicios desde el navegador** (Limpios, sin datos anteriores). <br>
img

## Licencia 📄

Este proyecto está bajo la licencia MIT ⚖️ - mira el archivo [LICENSE](LICENSE) para más detalles

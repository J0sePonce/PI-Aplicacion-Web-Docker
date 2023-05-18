# Aplicacion Web con Respaldo de Datos y Monitorización en Docker 🐳
Repositorio para mi Proyecto Integrado de ASIR, Aplicación Web con Respaldo de Datos y Monitorización en Docker. Realizado por Jose Ponce.
<hr>

# Descripción del proyecto 📋

<p align="justify">
  Este proyecto es una solución desarrollada como parte del <b>Proyecto Integrado de ASIR</b>. El objetivo principal es el de proporcionar una aplicación web con datos persistentes, el respaldo de datos y capacidades de monitorización, todo ello implementado utilizando contenedores Docker para facilitar el despliegue y su portabilidad.
</p>

<p align="justify">
  <b>El repositorio contiene lo necesario para:</b>
  <br>
  Desplegar una aplicación web (<i>WordPress, MariaDB</i>) con datos persistentes y la posibilidad de acceder a través de https utilizando certificados autofirmados (<i>Nginx</i>). Administrar y visualizar la base de datos a través del navegador (<i>phpMyAdmin</i>). Realizar copias de seguridad a través del navegador y que se almacenen en Drive (<i>Duplicati</i>). Sistema de monitorización para recopilar información del sistema y los contenedores, visualizando los datos a través del navegador (<i>Prometheus, Grafana, cAdvisor, etc</i>).
</p>

<br>

## Funcionalidades ⚙️

✅ `Utilidad 1:` Portabilidad y fácil despliegue gracias a la tecnología Docker. <br>
✅ `Utilidad 2:` Aplicación web contenerizada con datos persistentes. <br>
✅ `Utilidad 3:` Administración de base de datos a través de cliente web. <br>
✅ `Utilidad 4:` Respaldo de datos en Google Drive utilizando Duplicati. <br>
✅ `Utilidad 5:` Monitorización de contenedores. <br>
✅ `Utilidad 6:` Visualización datos de monitorización a través de cliente web. <br>

<br>

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

<br>

## Páginas disponibles

- WordPress (dominio configurado en `/etc/hosts`): https://www.wordpress-jose.com o https://localhost
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000
- Duplicati: http://localhost:8200
- phpMyAdmin: http://localhost:9000
- Cadvisor: http://localhost:8080
- pushgateway: http://localhost:9091

<br>

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

> Una vez dentro del fichero añadir la dirección IP del equipo y el nombre de dominio que prefieras, por ejemplo:

```shell
10.0.2.15 www.wordpress-jose.com
```

<br>

**2. Clonar repositorio:** Ahora clonamos este repositorio a nuestro equipo utilizando el comando `git`. <br>
```shell
git clone https://github.com/J0sePonce/PI-Aplicacion-Web-Docker.git
```

<br>

> En caso de NO tener instalado la herramienta Git: `apt update && apt install git -y`

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

**5. Acceder a los servicios desde el navegador** (Sin datos anteriores, se deberán configurar). <br>

> Imagen de WordPress después de su instalación

![WordPress](https://github.com/J0sePonce/PI-Aplicacion-Web-Docker/assets/93582239/b01d331f-86d9-4276-a277-9f04b4bf3fcf)

<br>

## Configuración de servicios

Los servicios Duplicati (copias de seguridad) y Grafana (Visualización de datos) deben configurarse desde el cliente web para que cumplan con sus funciones. A continuación, se muestra una breve explicación para configurar cada uno de los servicios:

▶️ <b>Duplicati:</b>
- Accedemos a través del navegador a la dirección http://localhost:8200, pulsamos **MENÚ** > `Añadir copia de seguridad`.
- Seleccionamos la opción `Configurar nueva copia de seguridad`, pulsamos **Siguiente** y configuramos el nombre de la tarea y la contraseña.
- En **Tipo de Almacenamiento** seleccionamos `Google Drive`, escribimos el nombre de la carpeta de Drive en la que se guardarán nuestras copias de seguridad y pulsamos sobre `AuthID` para dar permisos a Duplicati. Pulsamos `Conexión de prueba` > **OK** (si la carpeta no existe pulsamos **SI** para crearla).
- Buscamos la carpeta `source` y la seleccionamos.
- Por último, configuramos cuando queremos que se realizen las copias de seguridad.

<br>

▶️ <b>Grafana:</b> <br>
- Accedemos a través del navegador a la dirección `http://localhost:3000` e ingresamos las credenciales configuradas en el fichero docker-compose.yml.
- Pulsamos <b>Data Source</b> > `Prometheus`, añadimos la dirección IP y el puerto de Prometheus.
- Pulsamos en el menú sobre <b>Dashboards</b>, ahora pulsamos `New > Import`.
- Subimos el .json con la configuración de nuestro dashboard, luego seleccionamos `Prometheus` y pulsamos `Import`.
- Por último, configuramos el rango de tiempo del tablero pulsando sobre el icono 🕘.

<br>

## Licencia 📄

Este proyecto está bajo la licencia MIT ⚖️ - mira el archivo [LICENSE](LICENSE) para más detalles

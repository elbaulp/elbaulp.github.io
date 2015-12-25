---
id: 2255
title: Instalación y optimización de un servidor web con Nginx (II)

layout: post
guid: https://elbauldelprogramador.com/?p=2255
permalink: /instalacion-optimizacion-servidor-web-nginx-ii/
categories:
  - Administración de Servidores
  - linux
tags:
  - configuración php
  - instalar php-fpm
  - nginx y php
---
# Tabla de contenidos

  * [Instalación y optimización de un servidor web con Nginx (I)][1]
  * Instalación y optimización de un servidor web con Nginx (II)
  * [Instalación y optimización de un servidor web con Nginx (III)][2]

Continuando con el artículo anterior, ahora procedemos a instalar PHP-FPM.

<!--ad-->

## Instalar PHP-FPM

En lugar de instalar php5, instalaremos php5-fpm (FastCGI Process Manager), una implementación alternativa con algunas características adicionales. En Ubuntu se puede instalar desde repositorios, para debian los agregamos a mano al *sources.list*:

{% highlight bash %}deb http://packages.dotdeb.org stable all
deb-src http://packages.dotdeb.org stable all
{% endhighlight %}

Es necesario agregar la [llave GnuPG][3], instalamos php5-fpm y lo iniciamos:

{% highlight bash %}apt-get update
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
apt-get install php5-cli php5-suhosin php5-fpm php5-cgi php5-mysql
service php5-fpm start
{% endhighlight %}

Ahora probaremos que php funciona bajo nginx, para ello es necesario modificar ligeramente el archivo *nginx.conf*, concretamente:

  * En el bloque *http* hay que añadir index.php a la directiva index, para que quede index *index.php index.html index.htm;*.
      * Necesitamos crear la comunicación entre nginx y php mediante un socket, para ello añadimos lo siguiente en el bloque *http*. {% highlight bash %}upstream php {
    server unix://var/run/php-fpm.socket;
}
        {% endhighlight %}

          * Por último, dentro del bloque *server*, añadimos una regla que permita manejar los archivos php: {% highlight bash %}location ~ \.php$ {
    include fastcgi_params;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_pass php;
}
    {% endhighlight %}

              * Una última modificación al archivo */etc/php5/fpm/pool.d/www.conf* y agregamos la línea *listen = /var/run/php-fpm.socket*. </ul>
                ### Probando PHP

                Para comprobar que PHP funciona crearemos un fichero simple que mostrará un mensaje, hemos de colocarlo en */usr/local/nginx/http/* y asignarle como grupo y usuario *www-data*:

                {% highlight bash %}echo '<?php echo "Probando que PHP funciona";?>' > /usr/local/nginx/html/index.php
chown www-data:www-data /usr/local/nginx/html/index.php
{% endhighlight %}

                De nuevo nos dirigimos al *localhost* y deberíamos ver el mensaje, lo cual indica que se está ejecutando PHP.



 [1]: https://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-i "Instalación y optimización de un servidor web con Nginx (I)"
 [2]: https://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-iii "Instalación y optimización de un servidor web con Nginx (III)"
 [3]: https://elbauldelprogramador.com/editar-y-crear-archivos-cifrados-con-gpg-en-vim/ "Editar y crear archivos cifrados con GPG en Vim"

{% include _toc.html %}

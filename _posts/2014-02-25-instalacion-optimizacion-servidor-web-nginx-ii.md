---
id: 2255
title: Instalación y optimización de un servidor web con Nginx (II)
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2255
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

<!--more-->

## Instalar PHP-FPM

En lugar de instalar php5, instalaremos php5-fpm (FastCGI Process Manager), una implementación alternativa con algunas características adicionales. En Ubuntu se puede instalar desde repositorios, para debian los agregamos a mano al *sources.list*:

<pre lang="bash">deb http://packages.dotdeb.org stable all
deb-src http://packages.dotdeb.org stable all
</pre>

Es necesario agregar la [llave GnuPG][3], instalamos php5-fpm y lo iniciamos:

<pre lang="bash">apt-get update
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
apt-get install php5-cli php5-suhosin php5-fpm php5-cgi php5-mysql
service php5-fpm start
</pre>

Ahora probaremos que php funciona bajo nginx, para ello es necesario modificar ligeramente el archivo *nginx.conf*, concretamente:

  * En el bloque *http* hay que añadir index.php a la directiva index, para que quede index *index.php index.html index.htm;*. 
      * Necesitamos crear la comunicación entre nginx y php mediante un socket, para ello añadimos lo siguiente en el bloque *http*. <pre lang="bash">upstream php {
    server unix://var/run/php-fpm.socket;
}
        </pre>
        
          * Por último, dentro del bloque *server*, añadimos una regla que permita manejar los archivos php: <pre lang="bash">location ~ \.php$ {
    include fastcgi_params;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_pass php;
}
    </pre>
            
              * Una última modificación al archivo */etc/php5/fpm/pool.d/www.conf* y agregamos la línea *listen = /var/run/php-fpm.socket*. </ul> 
                ### Probando PHP
                
                Para comprobar que PHP funciona crearemos un fichero simple que mostrará un mensaje, hemos de colocarlo en */usr/local/nginx/http/* y asignarle como grupo y usuario *www-data*:
                
                <pre lang="bash">echo '<?php echo "Probando que PHP funciona";?>' > /usr/local/nginx/html/index.php
chown www-data:www-data /usr/local/nginx/html/index.php
</pre>
                
                De nuevo nos dirigimos al *localhost* y deberíamos ver el mensaje, lo cual indica que se está ejecutando PHP.
                
                <div class="sharedaddy">
                  <div class="sd-content">
                    <ul>
                      <li>
                        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Instalación y optimización de un servidor web con Nginx (II)+http://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-ii/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
                      </li>
                      <li>
                        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-ii/&t=Instalación y optimización de un servidor web con Nginx (II)+http://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-ii/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
                      </li>
                      <li>
                        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Instalación y optimización de un servidor web con Nginx (II)+http://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-ii/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
                      </li>
                    </ul>
                  </div>
                </div>
                
                <span id="socialbottom" class="highlight style-2">
                
                <p>
                  <strong>¿Eres curioso? » <a onclick="javascript:_gaq.push(['_trackEvent','random','click-random']);" href="/index.php?random=1">sigue este enlace</a></strong>
                </p>
                
                <h6>
                  Únete a la comunidad
                </h6>
                
                <div class="iconsc hastip" title="2240 seguidores">
                  <a href="http://twitter.com/elbaulp" target="_blank"><i class="icon-twitter"></i></a>
                </div>
                
                <div class="iconsc hastip" title="2452 fans">
                  <a href="http://facebook.com/elbauldelprogramador" target="_blank"><i class="icon-facebook"></i></a>
                </div>
                
                <div class="iconsc hastip" title="0 +1s">
                  <a href="http://plus.google.com/+Elbauldelprogramador" target="_blank"><i class="icon-google-plus"></i></a>
                </div>
                
                <div class="iconsc hastip" title="Repositorios">
                  <a href="http://github.com/algui91" target="_blank"><i class="icon-github"></i></a>
                </div>
                
                <div class="iconsc hastip" title="Feed RSS">
                  <a href="http://elbauldelprogramador.com/feed" target="_blank"><i class="icon-rss"></i></a>
                </div></span>

 [1]: http://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-i "Instalación y optimización de un servidor web con Nginx (I)"
 [2]: http://elbauldelprogramador.com/instalacion-optimizacion-servidor-web-nginx-iii "Instalación y optimización de un servidor web con Nginx (III)"
 [3]: http://elbauldelprogramador.com/editar-y-crear-archivos-cifrados-con-gpg-en-vim/ "Editar y crear archivos cifrados con GPG en Vim"
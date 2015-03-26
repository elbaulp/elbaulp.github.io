---
id: 1309
title: Cómo instalar y configurar Nginx con php5-fpm
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1309
permalink: /como-instalar-nginx-con-php5-fpm/
categories:
  - Administración de Servidores
  - How To
tags:
  - configurar nginx
  - configurar servidor nginx debian
  - instalar nginx
  - nginx
  - php-fpm
  - servidor web
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/02/nginx-logo.png" alt="instalar y configurar nginx" width="350" height="90" class="thumbnail alignleft size-full wp-image-1377" />  
Nginx (Pronunciado engine-x) es un <a href="http://elbauldelprogramador.com/search/?q=servidor" target="_blank">servidor</a> HTTP de alto rendimiento, gratuito, [software libre][1] y <a href="https://es.wikipedia.org/wiki/Proxy#Reverse_Proxy_.2F_Proxy_inverso" target="_blank">proxy inverso</a>, así como un servidor proxy <a href="https://es.wikipedia.org/wiki/Internet_Message_Access_Protocol" target="_blank">IMAP</a>/<a href="https://es.wikipedia.org/wiki/Post_Office_Protocol" target="_blank">POP3</a>. Desarrollado por Igor Sysoev. Acualmente el <a href="http://news.netcraft.com/archives/2012/01/03/january-2012-web-server-survey.html" target="_blank">12.18%</a> de las webs usan nginx como servidor HTTP. Sus aspectos más destacables son el rendimiento, estabilidad, simplicidad de configuración y un bajo consumo de recursos. En este artículo explicaré como instalar nginx desde el código fuente.

  
<!--more-->

### Instalando dependencias

Antes de poder compilar nginx, es necesario instalar unos cuantos paquetes:

<pre lang="bash"># apt-get install build-essential libssl-dev libpcre3-dev
</pre>

El paquete `build-essential` contiene las herramientas básicas para compilar programas desde código fuente, las otras dos librerías son necesarias para nginx durante el proceso de compilación.

### Descargar y compilar Nginx

<pre lang="bash">$ wget http://nginx.org/download/nginx-1.2.6.tar.gz
</pre>

Descomprimimos el fichero:

<pre lang="bash">$ tar zxvf nginx-1.2.6.tar.gz
</pre>

Una vez descomprimido, entramos en el directorio y compilamos:

<pre lang="bash">$ cd nginx-1.2.6
~/nginx-1.2.6$ ./configure --sbin-path=/usr/local/sbin --with-http_ssl_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-http_stub_status_module

~/nginx-1.2.6$ make

~/nginx-1.2.6$ sudo make install
</pre>

Para consultar qué modulos hay disponibles hay que visitar la <a href="http://wiki.nginx.org/Modules" target="_blank">pagina oficial de Nginx</a> y decidir cuales queremos habilitar. Con la opción `--sbin-path=/usr/local/sbin` establecemos la ruta en la que se instalará el ejecutable. Tras compilar se mostrará información de la localización de los distintos ficheros:

<pre lang="bash">nginx path prefix: "/usr/local/nginx"
  nginx binary file: "/usr/local/sbin"
  nginx configuration prefix: "/usr/local/nginx/conf"
  nginx configuration file: "/usr/local/nginx/conf/nginx.conf"
  nginx pid file: "/usr/local/nginx/logs/nginx.pid"
  nginx error log file: "/usr/local/nginx/logs/error.log"
  nginx http access log file: "/usr/local/nginx/logs/access.log"
  nginx http client request body temporary files: "client_body_temp"
  nginx http proxy temporary files: "proxy_temp"
  nginx http fastcgi temporary files: "fastcgi_temp"
  nginx http uwsgi temporary files: "uwsgi_temp"
  nginx http scgi temporary files: "scgi_temp"
</pre>

Es necesario descargar un script que permita detener, reiniciar e iniciar nginx, podemos descargar el siguiente:

<pre lang="bash">$ wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx
$ sudo mv nginx /etc/init.d/nginx
$ sudo chmod +x /etc/init.d/nginx
$ sudo chown root:root /etc/init.d/nginx
</pre>

En el tercer comando otorgamos permiso de ejecución al [script][2], con el cuarto hacemos al usuario root propietario del mismo.

Si queremos que nginx se inicie automáticamente al iniciar el sistema, hay que añadirlo a los [runlevel][3] correspondientes: 

<pre lang="bash"># update-rc.d nginx defaults
</pre>

Ahora estamos en condiciones de ejecutar nginx:

<pre lang="bash"># /etc/init.d/nginx start
[ ok ] Starting Nginx Server...:.
</pre>

Listo, nos dirigimos a nuestro navegador y escribimos en la barra de direcciones **localhost**. Si todo ha ido bien deberíamos ver esta pantalla:

[<img src="http://elbauldelprogramador.com/content/uploads/2013/02/instalar-nginx-en-debian-1024x818.png" alt="instalar nginx en debian" width="770" height="615" class="aligncenter size-large wp-image-1375" />][4]{.thumbnail}

Usando firebug se puede comprobar que efectivamente se está corriendo un servidor nginx:

[<img src="http://elbauldelprogramador.com/content/uploads/2013/02/instalar-nginx-en-debian2.png" alt="instalar nginx en debian2" width="641" height="150" class="aligncenter size-full wp-image-1376" />][5]{.thumbnail}

### Modificando la configuración por defecto

Sustituimos la configuración por defecto por esta:

<pre lang="bash">user  www-data;
worker_processes  1;
 
pid        /var/run/nginx.pid;
 
error_log  logs/error.log;

events {
    worker_connections  1024;
}
 
http {
    include       mime.types;
    default_type  application/octet-stream;
 
    gzip on;
    gzip_buffers 16 8k;
    gzip_disable "MSIE [1-6]\.";
    gzip_proxied any;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
 
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
 
    access_log  logs/access.log  main;
 
    sendfile        on;
    keepalive_timeout  3;
    index              index.html index.htm;
 
    server {
        listen       80;
        server_name localhost;
        root html;
 
 access_log  logs/host.access.log  main;

        # Deny all attempts to access hidden files such as .htaccess, .htpasswd, .DS_Store (Mac).
        location ~ /\. {
                deny all;
                access_log off;
                log_not_found off;
        }
 
    }
 
}
</pre>

Los cambios más relevantes sobre la configuración por defecto son:

  * Se ha cambiado el usuario del servidor de “*nobody*” a “*www-data*”, éste último es el usuario por defecto para servidores webs.
  * Se define el archivo donde se localizará el PID (Process ID) del servidor. Esto permite al script que hemos instalado iniciar o detener nginx.
  * Se habilita la compresión gzip para reducir el ancho de banda consumido.
  * Se define el formato que tendrán los ficheros de log.

Cambiamos los permisos de los ficheros que contienen la web y reiniciamos nginx para aplicar los cambios:

<pre lang="bash">$ sudo chown -R www-data:www-data html/
$ sudo service nginx destroy &#038;&#038; sudo service nginx start
</pre>

### Instalar php5-fpm

En lugar de instalar php5, instalaremos php5-fpm (*FastCGI Process Manager*), una implementación alternativa con algunas características adicionales.

En ubuntu, ejecutamamos el siguiente comando:

<pre lang="bash"># apt-get install php5-fpm
</pre>

En debian agregamos el repositorio al *sources.list*:

<pre lang="bash">deb http://packages.dotdeb.org stable all
deb-src http://packages.dotdeb.org stable all
</pre>

Agregamos la llave [GnuPG][6] del repositorio:

<pre lang="bash">apt-get update
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
</pre>

Instalamos php:

<pre lang="bash"># apt-get install php5-cli php5-suhosin php5-fpm php5-cgi php5-mysql
</pre>

Lo iniciamos:

<pre lang="bash"># /etc/init.d/php5-fpm start
</pre>

Para lograr que nginx interprete php, hay que hacer algunas modificaciones a la configuración:

<pre lang="bash">user  www-data;
worker_processes  1;
 
pid        /var/run/nginx.pid;
 
error_log  logs/error.log;
 
events {
    worker_connections  1024;
}
 
http {
    include       mime.types;
    default_type  application/octet-stream;
 
    gzip on;
    gzip_buffers 16 8k;
    gzip_disable "MSIE [1-6]\.";
    gzip_proxied any;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
 
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
 
    access_log  logs/access.log  main;
 
    sendfile        on;
    keepalive_timeout  3;
    index              index.php index.html index.htm;
 
    upstream php {
        server 127.0.0.1:9000;
    }

    server {
        listen       80;
        server_name localhost;
        root html;
 
  access_log  logs/host.access.log  main;
 
        # Deny all attempts to access hidden files such as .htaccess, .htpasswd, .DS_Store (Mac).
        location ~ /\. {
                deny all;
                access_log off;
                log_not_found off;
        }

        location ~ \.php$ {
                include fastcgi_params;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_pass php;
        }
    }
}
</pre>

Los principales cambios realizados son los siguientes:

  * Se ha añadido “`<em>index.php</em>`” antes de “`<em>index.html index.htm</em>`” para dar prioridad a los archivos php.
  * El bloque “`upstream php`” que apunta a PHP-FPM.
  * Un manejador para archivos php “`location ~ \.php$`”

Para terminar, añadimos los siguientes parámetros al final del archivo */usr/local/nginx/fastcgi_params*:

<pre lang="bash">fastcgi_connect_timeout 60;
fastcgi_send_timeout 180;
fastcgi_read_timeout 180;
fastcgi_buffer_size 128k;
fastcgi_buffers 4 256k;
fastcgi_busy_buffers_size 256k;
fastcgi_temp_file_write_size 256k;
fastcgi_intercept_errors on;
</pre>

Para aplicar los cambios, reiniciamos nginx:

<pre lang="bash"># service nginx restart
</pre>

Con esto, deberíamos tener instalado un servidor corriendo con nginx y ejecutando archivos php.

#### Referencias

*Learn how to setup a web server pt2: Installing Nginx and PHP* **|** <a href="http://blog.bryanbibat.net/2011/12/19/learn-how-to-setup-a-web-server-pt2-installing-nginx-and-php/" target="_blank">blog.bryanbibat.net</a>  
*HOWTO install php5-fpm on Debian Squeeze* **|** <a href="http://fak3r.com/2011/09/27/howto-install-php5-fpm-on-debian-squeeze/" target="_blank">fak3r.com</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo instalar y configurar Nginx con php5-fpm+http://elbauldelprogramador.com/como-instalar-nginx-con-php5-fpm/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-instalar-nginx-con-php5-fpm/&t=Cómo instalar y configurar Nginx con php5-fpm+http://elbauldelprogramador.com/como-instalar-nginx-con-php5-fpm/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo instalar y configurar Nginx con php5-fpm+http://elbauldelprogramador.com/como-instalar-nginx-con-php5-fpm/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/category/opensource/
 [2]: /category/script/
 [3]: /so/entendiendo-los-runlevel-en-debian-y-ubuntu/
 [4]: http://elbauldelprogramador.com/content/uploads/2013/02/instalar-nginx-en-debian.png
 [5]: http://elbauldelprogramador.com/content/uploads/2013/02/instalar-nginx-en-debian2.png
 [6]: http://elbauldelprogramador.com/seguridad/como-cifrar-correos-con-gpg-con-mailvelope/ "Cómo cifrar correos con GPG usando Mailvelope"
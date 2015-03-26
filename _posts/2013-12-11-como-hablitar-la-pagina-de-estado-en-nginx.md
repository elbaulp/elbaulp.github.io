---
id: 2040
title: Cómo habilitar la página de estado en Nginx
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2040
permalink: /como-hablitar-la-pagina-de-estado-en-nginx/
categories:
  - Administración de Servidores
tags:
  - estadisticas nginx
  - estado nginx
  - estado servidor web nginx
---
Nginx dispone de una página que muestra el estado del servidor, que mostrará información sobre las conexiones activas junto a otra información. Para habilitar la página en cuestión no hay más que seguir éstos sencillos pasos.

<!--more-->

### Habilitar el módulo HttpStubStatusModule

Es necesario compilar nginx con éste módulo. Para comprobar si está compilado debe aparecer `--with-http_stub_status_module` al ejecutar el comando

{% highlight bash %}>nginx -V
{% endhighlight %}

De no tenerlo, hay que volver a [compilar nginx][1] con éste módulo activo. 

### Habilitar la página de estado en nginx

Hay que editar el fichero *nginx.conf*, y añadir en el bloque ***server { /\*&#8230;\*/ }*** lo siguiente:

{% highlight bash %}>location /nginx_status {
        # Hablitar las estadísticas
        stub_status on;
        # No registrar en los logs los accesos a la página de estado
        access_log   off;
        # Perminir que únicamente mi IP pueda visitar la página #
        allow X.X.X.X;
        # Denegar el acceso al resto del mundo #
        deny all;
   }
{% endhighlight %}

Tras esto, es necesario reiniciar nginx para que sea consciente de los cambios:

{% highlight bash %}>service nginx reload
{% endhighlight %}

Ahora al dirigirse a la dirección ***midominio.com/nginx_status*** veremos algo así:

{% highlight bash %}>Active connections: 291
server accepts handled requests
   16630948 16630948 31070465
Reading: 6 Writing: 179 Waiting: 106
{% endhighlight %}

  * *active connections* &#8212; Número de conexiones abieras.
  * *server accepts handled requests* &#8212; En el ejemplo, nginx ha aceptado 16630948 conexiones, procesado 16630948 de ellas (Ninguna fue cerrada) y ha procesado 31070465 (1.8 peticiones por conexión).
  * *reading* &#8212; Peticiones de cabecera leídas.
  * *writing* &#8212; Peticiones leidas, procesadas, o escritas en respuesta al cliente.
  * *waiting* &#8212; Conexiones *keep-alive*, activas en el momento (Lectura + Escritura)

#### Referencias

*Enable and see current status page* **|** <a href="http://www.cyberciti.biz/faq/nginx-enable-and-see-current-status-page" target="_blank">cyberciti</a>  
*HttpStubStatusModule* **|** <a href="http://wiki.nginx.org/HttpStubStatusModule" target="_blank">wiki.nginx.org</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo habilitar la página de estado en Nginx+http://elbauldelprogramador.com/como-hablitar-la-pagina-de-estado-en-nginx/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-hablitar-la-pagina-de-estado-en-nginx/&t=Cómo habilitar la página de estado en Nginx+http://elbauldelprogramador.com/como-hablitar-la-pagina-de-estado-en-nginx/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo habilitar la página de estado en Nginx+http://elbauldelprogramador.com/como-hablitar-la-pagina-de-estado-en-nginx/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/how-to/como-instalar-nginx-con-php5-fpm/ "Cómo instalar y configurar Nginx con php5-fpm"
---
id: 1698
title: Colocar los botones sociales de jetpack al principio del artículo en WordPress
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1698
permalink: /colocar-los-botones-sociales-de-jetpack-al-principio-del-articulo-en-wordpress/
categories:
  - opensource
  - php
tags:
  - botones sociales al principio
  - botones sociales jetpack
  - botones sociales para wordpress
  - botones sociales wordpress
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/06/jetpack-300x222.png" alt="Colocar los botones sociales de jetpack al principio del artículo en WordPress" width="300" height="222" class="thumbnail alignleft size-medium wp-image-1699" />

A día de hoy, el famoso plugin para wordpress** *jetpack*** no soporta colocar de una forma fácil los botones sociales al principio del artículo. Así que buscando un poco por la red encontré una forma de hacerlo en el foro de WordPress que menciono en las referencias y que veremos a continuación. 

  
<!--more-->

### Colocar los botones sociales al principio de los artículos

El primer paso es editar el archivo ***modules/sharedaddy/sharing-service.php*** del plugin y eliminar o comentar las últimas líneas, que deberían ser: 

<pre lang="php">add_filter( 'the_content', 'sharing_display', 19 );
add_filter( 'the_excerpt', 'sharing_display', 19 );
</pre>

Con esto evitamos que el plugin muestre los botones en el contenido del artículo y en la página principal. 

Ahora depende de nosotros colocar los botones en el lugar que deseemos, llamando a la función 

<pre lang="php">sharing_display()
</pre>

En el caso de quererlos al principio del artículo, hay que buscar el fichero que se encargue de generar el contenido del artículo en nuestra plantilla. Esto varia según el tema que estemos usando, pero normalmente el nombre del archivo suele ser descriptivo. En mi caso el fichero se llama ***content-single.php***. Para colocar los botones sociales al lado del botón bitácoras por ejemplo, el código es el siguiente:

<pre lang="php"><?php agregador_bitacoras_com('mini');  echo sharing_display(); ?>
</pre>

Hay que jugar con el contenido del archivo para colocarlo en el lugar deseado.

### Mostrar los botones sociales al final del artículo en la página principal

En esta ocasión debemos buscar el archivo que se encarge de iterar sobre todos los artículos, ya que es aquí donde se genera la página principal. Como antes, por lo general suele existir un archivo llamado ***loop.php***, pero este no era mi caso. Sea cual sea el nombre del archivo, en el interior hemos de encontrar el código encargado de generar el contenido del artículo para la página principal (Que suele estar resumido). Yo he decidido colocar los botones sociales debajo del enlace **Seguir leyendo**:

<pre lang="php">the_content( __( 'Seguir leyendo <span class="meta-nav">&rarr;</span>');
echo sharing_display(); 
</pre>

Si fuera necesario usamos estilos CSS para colocar los botones donde deseemos y listo.

#### Referencias

*Foro WordPress* **|** <a href="http://wordpress.org/support/topic/plugin-sharedaddy-adding-this-manually?replies=26#post-2293386" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Colocar los botones sociales de jetpack al principio del artículo en WordPress+http://elbauldelprogramador.com/colocar-los-botones-sociales-de-jetpack-al-principio-del-articulo-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/colocar-los-botones-sociales-de-jetpack-al-principio-del-articulo-en-wordpress/&t=Colocar los botones sociales de jetpack al principio del artículo en WordPress+http://elbauldelprogramador.com/colocar-los-botones-sociales-de-jetpack-al-principio-del-articulo-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Colocar los botones sociales de jetpack al principio del artículo en WordPress+http://elbauldelprogramador.com/colocar-los-botones-sociales-de-jetpack-al-principio-del-articulo-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
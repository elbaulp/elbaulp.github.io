---
id: 1698
title: Colocar los botones sociales de jetpack al principio del artículo en WordPress

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
<img src="/images/2013/06/jetpack-300x222.png" alt="Colocar los botones sociales de jetpack al principio del artículo en WordPress" width="300" height="222" class="thumbnail alignleft size-medium wp-image-1699" />

A día de hoy, el famoso plugin para wordpress** *jetpack*** no soporta colocar de una forma fácil los botones sociales al principio del artículo. Así que buscando un poco por la red encontré una forma de hacerlo en el foro de WordPress que menciono en las referencias y que veremos a continuación. 

  
<!--more-->

### Colocar los botones sociales al principio de los artículos

El primer paso es editar el archivo ***modules/sharedaddy/sharing-service.php*** del plugin y eliminar o comentar las últimas líneas, que deberían ser: 

{% highlight php %}add_filter( 'the_content', 'sharing_display', 19 );
add_filter( 'the_excerpt', 'sharing_display', 19 );
{% endhighlight %}

Con esto evitamos que el plugin muestre los botones en el contenido del artículo y en la página principal. 

Ahora depende de nosotros colocar los botones en el lugar que deseemos, llamando a la función 

{% highlight php %}sharing_display()
{% endhighlight %}

En el caso de quererlos al principio del artículo, hay que buscar el fichero que se encargue de generar el contenido del artículo en nuestra plantilla. Esto varia según el tema que estemos usando, pero normalmente el nombre del archivo suele ser descriptivo. En mi caso el fichero se llama ***content-single.php***. Para colocar los botones sociales al lado del botón bitácoras por ejemplo, el código es el siguiente:

{% highlight php %}<?php agregador_bitacoras_com('mini');  echo sharing_display(); ?>
{% endhighlight %}

Hay que jugar con el contenido del archivo para colocarlo en el lugar deseado.

### Mostrar los botones sociales al final del artículo en la página principal

En esta ocasión debemos buscar el archivo que se encarge de iterar sobre todos los artículos, ya que es aquí donde se genera la página principal. Como antes, por lo general suele existir un archivo llamado ***loop.php***, pero este no era mi caso. Sea cual sea el nombre del archivo, en el interior hemos de encontrar el código encargado de generar el contenido del artículo para la página principal (Que suele estar resumido). Yo he decidido colocar los botones sociales debajo del enlace **Seguir leyendo**:

{% highlight php %}the_content( __( 'Seguir leyendo <span class="meta-nav">&rarr;</span>');
echo sharing_display(); 
{% endhighlight %}

Si fuera necesario usamos estilos CSS para colocar los botones donde deseemos y listo.

#### Referencias

*Foro WordPress* **|** <a href="http://wordpress.org/support/topic/plugin-sharedaddy-adding-this-manually?replies=26#post-2293386" target="_blank">Visitar sitio</a> 



{% include _toc.html %}

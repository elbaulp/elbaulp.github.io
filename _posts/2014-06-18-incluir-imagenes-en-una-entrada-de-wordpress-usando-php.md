---
id: 2387
title: Incluir imágenes en una entrada de WordPress usando PHP
author: Colaboraciones
layout: post
guid: http://elbauldelprogramador.com/?p=2387
permalink: /incluir-imagenes-en-una-entrada-de-wordpress-usando-php/
categories:
  - php
tags:
  - añádir imagenes php
  - añadir imagenes wordpress
  - imagenes en entradas wordpress
---
> Éste artículo es una colaboración de <a href="http://reinspirit.com/blog/" target="_blank">Pedro Mendez</a> en el que se verá cómo insertar imágenes en una entrada de WordPress. Desarrollador y diseñador de sitios web en Sevilla

Esto es lo que tenemos que hacer. Tenemos una imagen sin adjuntar en nuestra biblioteca multimedia de WordPress. También hay una página &#8220;2014 Galery&#8221;, que muestra las imágenes adjuntas de la página dentro de la galería de WordPress. Tenemos que encontrar la fecha de carga de la imagen sin adjuntar. Si el año que se subió la imagen fué 2014, tenemos que adjuntar la imagen a nuestra página.

<!--more-->

Antes de pasar al fragmento de código, tenemos que asumir algunas cosas. El `ID` de la entrada de imagen sin adjuntar es `$att_id`. El `ID` de la entrada de nuestra página es `$page_id`. He mencionado `ID` de la entrada, tanto para la imagen y la página porque WordPress almacena las entradas, páginas y archivos en una misma tabla `wp_posts` en la [base de datos][1]. Así que todas las entradas tendrán un `ID`.

## Obtener imágenes subidas por año

Tenemos que encontrar el año en que fue subida la imagen. El código que vamos a escribir está fuera del **WordPress loop**. Por eso utilizamos la función `get_the_time()` para encontrar el año de la carga.

<pre lang="php">$year = get_the_time('Y', $att_id);
</pre>

## Incluir imágenes a la página

Ahora nuestro trabajo es comprobar si `$year` es 2014. En caso afirmativo, añadimos la imagen. En WordPress como hemos mencionado, los detalles de cada archivo se almacenan en la tabla `wp_posts` que contiene una columna llamada `post_parent`. Esta columna es el punto de conexión para la imagen a una página o entrada. Para una imagen sin adjuntar, el valor `post_parent` será 0.

<pre lang="php">if(2014 == $year){
    wp_update_post( array(
        'ID' => $att_id,
        'post_parent' => $page_id
    ));
}
</pre>

El código anterior se explica por sí mismo. `wp_update_post` es una función de WordPress que actualiza los detalles de la publicación. Aquí estamos actualizando la columna del `post_parent` a `$page_id`. Esto concede la imagen a la página.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Incluir imágenes en una entrada de WordPress usando PHP+http://elbauldelprogramador.com/incluir-imagenes-en-una-entrada-de-wordpress-usando-php/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/incluir-imagenes-en-una-entrada-de-wordpress-usando-php/&t=Incluir imágenes en una entrada de WordPress usando PHP+http://elbauldelprogramador.com/incluir-imagenes-en-una-entrada-de-wordpress-usando-php/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Incluir imágenes en una entrada de WordPress usando PHP+http://elbauldelprogramador.com/incluir-imagenes-en-una-entrada-de-wordpress-usando-php/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/bases-de-datos/ "Bases de Datos"
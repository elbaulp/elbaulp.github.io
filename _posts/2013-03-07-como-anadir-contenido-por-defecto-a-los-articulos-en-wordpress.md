---
id: 1400
title: Cómo añadir contenido por defecto a los artículos en WordPress
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1400
permalink: /como-anadir-contenido-por-defecto-a-los-articulos-en-wordpress/
categories:
  - How To
  - php
tags:
  - artículos wordpress
  - contenido por defecto
  - contenido por defecto en post wordpress
---
<img src="http://elbauldelprogramador.com/content/uploads/2012/05/Screenshot-05302012-111511-AM1.png" alt="Wordpress" width="123" height="116" class="thumbnail alignleft size-full wp-image-761" />  
Si escribes en un blog, seguramente en cada artículo repites algunos textos, como añadir [shortcodes][1] que usas habitualmente, pedir a los lectores que se suscriban al [feed del blog][2], que te sigan en las redes sociales etcétera. En esos casos es útil que para cada nuevo artículo creado, se inserte un texto por defecto. 

Es bastante sencillo lograr esta funcionalidad, en el archivo *functions.php* de tu tema añade:

{% highlight php %}>add_filter( 'default_content', 'my_default_content' );
function my_default_content( $content ) {
   $content = "AQUI TU CONTENIDO POR DEFECTO";
 return $content;
}
{% endhighlight %}

Así de simple, ahora cada vez que crees un nuevo artículo, tendrá un contenido por defecto asignado.

#### Fuente

*How to Add Default Content in Your WordPress Post Editor* **|** <a href="http://www.wpbeginner.com/wp-tutorials/how-to-add-default-content-in-your-wordpress-post-editor/" target="_blank">wpbeginner</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo añadir contenido por defecto a los artículos en WordPress+http://elbauldelprogramador.com/como-anadir-contenido-por-defecto-a-los-articulos-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-anadir-contenido-por-defecto-a-los-articulos-en-wordpress/&t=Cómo añadir contenido por defecto a los artículos en WordPress+http://elbauldelprogramador.com/como-anadir-contenido-por-defecto-a-los-articulos-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo añadir contenido por defecto a los artículos en WordPress+http://elbauldelprogramador.com/como-anadir-contenido-por-defecto-a-los-articulos-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /tag/shortcodes/
 [2]: /rssfeed/
---
id: 835
title: Cómo convertir un archivo pdf a imágenes
author: Alejandro Alcalde
layout: post
guid: /?p=835
permalink: /como-convertir-un-archivo-pdf-a-imagenes/
if_slider_image:
  - 
  - 
categories:
  - bash
  - How To
  - linux
tags:
  - como convertir pdf en imagen
  - convertir pdf a jpg
  - convertir pdf en imagenes
  - imagemagick
  - pdf a imagenes
  - pdf to imagen
format: aside
---
[<img class="alignleft size-full wp-image-836" title="sh" src="http://elbauldelprogramador.com/content/uploads/2012/07/sh1.png" alt="" width="128" height="128" />][1]

El otro día me hacía falta convertir cada una de las páginas de un documento pdf a imágenes individuales, con un poco de búsqueda en google lo solucioné y hoy lo comparto con vosotros.

Es necesario tener instalado el paquete imagemagick, si no lo tenemos instalado ejecutamos:

{% highlight bash %}>sudo aptitude install imagemagick{% endhighlight %}

Tras instalarlo basta con ejecutar el comando siguiente:

{% highlight bash %}>convert foo.pdf foo.png{% endhighlight %}

La extensión de la imagen podemos cambiarla a jpg por ejemplo.

Si las imágenes resultan con poca calidad, podemos ejecutar el siguiente comando:

{% highlight bash %}>convert -density 400 foo.pdf -resize 25% foo.png{% endhighlight %}

Espero que os sea útil si alguna vez lo necesitáis.

&nbsp;

Vía | <a href="http://www.cyberciti.biz/faq/howto-convert-a-pdf-file-to-an-image/" target="_blank">cyberciti</a> | <a href="http://www.imagemagick.org/discourse-server/viewtopic.php?f=10&t=13371" target="_blank">imagemagick.org</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo convertir un archivo pdf a imágenes+http://elbauldelprogramador.com/como-convertir-un-archivo-pdf-a-imagenes/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-convertir-un-archivo-pdf-a-imagenes/&t=Cómo convertir un archivo pdf a imágenes+http://elbauldelprogramador.com/como-convertir-un-archivo-pdf-a-imagenes/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo convertir un archivo pdf a imágenes+http://elbauldelprogramador.com/como-convertir-un-archivo-pdf-a-imagenes/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/content/uploads/2012/07/sh1.png
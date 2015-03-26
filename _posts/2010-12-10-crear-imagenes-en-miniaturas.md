---
id: 58
title: Crear miniaturas de imágenes
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/crear-miniaturas-de-imagenes/
permalink: /crear-imagenes-en-miniaturas/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/crear-imagenes-en-miniaturas.html
  - /2010/12/crear-imagenes-en-miniaturas.html
  - /2010/12/crear-imagenes-en-miniaturas.html
categories:
  - script
---
### Creé una Versión mejorada de este script [aquí][1]

Este script es muy simple, pero resulta muy útil cuando tenemos muchas imágenes y queremos hacer miniaturas, por ejemplo, para subirlas a nuestra web.

  
<!--more-->

  
Nota: Si tenéis una web, os aconsejo que creeis miniaturas para las imágenes que son enlaces por ejemplo, no useis las propiedades *height* y *width* de la etiqueta *img* para redimensionar una imagen grande, porque vuestra página tardará más en cargar, y además esa miniatura pesará lo mismo que la original.

Para ejecutar el script, hay que instalar imagemagick:

<pre><span class="comentario">#!/bin/bash</span>
FILES="$@"
<span class="bash">mkdir</span> miniaturas
<span class="bash">for</span> i in $FILES
<span class="bash">do</span>
 <span class="bash">echo</span> "Processing image $i ..."
 /usr/bin/convert -thumbnail 180x128 $i miniaturas/$i
<span class="bash">done</span>
</pre>

Básicamente el script crea una carpeta que contendrá las miniaturas, y procesa las imagenes que le pasémos como parámetros al script, copiándolas a la carpeta creada. Para modificar el tamaño de las miniaturas, hay que cambiar *128&#215;128* por el valor que queramos.

Nota: El script hay que copiarlo en el directorio donde se encuentren las imágenes, en cuanto pueda lo modificaré para resolver esta deficiencia.

Ejemplo de uso

<pre>$ cd Directorio/de/nuestras/imagenes
$ ./NombreDelScript *
</pre>

El * significa que convertirá todas las imagenes del directorio

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Crear miniaturas de imágenes+http://elbauldelprogramador.com/crear-imagenes-en-miniaturas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/crear-imagenes-en-miniaturas/&t=Crear miniaturas de imágenes+http://elbauldelprogramador.com/crear-imagenes-en-miniaturas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Crear miniaturas de imágenes+http://elbauldelprogramador.com/crear-imagenes-en-miniaturas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/crear-miniaturas-de-imagenes-mejorado/
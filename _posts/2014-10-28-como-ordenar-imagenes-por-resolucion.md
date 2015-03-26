---
id: 2457
title: Cómo ordenar imágenes por resolución
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2457
permalink: /como-ordenar-imagenes-por-resolucion/
categories:
  - script
tags:
  - identify
  - imagenes por resolucion
  - ordenar por resolución
---
Hace poco me encontré queriendo ordenar una carpeta de fondos de pantalla por resolución, en lugar de otros métodos de ordenación más típicos como por nombre o tamaño. Así que buscando un poco encontré la respuesta en *superuser*. El usuario *[flammable][1]* preguntaba cómo ordenar imágenes por resolución. La respuesta es la siguiente:

<!--more-->

## El script

{% highlight bash %}>#!/bin/bash

for image in *.jpg *.JPG *.jpeg *.JPEG *.gif *.GIF *.bmp *.BMP *.png *.PNG;
do 
   res=$(identify -format %wx%h\\n "$image");
   mkdir -p $res;
   mv "$image" $res;
done
{% endhighlight %}

Yo lo modifiqué un poco acorde a mis necesidades:

{% highlight bash %}>#!/bin/bash

cd /ruta/mis/fondos

for image in *.jpg *.png;
do 
   res=$(identify -format %wx%h\\n "$image");
   mkdir -p /tmp/fondos/$res;
   cp "$image" /tmp/fondos/$res;
done
{% endhighlight %}

Para no modificar las imágenes originales, ya que están en *Drive*, y así poder seleccionar las que eliminar posteriormente.

## Qué hace el script

  * Recorrer todas las imágenes de una carpeta. 
      * El comando **identify** describe el formato y características de una o más imágenes, en concreto: 
          * `-format %wx%h\\n "$image"`: muestra la resolución de la imagen `$image` en formato *width x height*.
          * Se crea una carpeta nombrándola con la resolución de la imágen.
          * Se copia la imagen a la carpeta.

Tras ésto, tenemos organizadas todas las imágenes en carpetas por resolución. Mi objetivo era eliminar las de menor resolución, así que fui apuntando dichas imágenes para luego borrarlas en la carpeta original (La de Drive), donde están todas juntas. Tras almacenar en un archivo los nombres de las imágenes a borrar, ejecuté el siguiente comando en la carpeta original:

{% highlight bash %}>for i in $(cat ../ABorrar)
do 
   find /Carpeta/original/ -iname $i -exec rm '{}' \; 
done
{% endhighlight %}

## Renombrar las imágenes para que contengan su resolución

Como menciona Juanjo en el comentario, otra opción más adecuada es [renombrar][2] cada imagen con su resolución, para ello el siguiente script podría servir:

{% highlight bash %}>#!/bin/bash
 
cd /ruta/imagenes/

for image in *.jpg *.png;
do 
    res=$(identify -format %wx%h\\n "$image");
    rename "s/^/[$res] - /" "$image"
done
{% endhighlight %}

Así, las imágenes quedarán, por ejemplo, `[1280x1024] - nombre original.jpg`.

#### Referencias

*How to sort images into folders, based on resolution?* **|** <a href="http://superuser.com/questions/17562/how-to-sort-images-into-folders-based-on-resolution" target="_blank">superuser.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo ordenar imágenes por resolución+http://elbauldelprogramador.com/como-ordenar-imagenes-por-resolucion/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-ordenar-imagenes-por-resolucion/&t=Cómo ordenar imágenes por resolución+http://elbauldelprogramador.com/como-ordenar-imagenes-por-resolucion/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo ordenar imágenes por resolución+http://elbauldelprogramador.com/como-ordenar-imagenes-por-resolucion/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://superuser.com/users/4421/flammable
 [2]: http://elbauldelprogramador.com/renombrar-archivos-masivamente-en/ "Renombrar archivos masívamente"
---
id: 59
title: 'Crear miniaturas de imágenes [Mejorado]'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/crear-miniaturas-de-imagenes-mejorado/
permalink: /crear-miniaturas-de-imagenes-mejorado/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/crear-miniaturas-de-imagenes-mejorado.html
  - /2010/12/crear-miniaturas-de-imagenes-mejorado.html
  - /2010/12/crear-miniaturas-de-imagenes-mejorado.html
categories:
  - linux
  - script
tags:
  - crear miniaturas de imagenes
---
He mejorado el [script que subí hace unos días][1] para crear miniaturas de imágenes, y ahora se puede ejecutar desde cualquier lugar sin necesidad de copiar el script en la carpeta de las imágenes de las que queremos hacer miniaturas. Además, podemos seleccionar solo las imágenes que deseemos, o todas.

  
<!--more-->

  
También dejo el link de pastebin: <http://pastebin.com/BhKYpYJf>



<pre><span class="comentario">#!/bin/bash</span>

<span class="bash">if</span> [ -e /usr/bin/convert ] ; <span class="bash">then</span> <span class="comentario">#Compruebo que el programa imagemagick esta insatado</span>
 <span class="bash">dir</span>=`zenity --file-selection --directory --title="Selecciona el directorio de las imágenes"`
  <span class="bash">case</span> $? in
     0)
       <span class="bash">echo</span> -n "¿Quiere hacer miniaturas de todas las imágenes del directorio? s/n: " ; <span class="bash">read</span> respuesta
       <span class="bash">if</span> [ $respuesta == "S" ] || [ $respuesta == "s" ] ; <span class="bash">then</span> <span class="comentario"># Compruebo la respuesta del usuario</span>
        imagenes=$(<span class="bash">ls</span> $<span class="bash">dir</span>) <span class="comentario"># almaceno todos los archivos de la carpeta seleccionada</span>
        <span class="bash">mkdir</span> $<span class="bash">dir</span>/miniaturas
      <span class="bash">for</span> i in $imagenes
     <span class="bash">do</span>
      <span class="bash">if</span> [ -e $<span class="bash">dir</span>/$i ] ; <span class="bash">then</span>
       i=$(basename "$i")
       <span class="bash">echo</span> "Procesando imagen $i ..."
       /usr/bin/convert -thumbnail 180x128 $<span class="bash">dir</span>/$i $dir/miniaturas/$i
      <span class="bash">fi</span>
     <span class="bash">done</span>
     <span class="bash">echo</span> "Miniaturas creadas."
    <span class="bash">else</span>
     img=`zenity --filename=$<span class="bash">dir</span>/ --file-selection --multiple --separator=" " --title="Selecciona la imagenes"`
     <span class="bash">case</span> $? in
      0)
       <span class="bash">mkdir</span> $<span class="bash">dir</span>/miniaturas
       <span class="bash">for</span> i in $img
       <span class="bash">do</span>
         i=$(basename "$i")
        <span class="bash">echo</span> "Procesando imagen $i ..."
        /usr/bin/convert -thumbnail 180x128 $<span class="bash">dir</span>/$i $dir/miniaturas/$i
       <span class="bash">done</span>
       <span class="bash">echo</span> "Miniaturas creadas."
       ;;
     <span class="bash">esac</span>
       <span class="bash">fi</span>
       ;;
      1)
        <span class="bash">echo</span> "No seleccionó nada";;
     -1)
        <span class="bash">echo</span> "Ocurrió un error";;
    <span class="bash">esac</span>
<span class="bash">else</span>
 <span class="bash">echo</span> "Imagemagick no esta instalado, puede instalarlo haciendo 'sudo aptitude install imagemagick'"
<span class="bash">fi</span>

</pre>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Crear miniaturas de imágenes [Mejorado]+http://elbauldelprogramador.com/crear-miniaturas-de-imagenes-mejorado/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/crear-miniaturas-de-imagenes-mejorado/&t=Crear miniaturas de imágenes [Mejorado]+http://elbauldelprogramador.com/crear-miniaturas-de-imagenes-mejorado/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Crear miniaturas de imágenes [Mejorado]+http://elbauldelprogramador.com/crear-miniaturas-de-imagenes-mejorado/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/crear-imagenes-en-miniaturas/
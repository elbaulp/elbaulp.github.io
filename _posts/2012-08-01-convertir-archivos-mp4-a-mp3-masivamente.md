---
id: 867
title: Convertir archivos mp4 a mp3 masívamente
author: Alejandro Alcalde
layout: post
guid: /?p=867
permalink: /convertir-archivos-mp4-a-mp3-masivamente/
if_slider_image:
  - 
  - 
  - 
  - 
categories:
  - script
tags:
  - bash
  - ffmpeg
  - mp4 to mp3
format: aside
---
Ya mostré cómo <a href="/linux/renombrar-archivos-masivamente-en/" target="_blank">Renombrar archivos masivamente en GNU/Linux</a>. Hoy voy a enseñar un pequeño script que he tenido que crear para pasarme unos cuantos archivos en mp4 a mp3. 

Es bastante sencillo a la vez que útil:

<pre lang="bash" >#!/bin/bash

IFS='
'
if  ! [ -d "mp3f" ]
then
   mkdir mp3f
fi
for i in `ls *.mp4`
do
   echo 
   echo "****-----------------------------------------------------------------------------****"
   echo -e "ffmpeg -i $i -f mp3 -ab 320000 -vn ./mp3f/`basename "$i" .mp4`.mp3"
   echo "****-----------------------------------------------------------------------------****"
   echo
   ffmpeg -i $i -f mp3 -ab 320000 -vn ./mp3f/`basename "$i" .mp4`.mp3
done

IFS=' '

</pre>

Hay que establecer la variable IFS al salto de línea, ya que por defecto es el espacio. Por lo tanto en el for, si hay un archivo con espacios, por ejemplo &#8220;Song of The Week.mp4&#8243;, el for considerará cada palabra un archivo distinto e intentará convertir **Song, of, The, Week.mp4.** por separado.

Dentro del for se usa ffmpeg para convertir el archivo a mp3, con un bitrate de 320kbps, **-vn** es para elmininar el vídeo.

Los archivos de salida se almacenan en una carpeta llamada **mp3f**, y uso **\`basename &#8220;$i&#8221; .mp4\`.mp3** para cambiar la extensión del archivo de **mp4** a **mp3**.

Por último, fijamos IFS a su valor predeterminado.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Convertir archivos mp4 a mp3 masívamente+http://elbauldelprogramador.com/convertir-archivos-mp4-a-mp3-masivamente/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/convertir-archivos-mp4-a-mp3-masivamente/&t=Convertir archivos mp4 a mp3 masívamente+http://elbauldelprogramador.com/convertir-archivos-mp4-a-mp3-masivamente/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Convertir archivos mp4 a mp3 masívamente+http://elbauldelprogramador.com/convertir-archivos-mp4-a-mp3-masivamente/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
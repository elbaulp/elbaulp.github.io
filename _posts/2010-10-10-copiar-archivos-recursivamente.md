---
id: 15
title: Copiar archivos recursivamente
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/copiar-archivos-recursivamente/
permalink: /copiar-archivos-recursivamente/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/10/copiar-archivos-recursivamente.html
  - /2010/10/copiar-archivos-recursivamente.html
  - /2010/10/copiar-archivos-recursivamente.html
categories:
  - linux
  - script
---
Hola, Hice un pequeño script que consiste simplemente en dar dos rutas, una origen y otra destino, para copiar todos los archivos mp3 de la ruta origen (con una profundidad máxima de una  
carpeta), es decir, que si tenemos una carpeta con archivos mp3, y en esa misa carpeta tenemos otra carpeta con archivos mp3, el script tambien copiara los mp3 de la segunda carpeta.

Bueno, despues de dar la ruta origen y la destino, simplemente se crea en la ruta destino una carpeta con el mismo nombre que la carpeta que contiene los mp3, y los copia.

Hice este script porque tengo un usb para la música que escucho en el coche, y tambien tengo mucha musica, asi que decidi  
borrar el usb y volver a meter la música, pero no tanta como tenia anteriormente.  
Pero resulta que la radio de mi coche, no lee en el usb nada que tenga una profundidad de mas de 1 carpeta, es decir, en la raiz del usb, puedo tener carpetas, pero éstas no pueden tener más  
carpetas, deben tener tan solo archivos de música, y digo solo archivos de musica porque como exista una imagen u otra cosa&nbsp; dentro de la carpeta, no me reproduce la musica.

Cuento esto, para explicaros de donde surgió la idea de crear este script. Ya que que en mi PC tengo la musica ordenada por tipo (RAP, ELECTRO etc), Artistas, dentro de Artistas, los discos de  
éste, y, dentro de cada disco, la musica, y imagenes de la caratula y demas, en el usb no podia copiar simplemente todo esto .

Como no tenia ganas de andar pinchando en cada carpeta, seleccionar solo los mp3s, y crear en el usb la carpeta con el nombre del artista, cree el script, que hace todo ese trabajo por mi.

El unico requisito es que tengais instalado zenity (que casi siempre vien por defecto instalado), y, por supuesto, un So GNU/linux.

Aqui os dejo el codigo:

<pre class="ejemplo"><span class="path">#!/bin/bash</span>
<span class="bash">IFS</span>='
'
DIR=`zenity --file-selection --directory --title="Selecciona los archivos a copiar"`

<span class="bash">case</span> $? <span class="bash">in</span>
  0)
    DES=`zenity --file-selection --directory --title="Selecciona destino"`
    <span class="bash">case</span> $? <span class="bash">in</span>
    0)
      <span class="bash">echo</span> "Ruta destino "$DES" seleccionado."
      <span class="bash">echo</span> "Ruta origen "$DIR" seleccionado."
      datos=$(ls -p "$DIR")
      <span class="bash">echo</span> "--------------------"
      nuevaCarpeta=$(<span class="bash">echo</span> "$DIR" | <span class="bash">sed</span> -n 's//.*///gp') <span class="comentario"># Me quedo solo con el nombre de la carpeta destino</span>
      <span class="bash">cd</span> "$DES"
      mkdir "$nuevaCarpeta"
      <span class="bash">cd</span> "$nuevaCarpeta"
      cp -v "$DIR"/*.mp3 "$DES/$nuevaCarpeta" <span class="comentario">#Copio lo que hay en la raiz de esa carpeta</span>
      <span class="bash">for</span> carpeta <span class="bash">in</span> $datos
      <span class="bash">do</span>
        <span class="bash">if</span> [ -d "$DIR/$carpeta" ] ; <span class="bash">then</span>
          <span class="bash">cd</span> "$DIR/$carpeta"
          cp -v *.mp3 "$DES/$nuevaCarpeta"
        <span class="bash">fi</span>
      <span class="bash">done</span>              
      ;;
    *)
      <span class="bash">echo</span> "no selecciono nada.";;
      <span class="bash">esac</span>                                                      
    ;; <span class="comentario"># Fin del <span class="bash">case</span> 0) principal</span>
  *)
    <span class="bash">echo</span> "No selecciono nada.";;
    <span class="bash">esac</span>
<span class="bash">IFS</span>=' '

</pre>

Podéis hacer todas las preguntas que querais si no entendeis algo, y no repareis en criticarlo, si creeis que algo esta mal, o podria mejorarse.

Saludos, y espero que os sirva de algo.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Copiar archivos recursivamente+http://elbauldelprogramador.com/copiar-archivos-recursivamente/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/copiar-archivos-recursivamente/&t=Copiar archivos recursivamente+http://elbauldelprogramador.com/copiar-archivos-recursivamente/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Copiar archivos recursivamente+http://elbauldelprogramador.com/copiar-archivos-recursivamente/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
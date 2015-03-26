---
id: 324
title: Encontrar archivos abiertos en Linux
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/encontrar-archivos-abiertos-en-linux/
permalink: /encontrar-archivos-abiertos-en-linux/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/01/encontrar-archivos-abiertos-en-linux.html
  - /2012/01/encontrar-archivos-abiertos-en-linux.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551745}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551745}'
share_count:
  - 0
  - 0
categories:
  - linux
  - opensource
  - SO
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="" id="logo" name="sh" class="icono" /></a>
</div>

¿Cómo podemos saber cuantos archivos tenemos abiertos o hasta cuantos podemos permitir que están abiertos en Linux?

Por defecto el kernel de Linux establece un límite (para propósitos de seguridad) de hasta cuantos descriptores de archivos abiertos están permitidos en los sitemas linux servidor o escritorio.

El archivo <a target="_blank" href="http://www.cyberciti.biz/tips/linux-procfs-file-descriptors.html">/proc/sys/fs/file-nr</a> es un archivo de solo lectura que proporciona el número de archivos actuales abiertos.

  
<!--more-->

#### Encontrar cuantos archivos hay abiertos

Para ver el estado actual, introducimos:

<pre lang="bash">cat /proc/sys/fs/file-nr
</pre>

Ó:

<pre lang="bash">/sbin/sysctl fs.file-nr
</pre>

omo salida podemos obtener (en mi caso):

<pre lang="bash">5344 0 205074
</pre>

Este resultado contiene 3 números que significan:

  * 5344: El número de archivos asignados a manipular.
  * 0: El número de manejadores libres.
  * 205074: El número máximo de manejadores de archivos.

El kernel de Linux asigna los identificadores de archivos de forma dinámica, pero no los libera de nuevo. Si el número de archivos asignados se encuentra cercano al máximo, se debe considerar aumentar el <a target="_blank" href="http://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/">número máximo de archivos abiertos permitidos</a> editando el archivo <a target="_blank" href="http://www.cyberciti.biz/faq/making-changes-to-proc-filesystem-permanently/">/etc/sysctl.conf</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Encontrar archivos abiertos en Linux+http://elbauldelprogramador.com/encontrar-archivos-abiertos-en-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/encontrar-archivos-abiertos-en-linux/&t=Encontrar archivos abiertos en Linux+http://elbauldelprogramador.com/encontrar-archivos-abiertos-en-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Encontrar archivos abiertos en Linux+http://elbauldelprogramador.com/encontrar-archivos-abiertos-en-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
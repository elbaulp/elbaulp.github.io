---
id: 318
title: Cómo saber a qué partición pertenece un archivo en GNU/Linux
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/como-saber-a-que-particion-pertenece-un-archivo-en-gnulinux/
permalink: /como-saber-que-particion-pertenece-un/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/12/como-saber-que-particion-pertenece-un.html
  - /2011/12/como-saber-que-particion-pertenece-un.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551755}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551755}'
share_count:
  - 0
  - 0
categories:
  - How To
  - linux
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="" id="logo" name="sh" class="icono" /></a>
</div>

¿Cómo podemos saber que el archivo */home/hkr/Desktop/combinaciones.cpp* pertenece a una partición específica?¿O cómo podemos saber en qué partición existe un archivo?

Para eso podemos usar el comando df, que informa del uso del espacio en disco del sistema incluyendo nombres de archivos y directorios. La sintaxis es así:

  
<!--more-->

<pre lang="bash">df
df /ruta/a un/directorio
df /ruta/a un/archivo
</pre>

En el siguiente ejemplo se busca el nombre de la partición donde se encuentra el fichero llamado */home/hkr/Desktop/combinaciones.cpp*

<pre lang="bash">df -T /home/hkr/Desktop/combinaciones.cpp
</pre>

Que tiene como salida:

<pre lang="bash">Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda6     ext4   186362292 140452228  36443368  80% /home
</pre>

Como vemos, el resultado es que el archivo *combinaciones.cpp* pertenece a la partición */dev/sda6*. Con el siguiente comando mostramos solo el nombre de la partición:

<pre lang="bash">df /home/hkr/Desktop/combinaciones.cpp | awk '/^/dev/ {print $1}'
</pre>

O con este otro:

<pre lang="bash">awk '/^/dev/ {print $1}' &lt;&lt;&lt;"$(df /home/hkr/Desktop/combinaciones.cpp)"
</pre>

La salida para los dos comandos anteriores es la misma:

<pre lang="bash">/dev/sda6
</pre>

Es recomendable colocar la siguiente función bash en nuestro archivo *~/.bashrc*

<pre lang="bash"># find partition name for a given filename
findpart() { 
   [ -e "$1" ] &#038;&#038; df -P "$1"  | awk '/^/dev/ {print $1}' || echo "$1 not found"; 
}
</pre>

Ejemplos de uso:

<pre lang="bash">findpart /foo/bar
findpart /etc
findpart /home/vivek/test.txt
</pre>

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://1.bp.blogspot.com/-F2sPR477GsI/TvsYjhPFVgI/AAAAAAAAB_8/olid11qqdXw/s1600/Screenshot.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="68" width="400" src="http://1.bp.blogspot.com/-F2sPR477GsI/TvsYjhPFVgI/AAAAAAAAB_8/olid11qqdXw/s400/Screenshot.png" /></a>
</div>

Vía <a target="_blank" href="http://www.cyberciti.biz/faq/linux-unix-command-findout-on-which-partition-file-directory-exits/">cyberciti</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo saber a qué partición pertenece un archivo en GNU/Linux+http://elbauldelprogramador.com/como-saber-que-particion-pertenece-un/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-saber-que-particion-pertenece-un/&t=Cómo saber a qué partición pertenece un archivo en GNU/Linux+http://elbauldelprogramador.com/como-saber-que-particion-pertenece-un/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo saber a qué partición pertenece un archivo en GNU/Linux+http://elbauldelprogramador.com/como-saber-que-particion-pertenece-un/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
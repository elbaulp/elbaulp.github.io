---
id: 1549
title: Visualiza las visitas a tu web al estilo Pong con Logstalgia
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1549
permalink: /visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/
categories:
  - Administración de Servidores
  - aplicaciones
  - opensource
tags:
  - grabar video logstalgia
  - instalar logstalgia
  - tutorial logstalgia
---
Hace poco he descubierto un programa muy curioso, **Logstalgia**, que a partir del fichero de log de acceso a una web crea una pantalla del juego Pong en la que cada línea del log representa una bola en el juego. Es una buena representación gráfica de lo que está pasando en el servidor web. Y su uso es bastante simple. Empecemos instalándolo:

<pre lang="bash"># aptitude install logstalgia
</pre>

Para usarlo localmente, basta con ejecutar el siguiente comando:  
  
<!--more-->

<pre lang="bash">tail -f /var/www/mySitio/log/access.log | logstalgia -1280x720 --sync
</pre>

Por contra, si el servidor no es local, nos conectamos mediante ssh:

<pre lang="bash">ssh usuario@dominio.com tail -f /var/www/mySitio/log/access.log | logstalgia -1280x720 --sync
</pre>

Es posible guardar el un fichero la pantalla de logstalgia pasándole los siguientes parámetros:

<pre lang="">logstalgia -1280x720 --output-ppm-stream output.ppm --sync
</pre>

Y luego lo convertimos al formato de vídeo mp4:

<pre lang="bash">ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i output.ppm -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 server.log.mp4
</pre>

Os dejo un vídeo del tráfico de mi modesto blog:

<span class='embed-youtube' style='text-align:center; display: block;'></span>

#### Referencias

*Web oficial* **|** <a href="https://code.google.com/p/logstalgia/" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Visualiza las visitas a tu web al estilo Pong con Logstalgia+http://elbauldelprogramador.com/visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/&t=Visualiza las visitas a tu web al estilo Pong con Logstalgia+http://elbauldelprogramador.com/visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Visualiza las visitas a tu web al estilo Pong con Logstalgia+http://elbauldelprogramador.com/visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
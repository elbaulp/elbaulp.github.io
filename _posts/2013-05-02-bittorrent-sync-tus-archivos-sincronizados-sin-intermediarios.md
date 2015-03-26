---
id: 1548
title: 'BitTorrent Sync: Tus archivos sincronizados sin intermediarios'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1548
permalink: /bittorrent-sync-tus-archivos-sincronizados-sin-intermediarios/
categories:
  - internet
tags:
  - BitTorrent Sync en linux
  - instalar BitTorrent Sync
  - que es BitTorrent Sync
---
[<img src="http://elbauldelprogramador.com/content/uploads/2013/05/BiTTorrentSYnc-300x260.png" alt="BiTTorrentSYnc" width="300" height="260" class="alignleft size-medium wp-image-1553" />][1]

Escuchando el programa de radio **[security now!][2]** he descubierto una herramienta increíble. Se trata de **BitTorrrent Sync** y permite tener archivos sincronizados en todos los dispositivos que desees, sin necesidad de almacenarlos en la nube, como es el caso de dropbox por ejemplo. En este artículo voy a explicar cómo usarlo.

  
<!--more-->

BitTorrent Sync sincroniza los archivos usando el protocolo P2P. Cuando se configuran dos dispositivos para que estén sincronizados se conectan directamente entre ellos usando UDP, NAT y [UPnP][3], con lo cual no se depende de ningún tercero que tenga que almacenar los ficheros en la nube. Si ambos dispositivos se encuentran bajo la misma red local, BitTorrent Sync usará dicha red para realizar la sincronización más rápido.

## Instalar BitTorrent Sync y guía de uso

Está <a href="http://labs.bittorrent.com/experiments/sync/technology.html" target="_blank">disponible</a> tanto para Windows, Mac y Linux. Los dos primeros son programas de escritorio, en linux se usa una interfaz web. Descargamos el correspondiente:

  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/BTSync.exe" target="_blank">Windows</a>
  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/BTSync.dmg" target="_blank">Mac</a>
  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/btsync_x64.tar.gz" target="_blank">Linux x64</a>
  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/btsync_i386.tar.gz" target="_blank">Linux i386</a>

Una vez descargado, ejecutamos el programa y saldrá una ventana como esta:

<img class="thumbnail aligncenter size-full wp-image-1550" alt="BitTorrent Sync" src="http://elbauldelprogramador.com/content/uploads/2013/05/sync1.png" width="593" height="393" />

En Windows y mac, en linux hay que dirigirse a <a href="http://localhost:8888/gui" target="_blank">http://localhost:8888/gui</a>.

El siguiente paso es elegir una carpeta que queramos sincronizar y *generar un secreto* para dicha carpeta. El secreto es aleatório y único, es la llave que conecta varios dispositivos a una red sincronizada.

<div id="attachment_1551" style="width: 780px" class="wp-caption aligncenter">
  <a class="thumbnail" href="http://elbauldelprogramador.com/content/uploads/2013/05/Crear-carpeta-BitTorrent-Sync.png"><img class="size-large wp-image-1551" alt="Crear carpeta BitTorrent Sync" src="http://elbauldelprogramador.com/content/uploads/2013/05/Crear-carpeta-BitTorrent-Sync-1024x803.png" width="770" height="603" /></a>
  
  <p class="wp-caption-text">
    Crear carpeta BitTorrent Sync
  </p>
</div>

Hecho lo anterior, en el otro dispositivo, elegimos una carpeta en la que queramos almacenar los ficheros e introducimos el secreto en el paso anterior. En cuanto hagamos esto, automáticamente comenzará a sincronizar datos.

<div id="attachment_1552" style="width: 780px" class="wp-caption aligncenter">
  <a class="thumbnail" href="http://elbauldelprogramador.com/content/uploads/2013/05/Anadir-carpeta-BitTorrent-Sync.png"><img class="size-large wp-image-1552" alt="Anadir carpeta BitTorrent Sync" src="http://elbauldelprogramador.com/content/uploads/2013/05/Anadir-carpeta-BitTorrent-Sync-1024x801.png" width="770" height="602" /></a>
  
  <p class="wp-caption-text">
    Añadir carpeta BitTorrent Sync
  </p>
</div>

Para copiar el secreto de cualquier carpeta basta con hacer click en el botón **Get Secret** en linux o pulsar el botón derecho del ratón sobre la carpeta en Windows y Mac.

## Secret, Read-Only Secret y One-Time Secret

A la hora de compartir una carpeta, se pueden seleccionar varios tipos de secretos. El **generado al crear la carpeta** permite a todos los dispositivos con dicho secreto modificar el contenido. El **Read-Only Secret** sólo permite acceder a los archivos, pero no modificarlos. Un tercer tipo es el **One-time Secret**, que solo será válido durante 24 horas y puede ser de solo lectura o lectura/escritura.

Para terminar dejo el podcast del episodio de security now!



#### Referencias

*BitTorrent Sync* **|** <a href="http://labs.bittorrent.com/experiments/sync.html" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=BitTorrent Sync: Tus archivos sincronizados sin intermediarios+http://elbauldelprogramador.com/bittorrent-sync-tus-archivos-sincronizados-sin-intermediarios/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/bittorrent-sync-tus-archivos-sincronizados-sin-intermediarios/&t=BitTorrent Sync: Tus archivos sincronizados sin intermediarios+http://elbauldelprogramador.com/bittorrent-sync-tus-archivos-sincronizados-sin-intermediarios/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=BitTorrent Sync: Tus archivos sincronizados sin intermediarios+http://elbauldelprogramador.com/bittorrent-sync-tus-archivos-sincronizados-sin-intermediarios/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/content/uploads/2013/05/BiTTorrentSYnc.png
 [2]: /category/articulos/security-now-articulos/
 [3]: /articulos/grave-problema-en-upnp-que-afecta-a-81-millones-de-routers/
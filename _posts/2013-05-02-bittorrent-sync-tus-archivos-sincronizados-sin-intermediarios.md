---
id: 1548
title: 'BitTorrent Sync: Tus archivos sincronizados sin intermediarios'

layout: post
guid: https://elbauldelprogramador.com/?p=1548
permalink: /bittorrent-sync-tus-archivos-sincronizados-sin-intermediarios/
categories:
  - internet
tags:
  - BitTorrent Sync en linux
  - instalar BitTorrent Sync
  - que es BitTorrent Sync

description: "Escuchando el programa de radio security now! he descubierto una herramienta increíble. Se trata de **BitTorrrent Sync** y permite tener archivos sincronizados en todos los dispositivos que desees, sin necesidad de almacenarlos en la nube, como es el caso de dropbox por ejemplo. En este artículo voy a explicar cómo usarlo."
main-class: "articulos"
---
<figure>
  <img src="/assets/img/2013/05/BiTTorrentSYnc-300x260.png" alt="BiTTorrentSYnc"  class="alignleft size-medium wp-image-1553" />
</figure>

Escuchando el programa de radio **[security now!][2]** he descubierto una herramienta increíble. Se trata de **BitTorrrent Sync** y permite tener archivos sincronizados en todos los dispositivos que desees, sin necesidad de almacenarlos en la nube, como es el caso de dropbox por ejemplo. En este artículo voy a explicar cómo usarlo.


<!--ad-->

BitTorrent Sync sincroniza los archivos usando el protocolo P2P. Cuando se configuran dos dispositivos para que estén sincronizados se conectan directamente entre ellos usando UDP, NAT y [UPnP][3], con lo cual no se depende de ningún tercero que tenga que almacenar los ficheros en la nube. Si ambos dispositivos se encuentran bajo la misma red local, BitTorrent Sync usará dicha red para realizar la sincronización más rápido.

## Instalar BitTorrent Sync y guía de uso

Está <a href="http://labs.bittorrent.com/experiments/sync/technology.html" target="_blank">disponible</a> tanto para Windows, Mac y Linux. Los dos primeros son programas de escritorio, en linux se usa una interfaz web. Descargamos el correspondiente:

  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/BTSync.exe" target="_blank">Windows</a>
  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/BTSync.dmg" target="_blank">Mac</a>
  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/btsync_x64.tar.gz" target="_blank">Linux x64</a>
  * <a href="http://btsync.s3-website-us-east-1.amazonaws.com/btsync_i386.tar.gz" target="_blank">Linux i386</a>

Una vez descargado, ejecutamos el programa y saldrá una ventana como esta:

<img class="thumbnail aligncenter size-full wp-image-1550" alt="BitTorrent Sync" src="/assets/img/2013/05/sync1.png"  />

En Windows y mac, en linux hay que dirigirse a <a href="http://localhost:8888/gui" target="_blank">http://localhost:8888/gui</a>.

El siguiente paso es elegir una carpeta que queramos sincronizar y *generar un secreto* para dicha carpeta. El secreto es aleatório y único, es la llave que conecta varios dispositivos a una red sincronizada.

<div id="attachment_1551" style="width: 780px" class="wp-caption aligncenter">
  <a class="thumbnail" href="/assets/img/2013/05/Crear-carpeta-BitTorrent-Sync.png"><img class="size-large wp-image-1551" alt="Crear carpeta BitTorrent Sync" src="/assets/img/2013/05/Crear-carpeta-BitTorrent-Sync-1024x803.png"  /></a>

  <p class="wp-caption-text">
    Crear carpeta BitTorrent Sync
  </p>
</div>

Hecho lo anterior, en el otro dispositivo, elegimos una carpeta en la que queramos almacenar los ficheros e introducimos el secreto en el paso anterior. En cuanto hagamos esto, automáticamente comenzará a sincronizar datos.

<div id="attachment_1552" style="width: 780px" class="wp-caption aligncenter">
  <a class="thumbnail" href="/assets/img/2013/05/Anadir-carpeta-BitTorrent-Sync.png"><img class="size-large wp-image-1552" alt="Anadir carpeta BitTorrent Sync" src="/assets/img/2013/05/Anadir-carpeta-BitTorrent-Sync-1024x801.png"  /></a>

  <p class="wp-caption-text">
    Añadir carpeta BitTorrent Sync
  </p>
</div>

Para copiar el secreto de cualquier carpeta basta con hacer click en el botón **Get Secret** en linux o pulsar el botón derecho del ratón sobre la carpeta en Windows y Mac.

## Secret, Read-Only Secret y One-Time Secret

A la hora de compartir una carpeta, se pueden seleccionar varios tipos de secretos. El **generado al crear la carpeta** permite a todos los dispositivos con dicho secreto modificar el contenido. El **Read-Only Secret** sólo permite acceder a los archivos, pero no modificarlos. Un tercer tipo es el **One-time Secret**, que solo será válido durante 24 horas y puede ser de solo lectura o lectura/escritura.

Para terminar dejo el podcast del episodio de security now!



#### Referencias

*BitTorrent Sync* »» <a href="http://labs.bittorrent.com/experiments/sync.html" target="_blank">Visitar sitio</a>

 [2]: /security-now//
 [3]: /grave-problema-en-upnp-que-afecta-a-81-millones-de-routers/

{% include _toc.html %}

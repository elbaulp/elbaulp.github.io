---
id: 346
title: Actualizar BIOS de ASUS desde Linux
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/actualizar-bios-de-asus-desde-linux/
permalink: /actualizar-bios-de-asus-desde-linux/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/02/actualizar-bios-de-asus-desde-linux.html
  - /2012/02/actualizar-bios-de-asus-desde-linux.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551699}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551699}'
share_count:
  - 0
  - 0
categories:
  - seguridad
  - SO
tags:
  - como actualizar bios asus p5b
---
<div class="separator" style="float:left; margin-right:10px;">
  <img border="0" height="128" width="128" src="http://3.bp.blogspot.com/-wblX_BLWbE0/T0gHYglK1UI/AAAAAAAACI4/qtp0VmYrmqA/s400/b5018_firmwareupdateiconx_36031_640.png" />
</div>

Toda esta historia viene al comprar una memória de 2Gb de Ram a mi pc, para aumentar la capacidad total a 4Gb, no parece que sea algo muy complicado, ya que supuestamente mi placa base soporta hasta 8Gb y uso un Sistema Operatívo de 64-bits (CrunchBang 64-bit Stable + backports).

Bueno, inserto la RAM en la placa base todo contento ya que ahora iba a tener 4Gb (2x1Gb y 1x2Gb) y no se mi iba a quedar colgado el pc mientras escucho música con el Eclipse abierto más el emulador Android y el Chrome&#8230; (Que se come la RAM que da gusto), y resulta que solo reconoce 3Gb&#8230; Tras una tarde de buscar por foros y no encontrar nada me decido a publicar mi problema en los foros de [cruchbang][1] y [debian][2]. Al principio pensaba que era un problema de que no estaba colocando las memórias en los canales correctos para que hiciera el dual channel. Pero ese no era el problema.

Tras una respuesta en uno de los foros miro a ver si la BIOS reconoce las 4Gb y el resultado es que solo reconoce 3Gb. Investigo el motivo por el cual solo reconoce 3Gb y llego a una página que dice que es un problema de la versión de la BIOS que se soluciona actualizando a la última versión. Así que voy a explicar el proceso de actualización de la BIOS, en mi caso para la placa base ASUS P5B Deluxe Wifi edition:

  
<!--more-->

Lo primero que hay que hacer es bajarse el archivo de la página de ASUS, lo descomprimimos y tenemos un archivo con el modelo de la placa y de extensión .rom.

El siguiente paso es insertar un usb que formatearemos para realizar la actualización. Una vez insertado lo desmontamos y ejecutamos lo siguiente:

{% highlight bash %}>fdisk -cu /dev/sdb

Command (m for help): p

Disk /dev/sdb: 1002 MB, 1002438656 bytes
31 heads, 62 sectors/track, 1018 cylinders, total 1957888 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00025eb4

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *          62     1956595      978267    c  W95 FAT32 (LBA)

{% endhighlight %}

El siguiete paso es formatearlo:

{% highlight bash %}>mkfs.msdos -F 16 /dev/sdb1
{% endhighlight %}

Despues de esto, retiramos el usb y lo volvemos a introducir en el puerto. Si se monta automáticamente, lo desmontamos. Una vez desmontado, lo montamos con el siguiente comando:

{% highlight bash %}>mount /dev/sdb1 /mnt/temp/ -o rw,flush,uid=1000,utf8,shortname=win95
{% endhighlight %}

Copiamos el archivo ROM de la bios dentro del USB (Asegúrate de que el nombre del archivo está en mayúsculas.)

Desmontamos.

{% highlight bash %}>umount /dev/sdb1
{% endhighlight %}

Ahora reiniciamos con el usb insertado y tan pronto como veamos la pantalla de la BIOS pulsamos Alt+F2 para empezar el proceso de actualización. Seleccionamos el archivo ROM y esperamos a que finalize el proceso.

Despues de actualizar la BIOS, se restauran las configuraciones por defecto, de modo que es necesario volver a configurar la BIOS con los parámetros que deseemos.

<a target="_blank" href="http://www.blakeanthonyjohnson.com/?p=170">Fuente original</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Actualizar BIOS de ASUS desde Linux+http://elbauldelprogramador.com/actualizar-bios-de-asus-desde-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/actualizar-bios-de-asus-desde-linux/&t=Actualizar BIOS de ASUS desde Linux+http://elbauldelprogramador.com/actualizar-bios-de-asus-desde-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Actualizar BIOS de ASUS desde Linux+http://elbauldelprogramador.com/actualizar-bios-de-asus-desde-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://crunchbanglinux.org/forums/post/192843/#p192843
 [2]: http://forums.debian.net/viewtopic.php?f=7&t=76419
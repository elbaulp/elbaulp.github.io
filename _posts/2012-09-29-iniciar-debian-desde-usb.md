---
id: 966
title: Cómo iniciar debian desde un dispositivo USB
author: Alejandro Alcalde
layout: post
guid: /?p=966
permalink: /iniciar-debian-desde-usb/
categories:
  - How To
tags:
  - debian testing
  - iniciar debian desde pendrive
  - instalar debian testing usb
  - install debian desde usb
  - linux instalar debian usb
  - linux para portatil
format: aside
---
Recientemente formateé mi pc de sobremesa y el portatil para pasar de <a href="http://crunchbanglinux.org/" target="_blank">crunchbang</a> a debian testing y buscando formas de instalarlas desde un usb encontré la solución que comparto:

A lo largo del tutorial, se asumirá que el dispositivo usb está en **/dev/sda** y que la distribución a instalar es debian testing.

### Método 1

El primer paso es desmontar el usb:

<pre lang="bash">sudo umount /dev/sda</pre>

Descargar el **boot.img.gz**, necesario para hacer el usb &#8220;*bootable*&#8221; (que sea capaz el pc de arrancar desde él).

<pre lang="bash">cd ~
wget ftp://ftp.debian.org/debian/dists/testing/main/installer-amd64/current/images/hd-media/boot.img.gz</pre>

Este archivo es para procesadores de 64-bits, para procesadores de 32 hay que descargar el siguiente:

<pre lang="bash">cd ~
wget ftp://ftp.debian.org/debian/dists/testing/main/installer-i386/current/images/hd-media/boot.img.gz</pre>

Una vez descargado, se extrae la imagen y se escribe en el usb:

<pre lang="bash">sudo zcat ~/boot.img.gz &gt; /dev/sda</pre>

Montamos el usb en el directorio /mnt:

<pre lang="bash">sudo mount /dev/sda /mnt</pre>

En este caso se va a usar la versión **net-install** de debian testing, es posible usar cualquier otra imagen siempre que corresponda con la versión de la imagen descargada anteriormente.

<pre lang="bash">cd /mnt/
sudo wget http://cdimage.debian.org/cdimage/wheezy_di_beta2/amd64/iso-cd/debian-wheezy-DI-b2-amd64-netinst.iso</pre>

Listo, desmontamos el dispositivo usb:

<pre lang="bash">cd ~
sudo umount /dev/sda</pre>

Ahora es posible iniciar debian desde USB e instalar debian testing.

### Método 2

Descargar la ISO deseada de debian y ejecutar lo siguiente:

<pre lang="bash">cat debian.versión.iso > /dev/sdX ; sync
</pre>

Donde **/dev/sdX** ha de ser el dispositivo USB

### Método 3 (Sugerido en los comentarios por cioran)

<pre lang="bash">dd if=/ruta/debian.iso of=/dev/sdb bs=1M; sync
</pre>

* * *

### Referencias

*Boot Debian from an USB device* **|** <a href="http://www.debian-administration.org/article/Boot_Debian_from_an_USB_device" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo iniciar debian desde un dispositivo USB+http://elbauldelprogramador.com/iniciar-debian-desde-usb/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/iniciar-debian-desde-usb/&t=Cómo iniciar debian desde un dispositivo USB+http://elbauldelprogramador.com/iniciar-debian-desde-usb/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo iniciar debian desde un dispositivo USB+http://elbauldelprogramador.com/iniciar-debian-desde-usb/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
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

{% highlight bash %}>sudo umount /dev/sda{% endhighlight %}

Descargar el **boot.img.gz**, necesario para hacer el usb &#8220;*bootable*&#8221; (que sea capaz el pc de arrancar desde él).

{% highlight bash %}>cd ~
wget ftp://ftp.debian.org/debian/dists/testing/main/installer-amd64/current/images/hd-media/boot.img.gz{% endhighlight %}

Este archivo es para procesadores de 64-bits, para procesadores de 32 hay que descargar el siguiente:

{% highlight bash %}>cd ~
wget ftp://ftp.debian.org/debian/dists/testing/main/installer-i386/current/images/hd-media/boot.img.gz{% endhighlight %}

Una vez descargado, se extrae la imagen y se escribe en el usb:

{% highlight bash %}>sudo zcat ~/boot.img.gz &gt; /dev/sda{% endhighlight %}

Montamos el usb en el directorio /mnt:

{% highlight bash %}>sudo mount /dev/sda /mnt{% endhighlight %}

En este caso se va a usar la versión **net-install** de debian testing, es posible usar cualquier otra imagen siempre que corresponda con la versión de la imagen descargada anteriormente.

{% highlight bash %}>cd /mnt/
sudo wget http://cdimage.debian.org/cdimage/wheezy_di_beta2/amd64/iso-cd/debian-wheezy-DI-b2-amd64-netinst.iso{% endhighlight %}

Listo, desmontamos el dispositivo usb:

{% highlight bash %}>cd ~
sudo umount /dev/sda{% endhighlight %}

Ahora es posible iniciar debian desde USB e instalar debian testing.

### Método 2

Descargar la ISO deseada de debian y ejecutar lo siguiente:

{% highlight bash %}>cat debian.versión.iso > /dev/sdX ; sync
{% endhighlight %}

Donde **/dev/sdX** ha de ser el dispositivo USB

### Método 3 (Sugerido en los comentarios por cioran)

{% highlight bash %}>dd if=/ruta/debian.iso of=/dev/sdb bs=1M; sync
{% endhighlight %}

* * *

### Referencias

*Boot Debian from an USB device* **|** <a href="http://www.debian-administration.org/article/Boot_Debian_from_an_USB_device" target="_blank">Visitar sitio</a> 


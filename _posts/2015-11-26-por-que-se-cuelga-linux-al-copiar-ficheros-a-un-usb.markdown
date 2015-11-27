---
layout: post
title: "¿Por Qué Se Cuelga Linux Al Copiar Ficheros a Un Usb?"
categories:
excerpt: "Es posible que a vosotros también os haya ocurrido. Al realizar una operación de copiar un fichero grande a un usb en linux, o simplemente muchos ficheros que requieran tiempo para copiar, el sistema operativo se cuelga y va muy lento. Buscando un poco encontré una posible solución al problema. Veámosla:"
tags: [usb, linux, usb se cuelga, usb lento]
image:
  feature:
  thumb: hotlink-ok/Por-Que-Se-Cuelga-Linux-Al-Copiar-Ficheros-a-un-Usb.png
  credit:
  creditlink:
date: 2015-11-26T19:16:00+00:00
modified: 2015-11-27T11:14:00+00:00
---

{% include _toc.html %}

<figure>
  <img src="/images/hotlink-ok/Por-Que-Se-Cuelga-Linux-Al-Copiar-Ficheros-a-un-Usb.png" title="{{ title }}" alt="{{ title }}" />
</figure>
<span class="image-credit">Crédito de la imagen: <a href="https://pixabay.com/en/usb-drive-storage-plug-flash-38264/">pixabay.com</a></span><br/>

Es posible que a vosotros también os haya ocurrido. Al realizar una operación de copiar un fichero grande a un usb en linux, o simplemente muchos ficheros que requieran tiempo para copiar, el sistema operativo se cuelga y va muy lento. Buscando un poco encontré una posible solución al problema. Veámosla:

>La respuesta la encontré en <a href="http://unix.stackexchange.com" target="_blank" title="stackexchange">unix.stackexchange</a>, en una pregunta que realizó el usuario <a href="http://unix.stackexchange.com/users/52763/mikhail-morfikov" target="_blank" title="">Mikhail Morfikov</a>. Y la respuesta la dió el usuario <a href="http://unix.stackexchange.com/users/52205/rmano" target="_blank" title="">Rmano</a>.

<!--ad-->

## Descripción del problema

Este problema ocurre en sistemas de 64bits con bastante memoria, es un bug del <a href="http://lwn.net/Articles/572911/" target="_blank" title="">kernel</a> pendiente de resolver.

## Cómo solucionar el cuelgue del sistema al copiar ficheros a un usb

Una posible solución consiste en ejecutar los siguientes comandos como _root_ :

{% highlight bash %}
echo $((16*1024*1024)) > /proc/sys/vm/dirty_background_bytes
echo $((48*1024*1024)) > /proc/sys/vm/dirty_bytes
{% endhighlight %}

Si queremos que se conserven entre reinicios, debemos añadirlos al fichero `/etc/rc.local`

Sin embargo, cambiar dichos valores afectará a la tasa de transferencia entre el usb y el disco duro, así que los ficheros tardarán más tiempo en copiarse, pero al menos el sistema no se colgará y podremos seguir usándolo.

## Restaurar los valores por defecto

Para volver a los valores normales, hay que fijar los valores a

{% highlight bash %}
echo 0 > /proc/sys/vm/dirty_background_bytes
echo 0 > /proc/sys/vm/dirty_bytes
{% endhighlight %}

El significado de estos parámetros es:

- _/proc/sys/vm/dirty_background_bytes_: Contains the amount of dirty memory at which the background kernel
flusher threads will start writeback.
- _/proc/sys/vm/dirty_bytes_: Contains the amount of dirty memory at which a process generating disk writes
will itself start writeback.

### Referencias

Why is my PC freezing while I'm copying a file to a pendrive? | [unix.stackexchange.com](http://unix.stackexchange.com/questions/107703/why-is-my-pc-freezing-while-im-copying-a-file-to-a-pendrive "Why is my PC freezing while I'm copying a file to a pendrive?")

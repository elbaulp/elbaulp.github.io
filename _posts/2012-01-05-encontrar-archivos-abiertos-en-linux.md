---
id: 324
title: Encontrar archivos abiertos en Linux

layout: post
guid: http://elbauldelprogramador.org/encontrar-archivos-abiertos-en-linux/
permalink: /encontrar-archivos-abiertos-en-linux/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
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
  <a href="/images/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="" id="logo" name="sh" class="icono" /></a>
</div>

¿Cómo podemos saber cuantos archivos tenemos abiertos o hasta cuantos podemos permitir que están abiertos en Linux?

Por defecto el kernel de Linux establece un límite (para propósitos de seguridad) de hasta cuantos descriptores de archivos abiertos están permitidos en los sitemas linux servidor o escritorio.

El archivo <a target="_blank" href="http://www.cyberciti.biz/tips/linux-procfs-file-descriptors.html">/proc/sys/fs/file-nr</a> es un archivo de solo lectura que proporciona el número de archivos actuales abiertos.

  
<!--more-->

#### Encontrar cuantos archivos hay abiertos

Para ver el estado actual, introducimos:

{% highlight bash %}cat /proc/sys/fs/file-nr
{% endhighlight %}

Ó:

{% highlight bash %}/sbin/sysctl fs.file-nr
{% endhighlight %}

omo salida podemos obtener (en mi caso):

{% highlight bash %}5344 0 205074
{% endhighlight %}

Este resultado contiene 3 números que significan:

  * 5344: El número de archivos asignados a manipular.
  * 0: El número de manejadores libres.
  * 205074: El número máximo de manejadores de archivos.

El kernel de Linux asigna los identificadores de archivos de forma dinámica, pero no los libera de nuevo. Si el número de archivos asignados se encuentra cercano al máximo, se debe considerar aumentar el <a target="_blank" href="http://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/">número máximo de archivos abiertos permitidos</a> editando el archivo <a target="_blank" href="http://www.cyberciti.biz/faq/making-changes-to-proc-filesystem-permanently/">/etc/sysctl.conf</a>



{% include _toc.html %}

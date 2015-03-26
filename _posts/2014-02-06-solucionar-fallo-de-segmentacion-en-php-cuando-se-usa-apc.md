---
id: 2014
title: Solucionar fallo de segmentación en PHP cuando se usa APC
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2014
permalink: /solucionar-fallo-de-segmentacion-en-php-cuando-se-usa-apc/
categories:
  - Administración de Servidores
  - linux
tags:
  - configuración apc
  - fallo segmentación php
  - parámetros kernel
  - shmmax
  - sysctl
---
Hace algún tiempo, el blog se caía de forma aleatoria y dejaba de funcionar. Tras investigar un poco descubrí que era PHP el que estaba causando el problema. En concreto ocurría un fallo de segmentación en PHP que no conseguía averiguar de dónde procedían. Buscando y buscando al final dí con el problema, en realidad lo que provocaba el problema no era PHP, si no una consecuencia de usar APC y el parámetro `apc.shm_size` junto con el parámetro del kernel `kernel.shmmax`. El propósito de este artículo es dejar constancia de cómo se solucionó el problema por si alguien se encontrara en la misma situación.

<!--more-->

### Para qué sirve el parámetro /proc/sys/kernel/shmmax

Según la documentación del kernel:

> shmmax:
> 
> This value can be used to query and set the run time limit  
> on the maximum shared memory segment size that can be created.  
> Shared memory segments up to 1Gb are now supported in the  
> kernel. This value defaults to SHMMAX. 

Traducido:

> shmmax:
> 
> Este valor puede usarse para consultar y establecer el límite máximo del segmento de memoria compartida que puede crearse. Se soportan segmentos de memoria compartida de hasta 1Gb. Su valor por defecto está definido por la constante SHMMAX. 

### Para qué sirve el parámetro apc.shm_size

Según la documentación de APC:

> El tamaño de cada segmento de memoria compartida en MB. Por defecto, algunos sistemas (incluidos la mayoría de variantes de BSD) tienen límites muy bajos del tamaño de un segmento de memoria compartida. 

Sabiendo para qué sirve cada parámetro, en un foro encontré la respuesta a la solución:

> From my Linux experience, this bug is caused only by one thing:
> 
> Wrongly set SHM size in kernel and/or APC settings. With standard apc.shm_size = 30, i get segfault (11) every time i try to spawn php-cgi processes. But once i do the following:
> 
> echo &#8220;512000000&#8221; > /proc/sys/kernel/shmmax  
> set apc.shm_size = 64M
> 
> Then the problem completely disappears. PHP with APC becomes ROCK-solid, and NEVER segfaults running 24/7.

Por tanto, incrementando el valor del parámetro `/proc/sys/kernel/shmmax` a un valor igual o mayor que el del parámetro `apc.shm_size` de APC soluciona el problema. Desde que apliqué este cambio no he vuelto a tener caídas en los procesos de PHP.

### Algunas notas a tener en cuenta

El parámetro del kernel se puede cambiar de varias formas, tal y como mencionaba el usuario del foro se cambia únicamente durante la sesión activa del Sistema Operativo, tras reiniciar el servidor se establecerá su valor por defecto (30Mb). Para hacer los cambios permanentes, debemos escribir el valor del parámetro en el fichero */etc/sysctl.conf* o en */etc/sysctl.d/99-sysctl.conf*.

Por ejemplo, para establecer el valor a 256 Mb escribiríamos al final de uno de estos archivos:

{% highlight bash %}>kernel.shmmax=268435456
{% endhighlight %}

Y luego cargamos el fichero para aplicar los cambios:

{% highlight bash %}>sysctl -p
{% endhighlight %}

Para comprobar que se actualizó el valor:

{% highlight bash %}>cat /proc/sys/kernel/shmmax
268435456
{% endhighlight %}

#### Referencias

*Créditos de la imagen* **|** <a href="http://icons8.com/" target="_blank">icons8</a>  
*APC causes PHP fast-cgi to segfault* **|** <a href="https://bugs.php.net/bug.php?id=56894" target="_blank">bugs.php.net</a>  
*Documentación Sysctl* **|** <a href="https://www.kernel.org/doc/Documentation/sysctl/kernel.txt" target="_blank">kernel.org</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Solucionar fallo de segmentación en PHP cuando se usa APC+http://elbauldelprogramador.com/solucionar-fallo-de-segmentacion-en-php-cuando-se-usa-apc/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/solucionar-fallo-de-segmentacion-en-php-cuando-se-usa-apc/&t=Solucionar fallo de segmentación en PHP cuando se usa APC+http://elbauldelprogramador.com/solucionar-fallo-de-segmentacion-en-php-cuando-se-usa-apc/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Solucionar fallo de segmentación en PHP cuando se usa APC+http://elbauldelprogramador.com/solucionar-fallo-de-segmentacion-en-php-cuando-se-usa-apc/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
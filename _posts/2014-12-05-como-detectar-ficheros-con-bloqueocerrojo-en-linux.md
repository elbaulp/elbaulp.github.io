---
id: 2464
title: ¿Cómo detectar ficheros con bloqueo/cerrojo en Linux?
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2464
permalink: /como-detectar-ficheros-con-bloqueocerrojo-en-linux/
categories:
  - linux
tags:
  - bloqueos ficheros
  - cerrojos
  - fcntl
  - file locks
  - flock
  - locks
---
Éste artículo tiene su origen en una pregunta a la que respondí en *serverfault*, el usuario preguntaba *How to detect exceptionally long file locks in linux?*. Aunque mi respuesta no solucionó su problema, creo que la explicación puede ser de utilidad para alguien. A continuación escribo la traducción de mi respuesta al usuario:

Creo que lo que buscas es el fichero `/proc/locks`. Éste fichero muestra los archivos bloqueados actualmente en el sistema. Sin embargo, no muestra **Cuanto tiempo ha estado bloqueado un fichero**, pero sí que muestra **qué proceso lo está bloqueando**. Quizá sea posible detectar cuando se produce el bloqueo en éste fichero y medir el tiempo transcurrido. Un ejemplo de `/proc/locks` es el siguiente:

<!--more-->

{% highlight bash %}>$ cat /proc/locks 
1: POSIX  ADVISORY  WRITE 2245 08:06:1182714 1073741824 1073741824
2: POSIX  ADVISORY  WRITE 2245 08:06:1182714 1073741826 1073742335
3: POSIX  ADVISORY  WRITE 3058 08:06:10752740 0 0
4: POSIX  ADVISORY  WRITE 3058 08:06:10752739 0 0
5: POSIX  ADVISORY  WRITE 2421 08:06:10752766 0 EOF
6: POSIX  ADVISORY  WRITE 2421 08:06:11142048 0 EOF
7: POSIX  ADVISORY  WRITE 2421 08:06:9964366 1073741824 1073742335
8: POSIX  ADVISORY  WRITE 2421 08:06:11142040 0 EOF
{% endhighlight %}

Donde las columnas significan:

  * *Primera*: El identificador del bloqueo.
  * *Segunda*: Tipo de bloqueo (POSIX si el bloqueo se hizo con `fcntl` y `FLOCK` si se creó con `flock`.)
  * *Tercera*: Modo de bloqueo (ADVISORY o MANDATORY)
  * *Cuarta*: Tipo de bloqueo (WRITE o READ), correspondiente a bloqueos compartidos o exclusivos.
  * *Quinta*: PID del [proceso][1] que tiene el bloqueo sobre el fichero.
  * *Sexta*: Tres números separados por `:`, que identifican el fichero bloqueado.
  * *Séptima:* Byte donde comienza el bloqueo en el fichero.
  * *Octava:* Byte donde acaba el bloqueo del fichero.

#### Referencias

*How to detect exceptionally long file locks in linux?* **|** <a href="http://serverfault.com/a/593873/181098" target="_blank">serverfault.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=¿Cómo detectar ficheros con bloqueo/cerrojo en Linux?+http://elbauldelprogramador.com/como-detectar-ficheros-con-bloqueocerrojo-en-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-detectar-ficheros-con-bloqueocerrojo-en-linux/&t=¿Cómo detectar ficheros con bloqueo/cerrojo en Linux?+http://elbauldelprogramador.com/como-detectar-ficheros-con-bloqueocerrojo-en-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=¿Cómo detectar ficheros con bloqueo/cerrojo en Linux?+http://elbauldelprogramador.com/como-detectar-ficheros-con-bloqueocerrojo-en-linux/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/introduccion-los-procesos/ "Intro a los procesos"
---
id: 1046
title: Desafío de ingeniería inversa en C
author: Alejandro Alcalde
layout: post
guid: /?p=1046
permalink: /desafio-de-ingenieria-inversa-en-c/
categories:
  - C
  - Hacking
tags:
  - asm
  - Ingenieria inversa
---
<img src="http://elbauldelprogramador.com/content/uploads/2012/12/logicbomb1.png" alt="" title="Bomba" width="532" height="449" class="thumbnail aligncenter size-full wp-image-1048" />

#### Puedes encontrar la solución a esta práctica en [Desafío de ingeniería inversa en C &#8211; Soluciones][1] {.alert}

En la asignatura Estructura de Computadores de mi facultad, estamos haciendo una práctica que consiste en coger un ejecutable que haya compilado otro alumno, el cual pide una contraseña alfanumérica y otra numérica. Dicho ejecutable está compilado sin opción de depuración, es decir:

{% highlight bash %}>gcc -m32 -O&lt;n> Bomba.c -o bomba
{% endhighlight %}

Donde n es el nivel de optimización desado, en la práctica solo se permite hasta nivel 2. Como habŕas deducido del nombre del ejecutable, se trata de desactivar una bomba. Para lograr este objetivo, es necesario introducir correctamente ambas contraseñas y hacerlo en un periodo de tiempo limitado.

La tarea consiste en aplicar ingeniería inversa usando herramientas como objdump y gdb.

Ambas contraseñas pueden estar ocultas, es decir, haciendo operaciones de suma y resta a la contraseña para cambiar su valor y que no sea visible directamente mientras se depura el programa o haciendo uso de un editor hexadecimal como bless. La forma de ocultarlas queda a elección de cada uno, eso sí, está prohibido usar [algoritmos de cifrado][2].

Hoy con esta entrada te animo a que intentes descubrir las contraseñas de mi programa. Cualquier comentario que publique la contraseña será moderado hasta que termine el plazo de la práctica de clase, por razones obvias ;-). 

Cuando finalice este plazo, publicaré el código fuente y todos los comentarios, junto con alguna explicación de los programas que haya conseguido descifrar.

Todo aquel que quiera intentarlo, puede descargar el ejecutable de esta dirección: [https://dl.dropbox.com/u/54765219/Bomba\_El\_Baul\_del\_Programador][3]

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Desafío de ingeniería inversa en C+http://elbauldelprogramador.com/desafio-de-ingenieria-inversa-en-c/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/desafio-de-ingenieria-inversa-en-c/&t=Desafío de ingeniería inversa en C+http://elbauldelprogramador.com/desafio-de-ingenieria-inversa-en-c/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Desafío de ingeniería inversa en C+http://elbauldelprogramador.com/desafio-de-ingenieria-inversa-en-c/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion/desafio-de-ingenieria-inversa-en-c-soluciones/
 [2]: /?tag=criptografia
 [3]: https://dl.dropbox.com/u/54765219/Bomba_El_Baul_del_Programador
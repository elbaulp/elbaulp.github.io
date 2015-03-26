---
id: 1576
title: Cómo evitar que se aplique ingeniería inversa a un ejecutable
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1576
permalink: /como-evitar-que-se-aplique-ingenieria-inversa-a-un-ejecutable/
categories:
  - C
  - How To
tags:
  - evitar ingenieria inversa
  - funcion ptrace C
  - ingenieria inversa C
  - ptrace
---
Hace unos días explicaba en qué consisten las secciones [.ctors y .dtors][1]. Hoy voy a explicar un método muy sencillo para evitar que se aplique ingeniería inversa a nuestros ejecutables, que evitará la depuración del mismo.

  
<!--more-->

Para ello hay que hacer uso de la función `ptrace()`:

<pre lang="c">#include &lt;sys/ptrace.h>

       long ptrace(enum __ptrace_request request, pid_t pid,
                   void *addr, void *data);

The  ptrace()  system  call  provides  a  means  by  which  one process (the "tracer") may observe 
and control the execution of another process (the "tracee"), and examine and change the tracees 
memory and registers.  It is primarily used to implement breakpoint debugging and system 
call  tracing.
</pre>

Consite en un proceso observe el control de ejecución de otro. Se usa normalmente para implementar puntos de ruptura para depurar.

Esta función será usada como constructor para que se ejecute antes de llamar a la función `main()`:

<pre lang="c">/*
 * evilgrin.c, tweaking ptrace() to induced whatever we been debugged
 */

#include &lt;stdio.h>
#include &lt;sys/ptrace.h>

void ptrace_trap(void) __attribute__ ((constructor));

void ptrace_trap(void) {

    /*    
     * If ptrace fails here, means someone already ptrace()'ed us.
     */
     if (ptrace(PTRACE_TRACEME, 0, 0, 0) &lt; 0) { 
         printf("alguien está depurando");
         exit(0);
     }
}

int main(int argc, char **argv) {
     printf("Hello World!\n");
     return 1;
}
</pre>

El código de arriba realiza un `ptrace` a sí mismo. Si falla al intentar realizar un seguimiento a él mismo, quiere decir que otro proceso ya esté realizando el seguimiento (el depurador, por ejemplo). Veamos el ejemplo en práctica:

<pre lang="bash">$ gdb trace
(gdb) r
Starting program: trace 
alguien está depurando
[Inferior 1 (process 17027) exited normally]
(gdb) 
</pre>

Como se vé, el ejecutable termina ántes de llegar a ejecutar siquiera la función `main()`.

#### Referencias

*exploit-db.com* **|** <a href="http://www.exploit-db.com/papers/13234/" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo evitar que se aplique ingeniería inversa a un ejecutable+http://elbauldelprogramador.com/como-evitar-que-se-aplique-ingenieria-inversa-a-un-ejecutable/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-evitar-que-se-aplique-ingenieria-inversa-a-un-ejecutable/&t=Cómo evitar que se aplique ingeniería inversa a un ejecutable+http://elbauldelprogramador.com/como-evitar-que-se-aplique-ingenieria-inversa-a-un-ejecutable/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo evitar que se aplique ingeniería inversa a un ejecutable+http://elbauldelprogramador.com/como-evitar-que-se-aplique-ingenieria-inversa-a-un-ejecutable/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/programacion/lenguaje-c/jugando-con-la-seccion-dtors-de-la-tabla-de-secciones-en-c/ "Jugando con las secciones .dtors y .ctors de la tabla de secciones en C"
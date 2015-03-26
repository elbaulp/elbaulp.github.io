---
id: 1576
title: Cómo evitar que se aplique ingeniería inversa a un ejecutable

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

{% highlight c %}>#include &lt;sys/ptrace.h>

       long ptrace(enum __ptrace_request request, pid_t pid,
                   void *addr, void *data);

The  ptrace()  system  call  provides  a  means  by  which  one process (the "tracer") may observe 
and control the execution of another process (the "tracee"), and examine and change the tracees 
memory and registers.  It is primarily used to implement breakpoint debugging and system 
call  tracing.
{% endhighlight %}

Consite en un proceso observe el control de ejecución de otro. Se usa normalmente para implementar puntos de ruptura para depurar.

Esta función será usada como constructor para que se ejecute antes de llamar a la función `main()`:

{% highlight c %}>/*
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
{% endhighlight %}

El código de arriba realiza un `ptrace` a sí mismo. Si falla al intentar realizar un seguimiento a él mismo, quiere decir que otro proceso ya esté realizando el seguimiento (el depurador, por ejemplo). Veamos el ejemplo en práctica:

{% highlight bash %}>$ gdb trace
(gdb) r
Starting program: trace 
alguien está depurando
[Inferior 1 (process 17027) exited normally]
(gdb) 
{% endhighlight %}

Como se vé, el ejecutable termina ántes de llegar a ejecutar siquiera la función `main()`.

#### Referencias

*exploit-db.com* **|** <a href="http://www.exploit-db.com/papers/13234/" target="_blank">Visitar sitio</a> 



 [1]: http://elbauldelprogramador.com/programacion/lenguaje-c/jugando-con-la-seccion-dtors-de-la-tabla-de-secciones-en-c/ "Jugando con las secciones .dtors y .ctors de la tabla de secciones en C"
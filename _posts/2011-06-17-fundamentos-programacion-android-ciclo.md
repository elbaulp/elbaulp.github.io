---
id: 228
title: 'Fundamentos programación Android: Ciclo de vida de los componentes'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/fundamentos-programacion-android-ciclo-de-vida-de-los-componentes/
permalink: /fundamentos-programacion-android-ciclo/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /fundamentos-programacion-android-ciclo/
  - /fundamentos-programacion-android-ciclo/
  - /fundamentos-programacion-android-ciclo/
categories:
  - android
  - opensource
tags:
  - ciclo de vida
  - componentes android
  - curso android pdf
  - Fundamentos programación Android
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Cada componente tiene un ciclo de vida distinto. Las superclases de estos componentes tienen métodos ***callback*** que les permiten reaccionar ante un cambio de estado. Cada método callback está obligado a llamar al mismo método de su padre.

### Ciclo de vida de los Receiver

Tienen un ciclo de vida muy corto, ya que se activan al producirse un mensaje de difusión, que capturan con el método callback:

  
<!--more-->

{% highlight java %}>void onReceive(Context curContext, Intent broadcastMsg){% endhighlight %}

Si este método se está ejecutando, se considera el Receiver activo. Esto supone un problema si la tarea a ejecutar es pesada y la lanzamos a un hilo aparte. Cuando termine el método, Android considera que el receiver está inactivo, pero el hilo sigue ejecutándose y puede ser eliminado de la pila, interrumpiendo la tarea.

Se soluciona lanzando un servicio desde este método que se encarga de hacer las tareas pesadas, así, al tener el servicio su propio ciclo de vida, seguirá ejecutandose, aunque el receiver se considere inactivo.

### Ciclo de vida de los ContentProvider

Su ciclo es muy corto, permanecen activos mientras sean referenciados por un ContentResolver.

### Ciclo de vida de las Actividades

Tiene tres estados:

  * ***Activo:*** La actividad se encuentra en primer plano (Encima de la pila de tareas) e interactuando con el usuario.
  * ***Pausado:*** La actividad sigue siendo visible para el usuario, pero ha perdido el foco. Por ejemplo que se haya mostrado un cuadro de dialogo delante de nuestra actividad. Debemos guardar el estado de la interfaz y los datos de esta actividad antes de entrar en este estado, ya que podríamos perderlos si el sistema necesita más recursos de memoria.
  * ***Parado:*** La actividad no es visible para el usuario, queda a disposición del sistema para borrarla de la pila en caso de necesitar memoria.

La clase Activity dispone de métodos que se llaman cada vez que ésta cambia de estado, para permitirnos realiar tareas como guardar los datos antes de cambiar de estado, y cargar la actividad más rápido la proxima vez que se muestre. A continuación un diagrama con los distintos estados por los que pasa una actividad:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://4.bp.blogspot.com/-rzvsPpVkc5s/TfsiicRNDwI/AAAAAAAAAng/UkVWUYQySbM/s1600/activity_lifecycle.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img title="ciclo de vida actividades" alt="ciclo de vida actividades" border="0" height="500" width="407" src="http://4.bp.blogspot.com/-rzvsPpVkc5s/TfsiicRNDwI/AAAAAAAAAng/UkVWUYQySbM/s1600/activity_lifecycle.png" /></a>
</div>

  * ***onCreate(Bundle savedInstanceState):*** Este método se llama al crear la actividad. Siempre se sobreescribe para configurar la vista, crear adaptadores, rellenar los objetos con sus valores etc. Puede recibir como parámetro el estado anterior de la actividad para que podamos restaurarla.
  * ***onPause():*** Es llamado justo antes de que se traiga a primer plano otra actividad. Aquí es donde debemos guardar los datos para no perder la información de la actividad si esta es sacada de la pila. Dentro de este método también se suele parar las tareas pesadas que consuman CPU.
  * ***onStop():*** Es llamado cuando la actividad se va a ocultar durante un largo periodo de tiempo. Si el sistema necesita recursos, puede que este método no sea llamado, por lo que es recomendable guardar los datos en el método ***onPause().***
  * ***onDestroy:*** Último en llamarse antes de destruir la actividad. Puede llamarse a través del método ***finish()*** o llamarlo el sistema para conseguir más memoria. Para saber quién lo llamó, podemos usar ***isFinishing().***

Un ejemplo de uso de estos métodos puede ser cuando tenemos una aplicación que carga datos de internet, deberíamos cargar los datos al inicio de la actividad, una vez descargados, guardaríamos el estado de la actividad para que si es destruida, no sea necesario volver a descargar los datos.

Para realizar esta operación usaríamos el método ***onSavedInstanceState()***, que crearía un ***Bundle*** con los datos necesarios que pasaríamos al método ***onCreate()*** la segunda vez que cargaramos la actividad, sin necesidad de volver a descargar los datos.

### Ciclo de vida de Service

Los servicios se pueden usar de dos formas, dependiendo de como lo lancemos, su ciclo será uno u otro.

  * Si lo lanzamos con ***startService()*** se ejecurará hasta que termine. Los servicios se configurar en el método ***onCreate()*** y se liberan en el ***onDestroy()***. Podemos terminar un servicio externamente con ***Context.stopService()*** o dentro del mismo servicio con ***Service.stopSelf() o Service.stopSelfResult().***
  * Si lo lanzamos con ***Context.bindService()*** podremos interactuar con él mediante una interfaz que el servicio debe exportar. Terminaremos el servicio con ***Context.unbindService().***

A continuación el diagrama con el ciclo de vida de los servicios:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://2.bp.blogspot.com/-7eOY6RsbVQ0/TfsqCsNCg0I/AAAAAAAAAno/y-bkegRUNiw/s1600/service_lifecycle.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img alt="Ciclo de vida servicios" title="Ciclo de vida servicios" border="0" height="500" width="432" src="http://2.bp.blogspot.com/-7eOY6RsbVQ0/TfsqCsNCg0I/AAAAAAAAAno/y-bkegRUNiw/s1600/service_lifecycle.png" /></a>
</div>

* * *

#### Siguiente Tema: [Fundamentos programación Android: Limpieza de Procesos][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Fundamentos programación Android: Ciclo de vida de los componentes+http://elbauldelprogramador.com/fundamentos-programacion-android-ciclo/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/fundamentos-programacion-android-ciclo/&t=Fundamentos programación Android: Ciclo de vida de los componentes+http://elbauldelprogramador.com/fundamentos-programacion-android-ciclo/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Fundamentos programación Android: Ciclo de vida de los componentes+http://elbauldelprogramador.com/fundamentos-programacion-android-ciclo/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /fundamentos-programacion-android_18/
---
id: 227
title: 'Fundamentos programación Android: Actividades, Tareas, Procesos e Hilos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/fundamentos-programacion-android-actividades-tareas-procesos-e-hilos/
permalink: /fundamentos-programacion-android_17/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /fundamentos-programacion-android_17/
  - /fundamentos-programacion-android_17/
  - /fundamentos-programacion-android_17/
categories:
  - android
  - opensource
tags:
  - Actividades
  - android
  - curso android pdf
  - Fundamentos programación Android
  - Hilos
  - Procesos
  - Tareas
---
<div class="icodroid">
</div>

## Actividades y tareas

Las actividades conforme se van ejecutando van apilandose en una pila. Cuando finalizamos una actividad, con el método ***finish()*** o con la tecla atrás del teléfono, la actividad se extrae de la pila, quedando encima de la pila la actividad que se abrió anteriormente.

Si ejecutamos una actividad varias veces sin cerrarla, ésta aparecerá en la pila tantas veces como la hayamos ejecutado. La pila de actividades se envía al segundo plano cuando la aplicación pierde el foco, y vuelve al primer plano cuando la aplicación vuelve a tomar el control.

  
<!--more-->

Podemos modificar este comportamiento con ***flags*** que pasamos al objeto Intent a partir de las propiedades de la activity descritas en el [AndroidManifest][1]

Si una pila de tareas se abandona por el usuario durante un periodo de tiempo y el sistema necesita más recursos, se limpia la pila de actividades (excepto la actividad principal), este comportamiento se puede modificar en el manifiesto:



<table>
  <tr>
    <td>
      <b>Atributo</b>
    </td>
    
    <td>
      <b>Función</b>
    </td>
  </tr>
  
  <tr>
    <td>
      <i><b>alwaysRetainTaskState</b></i>
    </td>
    
    <td>
      Si vale true, se mantiene la pila aunque se abandone durante mucho tiempo
    </td>
  </tr>
  
  <tr>
    <td>
      <i><b>clearTaskOnLaunch</b></i>
    </td>
    
    <td>
      Si es true, se limpia la pila (excepto la actividad principal) cada vez que se lleve al segundo plano
    </td>
  </tr>
  
  <tr>
    <td>
      <b><i>finishOnTaskLaunch</i></b>
    </td>
    
    <td>
      Similar a la anterior, pero solo se aplica a la actividad con este atributo fijado a true.
    </td>
  </tr>
</table>



## Procesos e Hilos

Como cada aplicación se ejecuta en un proceso Linux distinto, todos los componentes y procesos de dicha aplicación corren en el mismo hilo. Esto se puede modificar con el atributo ***process*** de cada componente (activity, provider, receiver y service). En la etiqueta ***application*** del manifest podemos poner este atributo para que sea aplicado a todos sus elementos.

Para gestionar tareas pesadas podemos usar hilos para ejecutar dichas tareas en un hilo aparte (ejecutarlas en segundo plano). Para llevar a cabo esta operación usaremos el objeto ***Thread*** de java, aunque Android proporciona otros objetos para facilitar el trabajo, como ***Handler, AsyncTask o Looper.*** (entre otros).

* * *

#### Siguiente Tema: [Fundamentos programación Android: Ciclo de vida de los componentes][2] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Fundamentos programación Android: Actividades, Tareas, Procesos e Hilos+http://elbauldelprogramador.com/fundamentos-programacion-android_17/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/fundamentos-programacion-android_17/&t=Fundamentos programación Android: Actividades, Tareas, Procesos e Hilos+http://elbauldelprogramador.com/fundamentos-programacion-android_17/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Fundamentos programación Android: Actividades, Tareas, Procesos e Hilos+http://elbauldelprogramador.com/fundamentos-programacion-android_17/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://developer.android.com/guide/topics/manifest/manifest-intro.html
 [2]: /fundamentos-programacion-android-ciclo/
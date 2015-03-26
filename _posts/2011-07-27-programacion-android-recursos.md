---
id: 241
title: 'Programación Android: Recursos &#8211; Introducción'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-introduccion/
permalink: /programacion-android-recursos/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/07/programacion-android-recursos.html
  - /2011/07/programacion-android-recursos.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - recursos android
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Ya hemos visto que Android separa los recursos (imágenes, sonidos etc) del código colocándolos organizados dentro del directorio ***./res***. Esto nos facilita su mantenimiento, además de permitirnos usar diferentes recursos dependiendo de la configuración del terminal.

  
<!--more-->

Separar los recursos permite proporcionar alternativas para dar soporte a las distintas configuraciones de dispositivos, como idiomas o tamaños de pantalla. Para conseguir compatibilidad con las diferentes configuraciones, debemos organizar los recursos en el directorio ***./res*** de nuestros proyectos, dentro de subdirectorios para agruparlos por tipo y configuración.

Un recurso puede usarse por defecto (Se mostrará en cualquier dispositivo, independientemente de su configuración), o pueden especificarse recurosos alternativos (Que se mostrán en los dispositivos para configuraciones determinadas), veámoslo con unas imágenes de ejemplo:

Dos dispositivos distintos, usando recursos por defecto:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://4.bp.blogspot.com/-i4yy82wXUUw/TjApp4KaOZI/AAAAAAAAAs4/pvOrsmzXM24/s1600/resource_devices_diagram1.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img title="Recursos en Android" alt="Recursos en Android" border="0" height="130" width="400" src="http://4.bp.blogspot.com/-i4yy82wXUUw/TjApp4KaOZI/AAAAAAAAAs4/pvOrsmzXM24/s400/resource_devices_diagram1.png" /></a>
</div>

Dos dispositivos distintos, usando recursos alternativos:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://3.bp.blogspot.com/-gHivH4Mcffk/TjAp28O15AI/AAAAAAAAAtA/CbSojjJctp0/s1600/resource_devices_diagram2.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img title="Recursos en Android" alt="Recursos en Android" border="0" height="130" width="400" src="http://3.bp.blogspot.com/-gHivH4Mcffk/TjAp28O15AI/AAAAAAAAAtA/CbSojjJctp0/s400/resource_devices_diagram2.png" /></a>
</div>

Por ejemplo, podemos crear iconos más pequeños para que sean mostrados en los terminales con pantallas más pequeñas o diseñar una disposición de pantalla diferente para cuando la aplicación se esté ejecutando en modo apaisado, para conseguir esto, simplemente creamos una carpeta de recursos añadiendo el sufijo que indica la situación en la que debe usarse.

Para el caso del idioma, crearíamos un archivo xml con las cadenas traducidas a dicho idioma, en este caso inglés, y lo colocaríamos dentro de ***./res/values-en/strings.xml***. 

Para el caso del layout personalizado cuando la pantalla esté en modo apaisado, meteríamos nuestro layout dentro de ***res/layout-land/***

.

Para saber más acerca de los tipos de sufijos que se pueden usar, visita [Providing Resources en la página oficial de Android.][1]

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Usando recursos][2] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Introducción+http://elbauldelprogramador.com/programacion-android-recursos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos/&t=Programación Android: Recursos &#8211; Introducción+http://elbauldelprogramador.com/programacion-android-recursos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Introducción+http://elbauldelprogramador.com/programacion-android-recursos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://developer.android.com/guide/topics/resources/providing-resources.html
 [2]: /programacion-android-recursos-usando/
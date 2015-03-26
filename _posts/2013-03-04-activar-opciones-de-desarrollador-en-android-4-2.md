---
id: 1398
title: Cómo activar opciones de desarrollador en Android 4.2
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1398
permalink: /activar-opciones-de-desarrollador-en-android-4-2/
categories:
  - How To
tags:
  - android
  - android 4.2
  - desactivar Simular pantallas secundarias
  - modo ingeniero android
  - opciones de desarrollador android
  - opciones de desarrollo android
  - problema Simulate secondary displays
  - Simulate secondary displays
  - xda
---
Hace poco actualicé mi Samsung Galaxy S II (GT-I9100) a CyanogenMod 10.1 y me dí cuenta que las opciones de desarrollador en [Android][1] 4.2 no estaban donde siempre, en la configuración del teléfono. Así que buscando un poco encontré la respuesta. A fin de mejorar la experiencia del usuario, Google ha escondido por defecto esta opción.  
  
<!--more-->

  
Si quieres activarla has de ir a **Configuración » Acerca del teléfono » Número de compilación** (*Settings » About phone » Build number*) y pulsarlo siete veces.

Una vez activado, eché un vistazo a ver qué opciones nuevas había. Activé una llamada **Simular pantallas secundarias** (*Simulate secondary displays*) y el teléfono se quedó bloqueado. Reinicié y el teléfono había quedado en un bucle infinito en el proceso de inicio. Lo primero que pensé fue en volver a flashear la ROM. Pero una vez más buscando un poco por internet encontré una respuesta más adecuada, que no requería flashear. 

#### Desactivar la opción Simulate secondary displays (Simular pantallas secundarias)

La respuesta concretamente la encontré en el foro de [XDA][2]. Como sabía que el problema lo había causado la opción **Simular pantallas secundarias** bastaba con desactivarla para volver a la normalidad. Resulta que Android posee de un modo de *rescate o modo seguro* que se puede iniciar manteniendo pulsadas todas las teclas excepto el botón de encendido en el proceso de arranque:

<img src="http://elbauldelprogramador.com/content/uploads/2013/03/Screenshot_2013-03-03-13-48-30.png" alt="Safe Mode in Android o Modo rescate en Android" width="480" height="800" class="thumbnail aligncenter size-full wp-image-1399" />

Una vez en el modo rescate, desactivé la opción y problema resuelto.

#### Referencias

*New built-in developer options* **|** <a href="http://developer.android.com/about/versions/jelly-bean.html#42-dev-options" target="_blank">developer.android.com</a>  
*developer options disappear from settings* **|** <a href="http://stackoverflow.com/questions/13558969/developer-options-disappear-from-settings" target="_blank">stackOverflow</a>  
*&#091;Q&#93 Help! Messed with 'Simulate Secondary Display' settings!* **|** <a href="http://forum.xda-developers.com/showthread.php?t=2076180" target="_blank">forum.xda-developers</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo activar opciones de desarrollador en Android 4.2+http://elbauldelprogramador.com/activar-opciones-de-desarrollador-en-android-4-2/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/activar-opciones-de-desarrollador-en-android-4-2/&t=Cómo activar opciones de desarrollador en Android 4.2+http://elbauldelprogramador.com/activar-opciones-de-desarrollador-en-android-4-2/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo activar opciones de desarrollador en Android 4.2+http://elbauldelprogramador.com/activar-opciones-de-desarrollador-en-android-4-2/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /category/android
 [2]: /tag/xda
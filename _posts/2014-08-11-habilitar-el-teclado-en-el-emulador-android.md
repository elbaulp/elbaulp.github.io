---
id: 2419
title: Cómo habilitar el teclado en el emulador Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2419
permalink: /habilitar-el-teclado-en-el-emulador-android/
categories:
  - How To
tags:
  - habilitar el teclado en el emulador Android
  - hw.dPad=yes
  - hw.keyboard=yes
---
En ocasiones, al crear un emulador [Android][1], aún habiendo habilitado el soporte para teclado éste no funciona. Hoy veremos cómo habilitar el teclado en el emulador Android y, además, cómo habilitar la navegación mediante los cursores del teclado.

<!--more-->

## Habilitar el teclado en el emulador Android

Al crear un emulador, hemos de marcar las siguientes casillas:

<div id="attachment_2420" style="width: 482px" class="wp-caption aligncenter">
  <img src="http://elbauldelprogramador.com/content/uploads/2014/08/Cómo-habilitar-el-teclado-en-el-emulador-Android.png" alt="Cómo habilitar el teclado en el emulador Android" width="472" height="532" class="size-full wp-image-2420" />
  
  <p class="wp-caption-text">
    Crédito de la imagen, <a href="http://stackoverflow.com/users/204480/james-wald" title="Perfil en StackOverflow" target="_blank">James Wald</a> en StackOverflow
  </p>
</div>

Pero si ésto no funciona, debemos modificar el fichero de configuración del emulador. Normalmente éstos ficheros se encuentran en `~/.android/avd/<emulator-device-name>.avd/config.ini`. Una vez en el fichero, añadimos la línea `hw.keyboard=yes`. Guardamos y al iniciar el emulador deberemos poder escribir con el teclado.

### Habiliar teclado en todos los emuladores

Si dispones de muchos emuladores, es posible habilitar el teclado en todos ellos con:

<pre lang="bash">for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.keyboard=yes' >> "$f"; done
</pre>

## Habilitar la navegación con los cursores

De igual manera, pero esta vez hay que añadir `hw.dPad=yes` al fichero de configuración, para habilitarlo en todos los emuladores:

<pre lang="bash">for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.dPad=yes' >> "$f"; done
</pre>

#### Referencias

*Respuesta de James Wald a * **|** <a href="http://stackoverflow.com/a/11252510/1612432" target="_blank">Android emulator doesn't take keyboard input - SDK tools rev 20</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo habilitar el teclado en el emulador Android+http://elbauldelprogramador.com/habilitar-el-teclado-en-el-emulador-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/habilitar-el-teclado-en-el-emulador-android/&t=Cómo habilitar el teclado en el emulador Android+http://elbauldelprogramador.com/habilitar-el-teclado-en-el-emulador-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo habilitar el teclado en el emulador Android+http://elbauldelprogramador.com/habilitar-el-teclado-en-el-emulador-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/curso-programacion-android/ "Curso Programación Android"
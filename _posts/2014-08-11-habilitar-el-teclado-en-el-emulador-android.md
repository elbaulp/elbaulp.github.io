---
id: 2419
title: Cómo habilitar el teclado en el emulador Android

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
  <img src="/images/2014/08/Cómo-habilitar-el-teclado-en-el-emulador-Android.png" alt="Cómo habilitar el teclado en el emulador Android" width="472" height="532" class="size-full wp-image-2420" />
  
  <p class="wp-caption-text">
    Crédito de la imagen, <a href="http://stackoverflow.com/users/204480/james-wald" title="Perfil en StackOverflow" target="_blank">James Wald</a> en StackOverflow
  </p>
</div>

Pero si ésto no funciona, debemos modificar el fichero de configuración del emulador. Normalmente éstos ficheros se encuentran en `~/.android/avd/<emulator-device-name>.avd/config.ini`. Una vez en el fichero, añadimos la línea `hw.keyboard=yes`. Guardamos y al iniciar el emulador deberemos poder escribir con el teclado.

### Habiliar teclado en todos los emuladores

Si dispones de muchos emuladores, es posible habilitar el teclado en todos ellos con:

{% highlight bash %}for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.keyboard=yes' >> "$f"; done
{% endhighlight %}

## Habilitar la navegación con los cursores

De igual manera, pero esta vez hay que añadir `hw.dPad=yes` al fichero de configuración, para habilitarlo en todos los emuladores:

{% highlight bash %}for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.dPad=yes' >> "$f"; done
{% endhighlight %}

#### Referencias

*Respuesta de James Wald a * »» <a href="http://stackoverflow.com/a/11252510/1612432" target="_blank">Android emulator doesn't take keyboard input - SDK tools rev 20</a> 



 [1]: http://elbauldelprogramador.com/curso-programacion-android/ "Curso Programación Android"

{% include _toc.html %}

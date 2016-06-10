---
title: Cómo habilitar el teclado en el emulador Android

layout: post
permalink: /habilitar-el-teclado-en-el-emulador-android/
categories:
  - How To
tags:
  - habilitar el teclado en el emulador Android
  - hw.dPad=yes
  - hw.keyboard=yes
image: 2014/08/Cómo-habilitar-el-teclado-en-el-emulador-Android.png
description: "En ocasiones, al crear un emulador Android, aún habiendo habilitado el soporte para teclado éste no funciona. Hoy veremos cómo habilitar el teclado en el emulador Android y, además, cómo habilitar la navegación mediante los cursores del teclado."
modified: 2015-12-24T17:50
main-class: "android"
---
En ocasiones, al crear un emulador [Android][1], aún habiendo habilitado el soporte para teclado éste no funciona. Hoy veremos cómo habilitar el teclado en el emulador Android y, además, cómo habilitar la navegación mediante los cursores del teclado.

<!--ad-->

## Habilitar el teclado en el emulador Android

Al crear un emulador, hemos de marcar las siguientes casillas:

<figure>
  <a href="/assets/img/2014/08/Cómo-habilitar-el-teclado-en-el-emulador-Android.png"><img src="/assets/img/2014/08/Cómo-habilitar-el-teclado-en-el-emulador-Android.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
  <span class="image-credit">Crédito de la imagen: <a href="http://stackoverflow.com/users/204480/james-wald" title="Perfil en StackOverflow" target="_blank">James Wald</a> en StackOverflow</span>
</figure>

Pero si ésto no funciona, debemos modificar el fichero de configuración del emulador. Normalmente éstos ficheros se encuentran en `~/.android/avd/<emulator-device-name>.avd/config.ini`. Una vez en el fichero, añadimos la línea `hw.keyboard=yes`. Guardamos y al iniciar el emulador deberemos poder escribir con el teclado.

### Habiliar teclado en todos los emuladores

Si dispones de muchos emuladores, es posible habilitar el teclado en todos ellos con:

```bash
for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.keyboard=yes' >> "$f"; done

```

## Habilitar la navegación con los cursores

De igual manera, pero esta vez hay que añadir `hw.dPad=yes` al fichero de configuración, para habilitarlo en todos los emuladores:

```bash
for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.dPad=yes' >> "$f"; done

```

#### Referencias

*Respuesta de James Wald a * »» <a href="http://stackoverflow.com/a/11252510/1612432" target="_blank">Android emulator doesn't take keyboard input - SDK tools rev 20</a>

[1]: https://elbauldelprogramador.com/curso-programacion-android/ "Curso Programación Android"

{% include _toc.html %}

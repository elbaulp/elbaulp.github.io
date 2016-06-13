---
layout: post
title: "Cómo Cifar Un USB Con Veracrypt"
date: 2015-11-30T19:15:43+01:00
description: "Los USBs suelen llevarse siempre a mano, en los bolsillos, mochila etc, y en ocasiones pueden contener información sensible que no debería poder leer cualquiera. Por ello es buena idea llevarlo encriptado, ya sea por si se pierde o nos lo roban. Hoy veremos cómo podemos cifrar/encriptar nuestro usb con Veracrypt"
tags: [criptografía, usb, truecrypt, truecript, Veracrypt, cifrar usb]
image: Veracryptlogo.png
main-class: "articulos"
color: "#F57C00"
---

<figure>
  <img src="/assets/img/Veracryptlogo.png" title="{{ page.title }}" alt="{{ page.title }}" />
</figure>

{% include _toc.html %}

Los USBs suelen llevarse siempre a mano, en los bolsillos, mochila etc, y en ocasiones pueden contener información sensible que no debería poder leer cualquiera. Por ello es buena idea llevarlo encriptado, ya sea por si se pierde o nos lo roban. Hoy veremos cómo podemos cifrar/encriptar nuestro usb con _Veracrypt_.

<!--ad-->

## Descargar e instalar Veracrypt

El primer paso es dirigirnos a la <a href="https://veracrypt.codeplex.com/wikipage?title=Downloads" target="_blank" title="Veracr">web oficial</a> y descargarnos el programa para nuestro sistema operativo (Linux/Mac/Windows). Una vez instalado, lo ejecutamos y veremos la siguiente pantalla:

### Crear el usb cifrado

<figure>
  <a href="/assets/img/2.png"><img src="/assets/img/2.png" title="Crear un usb cifrado con veracrypt" alt="Crear un usb cifrado con veracrypt" /></a>
</figure>

A continuación se mostrarán una serie de pantallas, seguimos los pasos que aparecen en ellas:

### Seleccionar el tipo de volumen

<figure>
  <a href="/assets/img/3.png"><img src="/assets/img/3.png" title="Volumen estándar Veracrypt" alt="Volumen estándar Veracrypt" /></a>
</figure>

### Seleccionar el dispositivo

<figure>
  <a href="/assets/img/4.png"><img src="/assets/img/4.png" title="Selección del volumen a cifrar Veracrypt" alt="Selección del volumen a cifrar Veracrypt" /></a>
</figure>

### Tipos de cifrados

En el tipo de cifrado, podemos ejecutar un _benchmark_ para ver el rendimiento de cada uno, el más rápido es AES, pero si preferimos podemos elegir otros que fortifiquen la seguridad del dispositivo. A continuación se muestra el resultado de las pruebas:

<figure>
  <a href="/assets/img/bench.png"><img src="/assets/img/bench.png" title="Benchmark Veracrypt" alt="Benchmark Veracrypt" /></a>
</figure>

<figure>
  <a href="/assets/img/5.png"><img src="/assets/img/5.png" title="Tipo de cifrado Veracrypt" alt="Tipo de cifrado Veracrypt" /></a>
</figure>

### Establecer contraseña

A la hora de escoger la contraseña, es importante que sea fuerte y de más de 20 caractéres. Si es menor de este número, se recomienda establecer un PIM (_Personal Iterations Multiplier_)

<figure>
  <a href="/assets/img/8.png"><img src="/assets/img/8.png" title="Escoger contraseña  Veracrypt" alt="Escoger contraseña Veracrypt" /></a>
</figure>

### Seleccionar el sistema de ficheros

Ahora seleccionamos el tipo de sistema de ficheros que queremos. Se recomienda hacer un formateo completo en lugar de rápido. En mi caso marqué rápido porque ya lo había formateado previamente.

<figure>
  <a href="/assets/img/9.png"><img src="/assets/img/9.png" title="Pantalla principal Veracrypt" alt="Pantalla principal Veracrypt" /></a>
</figure>

### Soporte multiplataforma

Por último, si queremos usar el USB en otros sistemas, deberemos marcar la casilla adecuada.

<figure>
  <a href="/assets/img/10.png"><img src="/assets/img/10.png" title="Pantalla principal Veracrypt" alt="Pantalla principal Veracrypt" /></a>
</figure>

Ya solo queda pulsar el botón de formatear en la siguiente pantalla y esperar, puede tardar un poco y parecer que se ha quedado colgado, paciencia.

### Montar el USB

Una vez formateado, en la pantalla princpial de _Veracrypt_, seleccionamos un _slot_ en el que montar el dispositivo, introducimos nuestra contraseña y listo.

## Cifrar el usb usando la terminal

Para los que se sientan más cómodos usando la terminal, es posible instalar _Veracrypt_ sin interfaz gráfica y ejecutar el comando:

```bash

veracrypt -t -c /dev/dispositivo

```

Y seguir los pasos indicados, similares a los vistos arriba

<figure>
  <a href="/assets/img/cmdveracrypt.png"><img src="/assets/img/cmdveracrypt.png" title="Veracrypt en línea de comandos" alt="Veracrypt en línea de comandos" /></a>
</figure>

### Montar y desmontar el dispositivo mediante la línea de comandos

Para montar, basta ejecutar el comando

```bash

veracrypt /dev/dispositivo /ruta/a/montar

```

y para desmontar

```bash

veracrypt -d /dev/dispositivo

```

Listo, ya tenemos nuestro USB cifrado!

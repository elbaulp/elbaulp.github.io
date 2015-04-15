---
id: 167
title: Programa que envía mensajes desde Android a PC (Mejora II)

layout: post
guid: http://elbauldelprogramador.org/programa-que-envia-mensajes-desde-android-a-pc-mejora-ii/
permalink: /programa-que-envia-mensajes-desde_10/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
  
if_slider_image:
  - 
  - 
  - 
categories:
  - android
  - aplicaciones
  - opensource
tags:
  - curso android pdf
---
<img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Continúo con las mejoras a la aplicación que estoy desarrollando para Android, como dije en la [anterior mejora][1], necesitaba que varios clientes se puedan conectar al servidor, para ello he usado threads y la interface runnable de java.  
En esta versión tambien he controlado las excepciones producidas al no poder conectar al servidor o al solicitar conectarse a una dirección desconocida, estas excepciones las he controlado con Alerts de android, de las cuales hay dos tipos, Toast o Dialog.  
  
<!--more-->

Toast es el mensajito que aparece por un tiempo en la pantalla y con el cual no podemos interactuar (Como el que aparece al fijar una alarma y se muestra un mensaje diciendo el tiempo que queda para que suene.)  
  
Dialog es una ventana con la cual podemos intectactuar, es decir, que tiene botones.

Tengo que continuar haciendo mejoras, y buscando si lo que estoy haciendo en el código es correcto y que no sea una chapuza, aunque por ahora me funciona, si alguien sabe algo de java y quiere darme algún consejo, lo acepto encantado.

Dejo capturas y el nuevo código:

Toast:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://1.bp.blogspot.com/-bXEZr0Mqmbg/TaH0MF2N2CI/AAAAAAAAAZ4/-Pjv7xv7RMQ/s1600/Screenshot-1.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="256" width="320" src="http://1.bp.blogspot.com/-bXEZr0Mqmbg/TaH0MF2N2CI/AAAAAAAAAZ4/-Pjv7xv7RMQ/s320/Screenshot-1.png" /></a>
</div>

Servidor:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://3.bp.blogspot.com/-WvINTsXHJ7Y/TaH0MWvyqVI/AAAAAAAAAaA/QZVNJGX9qaw/s1600/Screenshot.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="256" width="320" src="http://3.bp.blogspot.com/-WvINTsXHJ7Y/TaH0MWvyqVI/AAAAAAAAAaA/QZVNJGX9qaw/s320/Screenshot.png" /></a>
</div>

Código cliente:



Para el servidor tengo dos clases, la principal, y otra que implementa Runnable para crear hilos y ocuparse de antender a cada cliente:

Clase servidor



Clase AtiendeConextion





 [1]: http://elbauldelprogramador.com/programa-que-envia-mensajes-desde/

{% include _toc.html %}

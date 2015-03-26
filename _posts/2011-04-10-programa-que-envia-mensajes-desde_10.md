---
id: 167
title: Programa que envía mensajes desde Android a PC (Mejora II)
author: Alejandro Alcalde
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
blogger_permalink:
  - /2011/04/programa-que-envia-mensajes-desde_10.html
  - /2011/04/programa-que-envia-mensajes-desde_10.html
  - /2011/04/programa-que-envia-mensajes-desde_10.html
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
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

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



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programa que envía mensajes desde Android a PC (Mejora II)+http://elbauldelprogramador.com/programa-que-envia-mensajes-desde_10/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programa-que-envia-mensajes-desde_10/&t=Programa que envía mensajes desde Android a PC (Mejora II)+http://elbauldelprogramador.com/programa-que-envia-mensajes-desde_10/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programa que envía mensajes desde Android a PC (Mejora II)+http://elbauldelprogramador.com/programa-que-envia-mensajes-desde_10/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/programa-que-envia-mensajes-desde/
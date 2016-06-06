---
id: 160
title: Programa que envía mensajes desde Android a PC

layout: post
guid: http://elbauldelprogramador.org/programa-que-envia-mensajes-desde-android-a-pc/
permalink: /programa-que-envia-mensajes-desde/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
  
categories:
  - android
  - aplicaciones
  - opensource
tags:
  - curso android pdf
main-class: dev
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />  
Hace poco tiempo empecé a seguir los [videotutoriales de Android][1], en parte porque estoy interesado en aprender a programar para android, y por otra parte porque necesito hacer un proyecto de fin de curso en el que me es imprescindible que se establezca una comunicación PC-Dispositivo Android.

Así que después de mucho buscar, encotré un programita en java que me iba a ser útil, concretamente este pequeño [chat][2] que encontré en CasiDiablo.  
<!--ad-->

A este código le hice algunas modificaciones en la parte del Cliente, y, finalmente conseguí que el dispositivo android enviara un mensaje y que el pc lo recibiera. Aún tengo que hacer algunas modificaciones porque tiene un pequeño problema, y es que, el cliente(El dispositivo android) se conecta y desconecta del server cada vez que envia un mensaje. 

Como prueba dejo dos capturas de pantalla, una realizando la conexión desde el emulador, y otra probandolo con mi móvil:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-NhzqkbbVSlI/TZSLKW_mJeI/AAAAAAAAAXs/fLJMMsGSYbI/s1600/Screenshot.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="128" width="320" src="https://2.bp.blogspot.com/-NhzqkbbVSlI/TZSLKW_mJeI/AAAAAAAAAXs/fLJMMsGSYbI/s320/Screenshot.png" /></a>
</div>



<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-IP60xZKxqEo/TZSMSDUnHcI/AAAAAAAAAX0/eXLpj7fD5PY/s1600/31032011045.jpg" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="240" width="320" src="https://2.bp.blogspot.com/-IP60xZKxqEo/TZSMSDUnHcI/AAAAAAAAAX0/eXLpj7fD5PY/s320/31032011045.jpg" /></a>
</div>



 [1]: https://elbauldelprogramador.com/video-tutorial-programacion-android/
 [2]: http://casidiablo.net/java-socket-chat-basico/

{% include _toc.html %}

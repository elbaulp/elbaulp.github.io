---
title: Programa que envía mensajes desde Android a PC
layout: post.amp
permalink: /programa-que-envia-mensajes-desde/
modified: 2016-09-04T22:30
categories:
  - android
  - aplicaciones
  - opensource
tags:
  - curso android pdf
main-class: "android"
color: "#689F38"
---

Hace poco tiempo empecé a seguir los [videotutoriales de Android][1], en parte porque estoy interesado en aprender a programar para android, y por otra parte porque necesito hacer un proyecto de fin de curso en el que me es imprescindible que se establezca una comunicación PC-Dispositivo Android.

Así que después de mucho buscar, encotré un programita en java que me iba a ser útil, concretamente este pequeño [chat][2] que encontré en CasiDiablo.

<!--ad-->

A este código le hice algunas modificaciones en la parte del Cliente, y, finalmente conseguí que el dispositivo android enviara un mensaje y que el pc lo recibiera. Aún tengo que hacer algunas modificaciones porque tiene un pequeño problema, y es que, el cliente(El dispositivo android) se conecta y desconecta del server cada vez que envia un mensaje.

Como prueba dejo dos capturas de pantalla, una realizando la conexión desde el emulador, y otra probandolo con mi móvil:

<figure>
	<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="640" width="1600" src="https://2.bp.blogspot.com/-NhzqkbbVSlI/TZSLKW_mJeI/AAAAAAAAAXs/fLJMMsGSYbI/s1600/Screenshot.png"></amp-img>
</figure>

<figure>
	<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="450" width="600" src="https://2.bp.blogspot.com/-IP60xZKxqEo/TZSMSDUnHcI/AAAAAAAAAX0/eXLpj7fD5PY/s320/31032011045.jpg"></amp-img>
</figure>

 [1]: /video-tutorial-programacion-android/
 [2]: http://casidiablo.net/java-socket-chat-basico/

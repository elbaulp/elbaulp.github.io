---
title: Añade Botón compartir en Diaspora en tu blog (BLOGGER)

layout: post
guid: http://elbauldelprogramador.org/anade-boton-compartir-en-diaspora-en-tu-blog-blogger/
permalink: /anade-boton-compartir-en-diaspora-en-tu/
categories:
  - curiosidades
  - internet
  - noticias
main-class: "articulos"
---
<div class="icodias">
</div>

Para los que no conozcan diaspora, hace tiempo que escribí una entrada sobre esta [Red social libre][1].

Ultimamente uso mucho esta red social, y estuve buscando para añadir un botón que compartiera directamente los post de mi blog en ella. Pero no lo encontré. Así que decidí crearme el mio propio, que ya podéis ver encima de los títulos de los post junto con los demás botones.

Es muy sencillo de agregar a nuestro sítio, simplemente colocamos este código en el lugar en el que queramos que aparezca:

```xml
<a expr:href='&quot;https://joindiaspora.com/bookmarklet?url=&quot; + data:post.url + &quot;&amp;title=&quot; + data:post.title' target='_blank'>
   <img alt='compartir en Diaspora*' height='32px' src='http://lh3.googleusercontent.com/-BtpsAHPELfY/TfzF4u54aoI/AAAAAAAAApA/BOgUWG9-sVk/s288/diaspora.png' title='compartir en Diaspora*' width='32px' />
</a>

```

Espero que os sirva de ayuda.



 [1]: /diaspora-la-red-social-libre

{% include _toc.html %}

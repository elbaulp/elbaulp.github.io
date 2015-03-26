---
id: 229
title: Añade Botón compartir en Diaspora en tu blog (BLOGGER)
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/anade-boton-compartir-en-diaspora-en-tu-blog-blogger/
permalink: /anade-boton-compartir-en-diaspora-en-tu/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/06/anade-boton-compartir-en-diaspora-en-tu.html
  - /2011/06/anade-boton-compartir-en-diaspora-en-tu.html
  - /2011/06/anade-boton-compartir-en-diaspora-en-tu.html
categories:
  - curiosidades
  - internet
  - noticias
---
<div class="icodias">
</div>

Para los que no conozcan diaspora, hace tiempo que escribí una entrada sobre esta [Red social libre][1].

Ultimamente uso mucho esta red social, y estuve buscando para añadir un botón que compartiera directamente los post de mi blog en ella. Pero no lo encontré. Así que decidí crearme el mio propio, que ya podéis ver encima de los títulos de los post junto con los demás botones.

Es muy sencillo de agregar a nuestro sítio, simplemente colocamos este código en el lugar en el que queramos que aparezca:

{% highlight xml %}><a expr:href='&quot;https://joindiaspora.com/bookmarklet?url=&quot; + data:post.url + &quot;&amp;title=&quot; + data:post.title' target='_blank'>
   <img alt='compartir en Diaspora*' height='32px' src='http://lh3.googleusercontent.com/-BtpsAHPELfY/TfzF4u54aoI/AAAAAAAAApA/BOgUWG9-sVk/s288/diaspora.png' title='compartir en Diaspora*' width='32px' />
</a>
{% endhighlight %}

Espero que os sirva de ayuda.



 [1]: /2011/01/diaspora-la-red-social-libre.html
---
id: 254
title: 'Programación Android: Recursos &#8211; Arrays de strings'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-arrays-de-strings/
permalink: /programacion-android-recursos-arrays-de/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/09/programacion-android-recursos-arrays-de.html
  - /2011/09/programacion-android-recursos-arrays-de.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Se pueden definir arrays de strings como recursos en cualquier archivo bajo el subdirectorio ./res/values. Para definirlos, usaremos un nodo XML llamado *string-array*. Este nodo es un hijo de *resources*, al igual que el nodo *string*. A continuación, vamos a ver como crear un array de strings:

  
<!--more-->

{% highlight xml %}>&lt;resources>
&lt;string -array name="test_array">
   &lt;item>uno&lt;/item>
   &lt;item>dos&lt;/item>
   &lt;item>tres&lt;/item>
&lt;/string>
&lt;/resources>
{% endhighlight %}

Una vez definido el recurso, podemos usarlo en el código Java de la siguiente manera:

{% highlight java %}>//Accedemos al objeto 'Recursos' desde la Activity
Resources res = nombre-de-la-actividad.getResources();
String strings[] = res.getStringArray(R.array.test_array);

//Mostramos el array
for (String s: strings)
   Log.d("ejemplo", s);
{% endhighlight %}

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Plurales][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Arrays de strings+http://elbauldelprogramador.com/programacion-android-recursos-arrays-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-arrays-de/&t=Programación Android: Recursos &#8211; Arrays de strings+http://elbauldelprogramador.com/programacion-android-recursos-arrays-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Arrays de strings+http://elbauldelprogramador.com/programacion-android-recursos-arrays-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-recursos-plurales/
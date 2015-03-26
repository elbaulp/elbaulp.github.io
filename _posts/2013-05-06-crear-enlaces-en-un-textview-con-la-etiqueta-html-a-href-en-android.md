---
id: 1546
title: 'Crear enlaces en un TextView con la etiqueta HTML &lt;a href en Android'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1546
permalink: /crear-enlaces-en-un-textview-con-la-etiqueta-html-a-href-en-android/
categories:
  - android
tags:
  - a href android xml
  - crear enlaces cadenas de texto android
  - etiqueta a href android
  - etiqueta a href string.xml
  - etiqueta a href TextView android
---
Para una aplicación que estoy haciendo, me hacía falta ser capaz de mostrar un enlace al usuario de forma similar al que se crean en las páginas webs con la etiqueta *<a href=&#8221;&#8221;></a>*. 

La cadena de texto con el enlace en cuestión reside en el archivo de recursos **[string.xml][1]**. En un principio pensé que me bastaría usar la propiedad `android:autoLink="web"` en el [layout.xml][2] de la siguiente forma:  
  
<!--more-->

  
***layout***:

<pre lang="xml">&lt;TextView
                <!-- .... -->
                android:autoLink="web"
                

<!-- .... --> />
</pre>

***string***:

<pre lang="xml">&lt;string name="aboutAuthor">Developed by <a href="http://elbauldelprogramador.com">Alejandro Alcalde.</a>&lt;/string>
</pre>

Pero la propiedad `autoLink="web"`, funciona únicamente cuando el texto al que hace referencia contiene explícitamente la dirección, es decir, con esta cadena de texto sí funcionaría:

<pre lang="xml">&lt;string name="aboutAuthor">Developed by http://elbauldelprogramador.com&lt;/string>
</pre>

Para conseguir hacer funcionar el primer ejemplo hay que hacer uso del método `setMovementMethod()` de la clase `TextView`:

<pre lang="java">final TextView author = (TextView) view.findViewById(R.id.tv_about_athor);
author.setMovementMethod(LinkMovementMethod.getInstance());
</pre>

Con el código anterior se consigue el comportamiento deseado:  
[<img src="http://elbauldelprogramador.com/content/uploads/2013/05/setMovementMethod-example-180x300.png" alt="enlaces en un textview android" width="180" height="300" class="aligncenter size-medium wp-image-1547" />][3]{.thumbnail}

Los dos primeros enlaces están creados con el método `setMovementMethod()`, los otros dos con `android:autoLink="web"`.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Crear enlaces en un TextView con la etiqueta HTML <a href en Android+http://elbauldelprogramador.com/crear-enlaces-en-un-textview-con-la-etiqueta-html-a-href-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/crear-enlaces-en-un-textview-con-la-etiqueta-html-a-href-en-android/&t=Crear enlaces en un TextView con la etiqueta HTML <a href en Android+http://elbauldelprogramador.com/crear-enlaces-en-un-textview-con-la-etiqueta-html-a-href-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Crear enlaces en un TextView con la etiqueta HTML <a href en Android+http://elbauldelprogramador.com/crear-enlaces-en-un-textview-con-la-etiqueta-html-a-href-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /opensource/programacion-android-recursos-strings/
 [2]: /opensource/programacion-android-recursos-layout/
 [3]: http://elbauldelprogramador.com/content/uploads/2013/05/setMovementMethod-example.png
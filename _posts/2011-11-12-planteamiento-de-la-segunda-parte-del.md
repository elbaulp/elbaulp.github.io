---
id: 277
title: Planteamiento de la segunda parte del curso de Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/planteamiento-de-la-segunda-parte-del-curso-de-android/
permalink: /planteamiento-de-la-segunda-parte-del/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/planteamiento-de-la-segunda-parte-del.html
  - /2011/11/planteamiento-de-la-segunda-parte-del.html
share_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
share_count:
  - 2
  - 2
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
[<img src="" id="logo" name="droid" class="icono" height="128px" width="128px" />][1]

Como <a target="_blank" href="/2011/11/terminada-la-primera-parte-del-manual.html">dije hace unos días</a>, la primera parte de Programación <a target="_blank" href="/search/label/android">Android</a> está terminada. [Ya está disponible para descargar][2]. En la segunda parte voy a explicar en detalle el funcionamiento de los proveedores de contenidos. Y también hablaré del <a target="_blank" href="http://developer.android.com/reference/android/os/StrictMode.html">StrictMode</a>, que básicamente es una herramienta para desarrolladores que nos avisa de cosas que puede que estemos haciendo sin darnos cuenta, como por ejemplo acceso a disco o red en el hilo principal de la aplicación.

A continuación dejo un índice del esquema que voy a seguir en esta segunda parte:



  * StrictMode
  * Introducción a los proveedores de contenidos.
  * Explorando los proveedores propios de Android.
  * Arquitectura de los proveedores de contenidos.
  * Implementando proveedores de contenidos
  * Usando proveedores de contenidos
  * Añadir registros
  * Eliminar registros
  * Obtener un recuento de los registros
  * Mostrar registros

<p class="alert">
  Esta vez, voy a intentar escribir más regularmente, para que no se haga tan larga como la primera parte. Espero que os esté sirviendo de ayuda el contenido de este curso, y de todo el blog en general.
</p>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Planteamiento de la segunda parte del curso de Android+http://elbauldelprogramador.com/planteamiento-de-la-segunda-parte-del/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/planteamiento-de-la-segunda-parte-del/&t=Planteamiento de la segunda parte del curso de Android+http://elbauldelprogramador.com/planteamiento-de-la-segunda-parte-del/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Planteamiento de la segunda parte del curso de Android+http://elbauldelprogramador.com/planteamiento-de-la-segunda-parte-del/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png
 [2]: /opensource/disponible-la-primera-parte-del-curso/
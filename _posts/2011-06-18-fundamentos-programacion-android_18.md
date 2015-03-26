---
id: 230
title: 'Fundamentos programación Android: Limpieza de Procesos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/fundamentos-programacion-android-limpieza-de-procesos/
permalink: /fundamentos-programacion-android_18/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /fundamentos-programacion-android_18/
  - /fundamentos-programacion-android_18/
  - /fundamentos-programacion-android_18/
fsb_social_twitter:
  - 0
fsb_social_facebook:
  - 0
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - Fundamentos programación Android
  - procesos android
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Android va destruyendo componentes inactivos para liberar memória, pero los elminia teniendo en cuenta cual es el de menor importancia:

  * Los primeros en ser elmininados son los procesos vacíos (Son aplicaciones cerradas que se mantienen en memoria para cargar rápidamente la aplicación la proxima vez que se abra.)
  * Procesos en segundo plano, estos son las aplicaciones que ya han ejecutado su método **onStop()**, Android confecciona una lista con los procesos en este estado y elimina en primer lugar el más antiguo.
  * Despues elminina los procesos de servicio. (si sigue necesitando más memoria.)
  * Si aún necesita más memoria, elimina los procesos pausados.
  * Si con esto sigue necesitando, finalmente elimina el proceso en primer plano.

Es muy importante implementar bien los métodos de estado, para evitar perden información.

* * *

#### Siguiente Tema: [Programación Android: Trabajar con actividades y pasar parámetros entre ellas][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Fundamentos programación Android: Limpieza de Procesos+http://elbauldelprogramador.com/fundamentos-programacion-android_18/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/fundamentos-programacion-android_18/&t=Fundamentos programación Android: Limpieza de Procesos+http://elbauldelprogramador.com/fundamentos-programacion-android_18/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Fundamentos programación Android: Limpieza de Procesos+http://elbauldelprogramador.com/fundamentos-programacion-android_18/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-trabajar-con/
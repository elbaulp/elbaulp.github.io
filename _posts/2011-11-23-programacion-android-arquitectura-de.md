---
id: 295
title: 'Programación Android: Arquitectura de los Proveedores de contenidos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-arquitectura-de-los-proveedores-de-contenidos/
permalink: /programacion-android-arquitectura-de/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/programacion-android-arquitectura-de.html
  - /2011/11/programacion-android-arquitectura-de.html
share_count:
  - 0
  - 0
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551788}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551788}'
share_data:
  - '[]'
  - '[]'
categories:
  - android
  - opensource
tags:
  - content provider
  - curso android pdf
  - 'Programación Android: Arquitectura de los Proveedores de contenidos'
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Vamos a examinar algunos de los elementos que componen los proveedores de contenidos(CV) y cómo éstos se relacionan con otras abstracciones de acceso a datos.

<pre class="brush: "></pre>

En conujunto, los CV tienen un enfoque paralelo a las siguientes abstracciones:

  * Sitios webs
  * [REST][1]
  * Servicios web
  * [Procedimientos Almacenados][2]

Cada CV de un dispositivo se registra a sí mismo de manera similar a como lo hace un sitio web con cadenas de texto (similar a los nombres de domínio, pero para los CV se llama *authority*). Esta cadena asenta las bases del conjunto de URIs que este CV puede ofrecer. No es diferente a como un sitio web con un dominio ofrece un conjunto de URls que muestran sus documentos o contenido en general.

  
<!--more-->

El registro de la authority se hace en el [androidManifest][3]. A continuación se muestran dos ejemplos de como se deben registrar proveedores (en este caso de la aplicación [FavSItes][4]):

<pre lang="xml">&lt;provider android:name=".SitesProvider"
   android:authorities="com.elbauldelprogramador.provider.FavSites" />
</pre>

Un authoroty es como un nombre de dominio para ese CV. Con el authority anterior, las urls de nuestro proveedor comenzarán con ese prefijo:

<pre>content://com.elbauldelprogramador.provider.FavSites</pre>

Como se ve, los CV, como los sitios web, tienen un nombre de dominio base que actúa como URL inicial.

Los CV también proporcionan URLs del tipo REST para recuperar o manipular datos. Para el registro que acabamos de ver, el URI para identificar un directorio o una colección de datos en la base de datos de FavSites será:

<pre>content://com.elbauldelprogramador.provider.FavSites/sites</pre>

Y para identificar un dato específico:

<pre>content://com.elbauldelprogramador.provider.FavSites/sites/#</pre>

Donde # es el id del dato específico, en el caso de la mi aplicación, un lugar en el mapa. A continuación algunos ejemplos de URIs que se aceptan:

<pre>content://media/internal/images
content://media/external/images
content://contacts/people
content://contacts/people/23
</pre>

<p class="alert">
  Nótese que estos CV (content://media y content://contacts) no tienen una estructura completa como los vistos más arriba. Se debe a que no son CV de terceros, son propios de Android y él es quién los controla.
</p>

* * *

#### Siguiente Tema: [Proveedores de Contenidos &#8211; Leer datos mediante URIs][5] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Arquitectura de los Proveedores de contenidos+http://elbauldelprogramador.com/programacion-android-arquitectura-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-arquitectura-de/&t=Programación Android: Arquitectura de los Proveedores de contenidos+http://elbauldelprogramador.com/programacion-android-arquitectura-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Arquitectura de los Proveedores de contenidos+http://elbauldelprogramador.com/programacion-android-arquitectura-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-proveedores-de/
 [2]: /plsql-procedimientos-y-funciones/
 [3]: /fundamentos-programacion-android_16/
 [4]: /search/?q=favsites
 [5]: /programacion-android-proveedores-de_28/
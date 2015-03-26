---
id: 321
title: 'Programación Android: Actualizar y borrar registros'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-actualizar-y-borrar-registros/
permalink: /programacion-android-actualizar-y/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/01/programacion-android-actualizar-y.html
  - /2012/01/programacion-android-actualizar-y.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551751}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551751}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - Actualizar y borrar registros
  - curso android pdf
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Vimos cómo [insertar registros y consultarlos][1], bien, pues actualizar y borrar registros es bastante sencillo. Realizar un [update][2] (Actualizar registros) es muy similar a hacer una inserción, en la cual los valores de la columna a modificar se pasan mediante un objeto [ContentResolver][1]. Abajo se muestra una sentencia para realizar dicho update:

  
<!--more-->

<pre lang="java">int numeroDeLineasActualizadas =
   activity.getContentResolver().update(
      Uri uri,
      ContentValues values, 
      String whereClause,
      String[] selectionArgs )
</pre>

El argumento *whereClause*, restringe la actualización a los registros de la BD que cumplan esa condición.

La sentencia para borrar registros es:

<pre lang="java">int numeroDeLineasBorradas =
   activity.getContentResolver().delete(
      Uri uri,
      String whereClause,
      String[] selectionArgs )
</pre>

Logicamente, el método *delete* no necesita un argumento que contenga el *ContentValues*.

Casi todas las llamadas que se hacen desde *managedQuery* y *ContentResolver* se dirigen a las clase *provider*. Saber cómo un proveedor implementa cada uno de estos métodos no dá suficientes pistas de cómo se usan dichos métodos. [En entradas posteriores][3], veremos cómo implementar desde cero un content provider.

* * *

#### Siguiente Tema: [Implementando un Content Provider (Parte 1)][4] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Actualizar y borrar registros+http://elbauldelprogramador.com/programacion-android-actualizar-y/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-actualizar-y/&t=Programación Android: Actualizar y borrar registros+http://elbauldelprogramador.com/programacion-android-actualizar-y/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Actualizar y borrar registros+http://elbauldelprogramador.com/programacion-android-actualizar-y/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /2011/12/programacion-android-insertando.html
 [2]: /2010/12/lenguaje-manipulacion-de-datos-dml.html
 [3]: /2012/01/programacion-android-implementando-un.html
 [4]: /programacion-android-implementando-un/
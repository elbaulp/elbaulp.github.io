---
id: 290
title: 'Programación Android: Proveedores de Contenido &#8211; Introducción'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-proveedores-de-contenido-introduccion/
permalink: /programacion-android-proveedores-de/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/programacion-android-proveedores-de.html
  - /2011/11/programacion-android-proveedores-de.html
share_count:
  - 0
  - 0
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551794}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551794}'
share_data:
  - '[]'
  - '[]'
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Android llama Proveedor de contenido a la abstracción de datos en Servícios. Digamos que un proveedor de contenido (CV a partir de ahora [de Content Provider]) es como un envoltorio para los datos. Una base de datos SQLite en un dispositivo Android es un ejemplo de fuente de datos (data source) que se encapsula en un CV.

Para recuperar datos de un cv o guardarlos en él, se necesitan usar un conjunto de Uris REST. Por ejemplo, si quisiéramos recuperar un conjunto de notas desde un cv que es una encapsulación de una base de datos de Notas, necesitaríamos usar una URI parecida a esta:

  
<!--more-->

<pre>content://com.android.note.NoteProvider/notes</pre>

<p class="alert">
  REST (REpresentational State Transfer). Es simplemente un concepto que, como usuarios de la web, casi todos estamos famirializados con él. Cuando introducimos una URL en el navegador y el servidor web responde con HTML, esencialmente estamos realizando una consulta basada en REST sobre el servidor web. De manera similar, cuando actualizamos algún contenido de un formulario web, estamos haciendo una actualización (update) basada en <a target="_blank" href="http://es.wikipedia.org/wiki/Representational_State_Transfer">REST</a> en el servidor web y cambiando su estado.
</p>

Para recuperar una nota específica de la base de datos de notas, (la nota 25 por ejemplo), se necistará una URI como la siguiente:

<pre>content://com.android.note.NoteProvider/notes/25</pre>

En futuras entradas veremos como estas Uris se traducen para usarse con los mecanismos de acceso a la base de datos. Cualquier aplicación del dispositivo puede usar estas URIs para acceder y manipular datos. Como consecuencia, los CV desempeñan un papel importante compartiendo datos entre aplicaciones.

Estrictamente hablando, la responsabilidad de los CV abarcan más mecanismos de encapsulación que el acceso a datos. Se necesitará un mecanismo de acceso a datos como por ejemplo SQLite o acceso a red para recibir datos.Debido a esto, La abstracción de los CV se requiere solamente si queremos compartir datos externamente o entre aplicaciones. Para el acceso interno a los datos, nuestra aplicación puede usar cualquier mecanismo de almacenamiento/acceso de datos de entre los siguientes:

  * ***Preferencias***: Es un conjunto de pares *clave/valor* que se usa para almacenar de manera persistente las preferencias de la aplicación.
  * ***Archivos:*** Archivos internos de la aplicación que podemos almacenar en un medio de almacenamiento extraible.
  * ***SQLite:*** Bases de datos SQLite, Cada una es privada al paquete que la crea.
  * ***Red:*** Un mecanismo que permite recibir o almacenar datos externamente a través de internet.

<p class="alert">
  A pesar de los numerosos mecanismos de acceso a datos permitidos en Android, en este <a href="/2011/11/planteamiento-de-la-segunda-parte-del.html">segundo tomo del Curso de programación Android</a>, me voy a centrar en SQlite y la abstracción del CV, ya que los CV componen la base del intercambio de datos, el cual es mucho más común en Android que en cualquier otro Framework.
</p>

* * *

#### Siguiente Tema: [Programación Android: Arquitectura de los Proveedore de contenidos][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Proveedores de Contenido &#8211; Introducción+http://elbauldelprogramador.com/programacion-android-proveedores-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-proveedores-de/&t=Programación Android: Proveedores de Contenido &#8211; Introducción+http://elbauldelprogramador.com/programacion-android-proveedores-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Proveedores de Contenido &#8211; Introducción+http://elbauldelprogramador.com/programacion-android-proveedores-de/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-arquitectura-de/
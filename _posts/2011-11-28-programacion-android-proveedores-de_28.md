---
id: 300
title: 'Programación Android: Proveedores de Contenidos &#8211; Leer datos mediante URIs'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-proveedores-de-contenidos-leer-datos-mediante-uris/
permalink: /programacion-android-proveedores-de_28/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/programacion-android-proveedores-de_28.html
  - /2011/11/programacion-android-proveedores-de_28.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551781}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551781}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - content provider
  - curso android pdf
  - Proveedores de Contenidos Android
  - URI
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Ya que las URIs definidas por un Proveedor de contenidos (CV) son únicas para ese proveedor, es muy importante que estas URIs estén bien documentadas. Los proveedores que Android proporciona hacen esto definiendo constantes que representan las cadenas de la URI.

Consideremos estas tres URIs definidas en el SDK de Android:

<pre>MediaStore.Images.Media.INTERNAL_CONTENT_URI
MediaStore.Images.Media.EXTERNAL_CONTENT_URI
Contacts.People.CONTENT_URI
</pre>

Sus URIs equivalentes serán como las siguientes:

<pre>content://media/internal/images
content://media/external/images
content://contacts/people
</pre>

  
<!--more-->

El proveedor *MediaStore* define dos URIs y *Contacts* uno. Si te das cuenta, las constantes están definidas usando esquema jerárquico. Por ejemplo, la URI de los contactos se señala como *Contacts.People.CONTENT_URI.* Esto se debe a que las bases de datos de contactos pueden tener muchas tablas para representar la entidad de un contacto. *People* es una de las tablas o colecciones. Cada entidad primaria de una base de datos puede llevar su propia URI de contenido.

<p class="alert">
  En <b><i>Contacts.Pople.CONTENT_URI</i></b>, Contacts es un paquete de java y People es una clase dentro de ese paquete. Hay que saber que Contacts y Contacts.People están obsoletos desde Android 2.0 y que ahora poseen nuevas URIs equivalentes que veremos más adelante. Sin embargo, para propositos educativos podemos seguir usandolos aunque estén obsoletos.
</p>

Dadas estas URIs, el código para recuperar una única fila del proveedor de contactos sería: 

<pre lang="java">Uri uriBase = Contacts.People.CONTENT_URI;
Uri uriPersona = Uri.withAppendedPath(Contacts.People.CONTENT_URI, "21");

//Consultamos el registro
//managedQuery es un método de la clase Activity
Cursor c = managedQuery(uriPersona, null, null, null);
</pre>

En este ejemplo, cogemos la uri base *Contacts.People.CONTENT_URI*, le añadimos un id de contacto y llamamos al método *managedQuery*.

En el método managedQuery podemos especificar el orden de los resultados, las columnas a seleccionar y una condición (en el ejemplo están a null.)

Vamos a ver ahora como crear un cursor que devuelva una lista de columnas de la tabla People del proveedor contatcs.

<pre lang="java">// Array que especifica la proyección (columnas a seleccionar)
String[] projection = new String[] {
   People._ID,
   People.NAME,
   People.NUMBER,
};

//obtenemos la URI base
Uri mContactsUri = Contacts.People.CONTENT_URI;

Cursor managedCursor = managedQuery(mContactsUri, 
                                    projection, // Qué columnas devolverá
                                    null,       // Cláusula where
                                    Contacts.People.NAME + " ASC"); //Clausula order by
</pre>

* * *

#### Siguiente Tema: [Usando cursores][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Proveedores de Contenidos &#8211; Leer datos mediante URIs+http://elbauldelprogramador.com/programacion-android-proveedores-de_28/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-proveedores-de_28/&t=Programación Android: Proveedores de Contenidos &#8211; Leer datos mediante URIs+http://elbauldelprogramador.com/programacion-android-proveedores-de_28/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Proveedores de Contenidos &#8211; Leer datos mediante URIs+http://elbauldelprogramador.com/programacion-android-proveedores-de_28/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-usando-cursores/
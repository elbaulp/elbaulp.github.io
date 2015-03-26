---
id: 306
title: 'Programación Android: Usando la cláusula Where'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-usando-la-clausula-where/
permalink: /programacion-android-usando-la-clausula/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/12/programacion-android-usando-la-clausula.html
  - /2011/12/programacion-android-usando-la-clausula.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551772}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551772}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - Cláusula where android
  - curso android pdf
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Los proveedores de conteido ofrecen dos formas de pasar una cláusula *[where][1]:*

  * A través de la URI
  * Combinando una cadena y un conjunto de argumentos string-array reemplazables.

En esta entrada vamos a ver ambas.

### Cláusula Where mediante la URI

Imaginemos que queremos recuperar un lugar (De la aplicación [FavSites][2]) cuyo id sea 23. Usaríamos el siguiente código:

  
<!--more-->

{% highlight java %}>Activity activity;
//... Inicializamos la actividad...
String siteUri = "content://com.elbauldelprogramador.provider.FavSites/sites/23";
Cursor managedCursor = activity.managedQuery( siteUri,
                                projection, //Columnas a devolver
                                null,       //Cláusula WHERE
                                null);      //Cláusula ORDER BY
{% endhighlight %}

En este ejemplo se ha dejado el argumento que hace referencia a la cláusula where a null ya que hemos especificado el ID del registro que queremos en la URI. En este caso el ID está embebido en la URI. Se usa la URI como vehículo para pasar la cláusula where. Esto se hace evidente cuando nos fijamos cómo se implementa el proveedor para los Sites de la aplicación, que corresponde al método query. A continuación un fragmento de código del método query:

{% highlight java %}>//Devuelve un id de sitio
//content://.../sites/23
int siteId = uri.getPathSegments().get(1);

queryBuilder.setTables(favSitesTableMetaData.TABLE_NAME);

queryBuilder.appendWhere(favSitesTableMEtaData._ID + "=" + siteId);
{% endhighlight %}

Como vemos la id del sitio se extrae de la URI. La Uri se divide en segmentos (path) del a forma content://&#8230;/seg1/seg2/seg3, en nuestro ejemplo el primer segmento es el id 23.

<p class="alert">
  Las clases Uri y UriMatcher se usan para identificar las URIs y extraer parámetros de ellas, más adelante las veremos. SQLiteQueryBuilder es una clase asistente en android.database.sqlite que permite construir consultas SQL que se ejecutarán por SQLiteDatabase en una instancia de una base de datos SQLite.
</p>

### Cláusulas where explícitas

Vamos a ver una vez más la estructura del método *managedQuery* de la clase Activity:

{% highlight java %}>public final Cursor managedQuery(Uri uri,
   String[] projection,
   String selection,
   String[] selectionArgs,
   String sortOrder)
{% endhighlight %}

El parámetro *selection*, es el que actúa como cláusula Where (Representa un filtro en el que elegimos qué filas queremos que se nos devuelvan). Si en este argumento pasamos *null* se nos devolverán todas las filas para la URI dada. En este parámetro podemos incluir ?, que serán reemplazados por los valores del parámetro *selectionArgs* en el orden que vayan apareciendo.

Los siguientes códigos que se muestran son equivalentes:

{% highlight java %}>//Método Uri
managedQuery("content://com.elbauldelprogramador.provider.FavSites/sites/23"
   ,null
   ,null
   ,null
   ,null);

//Método explícito
managedQuery("content://com.elbauldelprogramador.provider.FavSites/sites"
   ,null
   ,"_ID=?"
   ,new String[] {23}
   ,null);
{% endhighlight %}

Te preguntarás qué método usar en según que situación. Por convención se suele usar el método mediate URI cuando sea posible aplicarlo, y el explícito en casos especiales (Como en el ejemplo de arriba.)

* * *

#### Siguiente Tema: [Insertando registros][3] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Usando la cláusula Where+http://elbauldelprogramador.com/programacion-android-usando-la-clausula/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-usando-la-clausula/&t=Programación Android: Usando la cláusula Where+http://elbauldelprogramador.com/programacion-android-usando-la-clausula/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Usando la cláusula Where+http://elbauldelprogramador.com/programacion-android-usando-la-clausula/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /2011/01/consulta-de-datos-clausula-where.html
 [2]: /2011/10/prueba-la-aplicacion-favsites-en-tu.html
 [3]: /programacion-android-insertando/
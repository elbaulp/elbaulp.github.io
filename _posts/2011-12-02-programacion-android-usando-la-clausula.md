---
id: 306
title: 'Programación Android: Usando la cláusula Where'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-usando-la-clausula-where/
permalink: /programacion-android-usando-la-clausula/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
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
  <a href="/images/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Los proveedores de conteido ofrecen dos formas de pasar una cláusula *[where][1]:*

  * A través de la URI
  * Combinando una cadena y un conjunto de argumentos string-array reemplazables.

En esta entrada vamos a ver ambas.

### Cláusula Where mediante la URI

Imaginemos que queremos recuperar un lugar (De la aplicación [FavSites][2]) cuyo id sea 23. Usaríamos el siguiente código:

  
<!--more-->

{% highlight java %}Activity activity;
//... Inicializamos la actividad...
String siteUri = "content://com.elbauldelprogramador.provider.FavSites/sites/23";
Cursor managedCursor = activity.managedQuery( siteUri,
                                projection, //Columnas a devolver
                                null,       //Cláusula WHERE
                                null);      //Cláusula ORDER BY
{% endhighlight %}

En este ejemplo se ha dejado el argumento que hace referencia a la cláusula where a null ya que hemos especificado el ID del registro que queremos en la URI. En este caso el ID está embebido en la URI. Se usa la URI como vehículo para pasar la cláusula where. Esto se hace evidente cuando nos fijamos cómo se implementa el proveedor para los Sites de la aplicación, que corresponde al método query. A continuación un fragmento de código del método query:

{% highlight java %}//Devuelve un id de sitio
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

{% highlight java %}public final Cursor managedQuery(Uri uri,
   String[] projection,
   String selection,
   String[] selectionArgs,
   String sortOrder)
{% endhighlight %}

El parámetro *selection*, es el que actúa como cláusula Where (Representa un filtro en el que elegimos qué filas queremos que se nos devuelvan). Si en este argumento pasamos *null* se nos devolverán todas las filas para la URI dada. En este parámetro podemos incluir ?, que serán reemplazados por los valores del parámetro *selectionArgs* en el orden que vayan apareciendo.

Los siguientes códigos que se muestran son equivalentes:

{% highlight java %}//Método Uri
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





 [1]: /consulta-de-datos-clausula-where.html
 [2]: /prueba-la-aplicacion-favsites-en-tu.html
 [3]: /programacion-android-insertando/

{% include _toc.html %}

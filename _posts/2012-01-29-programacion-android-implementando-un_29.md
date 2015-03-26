---
id: 334
title: 'Programación Android: Implementando un Content Provider (Parte 4)'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-implementando-un-content-provider-parte-4/
permalink: /programacion-android-implementando-un_29/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/01/programacion-android-implementando-un_29.html
  - /2012/01/programacion-android-implementando-un_29.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551731}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551731}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - Content Provider Android
  - curso android pdf
---
<div class="separator" style="clear: both; text-align: center;">
  <img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />
</div>

En esta última parte de una serie de [4 artículos][1] en los que se ha ido explicando cómo implementar un [ContentProvider][2] desde cero, se va a ver cómo registrar dicho proveedor y cómo darle uso.

#### Registrar el proveedor

Para poder usar el proveedor es necesario registrarlo en el [AndroidManifest:][3]

{% highlight xml %}>&lt;provider android:name=".SitesProvider"
   android:authorities="com.elbauldelprogramador.provider.FavSites" />
{% endhighlight %}

  
<!--more-->

#### Añadir registros

{% highlight java %}>String tag = "Insertando registros...";
ContentValues cv = new ContentValues();

Log.d(tag,"Adding a site...");
      
cv.put(FavSitesProviderMetaData.favSitesTableMEtaData.NAME,
   "NombreSitio");
cv.put(FavSitesProviderMetaData.favSitesTableMEtaData.DESCRIPCION, 
   "Descripcion");
cv.put(FavSitesProviderMetaData.favSitesTableMEtaData.LONGITUD, 
   paquete.getInt("long"));
cv.put(FavSitesProviderMetaData.favSitesTableMEtaData.LATITUD, 
   paquete.getInt("lat")); 
  
ContentResolver cr = getContentResolver();      
Uri uri = FavSitesProviderMetaData.favSitesTableMEtaData.CONTENT_URI;

Log.d(tag,"site insert uri:" + uri);
Uri insertedUri = cr.insert(uri, cv);
Log.d(tag,"inserted uri:" + insertedUri);
{% endhighlight %}

#### Eliminar registros

{% highlight java %}>ContentResolver cr = getContentResolver();
Uri uri = FavSitesProviderMetaData.favSitesTableMEtaData.CONTENT_URI;

Log.d("Deleting site...","site delete uri:" + uri);
   cr.delete(uri, 
         "_ID=?", 
         new String[]{"5"});
{% endhighlight %}

#### Obtener el número de registros

Para realizar esto, debemos crear un [cursor][4] y contar el número de registros de este:

{% highlight java %}>Uri uri = FavSitesProviderMetaData.favSitesTableMEtaData.CONTENT_URI;
Cursor cur = managedQuery(uri,
                         null, // projection
                         null, // selection strings
                         null, // selection args array of strings
                         null);// sort order
int numeroRegistros = cur.getCount();
cur.close();
{% endhighlight %}

#### Mostrar la lista de sítios

Muestra todo el contenido de la tabla sites de la base de datos.

{% highlight java %}>/**
    * Función que imprime los resultados por el Log.
    */
   public void logOutput(Context context){
      //Salida por LOG.
      String tag = "Retrieve list of sites.";
      Uri uri = FavSitesProviderMetaData.favSitesTableMEtaData.CONTENT_URI;
      Activity a = (Activity) context;
      Cursor c = a.managedQuery(uri
                               ,null //projection
                               ,null //selection string
                               ,null //selection args array of string
                               ,null); //sort order
      
      int iname = c.getColumnIndex(
            FavSitesProviderMetaData.favSitesTableMEtaData.NAME);
      
      int iDesc = c.getColumnIndex(
            FavSitesProviderMetaData.favSitesTableMEtaData.DESCRIPCION);
      
      int iLat = c.getColumnIndex(
            FavSitesProviderMetaData.favSitesTableMEtaData.LATITUD);
      
      int iLong = c.getColumnIndex(
            FavSitesProviderMetaData.favSitesTableMEtaData.LONGITUD);
      
      int iFoto = c.getColumnIndex(
            FavSitesProviderMetaData.favSitesTableMEtaData.FOTO);
      
      //Informamos de los índices
      Log.d(tag, "name, description, latitude, long, photo: " 
            + iname + iDesc + iLat + iLong + iFoto);
      
      //Recorremos las filas basándonos en índices
      for(c.moveToFirst(); !c.isAfterLast();c.moveToNext()){
         //Recoger los valores
         String id = c.getString(0);
         String name = c.getString(iname);
         String desc = c.getString(iDesc);
         String lat = c.getString(iLat);
         String lon = c.getString(iLong);
         String foto = c.getString(iFoto);
         
         //informar
         StringBuffer cbuf = new StringBuffer(id);
         cbuf.append(",").append(name);
         cbuf.append(",").append(desc);
         cbuf.append(",").append(lat);
         cbuf.append(",").append(lon);
         cbuf.append(",").append(foto);
         Log.d(tag, cbuf.toString());
      }
      //Numero de registros
      int numberOfRecords = c.getCount();
      Log.d(tag, "Num of records: " + numberOfRecords);
      
      //cerrar el cursor
      c.close();
   }
{% endhighlight %}

Espero que este conjunto de cuatro artículos os haya servido de ayuda. En los próximos artículos veremos en profundidad los intents.

* * *

#### Siguiente Tema: [Intents &#8211; Conceptos básicos][5] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Implementando un Content Provider (Parte 4)+http://elbauldelprogramador.com/programacion-android-implementando-un_29/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-implementando-un_29/&t=Programación Android: Implementando un Content Provider (Parte 4)+http://elbauldelprogramador.com/programacion-android-implementando-un_29/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Implementando un Content Provider (Parte 4)+http://elbauldelprogramador.com/programacion-android-implementando-un_29/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /p/guia-de-desarrollo-android.html
 [2]: /2011/11/programacion-android-proveedores-de.html
 [3]: /fundamentos-programacion-android_16/
 [4]: /2011/02/plsql-cursores.html
 [5]: /programacion-android-intents-conceptos/
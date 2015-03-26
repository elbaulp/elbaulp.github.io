---
id: 328
title: 'Programación Android: Implementando un Content Provider (Parte 2)'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-implementando-un-content-provider-parte-2/
permalink: /programacion-android-implementando-un_08/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/01/programacion-android-implementando-un_08.html
  - /2012/01/programacion-android-implementando-un_08.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551739}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551739}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - Content Provider Android
  - curso android pdf
  - fundamentos sqlite android
---
<div class="separator" style="clear: both; text-align: center;">
  <img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />
</div>

En la anterior entrada de [programación Android][1], hablamos de cómo empezar a implementar un proveedor de contenido desde cero, empezando por el [planteamiento de la base de datos.][2] En esta entrada vamos a ver cómo extender de la clase ContentProvider.

Para implementar el content provider de la aplicación [FavSites][3] hemos de extender de la clase ContentProvider y sobreescribir *onCreate()* para crear la base de datos y después implementar los métodos query, insert, update, delete y getType. En esta segunda parte de cuatro en la que se explica cómo implementar un content provider desde cero, vamos a ver cómo configurar inicialmente en conten provider, en la siguente entrada se verá como implementar los métodos query, insert, update, delete y getType.

  
<!--more-->

El método query requiere el conjunto de columnas que tiene devolver. Es similar a una cláusula [select][4], que necesita los nombres de las columnas junto con sus homólogos, a veces llamados también sinónimos. Android usa un objeto *map* al que llama *projection map* para representar los nombres de columnas y sus sinónimos. Es necesario crear este objeto para poder usarlo posteriormente en la implementación del método query.

La mayoría de los métodos que se van a implementar reciben como parámetro una [URI][5]. Aunque a todas las URIs a las que este proveedor es capaz de responder empiezan de la misma forma, el final de dicha URI sí que puede ser diferente (Como cualquier sítio web). Cada URI, puede ser distinta al final para identificar datos o documentos:

<pre>content://com.elbauldelprogramador.provider.FavSites/sites
content://com.elbauldelprogramador.provider.FavSites/sites/64
</pre>

Dadas estas dos URIs, el proveedor de FavSites necesita distinguir cada una de ellas. Si, por ejemplo, nuestro proveedor usara más objetos a parte de lugares, entonces habría más URIs que identificaran cada objeto.

La implementación del proveedor necesita un mecanismo para distinguir una URI de otra, para hacerlo, Android usa una clase llamada *UriMatcher*. Por lo tanto, necesitamos configurar este objeto para todas nuestras variaciones de URIs. En el código este paso se realiza despues del segmento que crea el projection map (Estará comentado). [Más adelante comentaremos en detalle lo que hace esa porción de código][6].

El código que se muestra a continuación, sobreescribe el método onCreate() para crear la base de datos. Despues se implementan los métodos query, insert, update, delete y getType. Por razones de claridad del código, no voy a mostrar el código de estos métodos, ya que se explicarán en [entradas posteriores][6].

<pre lang="java">/**
FavSites for Android
    Copyright (C) 2011  Alejandro Alcalde Barros
    
This file is part of FavSites.

    FavSites is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FavSites is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FavSites.  If not, see &lt;http: //www.gnu.org/licenses/>.
*/

package com.elbauldelprogramador.favsites;

import java.sql.SQLException;
import java.util.HashMap;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;

import com.elbauldelprogramador.favsites.provider.FavSitesProviderMetaData;
import com.elbauldelprogramador.favsites.provider.FavSitesProviderMetaData.favSitesTableMEtaData;

public class SitesProvider extends ContentProvider{

   //Etiqueta ayuda para el loggeo. No tiene importancia para el cp.
   private static final String TAG = "SitesProvider";
   
   //Configurando el projection Map
   //El projection map es similar a "as" (alias de columna)
   private static HashMap&lt;string , String> sSitesProjectionMap;
   static{
      sSitesProjectionMap = new HashMap&lt;/string>&lt;string , String>();
      sSitesProjectionMap.put(favSitesTableMEtaData._ID,
                              favSitesTableMEtaData._ID);
      
      //nombre, desc, lati, long, foto
      sSitesProjectionMap.put(favSitesTableMEtaData.NAME,
                              favSitesTableMEtaData.NAME);
      sSitesProjectionMap.put(favSitesTableMEtaData.DESCRIPCION,
                              favSitesTableMEtaData.DESCRIPCION);
      sSitesProjectionMap.put(favSitesTableMEtaData.LATITUD,
                              favSitesTableMEtaData.LATITUD);
      sSitesProjectionMap.put(favSitesTableMEtaData.LONGITUD,
                              favSitesTableMEtaData.LONGITUD);
      sSitesProjectionMap.put(favSitesTableMEtaData.FOTO,
                              favSitesTableMEtaData.FOTO);
   }
   
   //Configuracion de las URIs
   //Propocionando un mecanismo para identificar
   //todos los patrones uri entrantes. (UriMatcher)
   private static final UriMatcher sUriMatcher;
   private static final int INCOMING_SITE_COLLECTION_URI_INDICATOR = 1;
   private static final int INCOMING_SINGLE_SITE_URI_INDICATOR = 2;
   static {
      sUriMatcher = new UriMatcher(UriMatcher.NO_MATCH);
      sUriMatcher.addURI(FavSitesProviderMetaData.AUTHORITY, "sites", 
                         INCOMING_SITE_COLLECTION_URI_INDICATOR);
      sUriMatcher.addURI(FavSitesProviderMetaData.AUTHORITY, "sites/#", 
                         INCOMING_SINGLE_SITE_URI_INDICATOR);
   }
   
   /**
    * Configurar/Crear la BD
    * Esta clase ayuda a abrir, crear y actualizar la bd
    */
   private static class DatabaseHelper extends SQLiteOpenHelper{
      
      DatabaseHelper(Context context){
         super(context,
             FavSitesProviderMetaData.DATABASE_NAME,
             null,
             FavSitesProviderMetaData.DATABASE_VERSION);
      }
      
      @Override
      public void onCreate(SQLiteDatabase db) {
         Log.d(TAG, "inner onCreate called");
         db.execSQL("CREATE TABLE " + favSitesTableMEtaData.TABLE_NAME + " ("
           + favSitesTableMEtaData._ID + " INTEGER PRIMARY KEY, "
           + favSitesTableMEtaData.NAME + " TEXT, "
           + favSitesTableMEtaData.DESCRIPCION + " TEXT, "
           + favSitesTableMEtaData.LATITUD + " REAL, "
           + favSitesTableMEtaData.LONGITUD + " REAL, "
           + favSitesTableMEtaData.FOTO + " TEXT"
           + ");");
      }

      @Override
      public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
         Log.d(TAG, "inner onUpgrade called");
         Log.w(TAG, "Upgrading database from version "
               + oldVersion + " to "
               + newVersion + ", wich will destroy all old data");
         db.execSQL("DROP TABLE IF EXISTS " 
                   + favSitesTableMEtaData.TABLE_NAME);
         onCreate(db);
      }
      
   }
   
   private DatabaseHelper mOpenHelper;
   
   @Override
   public int delete(Uri uri, String where, String[] whereArgs) {
      //...
   }

   @Override
   public String getType(Uri uri) {
      //...
   }

   @Override
   public Uri insert(Uri uri, ContentValues initialValues) {
      //...
   }

   @Override
   public boolean onCreate() {
      Log.d(TAG, "main onCreate Called");
      mOpenHelper = new DatabaseHelper(getContext());
      return true;
   }

   @Override
   public Cursor query(Uri uri, String[] projection, String selection,
         String[] selectionArgs, String sortOrder) {
      //...
   }

   @Override
   public int update(Uri uri, ContentValues values, String where,
         String[] whereArgs) {
      //...
   }

}
&lt;/string></pre>

* * *

#### Siguiente Tema: [Implementando un Content Provider (Parte 3)][7] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Implementando un Content Provider (Parte 2)+http://elbauldelprogramador.com/programacion-android-implementando-un_08/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-implementando-un_08/&t=Programación Android: Implementando un Content Provider (Parte 2)+http://elbauldelprogramador.com/programacion-android-implementando-un_08/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Implementando un Content Provider (Parte 2)+http://elbauldelprogramador.com/programacion-android-implementando-un_08/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
 [2]: /2012/01/programacion-android-implementando-un.html
 [3]: /2011/10/prueba-la-aplicacion-favsites-en-tu.html
 [4]: /2011/01/consulta-de-datos-clausula-select.html
 [5]: /2011/11/programacion-android-proveedores-de_28.html
 [6]: /2012/01/programacion-android-implementando-un_14.html
 [7]: /programacion-android-implementando-un_14/
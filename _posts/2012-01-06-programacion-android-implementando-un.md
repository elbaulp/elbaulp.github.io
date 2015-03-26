---
id: 325
title: 'Programación Android: Implementando un Content Provider (Parte 1)'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-implementando-un-content-provider-parte-1/
permalink: /programacion-android-implementando-un/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/01/programacion-android-implementando-un.html
  - /2012/01/programacion-android-implementando-un.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551743}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":1,"stumble":0,"pinit":0,"count":1,"time":1333551743}'
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
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Esta es la primera entrada de un total de 4 en la que se irán describiendo los pasos a dar para crear nuestro propio proveedor de contenidos.

Ya hemos visto cómo [interactuar con un Content provider][1], pero no hemos visto aún cómo escribir nuestro propio Content Provider. Para hacerlo, es necesario extender de *android.content.ContentProvider* e implementar los siguientes métodos:

  
<!--more-->

  * query
  * insert
  * update
  * delete
  * getType

También necesitamos configurar unas cuantas cosas antes de implementarlo. Los paso a seguir para implementarlo son los siguientes:



  1. Plantear nuestra [base de datos][2], [URIs][3], nombres de columnas y crear clases de metadatos que definirán constantes para todos estos elementos de metadatos.
  2. [Extender la clase abstracta ContentProvider][4].
  3. Implementar los métodos query, insert, update, delete y getType.
  4. Registrar el proveedor en el Android Manifest.

### Planteamiento de la base de datos

El siguiente planteamiento de la base de datos pertenece a la aplicación [FavSites][5], proyecto que realicé tiempo atrás y registrado bajo licencia [GPLv3][6]. Esta base de datos contiene una única tabla con las columnas nombre, descripción, latitud, longitud y foto. Estos nombres de columnas pasarán a formar parte de los metadatos en nuestra clase FavSitesProviderMetadata.

<pre lang="java">//FavSites for Android
//    Copyright (C) 2011  Alejandro Alcalde Barros
//    
//This file is part of FavSites.
//
//    FavSites is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//   FavSites is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with FavSites.  If not, see &lt;http: //www.gnu.org/licenses/>.


package com.elbauldelprogramador.favsites.provider;

import android.net.Uri;
import android.provider.BaseColumns;

/** 
 * @author Alejandro Alcalde
 * Definiciones necesarias para almacenar la información
 */
public class FavSitesProviderMetaData {
   
   public static final String AUTHORITY = "com.elbauldelprogramador.provider.FavSites";
   
   public static final String DATABASE_NAME = "favsites.db";
   public static final int DATABASE_VERSION = 1;
   public static final String FAVSITES_TABLE_NAME = "favSites";
   
   private FavSitesProviderMetaData() {}
   
   /**
    * Clase interna para describit la tabla favSites
    */
   public static final class favSitesTableMEtaData implements BaseColumns{
      
      private favSitesTableMEtaData() {}
      
      public static final String TABLE_NAME = "favSites";
      
      /**
       * DEfinición del Content URI y MIMEs
       */
      public static final Uri CONTENT_URI
              = Uri.parse("content://" + AUTHORITY + "/sites");

      public static final String CONTENT_TYPE 
               = "vnd.android.cursor.dir/vnd.favsites.site";
      
      public static final String CONTENT_ITEM_TYPE 
               = "vnd.android.cursor.item/vnd.favsites.site";
      /**
       * Orden por defecto de la tabla
       */
      public static final String DEFAULT_SORT_ORDER = "_ID DESC";
      
      /**
       * Orden personalizado
       */
      public static final String SORT_BY_NAME_DESC = "name DESC";
      public static final String SORT_BY_NAME_ASC = "name ASC";

      //Columnas propias
      
      /**
       * Nombre del sitio
       * Type: TEXT
       */
      public static final String NAME = "name";

      /**
       * Descripcion del sitio
       * Type: TEXT
       */
      public static final String DESCRIPCION = "descripcion";

      /**
       * LATIDTUD
       * Type: INTEGER (long)
       */
      public static final String LATITUD = "latitud";
      
      /**
       * LONGITUD
       * Type: INTEGER (long)
       */
      public static final String LONGITUD = "longitud";

      /**
       * Fotografia del sitio
       * Type: TEXT
       */
      public static final String FOTO = "foto";
   }

}

</pre>

Esta clase *FavSitesProviderMetaData* comienza definiendo que su authority será *com.elbauldelprogramador.provider.FavSites*. Usaremos esta cadena de texto para registrar el proveedor en el Android Manifest. Esta cadena forma la parte principal de la URI de este proveedor.

Despues procedemos a definir una tabla (favSites) como una clase interna de *FavSitesProviderMetaData*. Posteriormente, la clase *favSitesTableMEtaData* define una URI para identificar las colecciones de sítios. Dada la authority del párrafo anterior, la URI para una colección de sítios será como la siguiente:

<pre>content://com.elbauldelprogramador.provider.FavSites/sites</pre>

La constante que se refiere a esta URI es:

<pre>FavSitesProviderMetaData.favSitesTableMEtaData.CONTENT_URI</pre>

La clase *favSitesTableMEtaData* define los MIME types para una colección de sitios y de un único sítio. La implementación del proveedor usará estas constantes para devolver los MIME types para las URIs entrantes.

*favSitesTableMEtaData* también declara un conjunto de columnas: nombre, descripción, latitud, longitud y foto.

<p class="alert">
  Es aconsejable describir los tipos de datos que poseen las columnas mediante comentarios.
</p>

Además, la clase *favSitesTableMEtaData* hereda de la clase *BaseColumns*, la cual proporciona el campo estandar *_ID*, que representa el identificador de la fila. Con todas estas definiciones de metadatos, estamos listos para continuar con la implementación de nuestro proveedor.

* * *

#### Siguiente Tema: [Implementando un Content Provider (Parte 2)][7] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Implementando un Content Provider (Parte 1)+http://elbauldelprogramador.com/programacion-android-implementando-un/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-implementando-un/&t=Programación Android: Implementando un Content Provider (Parte 1)+http://elbauldelprogramador.com/programacion-android-implementando-un/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Implementando un Content Provider (Parte 1)+http://elbauldelprogramador.com/programacion-android-implementando-un/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /2012/01/programacion-android-actualizar-y.html
 [2]: /p/bases-de-datos.html
 [3]: /2011/11/programacion-android-proveedores-de_28.html
 [4]: /2012/01/programacion-android-implementando-un_08.html
 [5]: /2011/10/prueba-la-aplicacion-favsites-en-tu.html
 [6]: /2012/01/evaluando-el-estado-de-la-licencia-gpl.html
 [7]: /programacion-android-implementando-un_08/
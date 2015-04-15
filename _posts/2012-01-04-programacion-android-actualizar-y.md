---
id: 321
title: 'Programación Android: Actualizar y borrar registros'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-actualizar-y-borrar-registros/
permalink: /programacion-android-actualizar-y/
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
  <a href="/images/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Vimos cómo [insertar registros y consultarlos][1], bien, pues actualizar y borrar registros es bastante sencillo. Realizar un [update][2] (Actualizar registros) es muy similar a hacer una inserción, en la cual los valores de la columna a modificar se pasan mediante un objeto [ContentResolver][1]. Abajo se muestra una sentencia para realizar dicho update:

  
<!--more-->

{% highlight java %}int numeroDeLineasActualizadas =
   activity.getContentResolver().update(
      Uri uri,
      ContentValues values, 
      String whereClause,
      String[] selectionArgs )
{% endhighlight %}

El argumento *whereClause*, restringe la actualización a los registros de la BD que cumplan esa condición.

La sentencia para borrar registros es:

{% highlight java %}int numeroDeLineasBorradas =
   activity.getContentResolver().delete(
      Uri uri,
      String whereClause,
      String[] selectionArgs )
{% endhighlight %}

Logicamente, el método *delete* no necesita un argumento que contenga el *ContentValues*.

Casi todas las llamadas que se hacen desde *managedQuery* y *ContentResolver* se dirigen a las clase *provider*. Saber cómo un proveedor implementa cada uno de estos métodos no dá suficientes pistas de cómo se usan dichos métodos. [En entradas posteriores][3], veremos cómo implementar desde cero un content provider.

* * *

#### Siguiente Tema: [Implementando un Content Provider (Parte 1)][4] {.referencia}





 [1]: /2011/12/programacion-android-insertando.html
 [2]: /2010/12/lenguaje-manipulacion-de-datos-dml.html
 [3]: /2012/01/programacion-android-implementando-un.html
 [4]: /programacion-android-implementando-un/

{% include _toc.html %}

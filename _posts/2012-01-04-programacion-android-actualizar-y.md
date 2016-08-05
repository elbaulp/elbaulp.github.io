---
title: 'Programación Android: Actualizar y borrar registros'

layout: post.amp
permalink: /programacion-android-actualizar-y/
categories:
  - android
  - opensource
tags:
  - Actualizar y borrar registros
  - curso android pdf
main-class: "android"
color: "#689F38"
---
<div class="separator" style="clear: both; text-align: center;">
<a href="/assets/img/2013/07/iconoAndroid.png"  style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" width="128px" height="128px" /></a>
</div>

Vimos cómo [insertar registros y consultarlos][1], bien, pues actualizar y borrar registros es bastante sencillo. Realizar un [update][2] (Actualizar registros) es muy similar a hacer una inserción, en la cual los valores de la columna a modificar se pasan mediante un objeto [ContentResolver][1]. Abajo se muestra una sentencia para realizar dicho update:


<!--ad-->

```java
int numeroDeLineasActualizadas =
   activity.getContentResolver().update(
      Uri uri,
      ContentValues values,
      String whereClause,
      String[] selectionArgs )

```

El argumento *whereClause*, restringe la actualización a los registros de la BD que cumplan esa condición.

La sentencia para borrar registros es:

```java
int numeroDeLineasBorradas =
   activity.getContentResolver().delete(
      Uri uri,
      String whereClause,
      String[] selectionArgs )

```

Logicamente, el método *delete* no necesita un argumento que contenga el *ContentValues*.

Casi todas las llamadas que se hacen desde *managedQuery* y *ContentResolver* se dirigen a las clase *provider*. Saber cómo un proveedor implementa cada uno de estos métodos no dá suficientes pistas de cómo se usan dichos métodos. [En entradas posteriores][3], veremos cómo implementar desde cero un content provider.

* * *

#### Siguiente Tema: [Implementando un Content Provider (Parte 1)][4] {.referencia}





 [1]: /programacion-android-insertando
 [2]: /lenguaje-manipulacion-de-datos-dml
 [3]: /programacion-android-implementando-un
 [4]: /programacion-android-implementando-un/

{% include toc.html %}

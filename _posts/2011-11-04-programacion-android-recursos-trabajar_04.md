---
id: 268
title: 'Programación Android: Recursos &#8211; Trabajar con recursos Assets'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-trabajar-con-recursos-assets/
permalink: /programacion-android-recursos-trabajar_04/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
categories:
  - android
  - opensource
tags:
  - curso android pdf
main-class: dev
---
<img id="logo" name="droid" class="icono" width="128px" height="128px" />

Android ofrece más de un directorio en el que guardar ficheros que se incluirán en el paquete.: ***/assets***. Está en el mismo nivel que el directorio ***/res***, lo que significa que no es parte de los subdirectorios del mismo. A los archivos colocados en en el directorio ***/assets*** no se les generan IDs en R.java. Somos nosotros los que debemos especificar la ruta para leerlo. La ruta al fichero es una ruta relativa que comienza con ***/assets***. Debemos usar la calse ***AssetManager*** para acceder a estos ficheros, como se muestra en el código de abajo:

  
<!--ad-->

```java
String getStringFromAssetFile(Context activity)
   throws IOException
   {
       AssetManager am = activity.getAssets();
       InputStream is = am.open("test.txt");
       String s = convertStreamToString(is);
       is.close();
       return s;
   }

```

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Repasando la estructura del directorio de recursos][1] {.referencia}





 [1]: /programacion-android-recursos-repasando/

{% include _toc.html %}

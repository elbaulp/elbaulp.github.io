---
id: 277
title: Planteamiento de la segunda parte del curso de Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/planteamiento-de-la-segunda-parte-del-curso-de-android/
permalink: /planteamiento-de-la-segunda-parte-del/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/planteamiento-de-la-segunda-parte-del.html
  - /2011/11/planteamiento-de-la-segunda-parte-del.html
share_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333549441}'
share_count:
  - 2
  - 2
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
[<img src="" id="logo" name="droid" class="icono" height="128px" width="128px" />][1]

Como <a target="_blank" href="/2011/11/terminada-la-primera-parte-del-manual.html">dije hace unos días</a>, la primera parte de Programación <a target="_blank" href="/search/label/android">Android</a> está terminada. [Ya está disponible para descargar][2]. En la segunda parte voy a explicar en detalle el funcionamiento de los proveedores de contenidos. Y también hablaré del <a target="_blank" href="http://developer.android.com/reference/android/os/StrictMode.html">StrictMode</a>, que básicamente es una herramienta para desarrolladores que nos avisa de cosas que puede que estemos haciendo sin darnos cuenta, como por ejemplo acceso a disco o red en el hilo principal de la aplicación.

A continuación dejo un índice del esquema que voy a seguir en esta segunda parte:



  * StrictMode
  * Introducción a los proveedores de contenidos.
  * Explorando los proveedores propios de Android.
  * Arquitectura de los proveedores de contenidos.
  * Implementando proveedores de contenidos
  * Usando proveedores de contenidos
  * Añadir registros
  * Eliminar registros
  * Obtener un recuento de los registros
  * Mostrar registros

<p class="alert">
  Esta vez, voy a intentar escribir más regularmente, para que no se haga tan larga como la primera parte. Espero que os esté sirviendo de ayuda el contenido de este curso, y de todo el blog en general.
</p>



 [1]: http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png
 [2]: /opensource/disponible-la-primera-parte-del-curso/
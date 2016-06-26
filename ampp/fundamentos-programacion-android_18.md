---
title: 'Fundamentos programación Android: Limpieza de Procesos'

layout: post.amp

categories:
  - android
  - opensource
tags:
  - curso android pdf
  - Fundamentos programación Android
  - procesos android
main-class: "android"
color: "#689F38"
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Android va destruyendo componentes inactivos para liberar memória, pero los elminia teniendo en cuenta cual es el de menor importancia:

  * Los primeros en ser elmininados son los procesos vacíos (Son aplicaciones cerradas que se mantienen en memoria para cargar rápidamente la aplicación la proxima vez que se abra.)
  * Procesos en segundo plano, estos son las aplicaciones que ya han ejecutado su método **onStop()**, Android confecciona una lista con los procesos en este estado y elimina en primer lugar el más antiguo.
  * Despues elminina los procesos de servicio. (si sigue necesitando más memoria.)
  * Si aún necesita más memoria, elimina los procesos pausados.
  * Si con esto sigue necesitando, finalmente elimina el proceso en primer plano.

Es muy importante implementar bien los métodos de estado, para evitar perden información.

* * *

#### Siguiente Tema: [Programación Android: Trabajar con actividades y pasar parámetros entre ellas][1] {.referencia}





 [1]: /programacion-android-trabajar-con/

{% include toc.html %}

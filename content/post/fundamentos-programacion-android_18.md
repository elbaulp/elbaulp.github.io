---
title: 'Fundamentos programación Android: Limpieza de Procesos'
modified: 2016-09-17T09:15
layout: post.amp
permalink: /fundamentos-programacion-android_18/
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

Android va destruyendo componentes inactivos para liberar memória, pero los elminia teniendo en cuenta cual es el de menor importancia:

  * Los primeros en ser elmininados son los procesos vacíos (Son aplicaciones cerradas que se mantienen en memoria para cargar rápidamente la aplicación la proxima vez que se abra.)
  * Procesos en segundo plano, estos son las aplicaciones que ya han ejecutado su método **onStop()**, Android confecciona una lista con los procesos en este estado y elimina en primer lugar el más antiguo.
  * Despues elminina los procesos de servicio. (si sigue necesitando más memoria.)
  * Si aún necesita más memoria, elimina los procesos pausados.
  * Si con esto sigue necesitando, finalmente elimina el proceso en primer plano.

<!--ad-->

Es muy importante implementar bien los métodos de estado, para evitar perden información.

## Siguiente Tema: [Programación Android: Trabajar con actividades y pasar parámetros entre ellas][1] 

 [1]: https://elbauldelprogramador.com/programacion-android-trabajar-con/

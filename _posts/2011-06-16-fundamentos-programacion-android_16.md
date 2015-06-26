---
id: 226
title: 'Fundamentos programación Android: Intents y AndroidManifest'

layout: post
guid: http://elbauldelprogramador.org/fundamentos-programacion-android-intents-y-androidmanifest/
permalink: /fundamentos-programacion-android_16/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  - /fundamentos-programacion-android_16/
  - /fundamentos-programacion-android_16/
  - /fundamentos-programacion-android_16/
categories:
  - android
  - opensource
tags:
  - androidmanifest android
  - curso android pdf
  - intents android
  - startactivityforresult android example
---
<img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

## Intents

Las Actividades, Servicios y BroadcastReceiver se activan a través de mensajes asíncronos llamados ***intent***

***Un intent es un objeto que contiene todos los datos del mensaje.***

Hay tres métodos para activar cada uno de los componentes:

  
<!--ad-->

  * Las actividades se muestran pasando un Intent al método ***Context.startActivity()*** o ***Activity.startActivityForResult()***. Una vez lanzada la actividad, dentro de la misma podemos abrir el objeto Intent para obtener los parámetros usando el método ***getIntent()***
  * Para lanzar servicios o interactuar con ellos pasaremos el intent al método ***Context.startService()***. Para analizar el Intent dentro del proceso usaremos ***onBind().***
  * Para pasar los intents a un mensaje de difusión debemos pasar el Intent al método ***Context.sendBroadcast()***, ***Context.sendOrderedBroadcast()*** o ***Context.sendStickyBroadcast()***, así el intent se entregará a todas las clases ***BroadcastReceiver*** que estén escuchando, y podrán analizarlo con ***onReceive().***

## AndroidManifest

Para poder usar un componente, además de crearlo extendiendo de su clase correspondiente, es necesario definirlo en el ***AndroidManifest.xml***. Este archivo podemos editarlo directamente como XML, o con el formulario que nos facilita eclipse.

Cada componente tiene su propia etiqueta xml:

  * <activity>: Para actividades.</activity>
  * <service>: Para servicios.</service>
  * <receiver>: Para receptores de mensajes de difusión.</receiver>
  * <provider>: Para proveedores de contenidos.</provider>
  * <intent -filter>: Para categorizar componentes, así cuando se les llame no hay que saber el nombre del intent, android lo elige basandose en su categoría y parámetros.</intent>



* * *

#### Siguiente Tema: [Fundamentos programación Android: Actividades, Tareas, Procesos e Hilos][1] {.referencia}





 [1]: /fundamentos-programacion-android_17/

{% include _toc.html %}

---
id: 226
title: 'Fundamentos programación Android: Intents y AndroidManifest'
author: Alejandro Alcalde
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
blogger_permalink:
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
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

## Intents

Las Actividades, Servicios y BroadcastReceiver se activan a través de mensajes asíncronos llamados ***intent***

***Un intent es un objeto que contiene todos los datos del mensaje.***

Hay tres métodos para activar cada uno de los componentes:

  
<!--more-->

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



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Fundamentos programación Android: Intents y AndroidManifest+http://elbauldelprogramador.com/fundamentos-programacion-android_16/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/fundamentos-programacion-android_16/&t=Fundamentos programación Android: Intents y AndroidManifest+http://elbauldelprogramador.com/fundamentos-programacion-android_16/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Fundamentos programación Android: Intents y AndroidManifest+http://elbauldelprogramador.com/fundamentos-programacion-android_16/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /fundamentos-programacion-android_17/
---
id: 2276
title: Eliminar la pila de actividades (Back Stack) en Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2276
permalink: /eliminar-la-pila-de-actividades-back-stack-en-android/
categories:
  - android
tags:
  - CUSL
  - eliminar actividades de la pila Android
  - eliminar activities back stack
  - swadroid
---
El concurso universitario de software libre sigue en marcha, como dije participo en <a href="https://play.google.com/store/apps/details?id=es.ugr.swad.swadroid" title="Swadroid Play Store" target="_blank">SWADROID</a>. La última implementación que se hizo era añadir una opción para cerrar sesión. Pero nos dimos cuenta que si el usuario cerraba sesión desde alguna [activity][1] distinta de la princial, no se mostraba la pantalla de login, si no la activity en la que estuviera en el momento de cerrar sesión. Por supuesto, esto no es el comportamiento deseado, lo ideal sería que al cerrar sesión se muestre la pantalla de login independientemente de dónde se encuentre el usuario. Hoy veremos cómo eliminar la pila de actividades de una aplicación Android para obtener este comportamiento.

<!--more-->

Como es habitual, en stackoverflow se encontraba la respuesta, es tan sencillo como crear un [intent][2] con dos **flags**, *<a href="http://developer.android.com/reference/android/content/Intent.html#FLAG_ACTIVITY_SINGLE_TOP" title="Referencia" target="_blank">FLAG_ACTIVITY_SINGLE_TOP</a>* para no lanzar un activity si ya se está ejecutando encima de la pila y *<a href="http://developer.android.com/reference/android/content/Intent.html#FLAG_ACTIVITY_CLEAR_TOP" title="Referencia" target="_blank">FLAG_ACTIVITY_CLEAR_TOP</a>*, que tal y como indica la documentación:

> If set, and the activity being launched is already running in the current task, then instead of launching a new instance of that activity, all of the other activities on top of it will be closed and this Intent will be delivered to the (now on top) old activity as a new Intent. 

Es decir, si la actividad que se lanza con el intent ya está en la pila de actividades, en lugar de lanzar una nueva instancia de dicha actividad, el resto de activities en la pila serán cerradas y se resolverá el intent por la actividad a la que se llamó.

Por ejemplo, si la pila contiene las activities A, B, C, D. Si D llama a `startActivity()` con un intent para B, entonces C y D serán finalizadas y B recibe el intent, teniendo ahora en la pila A,B. En nuestro caso tampoco nos interesa que A esté en la pila, por lo que la finalizaremos manualmente.

Un ejemplo sería el siguiente:

<pre lang="java">startActivity(new Intent(getBaseContext(), SWADMain.class)
                        .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP));
finish();
</pre>

#### Referencias

*Finish all previous activities* **|** <a href="http://stackoverflow.com/questions/6330260/finish-all-previous-activities" target="_blank">stackoverflow.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Eliminar la pila de actividades (Back Stack) en Android+http://elbauldelprogramador.com/eliminar-la-pila-de-actividades-back-stack-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/eliminar-la-pila-de-actividades-back-stack-en-android/&t=Eliminar la pila de actividades (Back Stack) en Android+http://elbauldelprogramador.com/eliminar-la-pila-de-actividades-back-stack-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Eliminar la pila de actividades (Back Stack) en Android+http://elbauldelprogramador.com/eliminar-la-pila-de-actividades-back-stack-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/fundamentos-programacion-android/ "Fundamentos programación Android: Conceptos básicos y componentes"
 [2]: http://elbauldelprogramador.com/programacion-android-intents-conceptos/ "Programación Android: Intents – Conceptos básicos"
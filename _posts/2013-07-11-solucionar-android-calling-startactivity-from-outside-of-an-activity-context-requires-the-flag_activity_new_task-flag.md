---
id: 1730
title: 'Solucionar el error en Android Calling startActivity from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1730
permalink: /solucionar-android-calling-startactivity-from-outside-of-an-activity-context-requires-the-flag_activity_new_task-flag/
categories:
  - android
tags:
  - error Calling startActivity from outside of an Activity context requires the FLAG_ACTIVITY_NEW_TASK flag android
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/07/android2.png" alt="Solucionar el error en Android Calling startActivity from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag" width="132" height="154" class="thumbnail alignleft size-full wp-image-1756" />  
En una aplicación que estoy haciendo, la cual espero poder presentar en el blog en breve, me encontré con un problema que llevó un tiempo solucionar. La aplicación terminaba inesperadamente al intentar lanzar una actividad desde un [Servicio][1], concretamente el error era:

***  
Calling startActivity from outside of an Activity context requires the FLAG\_ACTIVITY\_NEW_TASK flag  
***

Así que como es habitual busqué en stackoverflow y encontré la solución, el código que generaba el problema era el siguiente:  
  
<!--more-->

{% highlight java %}>Intent sendIntent = new Intent();
sendIntent.setAction(Intent.ACTION_SEND);
sendIntent.putExtra(Intent.EXTRA_TEXT, name);
sendIntent.setType("text/plain");
sendIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
startActivity(Intent.createChooser(sendIntent, "Compartir en");
{% endhighlight %}

### La solución

Sin embargo, aún añadiendo el Flag *FLAG\_ACTIVITY\_NEW_TASK* el error persistia. El problema reside en que el método ***<a href="http://developer.android.com/reference/android/content/Intent.html#createChooser%28android.content.Intent,%20java.lang.CharSequence%29" target="_blank">createChooser()</a>***, devuelve un nuevo [intent][2], según la documentación, y por tanto el flag que acabamos de añadir no se copia automáticamente en el nuevo intent y es necesario volver a añadirlo. 

Una posible solución es:

{% highlight java %}>startActivity(Intent.createChooser(sendIntent, "Compartir en")
   .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
{% endhighlight %}

De esta forma el error ***Calling startActivity() from outside of an Activity context requires the FLAG\_ACTIVITY\_NEW_TASK flag*** deberá estar solucionado.

#### Referencias

*Solución en Stackoverflow* **|** <a href="http://stackoverflow.com/questions/14529492/context-wants-flag-activity-new-task-but-ive-already-set-that-flag" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Solucionar el error en Android Calling startActivity from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag+http://elbauldelprogramador.com/solucionar-android-calling-startactivity-from-outside-of-an-activity-context-requires-the-flag_activity_new_task-flag/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/solucionar-android-calling-startactivity-from-outside-of-an-activity-context-requires-the-flag_activity_new_task-flag/&t=Solucionar el error en Android Calling startActivity from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag+http://elbauldelprogramador.com/solucionar-android-calling-startactivity-from-outside-of-an-activity-context-requires-the-flag_activity_new_task-flag/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Solucionar el error en Android Calling startActivity from outside of an Activity  context requires the FLAG_ACTIVITY_NEW_TASK flag+http://elbauldelprogramador.com/solucionar-android-calling-startactivity-from-outside-of-an-activity-context-requires-the-flag_activity_new_task-flag/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/opensource/fundamentos-programacion-android/
 [2]: http://elbauldelprogramador.com/opensource/programacion-android-intents-conceptos/
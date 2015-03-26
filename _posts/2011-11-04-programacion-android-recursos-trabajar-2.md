---
id: 267
title: 'Programación Android: Recursos &#8211; Trabajar con recursos RAW'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-trabajar-con-recursos-raw/
permalink: /programacion-android-recursos-trabajar-2/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/programacion-android-recursos-trabajar.html
  - /2011/11/programacion-android-recursos-trabajar.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
<img id="logo" name="droid" class="icono" width="128px" height="128px" />

Los recursos Raw se colocan bajo el directorio ***./res/raw***. Son recursos raw archivos como ficheros de audio, vídeo o archivos de texto que requieran localización o ser referenciados mediante IDs de recursos.

A diferencia de los archivos XML, colocados en ./res/xml, estos archivos no se compilan, se mueven al paquete de la aplicación tal y como son. Sin embargo, a cada fichero se le asignará un identificador en la clase R.java. Si colocamos un archivo de texto en ***./res/raw/test.txt***, podremos leerlo usando el código de abajo:

  
<!--more-->

{% highlight java %}>private String getStringFromRawFile(Context activity)
   throws IOException
   {
      Resources r = activity.getResources();
      InputStream is = r.openRawResource(R.raw.test);
      String myText = convertStreamToString(is);
      is.close();
      return myText;
   }

private String convertStreamToString(InputStream is)
   throws IOException
   {
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      int i = is.read();
      while (i != -1)
      {
         baos.write(i);
         i = is.read();
      }
      return baos.toString();
   }
{% endhighlight %}

<p class="alert">
  Los nombres de ficheros con el mismo nombre base generan un error en el plugin ADT de eclipse.
</p>

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Trabajar con recursos Assets][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Trabajar con recursos RAW+http://elbauldelprogramador.com/programacion-android-recursos-trabajar-2/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-trabajar-2/&t=Programación Android: Recursos &#8211; Trabajar con recursos RAW+http://elbauldelprogramador.com/programacion-android-recursos-trabajar-2/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Trabajar con recursos RAW+http://elbauldelprogramador.com/programacion-android-recursos-trabajar-2/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-recursos-trabajar_04/
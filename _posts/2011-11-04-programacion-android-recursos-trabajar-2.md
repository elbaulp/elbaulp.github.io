---
id: 267
title: 'Programación Android: Recursos &#8211; Trabajar con recursos RAW'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-trabajar-con-recursos-raw/
permalink: /programacion-android-recursos-trabajar-2/
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
---
<img id="logo" name="droid" class="icono" width="128px" height="128px" />

Los recursos Raw se colocan bajo el directorio ***./res/raw***. Son recursos raw archivos como ficheros de audio, vídeo o archivos de texto que requieran localización o ser referenciados mediante IDs de recursos.

A diferencia de los archivos XML, colocados en ./res/xml, estos archivos no se compilan, se mueven al paquete de la aplicación tal y como son. Sin embargo, a cada fichero se le asignará un identificador en la clase R.java. Si colocamos un archivo de texto en ***./res/raw/test.txt***, podremos leerlo usando el código de abajo:

  
<!--more-->

{% highlight java %}private String getStringFromRawFile(Context activity)
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





 [1]: /programacion-android-recursos-trabajar_04/

{% include _toc.html %}

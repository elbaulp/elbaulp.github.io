---
title: 'Programación Android: Recursos &#8211; Trabajar con recursos RAW'
layout: post.amp
permalink: /programacion-android-recursos-trabajar-2/
categories:
  - android
  - opensource
tags:
  - curso android pdf
modified: 2016-08-09T20:40
main-class: "android"
color: "#689F38"
---

Los recursos Raw se colocan bajo el directorio ***./res/raw***. Son recursos raw archivos como ficheros de audio, vídeo o archivos de texto que requieran localización o ser referenciados mediante IDs de recursos.

A diferencia de los archivos XML, colocados en ./res/xml, estos archivos no se compilan, se mueven al paquete de la aplicación tal y como son. Sin embargo, a cada fichero se le asignará un identificador en la clase R.java. Si colocamos un archivo de texto en ***./res/raw/test.txt***, podremos leerlo usando el código de abajo:

<!--ad-->

```java
private String getStringFromRawFile(Context activity)
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
```

> Los nombres de ficheros con el mismo nombre base generan un error en el plugin ADT de eclipse.

# Siguiente Tema: [Programación Android: Recursos &#8211; Trabajar con recursos Assets][1] 

 [1]: https://elbauldelprogramador.com/programacion-android-recursos-trabajar_04/

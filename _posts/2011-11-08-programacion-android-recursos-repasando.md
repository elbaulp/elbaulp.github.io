---
title: 'Programación Android: Recursos &#8211; Repasando la estructura del directorio de recursos'

layout: post
permalink: /programacion-android-recursos-repasando/
categories:
  - android
  - opensource
tags:
  - curso android pdf
main-class: "android"
---
En resumen, en el siguiente listado muestra la estructura global del directorio de recursos:

```bash
/res/values/string.xml
                /colors.xml
                /dimens.xml
                /attrs.xml
                /styles.xml
     /drawable/*.png
                   /*.jpg
                   /*.gif
                   /*.9.png
     /anim/*.xml
     /layout/*.xml
     /raw/*.*
     /xml/*.xml
/assets/*.*/*.*

```

<p class="alert">
  Debido a que no se encuentra bajo el directorio <i>/res</i>, solo el directorio<i> /assets</i> puede contener una lista arbitrária de directorios. Cualquier otro directorio solo puede contener ficheros en ese nivel, y no mas subdirectorios
</p>

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Recursos y cambios de configuración][1] {.referencia}





 [1]: /programacion-android-recursos-recursos/

{% include _toc.html %}

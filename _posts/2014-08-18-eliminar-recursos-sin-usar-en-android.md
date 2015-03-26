---
id: 2421
title: Eliminar recursos sin usar en Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2421
permalink: /eliminar-recursos-sin-usar-en-android/
categories:
  - android
tags:
  - Android Resource Remover
  - ejemplo Android Resource Remover
  - eliminar recursos Android
  - limpiar proyecto Android
  - recursos sin usar Android
  - tutorial Android Resource Remover
  - unusedResources Android
---
Trabajando en el proyecto [SWADroid][1] | [(Fuente en Github)][2], y tras pasar la herramienta `Lint`, me encontré con cientos de recursos sin usar, que debía eliminar a mano. Pensé que debía existir alguna herramienta que permitiera automatizar el proceso, y de hecho, exíste, *Android Resource Remover*. Hoy veremos cómo usar ésta herramienta para eliminar recursos sin usar en Android.

<!--more-->

## El problema

A medida que un proyecto va creciendo, se usan más y más [recursos][3]. Con el paso del tiempo puede que muchos dejen de usarse al ser reemplazados por otros. En el caso de SWADRoid había cientos. La manera de resolverlos fue usando la herramienta *Android Resource Remover* cuya instalación procederemos a explicar ahora.

## Instalar Android Resource Remover

Bastante sencillo:

{% highlight bash %}>pip install android-resource-remover
{% endhighlight %}

## Ejecutar Android Resource Remover

Bastante sencillo también, basta con ejecutar

{% highlight bash %}>android-resource-remover
{% endhighlight %}

en el directorio del proyecto a limpiar.

### Problemas en la instalación

Si por algún motivo, el proceso de instalación no finaliza correctamente, es posible que falten los siguientes paquetes en el sistema.

{% highlight bash %}>sudo apt-get install libxml2-dev libxslt1-dev
{% endhighlight %}

En mi caso tuve que instalarlos.

También es posible que sea necesario actualizar la librería xml con

{% highlight bash %}>easy_install --upgrade lxml
{% endhighlight %}

## Uso avanzado

En mi caso, me encontré con problemas al usar el programa sin argumentos. Concretamente los pasos que seguí fueron:

{% highlight bash %}>lint --xml lint-result.xml -Wall --quiet --showall .
{% endhighlight %}

El significado de los parámetros es:

  * `--xml lint-result.xml` Guarda el resultado en el fichero indicado.
  * `-Wall` Comprueba todos *Warnings*, incluidos las desactivadas por defecto.
  * `--quiet` No muestra el progreso.
  * `--showall` No trunca mensajes demasiado largos.
  * `.` directorio sobre el que ejecutar `lint`.

Una vez finalizado el análisis, es posible eliminar los recursos sin usar usando *Android Resource Remover* con los siguientes parámetros:

{% highlight bash %}>android-resource-remover --xml lint-result.xml
{% endhighlight %}

## Eliminar Identificadores sin usar

Aunque *Android Resource Remover* por defecto eliminar únicamente recursos de tipo imágenes, ficheros xml etc, es posible hacer una ligera modificación al código para que elimine los identificadores sin usar. La línea a modificar es `root.findall('.//issue[@id="UnusedResources"]')`, basta modificarla a `root.findall('.//issue[@id="UnusedIDs"]')` y ejecutar de nuevo los pasos mencionados arriba.

## Resultado

Tras pasar *Android Resource Remover*, *SWADroid* paso a ocupar **1,5Mb** frente a las **2,3Mb** previas a la eliminación de los recursos sin usar.

#### Referencias

*Proyecto en Github* **|** <a href="https://github.com/KeepSafe/android-resource-remover" target="_blank">github.com/KeepSafe/android-resource-remover</a>  
*Remove unused Android resources to reduce APK size* **|** <a href="http://keepsafe-engineering.tumblr.com/post/85828806276/remove-unused-android-resources" target="_blank">keepsafe-engineering.com</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Eliminar recursos sin usar en Android+http://elbauldelprogramador.com/eliminar-recursos-sin-usar-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/eliminar-recursos-sin-usar-en-android/&t=Eliminar recursos sin usar en Android+http://elbauldelprogramador.com/eliminar-recursos-sin-usar-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Eliminar recursos sin usar en Android+http://elbauldelprogramador.com/eliminar-recursos-sin-usar-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/tag/swadroid "Artículos en el blog de SWADroid"
 [2]: https://github.com/Amab/SWADroid/tree/develop "Proyecto en Github"
 [3]: http://elbauldelprogramador.com/programacion-android-recursos/ "PROGRAMACIÓN ANDROID: RECURSOS – INTRODUCCIÓN"
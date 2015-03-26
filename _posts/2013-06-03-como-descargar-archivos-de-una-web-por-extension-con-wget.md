---
id: 1545
title: Cómo descargar archivos de una web por extensión con wget

layout: post
guid: http://elbauldelprogramador.com/?p=1545
permalink: /como-descargar-archivos-de-una-web-por-extension-con-wget/
categories:
  - aplicaciones
  - How To
  - internet
tags:
  - android studio español guia
  - android studio tutorial
  - descargar por extension wget
  - wget
---
Seguramente alguna vez hayas encontrado alguna web con montones de ficheros que te interesa descargarte, pero resulta un tanto arduo descargar los ficheros uno a uno. Si eres usuario Linux seguramente conozcas el comando *wget*. Este comando permite descargar todo el contenido de una web por extensión, de modo que si queremos descargar todos los ficheros con extensión *tar.gz* basta con ejecutar el siguiente comando:  
  
<!--more-->

{% highlight bash %}wget -r -A.tar.gz <url>
{% endhighlight %}

Donde:

  * **-A ó &#8211;accept** es una lista separada por comas de los sufijos o patrones de los ficheros que queremos descargar.
  * **-r ó &#8211;recursive** actúa recursívamente sobre la web indicada.

Este comando no siempre funciona, ya que algunos servidores pueden haber bloqueado el acceso a *wget*.



{% include _toc.html %}

---
id: 1518
title: Cómo ocultar la versión de BIND (Y cómo averiguarla)
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1518
permalink: /como-ocultar-la-version-de-bind-y-como-averiguarla/
categories:
  - Administración de Servidores
  - How To
tags:
  - extract bind version
  - fingerprinting bind version
  - ocultar version de bind
  - seguridad en bind
  - usar fpdns
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/04/dns-300x240.jpg" alt="Cómo ocultar la versión de BIND (Y como averiguarla)" width="300" height="240" class="thumbnail alignleft size-medium wp-image-1533" />  
Realizando un análisis en *<a href="http://www.dnsinspect.com" target="_blank">dnsInspect</a>* me dí cuenta de que el servidor estaba mostrando la versión de [BIND][1], lo cual no es buena idea. Así que busqué cómo ocultarla y aprovecho para compartirlo con todos vosotros por si alguna vez os hace falta.

Antes de proceder a ocultar la versión, comprobemos que efectivamente la estamos mostrando, usaremos **[dig][2]** para ello:  
  
<!--more-->

{% highlight bash %}>$ dig @example.com -c CH -t txt version.bind # Consultamos la versión para el dominio de la web
$ dig @direcciónDNS -c CH -t txt version.bind # Consultamos también en nuestros servidores DNS secundarios
{% endhighlight %}

Tras ejecutar el primer comando deberiamos ver si estamos mostrando la versión de **BIND**. En mi caso la respuesta era afirmativa, sin embargo al consultar la versión en el servidor DNS secundario la respuesta era ***&#8220;[Secured]&#8221;***.

Una vez hecho esto, pasamos a ocultar la versión.

### Ocultar la versión de BIND en un servidor

Esto no es más que **seguridad mediante oscuridad**, ya que aunque se oculte la versión, hay herramientas que detectarán la versión de BIND, como **<a href="http://www.cyberciti.biz/tips/howto-remotely-determine-dns-server-version.html" target="_blank">fpdns</a>**. Sin embargo, ocultandola evitaremos que scripts automatizados buscando versiones concretas puedan aprovecharse de cualquier vulnerabilidad.

Abrimos el fichero de configuración de **BIND**, concretamente */etc/bind/named.conf.options* y añadimos la siguiente línea:

{% highlight bash %}version "Texto a mostrar"; {% endhighlight %}

Guardamos el fichero y reiniciamos **BIND**:

{% highlight bash %}># service bind9 restart
{% endhighlight %}

### Mostrar versión de BIND aún cuando está oculta

Instalamos *fpdns*:

{% highlight bash %}>sudo apt-get install fpdns{% endhighlight %}

Lo ejecutamos pasando como argumento el servidor del cual queremos determinar la versión:

{% highlight bash %}>$ fpdns -D &lt;dominio>{% endhighlight %}

La salida será algo de este estilo:

{% highlight bash %}fingerprint (elbauldelprogramador.com, ip): ISC BIND version -- version  
fingerprint (elbauldelprogramador.com, ip): ISC BIND version -- version  
{% endhighlight %}

#### Referencias

*Cybercity* **|** <a href="http://www.cyberciti.biz/faq/hide-bind9-dns-sever-version/" target="_blank">Visitar sitio</a> 



 [1]: /articulos/como-configurar-un-servidor-dns/
 [2]: /opensource/dig-chuleta-basica-de-comandos/ "Dig – Chuleta básica de comandos"
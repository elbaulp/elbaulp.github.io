---
id: 261
title: Renombrar archivos masivamente en GNU/Linux
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/renombrar-archivos-masivamente-en-gnulinux/
permalink: /renombrar-archivos-masivamente-en/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/10/renombrar-archivos-masivamente-en.html
  - /2011/10/renombrar-archivos-masivamente-en.html
categories:
  - linux
  - script
tags:
  - renombrar archivos linux masivo
  - renombrar linux
---
<div class="icosh">
</div>

En ocasiones, cuando bajamos archivos de internet (Normalmente música), cada archivo tiene en el nombre la dirección de la página web de donde se descargó.

Si queremos renombrar todos los archivos para eliminar la página web del nombre del archivo, no es necesario ir uno por uno renombrando, usando el comando rename de GNU/linux lo conseguimos fácilmente.

Por ejemplo, pongamos que los archivos son los siguientes:

  
<!--more-->

{% highlight bash %}>hkr@hkr:~/Desktop/RAP/d$ ls
01. Rafael Lechowski (Flowklorikos) - Uno - www.HHGroups.com.mp3
02. Rafael Lechowski (Flowklorikos) - Lluvia y fuego - www.HHGroups.com.mp3
03. Rafael Lechowski (Flowklorikos) - Donde duele inspira - www.HHGroups.com.mp3
04. Rafael Lechowski (Flowklorikos) - Por amor al odio (con Gregory Isaacs) - www.HHGroups.com.mp3
05. Rafael Lechowski (Flowklorikos) - Soy loco por ti - www.HHGroups.com.mp3
06. Rafael Lechowski (Flowklorikos) - Desde el barro (con Carlos Talavera) - www.HHGroups.com.mp3
07. Rafael Lechowski (Flowklorikos) - Folio en blanco (Improvisacion) - www.HHGroups.com.mp3
08. Rafael Lechowski (Flowklorikos) - In-extremis - www.HHGroups.com.mp3
09. Rafael Lechowski (Flowklorikos) - Sucio (con Carlos Talavera) - www.HHGroups.com.mp3
10. Rafael Lechowski (Flowklorikos) - Artesano del arte insano - www.HHGroups.com.mp3
11. Rafael Lechowski (Flowklorikos) - Cosquijazz - www.HHGroups.com.mp3
12. Rafael Lechowski (Flowklorikos) - Mis ego depresiones - www.HHGroups.com.mp3
13. Rafael Lechowski (Flowklorikos) - 13 - www.HHGroups.com.mp3
{% endhighlight %}

Queremos elmininar las siguientes partes del nombre: **Rafael Lechowski (Flowklorikos)** y **www.HHGroups.com**. Para ello usamos la orden rename con la siguiente sintaxis:

{% highlight bash %}>rename 's/Rafael Lechowski (Flowklorikos) - //g' *.mp3
{% endhighlight %}

Lo que decimos con esa expresión regular es que reemplace lo que coincida con Rafael Lechowski (Flowklorikos) por nada, es decir, que lo elimine del nombre. Es necesario escapar con los espacios en blanco y los parentesis. El *.mp3 quiere decir que aplique el renombramiento a los archivos mp3.

Como resultado, ahora los ficheros tienen el siguiente nombre:

{% highlight bash %}>hkr@hkr:~/Desktop/RAP/d$ ls -1
01. Uno - www.HHGroups.com.mp3
02. Lluvia y fuego - www.HHGroups.com.mp3
03. Donde duele inspira - www.HHGroups.com.mp3
04. Por amor al odio (con Gregory Isaacs) - www.HHGroups.com.mp3
05. Soy loco por ti - www.HHGroups.com.mp3
06. Desde el barro (con Carlos Talavera) - www.HHGroups.com.mp3
07. Folio en blanco (Improvisacion) - www.HHGroups.com.mp3
08. In-extremis - www.HHGroups.com.mp3
09. Sucio (con Carlos Talavera) - www.HHGroups.com.mp3
10. Artesano del arte insano - www.HHGroups.com.mp3
11. Cosquijazz - www.HHGroups.com.mp3
12. Mis ego depresiones - www.HHGroups.com.mp3
13. 13 - www.HHGroups.com.mp3
{% endhighlight %}

Falta eliminar la parte www.HHGroups.com, que lo conseguimos con esta orden:

{% highlight bash %}>rename 's/ - www.HHGroups.com//g' *.mp3
{% endhighlight %}

Y finalmente, tenemos todos nuestros archivos renombrados:

{% highlight bash %}>hkr@hkr:~/Desktop/RAP/d$ ls -1
01. Uno.mp3
02. Lluvia y fuego.mp3
03. Donde duele inspira.mp3
04. Por amor al odio (con Gregory Isaacs).mp3
05. Soy loco por ti.mp3
06. Desde el barro (con Carlos Talavera).mp3
07. Folio en blanco (Improvisacion).mp3
08. In-extremis.mp3
09. Sucio (con Carlos Talavera).mp3
10. Artesano del arte insano.mp3
11. Cosquijazz.mp3
12. Mis ego depresiones.mp3
13. 13.mp3
{% endhighlight %}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Renombrar archivos masivamente en GNU/Linux+http://elbauldelprogramador.com/renombrar-archivos-masivamente-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/renombrar-archivos-masivamente-en/&t=Renombrar archivos masivamente en GNU/Linux+http://elbauldelprogramador.com/renombrar-archivos-masivamente-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Renombrar archivos masivamente en GNU/Linux+http://elbauldelprogramador.com/renombrar-archivos-masivamente-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
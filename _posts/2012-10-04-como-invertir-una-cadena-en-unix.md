---
id: 972
title: Cómo invertir una cadena en Unix
author: Alejandro Alcalde
layout: post
guid: /?p=972
permalink: /como-invertir-una-cadena-en-unix/
categories:
  - How To
tags:
  - invertir cadena
format: aside
---
[<img alt="invertir cadenas en bash" src="https://lh4.googleusercontent.com/-vUNPZhd87O8/TROpDAE42nI/AAAAAAAAAN8/Gfmk5XMAcsg/s128/sh.png" title="Shell Bash" class="alignleft" width="128" height="128" />][1]

Existe un comando que realiza esta operación, `rev`. De acuerdo a la descripción que proporciona la documentación funciona de la siguiente manera:

> Copia los archivos especificados a la salida estandar, invirtiendo el orden de los caracteres de cada línea. Si no se especifican ficheros, rev lee de la entrada estandar (el teclado).

Algunos ejemplos:  
  
<!--more-->

{% highlight bash %}>echo "elbauldelprogramador" | rev
{% endhighlight %}

Dará el siguiente resultado:

{% highlight bash %}>rodamargorpledluable
{% endhighlight %}

Es posible usar la siguiente sintaxis:

{% highlight bash %}>rev&lt;&lt;&lt;"Esta línea es una prueba"
{% endhighlight %}

Salida:

{% highlight bash %}>abeurp anu se aeníl atsE
{% endhighlight %}

### Ejemplo en Perl

{% highlight bash %}>perl -ne 'chomp;print scalar reverse . "n";'&lt;&lt;&lt;"elbauldelprogramador"
{% endhighlight %}

Ó

{% highlight bash %}>echo 'elbauldelprogramador' | perl -ne 'chomp;print scalar reverse . "n";'
{% endhighlight %}

### Script bash para invertir cadenas

{% highlight bash %} >#!/bin/bash
input="$1"
reverse=""
 
len=${#input}
for (( i=$len-1; i>=0; i-- ))
do
   reverse="$reverse${input:$i:1}"
done
 
echo "$reverse"
{% endhighlight %}

Para ejecutarlo escribimos lo siguiente en la terminal:

{% highlight bash %}>./script elbauldelprogramador
{% endhighlight %}

> En los comentarios de la fuente original en nixcraft (enlace al final de la entrada) un lector escribió dos ejemplos más, en [python][2] y [PHP][3]:

Ejemplo en python:

{% highlight bash %}>echo foo | python -c 'import sys;print(sys.stdin.read().strip()[::-1])'
python -c 'import sys;print(sys.stdin.read().strip()[::-1])' &lt;&lt;&lt; foo
{% endhighlight %}

Ejemplo en PHP:

{% highlight bash %}>echo foo | php -r 'print strrev(trim(fgets(STDIN)));'
php -r 'print strrev(trim(fgets(STDIN)));' &lt;&lt;&lt; foo
{% endhighlight %}

* * *

#### Fuente original

*NixCraft* **|** <a href="http://www.cyberciti.biz/faq/how-to-reverse-string-in-unix-shell-script/" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo invertir una cadena en Unix+http://elbauldelprogramador.com/como-invertir-una-cadena-en-unix/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-invertir-una-cadena-en-unix/&t=Cómo invertir una cadena en Unix+http://elbauldelprogramador.com/como-invertir-una-cadena-en-unix/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo invertir una cadena en Unix+http://elbauldelprogramador.com/como-invertir-una-cadena-en-unix/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: https://lh4.googleusercontent.com/-vUNPZhd87O8/TROpDAE42nI/AAAAAAAAAN8/Gfmk5XMAcsg/s128/sh.png
 [2]: /python/
 [3]: /php/
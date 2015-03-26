---
id: 972
title: Cómo invertir una cadena en Unix

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

{% highlight bash %}echo "elbauldelprogramador" | rev
{% endhighlight %}

Dará el siguiente resultado:

{% highlight bash %}rodamargorpledluable
{% endhighlight %}

Es posible usar la siguiente sintaxis:

{% highlight bash %}rev<<<"Esta línea es una prueba"
{% endhighlight %}

Salida:

{% highlight bash %}abeurp anu se aeníl atsE
{% endhighlight %}

### Ejemplo en Perl

{% highlight bash %}perl -ne 'chomp;print scalar reverse . "n";'<<<"elbauldelprogramador"
{% endhighlight %}

Ó

{% highlight bash %}echo 'elbauldelprogramador' | perl -ne 'chomp;print scalar reverse . "n";'
{% endhighlight %}

### Script bash para invertir cadenas

{% highlight bash %}#!/bin/bash
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

{% highlight bash %}./script elbauldelprogramador
{% endhighlight %}

> En los comentarios de la fuente original en nixcraft (enlace al final de la entrada) un lector escribió dos ejemplos más, en [python][2] y [PHP][3]:

Ejemplo en python:

{% highlight bash %}echo foo | python -c 'import sys;print(sys.stdin.read().strip()[::-1])'
python -c 'import sys;print(sys.stdin.read().strip()[::-1])' <<< foo
{% endhighlight %}

Ejemplo en PHP:

{% highlight bash %}echo foo | php -r 'print strrev(trim(fgets(STDIN)));'
php -r 'print strrev(trim(fgets(STDIN)));' <<< foo
{% endhighlight %}

* * *

#### Fuente original

*NixCraft* **|** <a href="http://www.cyberciti.biz/faq/how-to-reverse-string-in-unix-shell-script/" target="_blank">Visitar sitio</a> 



 [1]: https://lh4.googleusercontent.com/-vUNPZhd87O8/TROpDAE42nI/AAAAAAAAAN8/Gfmk5XMAcsg/s128/sh.png
 [2]: /python/
 [3]: /php/

{% include _toc.html %}

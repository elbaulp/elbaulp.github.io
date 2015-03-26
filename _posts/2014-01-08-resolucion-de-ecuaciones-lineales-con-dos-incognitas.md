---
id: 2217
title: Cómo resolver sistemas de ecuaciones lineales con dos incógnitas en Python

layout: post
guid: http://elbauldelprogramador.com/?p=2217
permalink: /como-resolver-sistemas-de-ecuaciones-lineales-con-dos-incognitas/
categories:
  - Algoritmos
  - python
tags:
  - ecuaciones lineales
  - resolver ecuaciones python
---
<span class="highlight style-1">El siguiente artículo es una colaboración de <a href="http://dealgebra.blogspot.mx/" title="Visitar blog" target="_blank">Rogelio González</a>, al que agradezco su interés por colaborar en este blog.</span>

[<img src="/images/2014/01/Cómo-resolver-sistemas-de-ecuaciones-lineales-con-dos-incógnitas1-300x200.jpg" alt="Cómo resolver sistemas de ecuaciones lineales con dos incógnitas1" width="300" height="200" class="alignleft size-medium wp-image-2224" />][1]  
Una ecuación no es más que una igualdad en la que hay cantidades desconocidas llamadas incógnitas. Las soluciones son los valores que tienen las incógnitas cuando satisfacen la igualdad. Un sistema de ecuaciones es la reunión de 2 o mas ecuaciones con 2 o más incógnitas. Así:

<!--more-->

<p style="text-align:center">
  <img src="//s0.wp.com/latex.php?latex=x%2By%3D3%5C%5C2x%2B3y%3D3%5C%5C+&bg=ffffff&fg=000&s=0" alt="x+y=3&#92;&#92;2x+3y=3&#92;&#92; " title="x+y=3&#92;&#92;2x+3y=3&#92;&#92; " class="latex" />
</p>

Es un sistema de ecuaciones cuyas soluciones son <img src="//s0.wp.com/latex.php?latex=x%3D6%2C+y%3D-3&bg=ffffff&fg=000&s=0" alt="x=6, y=-3" title="x=6, y=-3" class="latex" />. Los sistemas de ecuaciones tienen aplicaciones en todas las ciencias entonces es útil tener un algoritmo que las resuelva y comprender qué es lo que hace. Normalmente utilizaríamos algo de algebra lineal para resolverlo pero hoy vamos a hacerlo de otro modo.

### Tipos de sistemas de ecuaciones

Aunque de manera intuitiva nos puede parecer que todo sistema tiene soluciones únicas esto no es así. El sistema pueder tener soluciones unicas como el primer ejemplo,infinitas soluciones o no tener solución. ¿Qué hace distinto un sistema de otro? o en otras palabras ¿Qué método tenemos que nos diga que sistema es?

### Determinantes

El **determinante** de nuestro sistema es el que nos dirá qué tipo de sistema es. El determinante del sistema:

<p style="text-align:center">
  <img src="//s0.wp.com/latex.php?latex=ax%2Bby%3Dc%5C%5Cdx%2Bey%3Df+&bg=ffffff&fg=000&s=0" alt="ax+by=c&#92;&#92;dx+ey=f " title="ax+by=c&#92;&#92;dx+ey=f " class="latex" />
</p>

Viene dado por <img src="//s0.wp.com/latex.php?latex=ae-bd&bg=ffffff&fg=000&s=0" alt="ae-bd" title="ae-bd" class="latex" />, en el primer ejemplo el determinante es **1** pues <img src="//s0.wp.com/latex.php?latex=1%5Ccdot+3-1%5Ccdot+2%3D1&bg=ffffff&fg=000&s=0" alt="1&#92;cdot 3-1&#92;cdot 2=1" title="1&#92;cdot 3-1&#92;cdot 2=1" class="latex" />.En general si el determinante (<img src="//s0.wp.com/latex.php?latex=D&bg=ffffff&fg=000&s=0" alt="D" title="D" class="latex" />) es distinto de cero tenemos soluciones únicas, si el determinante es cero entonces o hay infinitas soluciones o no hay ninguna. En &#8220;el caso fácil&#8221; cuando <img src="//s0.wp.com/latex.php?latex=D%5Cneq+0&bg=ffffff&fg=000&s=0" alt="D&#92;neq 0" title="D&#92;neq 0" class="latex" /> las soluciones están dadas por:

<p style="text-align:center">
  <img src="//s0.wp.com/latex.php?latex=x%3D%5Cfrac%7Bec-bf%7D%7Bae-bd%7D%5C%5Cy%3D%5Cfrac%7Baf-dc%7D%7Bae-bd%7D&bg=ffffff&fg=000&s=2" alt="x=&#92;frac{ec-bf}{ae-bd}&#92;&#92;y=&#92;frac{af-dc}{ae-bd}" title="x=&#92;frac{ec-bf}{ae-bd}&#92;&#92;y=&#92;frac{af-dc}{ae-bd}" class="latex" />
</p>

Ahora &#8220;el caso difícil&#8221; cuando <img src="//s0.wp.com/latex.php?latex=D%3D0&bg=ffffff&fg=000&s=0" alt="D=0" title="D=0" class="latex" /> ¿Cómo saber si el sistema tiene infinitas soluciones o ninguna? Pongamos atención en los siguientes sistemas:

<p style="text-align:center">
  <img src="//s0.wp.com/latex.php?latex=x%2By%3D3%5C%5C+2x%2B2y%3D6&bg=ffffff&fg=000&s=0" alt="x+y=3&#92;&#92; 2x+2y=6" title="x+y=3&#92;&#92; 2x+2y=6" class="latex" />
</p>

<p style="text-align:center">
  <img src="//s0.wp.com/latex.php?latex=x%2By%3D3%5C%5C+2x%2B2y%3D5&bg=ffffff&fg=000&s=0" alt="x+y=3&#92;&#92; 2x+2y=5" title="x+y=3&#92;&#92; 2x+2y=5" class="latex" />
</p>

En el primer sistema es fácil ver que la segunda ecuación es solo la primera multiplicada por 2 y es coherente el resultado. Sin embargo en el segundo sistema el lado izquierdo de la igualdad nos dice de nuevo que la segunda ecuación es solo la primera multiplicada por 2 pero el lado derecho no puede ser cierto pues el doble de 3 no es 5. Entonces decimos que el primer sistema tiene soluciones infinitas pues las soluciones de la primera ecuación siempre cumplen la segunda pues básicamente es la misma ecuación. El segundo sistema no tiene soluciones y podemos verlo en el absurdo de que el doble de 3 es 5. Podemos decir pues que en un sistema con <img src="//s0.wp.com/latex.php?latex=D%3D0&bg=ffffff&fg=000&s=0" alt="D=0" title="D=0" class="latex" /> lo importante es ver por qué número debemos multiplicar la primera ecuación para obtener la segunda y la parte derecha de las ecuaciones nos dirán si es coherente o no, en otras palabras si tiene infinitas soluciones o ninguna.

### Ideas llevadas a Python

&#8220;El caso difícil&#8221; lo podemos resolver sabiendo cuál es el número por el que tengo que multiplicar la primera ecuación para obtener la segunda, podríamos hacer `m = d / a` donde **m** sería nuestro &#8220;número&#8221;y después ver si `m * c = f` :

{% highlight python %}from sys import argv
script, a, b, c, d, e, f = argv

a = float(a)
b = float(b)
c = float(c)
d = float(d)
e = float(e)
f = float(f)

m = d / a

if m * c == f :
    print "El sistema tiene infinitas soluciones"
else:
    print "El sistema no tiene soluciones"

{% endhighlight %}

Uniendo &#8220;el caso difícil&#8221; con &#8220;el caso fácil&#8221; tenemos el código completo del algoritmo, tendremos que verificar antes que a,b,d,e no sean todos cero pues entonces no sería un sistema de ecuaciones, salvando esto podemos usar el algoritmo:

{% highlight python %}from sys import argv
script, a, b, c, d, e, f = argv

a = float(a)
b = float(b)
c = float(c)
d = float(d)
e = float(e)
f = float(f)

det = a * e - b * d

if det != 0 :
    x = (e * c - b * f) / det
    y = (a * f - d * c) / det

    print "La solucion al sistema es x= %d e y= %d" % (x, y)

else :
    m = d / a

    if m * c == f :
        print "El sistema tiene infinitas soluciones"
    else:
        print "El sistema no tiene soluciones"

{% endhighlight %}

### Conclusion

¿Por qué tantas matemáticas y poco código? Creo que todos lo sabemos: la idea que soporta el código es lo interesante y no solo lo interesante *es* lo importante. No todo programador es matemático (no es necesario serlo) pero es una gran ventaja tener esa &#8220;intuición&#8221; que nos dan las matemáticas.

<a class="aligncenter download-button" href="http://elbauldelprogramador.com/download/resolucion-de-ecuaciones-lineales-con-dos-incognitas/" rel="nofollow"> Download &ldquo;Resolución de ecuaciones lineales con dos incógnitas&rdquo; <small>ResoluciónEcuaciones.pdf &ndash; Downloaded 918 times &ndash; 51 kB</small> </a>

#### Créditos

*Imágen gracias a eriwst* **|** <a href="http://www.flickr.com/photos/eriwst/2421129047/sizes/z/" target="_blank">flickr.com</a> 



 [1]: /images/2014/01/Cómo-resolver-sistemas-de-ecuaciones-lineales-con-dos-incógnitas1.jpg

{% include _toc.html %}

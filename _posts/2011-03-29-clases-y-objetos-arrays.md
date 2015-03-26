---
id: 158
title: 'Clases y Objetos &#8211; Arrays'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/clases-y-objetos-arrays/
permalink: /clases-y-objetos-arrays/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/03/clases-y-objetos-arrays.html
  - /2011/03/clases-y-objetos-arrays.html
  - /2011/03/clases-y-objetos-arrays.html
categories:
  - C
---
<div class="iconcpp">
</div>

Un array sirve para guardar un conjunto de entidades pertenecientes a la misma  
clase. Para reservar espacio en memoria para un array, y para liberar la memoria, se ha  
de llamar a las funciones **operator new[]()** y **operator delete[]()**, respectivamente. En  
este caso, **new** no acepta inicializadores. Por ejemplo, en la siguiente porción de código  
se reserva espacio en memoria para un array de 3 enteros. Se inicializan, se usan, y por  
último, se libera dicho espacio en memoria reservado cuando ya no se precisa más el  
array.

  
<!--more-->

{% highlight bash %}<span class="comentario">//se reserva espacio en memoria para un array de 3 elementos</span>
int* ip=new int[3];
<span class="comentario">//se inicializan los elementos del array</span>
ip[0]=1;
ip[1]=2;
ip[3]=3;
<span class="comentario">//... se usa el array</span>
<span class="comentario">//se libera la porción de memoria reservada</span>
delete[] ip;
{% endhighlight %}

Lo mismo podremos hacer para un array de caracteres, que puede guardar hasta  
un máximo de 20.  


{% highlight bash %}char* cp= new char[20];
strcpy(cp, “esto es una cadena”);
<span class="comentario">//... se usa el array</span>
delete[] cp;
{% endhighlight %}



## Array de objetos

Primero reservamos espacio para un array de tres objetos de la clase Punto.  
Luego inicializamos dichos objetos, llamando al constructor. Hacemos uso de los  
objetos, y por último, liberamos el espacio de memoria reservada.  


{% highlight bash %}<span class="comentario">//reserva espacio para tres elementos</span>
<b>Punto* objs= new Punto[3];</b>
<span class="comentario">//inicializa los elementos del array</span>
objs[0]=Punto();
objs[1]=Punto(‘+’,40,5);
objs[2]=Punto(60,10);
<span class="comentario">//desde cada elemento se llama a las funciones miembro</span>
objs[1].mostrar();
<span class="comentario">//destructor del array</span>
delete[] objs;
<span class="comentario">//llama tres veces al destructor</span>
{% endhighlight %}



## Array de punteros a objetos

Primero reservamos espacio para un array de tres punteros a objetos de la clase  
Punto. Luego asignamos las direcciones de los objetos creados a los elementos del  
array, hacernos uso de los punteros a objetos, y por último, liberamos el espacio de  
memoria reservada, destruyendo cada elemento del array, y el array mismo.

{% highlight bash %}<span class="comentario">//reserva espacio para tres elementos</span>
<b>Punto** pObjs=new Punto*[3];</b>
<span class="comentario">//inicializa los elementos del array</span>
pObjs[0l=new Punto(10, 20);
pObjs[l]=new Punto('+', 40, 5);
pObjs[2]=new Punto(‘@’, 60, 10);
<span class="comentario">//desde cada elemento se llama a las funciones miembro</span>
<span class="comentario">//pObjs[1] mostrar();</span>
<span class="comentario">//destrucción del array</span>
for (int i=0; i&lt;3; i++)
   delete pObjs[i];
delete[] pObjs;
{% endhighlight %}



## Moverse por el array

Punteros y arrays están íntimamente relacionados por las reglas de la aritmética  
de punteros. El compilador interpreta el nombre de array corno un puntero a su primer  
elemento. Es decir, si objs es el nombre del array, objs es equivalente a &objs[01. Por  
las reglas de la aritmética de punteros, si se añade un entero i al nombre de un array, el  
resultado es un puntero al elemento i del array: esto es, objs+i es equivalente a  
&objs[i). Esta equivalencia la podemos expresar mediante la regla:

{% highlight bash %}<i>*(objs+i) es equivalente a objs[i]</i>{% endhighlight %}

Podemos usar los operadores unarios ++ y &#8212; para acceder a elementos  
consecutivos del array objs del siguiente modo:  


{% highlight bash %}<span class="comentario">//objs es objs[0]</span>
objs++;          <span class="comentario">//avanza a objs[1]</span>
objs++;          <span class="comentario">//avanza a objs[2]</span>
objs--;          <span class="comentario">//retrocede a objs[1]</span>
{% endhighlight %}



* * *

#### [Clases y Objetos &#8211; Pasar un objeto a una función][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Clases y Objetos &#8211; Arrays+http://elbauldelprogramador.com/clases-y-objetos-arrays/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/clases-y-objetos-arrays/&t=Clases y Objetos &#8211; Arrays+http://elbauldelprogramador.com/clases-y-objetos-arrays/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Clases y Objetos &#8211; Arrays+http://elbauldelprogramador.com/clases-y-objetos-arrays/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/clases-y-objetos-pasar-un-objeto-una/
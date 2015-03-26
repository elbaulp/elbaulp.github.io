---
id: 2360
title: Qué es un NullPointerException y cómo solucionarlo
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2360
permalink: /que-es-un-nullpointerexception-y-como-solucionarlo/
categories:
  - Java
tags:
  - excepciones java
  - 'null'
  - NullPointerException java
---
> El siguiente artículo es una traducción de una pregunta en stackOverflow del usuario <a href="http://stackoverflow.com/users/29182/ziggy" target="_blank">ziggy</a>, que preguntaba ¿Qué es un **NullPointerException** y cómo se puede solucionar?. La respuesta es del usuario <a href="http://stackoverflow.com/users/27439/vincent-ramdhanie" target="_blank">vincent-ramdhanie</a> 

Cuando se declara una variable referencia (Un objeto), realmente se está creando un puntero a un objeto. Consideremos el siguiente código que declara un entero con el tipo de dato primitivo:

<!--more-->

<pre lang="java">int x;
x = 10;
</pre>

En el ejemplo la variable `x` es un `int` y JAva lo inicializa a 0. Cuando se le asigna el 10 en la segunda línea el valor se escribe el la posición de memoria a la que apunta `x`. Pero cuando la variable es de tipo referencia ocurre algo distinto. Por ejemplo:

<pre lang="java">Integer num;
num = new Integer(10);
</pre>

La primera línea declara una variable llamada `num`, pero no contiene un valor primitivo como en el caso anterior. En su lugar contiene un puntero (Porque su tipo es `Integer`, de tipo referencia). Como hasta el momento no se le ha dicho hacia qué apuntar, Java le asigna Null, lo cual significa que no apunta a nada.

En la segunda línea, la palabra reservada `new` se usa para instanciar (o crear) un objeto de tipo `Integer` y la variable puntero `num` se asigna a éste objeto. Ahora se puede referenciar al objeto usando el operador de de-referencia `.` (El punto). 

La excepción `NullPointerException` ocurre al declarar una variable y no crear el objeto. Si se intenta de-referenciar `num` antes de crear el objeto se obtiene un `NullPointerException`. En los casos más triviales el compilador capturará el problema e informará de él con el mensaje *“num quizá no se haya inicializado”* pero en otras ocasiones se escribirá código que no crea el objeto directamente.

Por ejemplo se puede tener un método como el siguiente:

<pre lang="java">public void doSomething(Integer num){
   // Usar num
}
</pre>

En el cual no se está creando el objeto, si no asumiendo que fue creado antes de llamar al método `doSomething`. El problema es que puede que se llame al método así:

<pre lang="java">doSomething(null);
</pre>

En cuyo caso `num` es Null. La mejor forma de evitar este tipo de excepciones es comprobar siempre si es null en caso de no haber creado el objeto nosotros mismos. Por tanto, `doSomething()` debería escribirse así:

<pre lang="java">public void doSomething(Integer num){
    if(num != null){
       // Usar num
    }
}
</pre>

#### Referencias

*What is a Null Pointer Exception, and how do I fix it?* **|** <a href="http://stackoverflow.com/a/218510/1612432" target="_blank">stackoverflow</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Qué es un NullPointerException y cómo solucionarlo+http://elbauldelprogramador.com/que-es-un-nullpointerexception-y-como-solucionarlo/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/que-es-un-nullpointerexception-y-como-solucionarlo/&t=Qué es un NullPointerException y cómo solucionarlo+http://elbauldelprogramador.com/que-es-un-nullpointerexception-y-como-solucionarlo/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Qué es un NullPointerException y cómo solucionarlo+http://elbauldelprogramador.com/que-es-un-nullpointerexception-y-como-solucionarlo/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
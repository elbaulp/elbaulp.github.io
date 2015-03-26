---
id: 150
title: 'Clases y Objetos &#8211; Punteros a objetos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/clases-y-objetos-punteros-a-objetos/
permalink: /clases-y-objetos-punteros-objetos/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/03/clases-y-objetos-punteros-objetos.html
  - /2011/03/clases-y-objetos-punteros-objetos.html
  - /2011/03/clases-y-objetos-punteros-objetos.html
categories:
  - C
---
<div class="iconcpp">
</div>

Los operadores **new y delete** ofrecen la posibilidad de reservar y liberar de  
forma dinámica la porción de memoria que ocupa un objeto, de un modo similar a la de  
las funciones **malloc y free**. La ventaja principal estriba en que **new y delete** forman  
parte del lenguaje C++, no son funciones de una librería. Hay dos tipos de operadores  
new y delete, según traten o no con arrays. En el segundo caso, **operator new**( admite  
opcionalmente una inicialización. La sentencia:  
  
<!--more-->

{% highlight bash %}int* int_ptr= new int(3);
{% endhighlight %}

reserva memoria para un entero, y lo inicializa con el número 3. El operador new  
devuelve la dirección del bloque de la memoria donde está guardado el valor de la  
variable. Para conocer el valor de la variable a la que apunta int_ptr, basta escribir:

{% highlight bash %}cout &lt; &lt; *int_Ptr;
{% endhighlight %}

Algo que podemos expresar mediante la siguiente regla general:

{% highlight bash %}contenido = *direccion;
{% endhighlight %}

Para liberar la memoria anteriormente reservada se llama a **operator delete()**.

{% highlight bash %}delete int_ptr;
{% endhighlight %}

Los pasos para declarar y usar punteros a objetos son idénticos a los empleados  
con otras variables:

&#8211;Se declara un puntero a un objeto de la clase Punto

{% highlight bash %}Punto* ptro_pt;
{% endhighlight %}

&#8211;Se reserva espacio en memoria mediante el operador new, el cual devuelve la  
dirección del comienzo del bloque que ocupa dicho objeto en memoria, y luego se llama  
a un constructor, inicializando los miembros dato.

{% highlight bash %}ptro_pt=new Punto('*', 20, 10); <span class="comentarios">//primer constructor</span>
ptro_pt=new Punto(20, 10);      <span class="comentarios">//segundo constructor</span>
ptro_pt=new Punto();            <span class="comentarios">//constructor por defecto</span>
{% endhighlight %}

&#8211;Para acceder a los miembros públicos de la clase se utiliza la flecha(-». Por  
ejemplo, para llamar a la función mostrar, basta escribir:

{% highlight bash %}ptro_pt->mostrar ();
{% endhighlight %}

En general, para acceder a un miembro público (dato o función) de una clase  
desde un puntero a un objeto se escribirá:

{% highlight bash %}puntero_a_objeto->miembro_público;
{% endhighlight %}

&#8211;Podemos liberar la porción de la memoria reservada mediante el operador  
delete, en cualquier momento en el que no necesitemos ya más del objeto reverenciado  
por ptro_pt, sin esperar a que se alcance el final del bloque de su ámbito de definición.

{% highlight bash %}delete ptro_pt;   <span class="comentarios">//llama al destructor</span>
{% endhighlight %}

* * *

#### Siguiente tema: [Clases y Objetos &#8211; Arrays][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Clases y Objetos &#8211; Punteros a objetos+http://elbauldelprogramador.com/clases-y-objetos-punteros-objetos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/clases-y-objetos-punteros-objetos/&t=Clases y Objetos &#8211; Punteros a objetos+http://elbauldelprogramador.com/clases-y-objetos-punteros-objetos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Clases y Objetos &#8211; Punteros a objetos+http://elbauldelprogramador.com/clases-y-objetos-punteros-objetos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/clases-y-objetos-arrays/
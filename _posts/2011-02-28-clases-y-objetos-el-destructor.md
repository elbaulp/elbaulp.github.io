---
id: 145
title: 'Clases y Objetos &#8211; El Destructor'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/clases-y-objetos-el-destructor/
permalink: /clases-y-objetos-el-destructor/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/clases-y-objetos-el-destructor.html
  - /2011/02/clases-y-objetos-el-destructor.html
  - /2011/02/clases-y-objetos-el-destructor.html
categories:
  - C
---
<div class="iconcpp">
</div>

Ya hemos visto como [definir una clase][1], y como crear un [constructor][2] para ella. Ahora vamos a ver como destruir un objeto creado.  
  
<!--more-->

El destructor es una función especial, que tiene el mismo nombre que la clase  
pero que va precedido del símbolo ~ (ASCII 126). El destructor es único y no tiene  
argumentos: se puede definir dentro de la clase o fuera de la misma. Si no se ha definido  
explícitamente un destructor dentro de la clase, C++ proporciona uno. Cuando una  
variable sale del ámbito en la que se ha declarado, se libera la memoria que ocupa: un  
objeto llama para este propósito al destructor. Por ejemplo, en el [capitulo anterior][2] creamos pt1 y def, son objetos  
definidos en el bloque de **main**. Cuando el programa alcanza el final del bloque, dichos  
objetos salen de ámbito llamando al destructor de la clase, e imprimiendo en la pantalla  
dos mensajes idénticos (objeto de la clase Punto destruido).



{% highlight bash %}int (main){
  Punto ptl(‘*’, 20, 10);
  Punto def;
  <span class="comentario">//...</span>
  return 0;
}
{% endhighlight %}



Declaración y definición del destructor de la clase. La definición puede hacerse  
también fuera de la clase.

{% highlight bash %}class Punto{
  public:
    <span class="comentario">//...</span>
    ~Punto() { cout&lt; &lt;"nobjeto Punto destruido"; }
};
{% endhighlight %}

* * *

#### Siguiente tema: [Clases y Objetos - Control del acceso a los miembros de la clase][3] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Clases y Objetos &#8211; El Destructor+http://elbauldelprogramador.com/clases-y-objetos-el-destructor/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/clases-y-objetos-el-destructor/&t=Clases y Objetos &#8211; El Destructor+http://elbauldelprogramador.com/clases-y-objetos-el-destructor/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Clases y Objetos &#8211; El Destructor+http://elbauldelprogramador.com/clases-y-objetos-el-destructor/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/clases-y-objetos-definir-una-clase/
 [2]: http://elbauldelprogramador.com/clases-y-objetos-el-constructor/
 [3]: http://elbauldelprogramador.com/clases-y-objetos-control-del-acceso-los/
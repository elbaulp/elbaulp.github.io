---
id: 145
title: 'Clases y Objetos &#8211; El Destructor'

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
    ~Punto() { cout< <"nobjeto Punto destruido"; }
};
{% endhighlight %}

* * *

#### Siguiente tema: [Clases y Objetos - Control del acceso a los miembros de la clase][3] {.referencia}



 [1]: http://elbauldelprogramador.com/clases-y-objetos-definir-una-clase/
 [2]: http://elbauldelprogramador.com/clases-y-objetos-el-constructor/
 [3]: http://elbauldelprogramador.com/clases-y-objetos-control-del-acceso-los/

{% include _toc.html %}

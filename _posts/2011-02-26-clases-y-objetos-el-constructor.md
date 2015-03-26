---
id: 144
title: 'Clases y Objetos &#8211; El Constructor'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/clases-y-objetos-el-constructor/
permalink: /clases-y-objetos-el-constructor/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/clases-y-objetos-el-constructor.html
  - /2011/02/clases-y-objetos-el-constructor.html
  - /2011/02/clases-y-objetos-el-constructor.html
categories:
  - C
---
<div class="iconcpp">
</div>

## Constructores

Una vez que [se ha definido una clase][1], para usarla se ha de definir un objeto. Se define una variable de la clase Punto, exactamente igual que se define una variable de un tipo predefinido (int, float, etc.), o definido por el usuario. Las variables de una clase se denominan objetos. Los objetos usan la misma notación que cualquier tipo de variable, y su alcance se extiende desde la línea donde se ha declarado hasta el final del bloque.  
  
<!--more-->

Un objeto perteneciente a una clase se crea llamando a una función especial  
denominada constructor de la clase. El constructor se llama de forma automática cuando  
se crea un objeto, para situarlo en memoria e inicializar los miembros dato declarados  
en la clase. El constructor tiene el mismo nombre que la clase. Lo específico del  
constructor es que no tiene tipo de retorno, por lo que su sintaxis es más simple:



{% highlight cpp %}>Punto:: Punto (argumentos){% endhighlight %}



Declaración del constructor: 

{% highlight cpp %}>class Punto{
    //...
  public:
    Punto (char chl, int x1, int yl);
    //...
};
{% endhighlight %}

Definición del constructor. El constructor inicializa los miembros dato:

{% highlight cpp %}>Punto::Punto (char ch1,int x1, int y1){
  ch=chl;
  x=xl;
  y=yl; 
}
{% endhighlight %}

Llamada al constructor. Para crear un objeto pt1 de la clase Punto, basta una única  
sentencia

{% highlight bash %}Punto ptl(‘*’, 40, 13);{% endhighlight %}

En dicho objeto, el miembro dato ch guardará el carácter *, el miembro dato x,  
el número entero 40, y el miembro y, el entero 13.

Se llama a las funciones miembro desde el objeto pt1

{% highlight cpp %}>pt1.mostrar();
ptl.ocultar();
{% endhighlight %}

Podemos tener más de un constructor, por ejemplo uno que fije el carácter pero  
que permita cambiar las coordenadas del punto.

Declaración del constructor

{% highlight cpp %}>class Punto{
    //...
  public:
    Punto (int xl, int yl);
    //...
};
{% endhighlight %}

Definición del constructor: se fija el carácter, y se le pasan las coordenadas del punto.

{% highlight cpp %}>Punto::Punto(int xl, int yl){
  x 1=xl;
  y=y1;
  ch=’*’;
}
{% endhighlight %}

Se llama al constructor para crear un objeto pt2

{% highlight bash %}Punto pt2(40, 13);{% endhighlight %}

En dicho objeto, el miembro dato ch guardará el carácter *, el miembro dato x,  
el número entero 40, y el miembro y, el entero 13.

Se llama a las funciones miembro desde el objeto pt2

{% highlight cpp %}>pt2.mostrar();
pt2.ocultar();
{% endhighlight %}

Una clase, como hemos visto, puede tener más de un constructor. Cuando un  
constructor no tiene argumentos, se dice que es el constructor por defecto.

Declaración del constructor por defecto de la clase

{% highlight cpp %}>class Punto{
    //...
  public:
    Punto();
    //...
};
{% endhighlight %}

Definición del constructor por defecto: los miembros dato se inicializan en el bloque  
de dicho constructor

{% highlight cpp %}>Punto::Punto(){
  ch=’*’;
  x=40;
  y=13;
}
{% endhighlight %}

Para llamar al constructor por defecto, basta escribir:

{% highlight bash %}Punto def;{% endhighlight %}

No escribir la sentencia:

{% highlight cpp %}>Punto def();
//Error
//Se llama a las funciones miembro desde el objeto def
def.mostrar();
def.ocultar();
{% endhighlight %}

* * *

#### Siguiente tema: [Clases y Objetos &#8211; El Destructor][2] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Clases y Objetos &#8211; El Constructor+http://elbauldelprogramador.com/clases-y-objetos-el-constructor/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/clases-y-objetos-el-constructor/&t=Clases y Objetos &#8211; El Constructor+http://elbauldelprogramador.com/clases-y-objetos-el-constructor/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Clases y Objetos &#8211; El Constructor+http://elbauldelprogramador.com/clases-y-objetos-el-constructor/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
 [2]: http://elbauldelprogramador.com/clases-y-objetos-el-destructor/
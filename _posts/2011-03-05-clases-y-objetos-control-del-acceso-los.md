---
id: 148
title: 'Clases y Objetos &#8211; Control del acceso a los miembros de la clase'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/clases-y-objetos-control-del-acceso-a-los-miembros-de-la-clase/
permalink: /clases-y-objetos-control-del-acceso-los/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/03/clases-y-objetos-control-del-acceso-los.html
  - /2011/03/clases-y-objetos-control-del-acceso-los.html
  - /2011/03/clases-y-objetos-control-del-acceso-los.html
categories:
  - C
---
<div class="iconcpp">
</div>

Veamos la diferencia entre las siguientes declaraciones de la [clase Punto][1]:  
  
<!--more-->

  


{% highlight bash %}class Punto{
 
public:
  int x;
  int y;
  char ch;

  Punto (char ch1, int x1, int y1);
  void mostrar ();
  void ocultar ();
};
{% endhighlight %}

{% highlight bash %}class Punto{
  int x;
  int y;
  char ch;

public:
  Punto(char chl, int x1, int yl);
  void mostrar();
  void ocultar();
};
{% endhighlight %}



La diferencia de las declaraciones de las clases está en el acceso a los miembros  
dato de la clase, **private**, por defecto. Los datos son, por tanto, privados y las funciones  
son públicas. Cualquier intento de modificar directamente los valores de la abscisa x, la  
ordenada y, o del carácter ch, dará lugar a un error en tiempo de compilación. Luego, en  
**main** no podremos escribir las sentencias:



{% highlight bash %}pt.x=19;
pt.y=5;
pt.ch=’+’;
{% endhighlight %}

El hecho de que los datos sean privados no quiere decir que sean invisibles:  
simplemente quiere decir que no se pueden cambiar desde el exterior. Si es imposible  
acceder a los datos privados, se pueden añadir a la clase funciones que permitan conocer  
sus valores. Si nos interesa conocer la abscisa x y la ordenada y del punto, podernos  
añadir a la clase dos funciones miembro denominadas getx y gety, que retornan los  
valores de *x* y de *y*.



{% highlight bash %}class Punto{
  int y;
  char ch;
public:
  Punto(char chl, int x1, int y1);
  void mostrar ();
  void ocultar ();
  int getx () { return x;}
  int gety () { return y;}
};
{% endhighlight %}



Este ejemplo ilustra una faceta importante del lenguaje C++ denominada  
encapsulación. El acceso a los miembros de una clase está controlado. Para usar una  
clase, solamente se necesita saber qué funciones miembro se pueden llamar y qué datos  
son accesibles. A esto se le denomina interfaz de la clase. No necesitamos saber cómo está hecha la clase, cómo son sus detalles internos. A esto se le denomina ocultamiento  
de la información. Una vez que la clase está depurada y probada, la clase es como una  
caja negra. Los objetos de dicha clase guardan unos datos, y están caracterizados por  
una determinada conducta.

Para acceder a un miembro público (dato o función), desde un objeto de la clase  
Punto basta escribir:



{% highlight bash %}objeto.miembro_público;
{% endhighlight %}

Habitualmente, los miembros públicos son funciones, como mostrar, ocultar,  
*getx, gety*. Las llamadas a dichas funciones miembro desde un objeto *pt1* de la clase  
Punto, se escribirán:



{% highlight bash %}ptl.mostrar ();
cout &lt; &lt; "nabscisa del punto= " &lt;&lt; ptl.getx();
cout &lt;&lt; "nordenada del punto= "&lt;&lt; ptl.gety ();
{% endhighlight %}

* * *

#### Siguiente tema: [Clases y Objetos - Funciones Inline][2] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Clases y Objetos &#8211; Control del acceso a los miembros de la clase+http://elbauldelprogramador.com/clases-y-objetos-control-del-acceso-los/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/clases-y-objetos-control-del-acceso-los/&t=Clases y Objetos &#8211; Control del acceso a los miembros de la clase+http://elbauldelprogramador.com/clases-y-objetos-control-del-acceso-los/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Clases y Objetos &#8211; Control del acceso a los miembros de la clase+http://elbauldelprogramador.com/clases-y-objetos-control-del-acceso-los/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
 [2]: http://elbauldelprogramador.com/clases-y-objetos-funciones-inline/
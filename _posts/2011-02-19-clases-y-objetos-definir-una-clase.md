---
id: 140
title: 'Clases y Objetos &#8211; Definir una Clase'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/clases-y-objetos-definir-una-clase/
permalink: /clases-y-objetos-definir-una-clase/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/clases-y-objetos-definir-una-clase.html
  - /2011/02/clases-y-objetos-definir-una-clase.html
  - /2011/02/clases-y-objetos-definir-una-clase.html
categories:
  - C
---
<div class="iconcpp">
</div>

Consideremos una clase denominada Punto, con tres miembros dato: dos variables enteras x e y que se usan para guardar las coordenadas de un punto de la pantalla, y una variable del tipo char, ch, que se usa para visualizar el punto en una pantalla de texto. Vamos a declarar y definir dos funciones miembro que permitan mostrar u ocultar el punto. De este modo, la clase Punto no solamente sirve para guardar datos, sino también para usar dichos datos. Los pasos para definir la clase, crear un objeto perteneciente a dicha clase y llamar desde dicho objeto a las funciones miembro o métodos de la clase se exponen a continuación.  
  
<!--more-->

## Definir la clase



Se declaran las variables que van a guardar los datos, y las funciones que van a manipular dichos datos. Se sitúan convenientemente los controladores de acceso a la clase public o private (por defecto), teniendo en cuenta la regla general de que una clase debe ocultar tanta información como sea posible.

<pre>class Punto{
  int x;          <span class="comentario">//miembros dato</span>
  int y;
  char ch;

public:

  void mostrar(); <span class="comentario">//miembros función</span>
  void ocultar();
};
</pre>



Se definen las funciones miembro de la clase. Para indicar que una función es miembro de una determinada clase se pone, entre el tipo de variable que retorna y el nombre de la función, el nombre de la clase y el símbolo (operador de resolución de ámbito).

<pre>void <b>Punto</b>::mostrar() {
  gotoxy(x,y);
  cout < < ch;
}
void <b>Punto::ocultar() {
  gotoxy(x,y);
  cout < < " ";
}
</pre>


<p>
  
</p>


<p>
  En la pantalla de texto se pueden imprimir 80 caracteres horizontalmente y 25 caracteres verticalmente. La función gotoxy, sitúa el cursor en la posición indicada por las coordenadas x e y.
</p>


<p>
  - La función mostrar pone el carácter guardado en ch en la posición (x, y).
</p>


<p>
  - La función ocultar pone un espacio en dicha posición, borrando el carácter.
</p>


<hr />

<h4 class="referencia">
  Siguiente tema: <a href="http://elbauldelprogramador.com/clases-y-objetos-el-constructor/">Clases y Objetos - El Constructor</a>
</h4>


<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Clases y Objetos &#8211; Definir una Clase+http://elbauldelprogramador.com/clases-y-objetos-definir-una-clase/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/clases-y-objetos-definir-una-clase/&t=Clases y Objetos &#8211; Definir una Clase+http://elbauldelprogramador.com/clases-y-objetos-definir-una-clase/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Clases y Objetos &#8211; Definir una Clase+http://elbauldelprogramador.com/clases-y-objetos-definir-una-clase/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
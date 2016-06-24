---
title: 'Clases y Objetos &#8211; Definir una Clase'
layout: post.amp
permalink: /clases-y-objetos-definir-una-clase/
categories:
  - C
main-class: "dev"
color: "#E64A19"
---
<div class="iconcpp">
</div>

Consideremos una clase denominada Punto, con tres miembros dato: dos variables enteras x e y que se usan para guardar las coordenadas de un punto de la pantalla, y una variable del tipo char, ch, que se usa para visualizar el punto en una pantalla de texto. Vamos a declarar y definir dos funciones miembro que permitan mostrar u ocultar el punto. De este modo, la clase Punto no solamente sirve para guardar datos, sino también para usar dichos datos. Los pasos para definir la clase, crear un objeto perteneciente a dicha clase y llamar desde dicho objeto a las funciones miembro o métodos de la clase se exponen a continuación.  

<!--ad-->

## Definir la clase



Se declaran las variables que van a guardar los datos, y las funciones que van a manipular dichos datos. Se sitúan convenientemente los controladores de acceso a la clase public o private (por defecto), teniendo en cuenta la regla general de que una clase debe ocultar tanta información como sea posible.

```bash
class Punto{
  int x;          //miembros dato
  int y;
  char ch;

public:

  void mostrar(); //miembros función
  void ocultar();
};

```



Se definen las funciones miembro de la clase. Para indicar que una función es miembro de una determinada clase se pone, entre el tipo de variable que retorna y el nombre de la función, el nombre de la clase y el símbolo (operador de resolución de ámbito).

```bash
void <b>Punto</b>::mostrar() {
  gotoxy(x,y);
  cout < < ch;
}
void <b>Punto::ocultar() {
  gotoxy(x,y);
  cout < < " ";
}

```


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
  Siguiente tema: <a href="https://elbauldelprogramador.com/clases-y-objetos-el-constructor/">Clases y Objetos - El Constructor</a>
</h4>




{% include toc.html %}

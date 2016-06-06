---
id: 150
title: 'Clases y Objetos &#8211; Punteros a objetos'

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




categories:
  - C
main-class: 'dev'
---
<div class="iconcpp">
</div>

Los operadores **new y delete** ofrecen la posibilidad de reservar y liberar de  
forma dinámica la porción de memoria que ocupa un objeto, de un modo similar a la de  
las funciones **malloc y free**. La ventaja principal estriba en que **new y delete** forman  
parte del lenguaje C++, no son funciones de una librería. Hay dos tipos de operadores  
new y delete, según traten o no con arrays. En el segundo caso, **operator new**( admite  
opcionalmente una inicialización. La sentencia:  

<!--ad-->

```bash
int* int_ptr= new int(3);

```

reserva memoria para un entero, y lo inicializa con el número 3. El operador new  
devuelve la dirección del bloque de la memoria donde está guardado el valor de la  
variable. Para conocer el valor de la variable a la que apunta int_ptr, basta escribir:

```bash
cout < < *int_Ptr;

```

Algo que podemos expresar mediante la siguiente regla general:

```bash
contenido = *direccion;

```

Para liberar la memoria anteriormente reservada se llama a **operator delete()**.

```bash
delete int_ptr;

```

Los pasos para declarar y usar punteros a objetos son idénticos a los empleados  
con otras variables:

&#8211;Se declara un puntero a un objeto de la clase Punto

```bash
Punto* ptro_pt;

```

&#8211;Se reserva espacio en memoria mediante el operador new, el cual devuelve la  
dirección del comienzo del bloque que ocupa dicho objeto en memoria, y luego se llama  
a un constructor, inicializando los miembros dato.

```bash
ptro_pt=new Punto('*', 20, 10); //primer constructor
ptro_pt=new Punto(20, 10);      //segundo constructor
ptro_pt=new Punto();            //constructor por defecto

```

&#8211;Para acceder a los miembros públicos de la clase se utiliza la flecha(-». Por  
ejemplo, para llamar a la función mostrar, basta escribir:

```bash
ptro_pt->mostrar ();

```

En general, para acceder a un miembro público (dato o función) de una clase  
desde un puntero a un objeto se escribirá:

```bash
puntero_a_objeto->miembro_público;

```

&#8211;Podemos liberar la porción de la memoria reservada mediante el operador  
delete, en cualquier momento en el que no necesitemos ya más del objeto reverenciado  
por ptro_pt, sin esperar a que se alcance el final del bloque de su ámbito de definición.

```bash
delete ptro_pt;   //llama al destructor

```

* * *

#### Siguiente tema: [Clases y Objetos &#8211; Arrays][1] {.referencia}



 [1]: https://elbauldelprogramador.com/clases-y-objetos-arrays/

{% include _toc.html %}

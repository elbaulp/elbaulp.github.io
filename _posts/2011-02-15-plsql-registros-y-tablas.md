---
id: 138
title: 'PL/SQL &#8211; Registros y Tablas'

layout: post
guid: http://elbauldelprogramador.org/plsql-registros-y-tablas/
permalink: /plsql-registros-y-tablas/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/plsql-registros-y-tablas.html
  - /2011/02/plsql-registros-y-tablas.html
  - /2011/02/plsql-registros-y-tablas.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

Existen dos tipos de datos que no he mencionado anteriormente: los registros (o estructuras) y las tablas (o arrays o vectores).

Los dos tipos deben ser definidos como un nuevo tipo antes de [declarar variables][1] de ese nuevo tipo.

El modo de definir nuevos tipos de variables en PL/SQL es a través de la palabra reservada TYPE:  


{% highlight sql %}TYPE nuevo_tipo IS tipo_original.{% endhighlight %}

  
<!--more-->

  
Una vez definido en nuevo tipo, ya se pueden definir variables de ese nuevo tipo.

## Registros



Los registros no son más que agrupaciones de tipos de variables que se acceden con el mismo nombre.



{% highlight sql %}TYPE nombre_registro IS RECORD(
  Campo1 tipo,
  Campo2 tipo,
  Campo3 tipo );
{% endhighlight %}



Por ejemplo:  


{% highlight sql %}TYPE alumno IS RECORD(
  n_alumno VARCHAR2(5),
  nombre VARCHAR2(25),
  tlf VARCHAR2(15) );
{% endhighlight %}



## Tablas

Una tabla no es más que una colección de elementos identificados cada uno de ellos por un índice. En muchos lenguajes se les denomina arrays o matrices.

{% highlight sql %}TYPE nombre_tabla IS TABLE OF tipo_de_elementos;{% endhighlight %}



El tamaño de la tabla se define durante la declaración de la variable.

{% highlight sql %}Nombre_variable nombre_tabla := nombre_variable( lista de elementos );{% endhighlight %}

Pro ejemplo:

{% highlight sql %}DECLARE
  TYPE array_enteros IS TABLE OF INTEGER;
  Un_array array_enteros := array_enteros( 0, 0, 0, 0 );
{% endhighlight %}

* * *

#### Siguiente tema: [Tunning básico de SQL][2] {.referencia}



 [1]: http://elbauldelprogramador.com/plsql-declaracion-de-variables/
 [2]: http://elbauldelprogramador.com/tunning-basico-de-sql/

{% include _toc.html %}

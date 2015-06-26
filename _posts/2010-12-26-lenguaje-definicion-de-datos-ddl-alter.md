---
id: 68
title: 'Lenguaje Definición de Datos (DDL) &#8211; ALTER TABLE'

layout: post
guid: http://elbauldelprogramador.org/lenguaje-definicion-de-datos-ddl-alter-table/
permalink: /lenguaje-definicion-de-datos-ddl-alter/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
  
categories:
  - BaseDeDatos
tags:
  - concepto de ddl
  - que es un ddl
  - sentencias dml y ddl
---
<div class="icosql">
</div>

#### Modificar la estrutura de una tabla

Para modificar la estructura de una tabla se utiliza el comando ALTER TABLE.

{% highlight sql %}ALTER TABLE Tabla
 {[ADD       ( Columna Tipodato [restricción de columna][…])]
 [MODIFY ( Columna Tipodato[restricción de columna]][…])]
 [ADD CONSTRAINTS restricción]
 [DROP CONSTRAINTS restricción]};{% endhighlight %}

  
<!--ad-->

  
Añadir o modificar columnas ( nombre, tipo, valor por defecto, restricción NOT NULL)

{% highlight sql %}alter table nombre_table {ADD | MODIFY} ( columna tipo [restricción,..]){% endhighlight %}

Eliminación de columnas

{% highlight sql %}alter table nombre_table DROP COLUMN nombre_columna{% endhighlight %}

Añadir restricción de tabla

{% highlight sql %}alter table nombre_tabla ADD CONSTRAINT nombre_restricción restricción{% endhighlight %}

Eliminar una restricción.

{% highlight sql %}alter table nombre_table DROP CONSTRAINT nombre_restricción {% endhighlight %}

Activación y desactivación de una restricción.

{% highlight sql %}alter table nombre_table [ENABLE VALIDATE|ENABLE NOVALIDATE|DISABLE] nombre_restricción{% endhighlight %}

Donde:

ENABLE VALIDATE activa la restricción si el conjunto de filas ya presentes en la tabla cumple dicha restricción.

ENABLE NOVALIDATE activa la restricción para las siguientes instrucciones de manipulación de datos.

DISABLE desactiva la restricción.

Hay que tener en cuenta que si la tabla está vacía, al añadir una columna con la restricción NOT NULL no habrá ningún error, pero si tiene filas no permitirá añadir una columna con esta opción. 

Ejemplos:

{% highlight sql %}alter table CabFacturas ADD dFecPago DATE;{% endhighlight %}



{% highlight sql %}alter table CabFacturas MODIFY dFecPago DEFAULT SYSDATE;{% endhighlight %}



{% highlight sql %}alter table CabFacturas DROP COLUMN dFecAux;{% endhighlight %}



{% highlight sql %}alter table CabFacturas ADD CONSTRAINT CK_CabFacturas CHECK ( dFecPago >= dFecFac);{% endhighlight %}



{% highlight sql %}alter table LinFacturas ADD CONSTRAINT CK1_LinFact CHECK ( Precio > 0);{% endhighlight %}



{% highlight sql %}alter table LinFacturas DROP CONSTRAINT CK1_LinFact;{% endhighlight %}



{% highlight sql %}alter table CabFacturas DISABLE CK_CabFacturas;{% endhighlight %}



{% highlight sql %}alter table nombre_table DROP COLUMN nombre_columna;{% endhighlight %}



* * *</p> 

#### Siguiente Tema: [Lenguaje Definición de Datos (DDL) &#8211; Vistas][1] {.referencia}



 [1]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-vistas/

{% include _toc.html %}

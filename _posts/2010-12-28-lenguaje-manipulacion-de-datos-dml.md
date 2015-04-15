---
id: 72
title: Lenguaje Manipulación de Datos (DML)

layout: post
guid: http://elbauldelprogramador.org/lenguaje-manipulacion-de-datos-dml/
permalink: /lenguaje-manipulacion-de-datos-dml/
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
  - que es un ddl
  - sentencias dml y ddl
---
<div class="icosql">
</div>

En los anteriores post hemos visto órdenes del *Lenguaje de Definición de Datos (DDL)*, [Create][1], [Drop][2], [Alter Table][3], [Vístas][4], [Índices y secuencias][5], y por último [Sinónimos y pseudoColumnas][6]

Las instrucciones de actualización son aquellas que no devuelven ningún registro, sino que son las encargadas de acciones como añadir, borrar y modificar registros. En este post veremos las órdenes INSERT, DELETE y UPDATE.

  * **INSERT**: sirve para insertar registros en una tabla
  * **DELETE**: permite eliminar registros de una tabla.
  * **UPDATE**: permite modificar registros de una tabla.

  
<!--more-->

### Inserción de registros

La sentencia INSERT nos permite introducir nuevas filas en una tabla de la base de datos. Su sintaxis más simple es:

{% highlight sql %}Insert into  tabla ([<lista_campos>]) Values ([<lista de valores>]){% endhighlight %}

donde tabla representa la tabla a la que queremos añadir el registro y los valores que siguen a la clausula VALUES son los valores que damos a los distintos campos del registro. Si no se especifica la lista de campos, la lista de valores debe seguir el orden de todos los campos de la tabla.

La lista de campos a rellenar se indica si no queremos rellenar todos los campos. Los campos no rellenados explícitamente con la orden INSERT, se rellenan con su valor por defecto (DEFAULT) o bien con NULL si no se indicó valor alguno. 

{% highlight sql %}Insert into tabla ([<lista_campos>])
Select .....{% endhighlight %}

En esta segunda sintaxis se permite añadir registros a una tabla obteniéndolos mediante una consulta SELECT. Por supuesto el tipo de los campos y el orden de estos debe coincidir con los de la lista de campos o con los de la tabla destino si estos últimos no se indican.

Ejemplo:

{% highlight sql %}CREATE SEQUENCE SQ_NumFactura START WITH 1 INCREMENT BY 1;

CREATE TABLE MATRICULAS(
    nNumMatr  NUMBER(10) PRIMARY KEY,
    cCodAlu   VARCHAR2(10),
    cNomAlu   VARCHAR2(50),
    dFecIng   DATE DEFAULT SYSDATE
);

INSERT INTO MATRICULAS VALUES (SQ_NumFactura.NEXTVAL,'123','Antonio Lopez', '01/01/2000');

INSERT INTO MATRICULAS(nNumMatr,cCodAlu,cNomAlu) VALUES (SQ_NumFactura.NEXTVAL, '456','Manuel Viedma');

SELECT * FROM MATRICULAS;

SELECT SQ_NumFactura.NEXTVAL FROM DUAL;

INSERT INTO MATRICULAS(nNumMatr,cCodAlu,cNomAlu) VALUES (SQ_NumFactura.NEXTVAL, '789','Cristina Barcelona');

SELECT * FROM MATRICULAS;{% endhighlight %}



### Borrado de registros

La sentencia DELETE nos permite borrar filas de una tabla de la base de datos. Su sintaxis más simple es:

{% highlight sql %}Delete [from] tabla [Where <condición>]{% endhighlight %}

La sentencia DELETE es de tipo DML mientras que la sentencia TRUNCATE es de tipo DDL; la diferencia está en dos aspectos:

  * DELETE puede borrar 0, 1 o más registros de una tabla, mientras que TRUNCATE los borra todos.
  * DELETE puede disparar un triger de tipo DELETE asociado a la tabla con la que estemos trabajando, mientras que TRUNCATE no disparará ningún triger.

Una vez que se han eliminado los registros utilizando la sentencia DELETE, no puede deshacer la operación. Si desea saber qué registros se eliminarán, primero examine los resultados de una consulta de selección que utilice el mismo criterio y después ejecute la consulta de borrado. Mantenga copias de seguridad de sus datos en todo momento. Si elimina los registros equivocados podrá recuperarlos desde las copias de seguridad.   
Hay que tener en mucho cuidado con la restricción de ON DELETE CASCADE.

### Modificación de registros

La sentencia UPDATE nos permite modificar filas de una tabla de la base de datos. Su sintaxis más simple es:

{% highlight sql %}Update tabla Set columna1= valor1 [, columna2= valor2, .....] [Where <condición>]{% endhighlight %}

Se modifican las columnas indicadas en el apartado SET con los valores indicados. La cláusula WHERE permite especificar qué registros serán modificados.

Su segundo tipo de sintaxis es:

{% highlight sql %}Update tabla Set columna1= (Sentencia SELECT) [Where <condición>]{% endhighlight %}

Este tipo de actualizaciones sólo son válidas si la Sentencia SELECT devuelve un único valor, que además debe de ser compatible con la columna que se actualiza.

### Sentencia MERGE

Este comando sirve para actualizar los valores de los registros de una tabla a partir de valores de registros de otra tabla o consulta. Permite pues combinar los datos de dos tablas a fin de actualizar la primera. Su sintaxis es: 

{% highlight sql %}MERGE INTO tabla alias
USING (instrucción SELECT) alias
ON (condición de unión)
WHEN MATCHED THEN
   UPDATE SET col1=valor1 [col2=valor2]
WHEN NOT MATCHED THEN
   INSERT (listaDeColumnas)
   VALUES (listaDeValores){% endhighlight %}

MERGE compara los registros de ambas tablas según la condición indicada en el apartado ON. Compara cada registro de la tabla con cada registro del SELECT. Los apartados de la sintaxis significan lo siguiente:

  * **tabla** es el nombre de la tabla que queremos modificar.
  * **USING**. En esa cláusula se indica una instrucción SELECT que muestre una tabla que contenga los datos a partir de los cuales se modifica la tabla.
  * **ON**. permite indicar la condición que permite relacionar los registros de la tabla con los registros de la consulta SELECT.
  * **WHEN MATCHED THEN**. El UPDATE que sigue a esta parte se ejecuta cuando la condición indicada en el apartado ON sea cierta para los dos registros actuales.
  * **WHEN NOT MATCHED THEN**. El INSERT que sigue a esta parte se ejecuta para cada registro de la consulta SELECT que no pudo ser relacionado con ningún registro de la tabla.

Supongamos que poseemos una tabla en la que queremos realizar una lista de localidades con su respectiva provincia. Las localidades están ya rellenadas, nos faltan las provincias. Resulta que tenemos otra tabla llamada clientes en la que tenemos datos de localidades y provincias, gracias a esta tabla podremos rellenar los datos que faltan en la otra. 

{% highlight sql %}MERGE INTO localidades l
USING (SELECT * FROM clientes) c
ON (l.localidad=clientes.localidad)
WHEN MATCHED THEN
  UPDATE SET l.provincia=c.provincia
WHEN NOT MATCHED THEN
  INSERT (localidad, provincia)
  VALUES (c.localidad, c.provincia)
{% endhighlight %}

La situación se muestra en la ilustración siguiente:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://4.bp.blogspot.com/_IlK2pNFFgGM/TRnrV2IJs1I/AAAAAAAAAOg/YMDC7sjbyQ0/s1600/merge.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="197" src="http://4.bp.blogspot.com/_IlK2pNFFgGM/TRnrV2IJs1I/AAAAAAAAAOg/YMDC7sjbyQ0/s320/merge.png" width="320" /></a>
</div>

y el resultado después de ejecutar la sentencia MERGE sería:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://2.bp.blogspot.com/_IlK2pNFFgGM/TRnrQ3Xb0EI/AAAAAAAAAOY/hBO4ZHrwZqA/s1600/tablamerge.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="116" src="http://2.bp.blogspot.com/_IlK2pNFFgGM/TRnrQ3Xb0EI/AAAAAAAAAOY/hBO4ZHrwZqA/s320/tablamerge.png" width="320" /></a>
</div>



* * *

#### Siguiente Tema: [Consulta de Datos &#8211; Cláusula Select][7] {.referencia}



 [1]: http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-create/
 [2]: http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-drop/
 [3]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-alter/
 [4]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-vistas/
 [5]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl/
 [6]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl_27/
 [7]: http://elbauldelprogramador.com/consulta-de-datos-clausula-select/

{% include _toc.html %}

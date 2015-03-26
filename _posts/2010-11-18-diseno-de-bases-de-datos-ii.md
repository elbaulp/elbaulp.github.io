---
id: 28
title: 'Diseño de Bases de Datos ( II ) &#8211; Restricciones'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/diseno-de-bases-de-datos-ii-restricciones/
permalink: /diseno-de-bases-de-datos-ii/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/11/diseno-de-bases-de-datos-ii.html
  - /2010/11/diseno-de-bases-de-datos-ii.html
  - /2010/11/diseno-de-bases-de-datos-ii.html
categories:
  - BaseDeDatos
tags:
  - default
  - sintaxis de restricciones check
  - sintaxis de restricciones check unique default
  - unique
---
<div class="icosql">
</div>

<p class="nota">
  <strong>Nota:</strong>Basado en los apuntes de clase
</p>

## 1. Restricciones Inherentes del Modelo Relacional.

<div style="margin-left: 1em">
  <p>
    - No existen tuplas repetidas (obligatoriedad de clave primaria). La relación se ha definido como un conjunto de tuplas, y en matemáticas los conjuntos por definición no incluyen elementos repetidos. Hay que decir, sin embargo, que muchos de los SGBD relacionales sí admiten duplicidad de tuplas.
  </p>
  
  <p>
    <br /><!--more-->
  </p>
  
  <p>
    - El orden de las tuplas y el de los atributos no es relevante.
  </p>
  
  <p>
    - Cada atributo de cada tupla solo puede tomar un único valor sobre el dominio sobre el que está definido.
  </p>
  
  <p>
    - Ningún atributo que forme parte de la clave primaria de una relación puede tomar un valor nulo (regla de integridad de entidad)
  </p>
  
  <p>
    <em>Estas restricciones son las que marcan la diferencia entre una tabla y una relación, ya que una tabla presenta las filas y las columnas en un orden, del cual carecen las relaciones. Por otro lado, una tabla podría contener filas repetidas. De todos modos, es muy común utilizar el término tabla para referirse a una relación.</em>
  </p>
</div>

#### Las 12 reglas de Codd

<div style="margin-left: 1em">
  <p>
    Preocupado por los productos que decían ser sistemas gestores de bases de datos relacionales (RDBMS) sin serlo, Codd publica las 12 reglas que debe cumplir todo DBMS para ser considerado relacional. Estas reglas en la práctica las cumplen pocos sistemas relaciónales. Las reglas son:
  </p>
  
  <ol>
    <li>
      <strong>Información.</strong> Toda la información de la base de datos debe estar representada explícitamente en el esquema lógico. Es decir, todos los datos están en las tablas.
    </li>
    <li>
      <strong>Acceso garantizado.</strong> Todo dato es accesible sabiendo el valor de su clave y el nombre de la columna o atributo que contiene el dato
    </li>
    <li>
      <strong>Tratamiento sistemático de los valores nulos.</strong> El DBMS debe permitir el tratamiento adecuado de estos valores.
    </li>
    <li>
      <strong>Catálogo en línea basado en el modelo relacional.</strong> Los metadatos deben de ser accesibles usando un esquema relacional.
    </li>
    <li>
      <strong>Sublenguaje de datos completo.</strong> Al menos debe de existir un lenguaje que permita el manejo completo de la base de datos. Este lenguaje, por lo tanto, debe permitir realizar cualquier operación.
    </li>
    <li>
      <strong>Actualización de vistas.</strong> El DBMS debe encargarse de que las vistas muestren la última información.
    </li>
    <li>
      <strong>Inserciones, modificaciones y eliminaciones de dato nivel.</strong> Cualquier operación de modificación debe actuar sobre conjuntos de filas, nunca deben actuar registro a<br /> registro.
    </li>
    <li>
      <strong>Independencia física.</strong> Los datos deben de ser accesibles desde la lógica de la base de datos aún cuando se modifique el almacenamiento.
    </li>
    <li>
      <strong>Independencia lógica.</strong> Los programas no deben verse afectados por cambios en las tablas.
    </li>
    <li>
      <strong>Independencia de integridad.</strong> Las reglas de integridad deben almacenarse en la base de datos (en el diccionario de datos), no en los programas de aplicación.
    </li>
    <li>
      <strong>Independencia de la distribución.</strong> El sublenguaje de datos debe permitir que sus instrucciones funcionen igualmente en una base de datos distribuida que en una que no lo es.
    </li>
    <li>
      <strong>No subversión.</strong> Si el DBMS posee un lenguaje que permite el recorrido registro a registro, éste no puede utilizarse para incumplir las reglas relacionales.
    </li>
  </ol>
</div>

## 2. Restricciones Semánticas o de Usuario.

<div style="margin-left: 1em;">
  <ol type="a">
    <li>
      <strong>Restricción de Clave Primaria</strong> <em>(PRIMARY KEY)</em>, permite declarar un atributo o conjunto de atributos como la clave primaria de una relación.
    </li>
    <li>
      <strong>Restricción de Unicidad</strong> <em>(UNIQUE)</em>, permite que una clave alternativa o secundaria pueda tomar valores únicos para las tuplas de una relación (como si de una clave primaria se tratara). Se entiende que la clave primaria siempre tiene esta restricción.
    </li>
    <li>
      <strong>Restricción de Obligatoriedad</strong> <em>(NOT NULL)</em>, permite declarar si uno o varios atributos de una relación debe tomar siempre un valor.
    </li>
    <li>
      <strong>Restricción de Integridad Referencial o de Clave Foránea</strong> <em>(FOREIGN KEY)</em>, se utiliza para que mediante claves foráneas podamos enlazar relaciones de una base de datos. La integridad referencial nos indica que si una relación tiene una clave foránea que referencia a otra relación, cada valor de la clave foránea o ajena tiene que ser igual a un valor de la clave principal de la relación a la que referencia, o bien, ser completamente nulo. Los atributos que son clave foránea en una relación no necesitan tener los mismos nombres que los atributos de la clave primaria con la cual ellos se corresponden. <p>
        El diseñador de la base de datos deberá poder especificar qué operaciones han de rechazarse y cuáles han de aceptarse, y en este caso, qué operaciones de compensación hay que realizar para mantener la integridad de la base de datos. Para ello el diseñador debe plantearse tres preguntas por cada clave foránea:
      </p>
      
      <ol>
        <li>
          <strong>¿Puede aceptar nulos esa clave foránea?</strong> Por ejemplo, (tomando como referencia las relaciones PROVEEDORES, ARTICULOS) ¿tiene sentido la existencia de un articulo cuyo proveedor se desconoce? Evidentemente, no. En algunos casos esta respuesta podría ser distinta, por ejemplo, en una base de datos con las relaciones EMPLEADOS y DEPARTAMENTOS, podría existir un empleado no asignado de momento a un departamento.
        </li>
        <li>
          <strong>¿Qué deberá suceder si se intenta eliminar una tupla referenciada por una clave foránea?</strong> Por ejemplo, si se intenta eliminar un proveedor del cual existe algún artículo. En general, para estos casos existen por lo menos tres posibilidades: <ul>
            <li>
              <strong>Restringir:</strong> La operación de eliminación se restringe sólo al caso en el que no existe alguna tupla con clave foránea que la referencie, rechazándose en caso contrario. En nuestro ejemplo, un proveedor podrá ser borrado, si y sólo si, por ahora, no suministra artículos.
            </li>
            <li>
              <strong>Propagar en cascada:</strong> La operación de borrado se propaga en cascada eliminando también todas las tuplas cuya clave foránea la referencien. En nuestro ejemplo, se eliminaría el proveedor y todas las tuplas de artículos suministrados por él.
            </li>
            <li>
              <strong>Anular:</strong> Se asignan nulos en la clave foránea de todas las tuplas que la referencien y se elimina la tupla referenciada. En nuestro ejemplo, no tiene mucho sentido, pero consistiría en asignar nulos al NIF-PROV de todas las tuplas de articulos pertenecientes al proveedor que queremos borrar, y posteriormente borrar al proveedor.
            </li>
          </ul>
        </li>
        
        <li>
          <strong>¿Qué deberá suceder si hay un intento de modificar la clave primaria de una tupla referenciada por una clave foránea?</strong> Por ejemplo, si se intenta modificar la clave de un proveedor del cual existe algún artículo. Se actua con las mismas tres posibilidades que en el caso anterior: <ul>
            <li>
              Restringir
            </li>
            <li>
              Propagar en cascada.
            </li>
            <li>
              Anular
            </li>
          </ul>
        </li>
      </ol>
    </li>
    
    <li>
      <strong>Restricción de Valor por Defecto</strong> <em>(DEFAULT)</em>, permite que cuando se inserte una tupla o registro en una tabla, para aquellos atributos para los cuales no se indique un valor exacto se les asigne un valor por defecto.
    </li>
    <li>
      <strong>Restricción de Verificación o Chequeo</strong> <em>(CHECK)</em>, en algunos casos puede ocurrir que sea necesario especificar una condición que deben cumplir los valores de determinados atributos de una relación de la BD, aparte de las restricciones vistas anteriormente.
    </li>
    <li>
      <strong>Aserciones</strong> <em>(ASSERTION)</em>: Esta restricción generaliza a la anterior, lo forman las aserciones en las que la condición se establece sobre elementos de distintas relaciones (por ello debe tener un nombre que la identifique).
    </li>
    <li>
      <strong>Disparadores</strong> <em>(TRIGGERS)</em>, a veces puede interesar espeficar una acción distinta del rechazo cuando no se cumple una determinada restricción semántica. En este caso, se recurre al uso de disparadores o triggers que nos permiten además de indicar una condición, especificar la acción que queremos que se lleve a cabo si la condición se hace verdadera. Los disparadores pueden interpretarse como reglas del tipo evento-condición-acción (ECA) que pueden interpretarse como reglas que especifican que cuando se produce un evento, si se cumple una condición, entonces se realiza una determinada acción.
    </li>
  </ol>
</div>

#### Siguiente tema: [Introducción SQL][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Diseño de Bases de Datos ( II ) &#8211; Restricciones+http://elbauldelprogramador.com/diseno-de-bases-de-datos-ii/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/diseno-de-bases-de-datos-ii/&t=Diseño de Bases de Datos ( II ) &#8211; Restricciones+http://elbauldelprogramador.com/diseno-de-bases-de-datos-ii/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Diseño de Bases de Datos ( II ) &#8211; Restricciones+http://elbauldelprogramador.com/diseno-de-bases-de-datos-ii/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/introduccion-sql-sql-introduction/
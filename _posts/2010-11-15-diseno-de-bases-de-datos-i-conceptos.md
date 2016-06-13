---
title: 'Diseño de Bases de Datos ( I ) &#8211; Conceptos del Modelo Relacional'
layout: post
permalink: /diseno-de-bases-de-datos-i-conceptos/
categories:
  - BaseDeDatos
main-class: "BaseDeDatos"
---
<div class="icosql">
</div>

<p class="nota">
  <strong>Nota:</strong>Basado en los apuntes de clase
</p>

<h2 lang="es">
  1. Introducción
</h2>

<p lang="es">
  Las bases de datos relacionales se basan en el uso de tablas (también se las llama <strong>relaciones</strong>). Las tablas se representan gráficamente como una estructura rectangular formada por filas y columnas.
</p>


<!--ad-->

<p lang="es">
  Cada fila posee una ocurrencia o ejemplar de la instancia o relación representada por la tabla (a las filas se las llama también <strong>tuplas o registros</strong>).
</p>

<p lang="es">
  Cada columna almacena información sobre una propiedad determinada de la tabla (se le llama también <strong>atributo</strong>), nombre, dni, apellidos, edad,&#8230; Cuando no se conoce el valor de un atributo se le asigna el valor <strong>nulo</strong>. Los valores nulos indican contenidos de atributos que no tienen ningún valor. En claves foráneas indican que el registro actual no está relacionado con ninguno. Las bases de datos relacionales admiten utilizar ese valor en todo tipo de operaciones.
</p>

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/_IlK2pNFFgGM/TNvmeiTTliI/AAAAAAAAAEc/oeK5KsBvCx4/s1600/m.rf1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="57" src="https://3.bp.blogspot.com/_IlK2pNFFgGM/TNvmeiTTliI/AAAAAAAAAEc/oeK5KsBvCx4/s320/m.rf1.png" width="320" /></a>
</div>

<h2 lang="es">
  Conceptos del Modelo Relacional.<br />
</h2>

<p lang="es">
  <strong>Relación (Tabla).</strong> Es el elemento central del modelo relacional. Son los objetos principales sobre los que debe recogerse información y generalmente denotan personas, lugares, cosas o eventos de interés. Una relación tiene un nombre, un conjunto de atributos que representan sus propiedades y está formada por un conjunto de tuplas que incluyen los valores que cada uno de los atributos toma para cada una de las tuplas de la relación. Una relación se representa mediante una tabla bidimensional (las columnas representan los atributos y las filas representan las tuplas o registros).
</p>

<div style="position:absolute;">
  <table border="1" cellspacing="0">
    <caption>TABLA PROVEEDORES</caption> <tr>
      <td bgcolor="#666666">
        NIF
      </td>

      <td bgcolor="#666666">
        NOMBRE
      </td>

      <td bgcolor="#666666">
        LOCALIDAD
      </td>
    </tr>

    <tr>
      <td>
        111111
      </td>

      <td>
        Manuel
      </td>

      <td>
        Málaga
      </td>
    </tr>

    <tr>
      <td>
        3333333
      </td>

      <td>
        Gabriel
      </td>

      <td>
        Granada
      </td>
    </tr>

    <tr>
      <td>
        5555555
      </td>

      <td>
        Marcos
      </td>

      <td>
        Málaga
      </td>
    </tr>

    <tr>
      <td>
        7777777
      </td>

      <td>
        Carlos
      </td>

      <td>
        Cádiz
      </td>
    </tr>
  </table>
</div>

<div style=" width:240px; position:relative; left:270px;">
  <table border="1" cellspacing="0">
    <caption>TABLA ARTICULOS</caption> <tr>
      <td bgcolor="#666666">
        CODIGO
      </td>

      <td bgcolor="#666666">
        NIF-PRO
      </td>

      <td bgcolor="#666666">
        CONCEPTO
      </td>
    </tr>

    <tr>
      <td>
        11
      </td>

      <td>
        555555
      </td>

      <td>
        Teclado
      </td>
    </tr>

    <tr>
      <td>
        22
      </td>

      <td>
        777777
      </td>

      <td>
        Impresora
      </td>
    </tr>

    <tr>
      <td>
        33
      </td>

      <td>
        111111
      </td>

      <td>
        Monitor
      </td>
    </tr>
  </table>
</div>

<p lang="es">
  <strong>- Tupla o registro.</strong> Corresponde a una fila de la tabla. Representa cada una de las ocurrencias de la relación (equivale a lo que conocemos como ocurrencia de un registro, en ficheros clásicos). El número de tuplas se denomina <strong>cardinalidad</strong>, la cardinalidad varía con el tiempo.
</p>

<p lang="es">
  <strong>Dominio.</strong> Es una colección de valores, de los cuales uno o más atributos obtienen sus valores reales. Pueden ser finitos ( dias de la semana, meses del año, letras del alfabeto, etc..) o infinitos (números reales, dias del calendario – siempre que no esten limitados por el sistema operativo o el SGBD-, etc..)
</p>

<p lang="es">
  <strong>Atributo.</strong> Corresponde a una columna de la tabla (equivale a un campo de un registro) y se definen sobre dominios. El número de atributos se llama grado. El grado no varía con el tiempo, si añadimos un atributo a una relación, podemos considerar que se trata de otra relación nueva.
</p>

<p lang="es">
  <strong>Clave candidata</strong> es un atributo K (o conjunto de atributos) de una relación R que cumple dos propiedades:
</p>

<p lang="es" style="margin-left: 1em">
  <strong>Unicidad:</strong> No existen dos tuplas en R con el mismo valor de K
</p>

<p lang="es" style="margin-left: 1em">
  <strong>Minimalidad:</strong> Si K es compuesto, no será posible eliminar ningún componente de K sin destruir la propiedad de unicidad.
</p>

Por ejemplo, el atributo compuesto (NIF,LOCALIDAD) no es una clave candidata de la relación PROVEEDORES, ya que podemos eliminar el atributo LOCALIDAD sin destruir la propiedad de unicidad, es decir, siguen sin existir dos tuplas con el mismo valor de NIF.

<p lang="es">
  <strong>Clave primaria.</strong> Es posible que una relación posea más de una clave candidata, en ese caso, se escoge una de ellas como <strong>clave primaria</strong> y el resto se denominan <strong>claves alternativas</strong>. En la práctica la elección de la clave primaria suele ser sencilla. Toda relación, sin excepción, tiene una clave primaria y suele representarse subrayando y/o añadiendo el carácter # al atributo (o conjunto de atributos) correspondiente.
</p>

<p lang="es" style="margin-left: 1em">
  Por ejemplo: Artículos( código#, concepto)
</p></p>

<p lang="es">
  <strong>Clave foránea, ajena o extranjera</strong> es un atributo (o conjunto de atributos) de una relación R1 que a la vez es clave primaria de otra relación R2. Se utiliza para referenciar a la tupla de R2 cuya clave primaria coincida con el valor de la clave foránea de R1. Ambas claves deben definirse sobre el mismo dominio.
</p>

Por ejemplo, el atributo NIF-PROV de la relación PRECIOS es clave foránea ya que se utiliza para referenciar a una tupla de PROVEEDORES mediante la clave primaria NIF.

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/_IlK2pNFFgGM/TOEf64pXGdI/AAAAAAAAAE0/eersZkN7Aj4/s1600/m.rf2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="230" src="https://2.bp.blogspot.com/_IlK2pNFFgGM/TOEf64pXGdI/AAAAAAAAAE0/eersZkN7Aj4/s320/m.rf2.png" width="320" /></a>
</div></p>



#### Siguiente tema:[Diseño de Bases de Datos ( II ) &#8211; Restricciones][1] {.referencia}



 [1]: https://elbauldelprogramador.com/diseno-de-bases-de-datos-ii/

{% include _toc.html %}

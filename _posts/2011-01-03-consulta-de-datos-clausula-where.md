---
id: 79
title: 'Consulta de Datos &#8211; Cláusula WHERE'

layout: post
guid: http://elbauldelprogramador.org/consulta-de-datos-clausula-where/
permalink: /consulta-de-datos-clausula-where/
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
main-class: 'dev'
---
<div class="icosql">
</div>

La cláusula WHERE se utiliza para seleccionar aquellos registros que cumplen una o más  
condiciones. Su sintaxis es:

```sql
WHERE <search_condition>
```

Selecciona aquellas filas que cumplen la condición especificada por esta orden. La  
condición de búsqueda o de selección de registros se puede conformar utilizando columnas de la tabla, constantes, funciones y/o expresiones y operadores.  
  
<!--ad-->

Los operadores más utilizados en las condiciones de selección son:

<table class="tabla">
  <tr>
    <td>
      Operador
    </td>
    
    <td>
      Definición
    </td>
  </tr>
  
  <tr>
    <td>
      =, !=, <>
    </td>
    
    <td>
      Igual a, distinto de, distinto de
    </td>
  </tr>
  
  <tr>
    <td>
      >, >=, <, <=
    </td>
    
    <td>
      Mayor que, Mayor o igual que, menor que, menor o igual que
    </td>
  </tr>
  
  <tr>
    <td>
      BETWEEN &#8230; AND &#8230;
    </td>
    
    <td>
      Chequea un rango incluyendo los dos valores
    </td>
  </tr>
  
  <tr>
    <td>
      LIKE
    </td>
    
    <td>
      Compara una cadena de caracteres con un patrón o formato
    </td>
  </tr>
  
  <tr>
    <td>
      IN ( ), NOT IN ( )
    </td>
    
    <td>
      Comprueba que un campo o expresión tenga valores o no en un<br /> conjunto de valores
    </td>
  </tr>
  
  <tr>
    <td>
      IS NULL, IS NOT NULL
    </td>
    
    <td>
      Comprueba que un campo o expresión sea nula o no
    </td>
  </tr>
</table>



#### Operador BETWEEN:

Para indicar que deseamos recuperar los registros según el intervalo de valores de un campo  
emplearemos el operador BETWEEN cuya sintaxis es:

```sql
Columna o Expresión [Not] Between valor1 And valor2
```

en este caso la consulta devolvería los registros que contengan en columna o expresión un  
valor incluido en el intervalo valor1, valor2 (ambos inclusive). Si anteponemos el operador NOT  
devolverá aquellos valores no incluidos en el intervalo.

#### Operador LIKE:

Este operador se utiliza para realizar comprobaciones de columnas o expresiones con  
patrones de caracteres. Su sintaxis es:

```sql
expresión_a_comparar [ NOT ] LIKE patrón
```

Los símbolos utilizados en el patrón son:

<table class="tabla">
  <tr>
    <td>
      %
    </td>
    
    <td>
      Cualquier cadena de cero o más<br /> caracteres.
    </td>
    
    <td>
      WHERE title LIKE &#8216;%computer%&#8217; busca todos los<br /> títulos de libros que contengan la palabra &#8216;computer&#8217;<br /> en cualquier parte del título.
    </td>
  </tr>
  
  <tr>
    <td>
      _ (subrayado)
    </td>
    
    <td>
      Cualquier carácter individual
    </td>
    
    <td>
      WHERE au_fname LIKE &#8216;_ean&#8217; busca todos los<br /> nombres de cuatro letras que finalicen con ean<br /> (Dean, Sean, etc.).
    </td></table> 
    
    <p>
    </p>
    
    <h4>
      Operador IN:
    </h4>
    
    <p>
      Se utiliza para comprobar si un valor pertenece a una lista de valores. Su sintaxis es:
    </p>
    
    ```sql
expresion [ NOT ] IN ( subconsulta | expresion o valor [ ,...n ])
```
    
    <p>
      La lista de valores se puede obtener a partir de una setencia select o bien indicando el<br /> conjunto de valores separados por comas
    </p>
    
    <h4>
      Operador IS NULL:
    </h4>
    
    <p>
      En SQL el valor nulo tiene un valor diferente a 0 y a cadena vacía. Por tanto, para preguntar<br /> si un atributo contiene, o no, un valor nulo, hay que utilizar el predicado IS [NOT] NULL.
    </p>
    
    <hr />
    
    <h4 class="referencia">
      Siguiente Tema: <a href="https://elbauldelprogramador.com/consulta-de-datos-clausula-group-by/">Consulta de Datos &#8211; Cláusula GROUP BY</a>
    </h4>
    
    

{% include _toc.html %}

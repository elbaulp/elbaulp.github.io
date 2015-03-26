---
id: 79
title: 'Consulta de Datos &#8211; Cláusula WHERE'
author: Alejandro Alcalde
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
blogger_permalink:
  - /2011/01/consulta-de-datos-clausula-where.html
  - /2011/01/consulta-de-datos-clausula-where.html
  - /2011/01/consulta-de-datos-clausula-where.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

La cláusula WHERE se utiliza para seleccionar aquellos registros que cumplen una o más  
condiciones. Su sintaxis es:

{% highlight sql %}>WHERE &lt;search_condition>{% endhighlight %}

Selecciona aquellas filas que cumplen la condición especificada por esta orden. La  
condición de búsqueda o de selección de registros se puede conformar utilizando columnas de la tabla, constantes, funciones y/o expresiones y operadores.  
  
<!--more-->

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

{% highlight sql %}>Columna o Expresión [Not] Between valor1 And valor2{% endhighlight %}

en este caso la consulta devolvería los registros que contengan en columna o expresión un  
valor incluido en el intervalo valor1, valor2 (ambos inclusive). Si anteponemos el operador NOT  
devolverá aquellos valores no incluidos en el intervalo.

#### Operador LIKE:

Este operador se utiliza para realizar comprobaciones de columnas o expresiones con  
patrones de caracteres. Su sintaxis es:

{% highlight sql %}>expresión_a_comparar [ NOT ] LIKE patrón{% endhighlight %}

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
    
    {% highlight sql %}>expresion [ NOT ] IN ( subconsulta | expresion o valor [ ,...n ]){% endhighlight %}
    
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
      Siguiente Tema: <a href="http://elbauldelprogramador.com/consulta-de-datos-clausula-group-by/">Consulta de Datos &#8211; Cláusula GROUP BY</a>
    </h4>
    
    <div class="sharedaddy">
      <div class="sd-content">
        <ul>
          <li>
            <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Consulta de Datos &#8211; Cláusula WHERE+http://elbauldelprogramador.com/consulta-de-datos-clausula-where/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/consulta-de-datos-clausula-where/&t=Consulta de Datos &#8211; Cláusula WHERE+http://elbauldelprogramador.com/consulta-de-datos-clausula-where/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Consulta de Datos &#8211; Cláusula WHERE+http://elbauldelprogramador.com/consulta-de-datos-clausula-where/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
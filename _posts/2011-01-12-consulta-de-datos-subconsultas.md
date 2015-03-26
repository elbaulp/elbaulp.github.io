---
id: 86
title: 'Consulta de Datos &#8211; Subconsultas'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/consulta-de-datos-subconsultas/
permalink: /consulta-de-datos-subconsultas/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/consulta-de-datos-subconsultas.html
  - /2011/01/consulta-de-datos-subconsultas.html
  - /2011/01/consulta-de-datos-subconsultas.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

Una subconsulta es una consulta SELECT que está anidada en una instrucción SELECT, INSERT, UPDATE o DELETE, o dentro de otra subconsulta. En una subconsulta, la instrucción SELECT nos para proporciona un conjunto de uno o más valores que se utilizan para evaluar una expresión.

Una subconsulta se puede utilizar en cualquier parte en la que se permita una expresión. La consulta SELECT de una subconsulta se incluye siempre entre paréntesis.

Una subconsulta puede anidarse dentro de la cláusula WHERE o HAVING de una instrucción SELECT, INSERT, UPDATE o DELETE.  
  
<!--more-->

  
Se puede disponer de hasta 32 niveles de anidamiento, aunque el límite varía dependiendo de la memoria disponible y de la complejidad del resto de las expresiones de la consulta.

Hay tres tipos básicos de subconsultas que son:

  * Operan en listas incorporadas con IN, o en aquéllas que modificó un operador de comparación mediante ANY o ALL.
  * Se introducen con un operador de comparación sin modificar y deben devolver un valor individual.
  * Son pruebas de existencia que se introducen con EXISTS. 

Las instrucciones que incluyen una subconsulta normalmente tienen uno de estos formatos:

<pre lang="sql">WHERE expression [NOT] IN (subconsulta)
WHERE expression comparison_operator [ANY | ALL] (subconsulta)
WHERE [NOT] EXISTS (subconsulta)
</pre>

El predicado IN se emplea para recuperar únicamente aquellos registros de la consulta principal para los que algunos registros de la subconsulta contienen un valor igual. Inversamente se puede utilizar NOT IN para recuperar únicamente aquellos registros de la consulta principal para los que no hay ningún registro de la subconsulta que contenga un valor igual.

Se puede utilizar el predicado ANY para recuperar registros de la consulta principal, que satisfagan la comparación (comparison_operator) con cualquier otro registro recuperado en la subconsulta.

El predicado ALL se utiliza para recuperar únicamente aquellos registros de la consulta principal que satisfacen la comparación con todos los registros recuperados en la subconsulta.

El predicado EXISTS se utiliza en comparaciones de verdad/falso para determinar si la subconsulta devuelve algún registro.

* * *

#### Siguiente Tema: [Consulta de Datos &#8211; Tablas Resumen operadores y Funciones Oracle][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Consulta de Datos &#8211; Subconsultas+http://elbauldelprogramador.com/consulta-de-datos-subconsultas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/consulta-de-datos-subconsultas/&t=Consulta de Datos &#8211; Subconsultas+http://elbauldelprogramador.com/consulta-de-datos-subconsultas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Consulta de Datos &#8211; Subconsultas+http://elbauldelprogramador.com/consulta-de-datos-subconsultas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/consulta-de-datos-tablas-resumen/
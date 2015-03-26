---
id: 85
title: 'Consulta de Datos &#8211; Operadores UNION [ALL], INTERSECT, MINUS.'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/consulta-de-datos-operadores-union-all-intersect-minus/
permalink: /consulta-de-datos-operadores-union-all/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/consulta-de-datos-operadores-union-all.html
  - /2011/01/consulta-de-datos-operadores-union-all.html
  - /2011/01/consulta-de-datos-operadores-union-all.html
categories:
  - BaseDeDatos
tags:
  - MINUS pl sql
---
<div class="icosql">
</div>

Podemos combinar múltiples consultas utilizando los operadores UNION, UNION ALL, INTERSECT y MINUS.

Los correspondientes campos y/o expresiones que aparecen en la listas de los SELECT de las consultas a las que se le aplican los operadores anteriores deben coincidir en tipo y número, o al menos, tener un tipo compatible o sobre el cual se pueda aplicar un casting automático.  
  
<!--more-->

<pre lang="sql">SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse" FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "Department", warehouse FROM warehouses;
</pre>

Cuando se aplica el operador UNION sobre dos consultas, el resultado serán los registros de la primera consulta más los registros de la segunda consulta, eliminando los registros duplicados.

Cuando se aplica el operador UNION ALL sobre dos consultas, el resultado serán los registros de la primera consulta más los registros de la segunda consulta.

<pre lang="sql">SELECT product_id FROM inventories
UNION ALL
SELECT product_id FROM order_items;
</pre>

Cuando se aplica el operador INTERSECT sobre dos consultas, el resultado serán los registros duplicados o coincidentes en la primera y segunda consulta.

<pre lang="sql">SELECT product_id FROM inventories
INTERSECT
SELECT product_id FROM order_items;
</pre>

Cuando se aplica el operador MINUS sobre dos consultas, el resultado serán los registros que están en la primera consulta pero que no aparecen en la segunda consulta.

<pre lang="sql">SELECT product_id FROM inventories
MINUS
SELECT product_id FROM order_items;
</pre>



#### Indicaciones



  * El orden de las cláusulas en las sentencia SELECT es significativo. Se puede omitir cualquiera de las cláusulas opcionales, pero cuando se usan, deben aparecer en el orden apropiado. 
  * Cuando se ejecuta la sentencia SELECT con las cláusula WHERE, GROUP BY, y HAVING el orden de ejecución es el siguiente: 
      1. El WHERE excluye las filas que no cumplen la condición.
      2. El GROUP BY colecciona las filas escogidas dentro de un grupo por cada uno de los valores de la cláusula GROUP BY.
      3. Las funciones agregado calculan los valores por cada grupo.
      4. La cláusula HAVING por último excluye las filas que no cumplen la condición de búsqueda.



* * *

#### Siguiente Tema: [Consulta de Datos &#8211; Subconsultas.][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Consulta de Datos &#8211; Operadores UNION [ALL], INTERSECT, MINUS.+http://elbauldelprogramador.com/consulta-de-datos-operadores-union-all/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/consulta-de-datos-operadores-union-all/&t=Consulta de Datos &#8211; Operadores UNION [ALL], INTERSECT, MINUS.+http://elbauldelprogramador.com/consulta-de-datos-operadores-union-all/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Consulta de Datos &#8211; Operadores UNION [ALL], INTERSECT, MINUS.+http://elbauldelprogramador.com/consulta-de-datos-operadores-union-all/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/consulta-de-datos-subconsultas/
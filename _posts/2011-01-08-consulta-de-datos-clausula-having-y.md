---
id: 84
title: 'Consulta de Datos &#8211; Cláusula HAVING y ORDER BY'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/consulta-de-datos-clausula-having-y-order-by/
permalink: /consulta-de-datos-clausula-having-y/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/consulta-de-datos-clausula-having-y.html
  - /2011/01/consulta-de-datos-clausula-having-y.html
  - /2011/01/consulta-de-datos-clausula-having-y.html
categories:
  - BaseDeDatos
tags:
  - base de datos having
---
<div class="icosql">
</div>

Especifica una condición de selección para un grupo. HAVING se usa normalmente con el GROUP BY. Cuando no está con el GROUP BY, HAVING se comporta como la cláusula WHERE, aunque esto es erróneo utilizarlo, puesto que ralentiza el sistema. Su sintaxis es:

<pre lang="sql">[ HAVING &lt;search_condition_group> ]</pre>

  
<!--more-->

  
donde search\_condition\_group determina la condición o condiciones de selección del agregado. Normalmente la condición de selección utiliza un agregado que se compara con un valor. Por ejemplo camiones que han realizado un porte o más:

<pre lang="sql">Select cCmnMtr from porte
Group by cCmnMtr
Having count(*) > =1;
</pre>



### Clausula ORDER BY

Nos devuelve las filas ordenadas por una serie de columnas. Su sintaxis es:

<pre lang="sql">[ORDER BY {order_by_expression [ ASC | DESC ] } [,...n] ]
</pre>

donde order\_by\_expression determina la columna o columnas por la cual deseamos obtener los resultados ordenados. Se puede especificar una columna, una columna renombrada, una columna cualificada por su tabla, una expresión, o un número entero positivo (mayor a cero) que determina la posición de la columna en el select list.

Se pueden especificar múltiples columnas de ordenación. La secuencia de ordenación viene determinada por el orden de aparición de las columnas en la cláusula ORDER BY.

La cláusula ORDER BY puede incluir columnas que no aparecen en la select list; sin embargo, si se especifica SELECT DISTINCT, las columnas por las que se ordena deben aparecer en la select list.

**ASC**  
Es el valor que se toma por defecto, especifica que los registros se ordenaran en orden  
ascendente.  
**DESC**  
Especifica que los registros se ordenan en orden descendente.

Los valores nulos se consideran como los más pequeños posibles.

* * *

#### Siguiente Tema: [Consulta de Datos &#8211; Operadores UNION [ALL], INTERSECT, MINUS.][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Consulta de Datos &#8211; Cláusula HAVING y ORDER BY+http://elbauldelprogramador.com/consulta-de-datos-clausula-having-y/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/consulta-de-datos-clausula-having-y/&t=Consulta de Datos &#8211; Cláusula HAVING y ORDER BY+http://elbauldelprogramador.com/consulta-de-datos-clausula-having-y/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Consulta de Datos &#8211; Cláusula HAVING y ORDER BY+http://elbauldelprogramador.com/consulta-de-datos-clausula-having-y/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/consulta-de-datos-operadores-union-all/
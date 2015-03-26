---
id: 139
title: Tunning básico de SQL
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/tunning-basico-de-sql/
permalink: /tunning-basico-de-sql/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/tunning-basico-de-sql.html
  - /2011/02/tunning-basico-de-sql.html
  - /2011/02/tunning-basico-de-sql.html
categories:
  - BaseDeDatos
tags:
  - que es tuning sql
---
<div class="icosql">
</div>

Bueno, hemos llegado al fin del temario de base de datos, todo lo que he ido escribiendo a lo largo de estos meses lo encontrarás en la página de [Base de Datos][1]. El último tema de este curso va a tratar de &#8220;Tunning básico de SQL&#8221;.  
  
<!--more-->

## Tunning básico de SQL



Una de las tareas más importantes de las propias de un desarrollador de bases de datos es la de puesta a punto o tuning. Hay que tener en cuenta que las sentencias SQL pueden llegar a ser muy  
complejas y conforme el esquema de base de datos va creciendo las sentencias son más complejas y  
confusas. Por es difícil escribir la sentencia correcta a la primera.

Por todo ello después de tener cada uno de los procesos escrito, hay que pasar por una etapa de tuning en la que se revisan todas las sentencias SQL para poder optimizarlas conforme a la experiencia adquirida.

Tanto por cantidad como por complejidad, la mayoría de las optimizaciones deben hacerse sobre sentencias SELECT, ya que son (por regla general) las responsables de la mayor pérdida de tiempos.

A continuación se dan unas normas básicas para escribir sentencias SELECT optimizadas.

&#8211; Las condiciones (tanto de filtro como de join) deben ir siempre en el orden en que esté definido el índice. Si no hubiese índice por las columnas utilizadas, se puede estudiar la posibilidad de añadirlo, ya que tener índices de más sólo penaliza los tiempos de inserción, actualización y borrado, pero no de consulta.

&#8211; Evitar la condiciones IN ( SELECT&#8230;) sustituyéndolas por joins.

&#8211; Colocar la tabla que devuelve menor número de registros en el último lugar del [FROM][2].

&#8211; Una consulta cualificada con la cláusula DISTINTC debe ser ordenada por el servidor aunque no se incluya la cláusula [ORDER BY][3].

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Tunning básico de SQL+http://elbauldelprogramador.com/tunning-basico-de-sql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/tunning-basico-de-sql/&t=Tunning básico de SQL+http://elbauldelprogramador.com/tunning-basico-de-sql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Tunning básico de SQL+http://elbauldelprogramador.com/tunning-basico-de-sql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://bashyc.blogspot.com/p/bases-de-datos.html
 [2]: http://elbauldelprogramador.com/consulta-de-datos-clausula-from/
 [3]: http://elbauldelprogramador.com/consulta-de-datos-clausula-having-y/
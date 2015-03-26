---
id: 138
title: 'PL/SQL &#8211; Registros y Tablas'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/plsql-registros-y-tablas/
permalink: /plsql-registros-y-tablas/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/plsql-registros-y-tablas.html
  - /2011/02/plsql-registros-y-tablas.html
  - /2011/02/plsql-registros-y-tablas.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

Existen dos tipos de datos que no he mencionado anteriormente: los registros (o estructuras) y las tablas (o arrays o vectores).

Los dos tipos deben ser definidos como un nuevo tipo antes de [declarar variables][1] de ese nuevo tipo.

El modo de definir nuevos tipos de variables en PL/SQL es a través de la palabra reservada TYPE:  


<pre lang="plsql">TYPE nuevo_tipo IS tipo_original.</pre>

  
<!--more-->

  
Una vez definido en nuevo tipo, ya se pueden definir variables de ese nuevo tipo.

## Registros



Los registros no son más que agrupaciones de tipos de variables que se acceden con el mismo nombre.



<pre lang="plsql">TYPE nombre_registro IS RECORD(
  Campo1 tipo,
  Campo2 tipo,
  Campo3 tipo );
</pre>



Por ejemplo:  


<pre lang="plsql">TYPE alumno IS RECORD(
  n_alumno VARCHAR2(5),
  nombre VARCHAR2(25),
  tlf VARCHAR2(15) );
</pre>



## Tablas

Una tabla no es más que una colección de elementos identificados cada uno de ellos por un índice. En muchos lenguajes se les denomina arrays o matrices.

<pre lang="plsql">TYPE nombre_tabla IS TABLE OF tipo_de_elementos;</pre>



El tamaño de la tabla se define durante la declaración de la variable.

<pre lang="plsql">Nombre_variable nombre_tabla := nombre_variable( lista de elementos );</pre>

Pro ejemplo:

<pre lang="plsql">DECLARE
  TYPE array_enteros IS TABLE OF INTEGER;
  Un_array array_enteros := array_enteros( 0, 0, 0, 0 );
</pre>

* * *

#### Siguiente tema: [Tunning básico de SQL][2] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=PL/SQL &#8211; Registros y Tablas+http://elbauldelprogramador.com/plsql-registros-y-tablas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/plsql-registros-y-tablas/&t=PL/SQL &#8211; Registros y Tablas+http://elbauldelprogramador.com/plsql-registros-y-tablas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=PL/SQL &#8211; Registros y Tablas+http://elbauldelprogramador.com/plsql-registros-y-tablas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/plsql-declaracion-de-variables/
 [2]: http://elbauldelprogramador.com/tunning-basico-de-sql/
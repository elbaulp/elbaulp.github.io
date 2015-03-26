---
id: 66
title: 'Lenguaje Definición de Datos (DDL) &#8211; DROP'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/lenguaje-definicion-de-datos-ddl-drop/
permalink: /lenguaje-definicion-de-datosddl-drop/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/lenguaje-definicion-de-datosddl-drop.html
  - /2010/12/lenguaje-definicion-de-datosddl-drop.html
  - /2010/12/lenguaje-definicion-de-datosddl-drop.html
categories:
  - BaseDeDatos
tags:
  - clausulas del ddl
  - concepto de ddl
  - que es un ddl
  - sentencias dml y ddl
---
<div class="icosql">
</div>

En el anterior post vimos la orden [CREATE.][1]  
En este post explicaré el funcionamiento de la orden DROP.

#### Borrado de una tabla (estructura y datos)

<pre lang="sql">Drop table nombre_tabla [CASCADE CONSTRAINT];</pre>

Al borrar una tabla, se borra tanto su estructura como sus datos, sus índices asociados y los privilegios concedidos sobre estas también se borran, las vistas creadas directa o indirectamente sobre esta tabla son desactivadas de forma automática por ORACLE pero no borradas.  
  
<!--more-->

  
Cada usuario puede borrar sus propias tablas, pero no puede borrar las de otro usuario al menos que tenga concedido un permiso adecuado.  
Si se hace referencia a la clave primaria de esta tabla mediante restricciones FOREIGN KEY o REFERENCES, la clausula CASCADE CONSTRAINT permite suprimir estas restricciones de integridad referencial en las tablas ‘descendientes’.

#### Borrado de los registros de una tabla

Con la orden TRUNCATE se eliminan todas las filas de una tabla y se puede liberar espacio utilizado por esta tabla. Es una orden del lenguaje DDL y por tanto no se puede anular. Tampoco activa disparadores DELETE por lo que es más rápido que una orden DELETE. Su sintaxis es:

<pre lang="sql">Truncate table nombre_table [{DROP | REUSE} STORAGE];</pre>

Con DROP STORAGE se desasigna todo el espacio.  
Con DROP REUSE mantendrá reservado el espacio para nuevas filas.

* * *</p> 

#### Siguiente Tema: [Lenguaje Definición de Datos (DDL) &#8211; ALTER TABLE][2] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Lenguaje Definición de Datos (DDL) &#8211; DROP+http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-drop/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-drop/&t=Lenguaje Definición de Datos (DDL) &#8211; DROP+http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-drop/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Lenguaje Definición de Datos (DDL) &#8211; DROP+http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-drop/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-create/
 [2]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-alter/
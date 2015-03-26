---
id: 68
title: 'Lenguaje Definición de Datos (DDL) &#8211; ALTER TABLE'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/lenguaje-definicion-de-datos-ddl-alter-table/
permalink: /lenguaje-definicion-de-datos-ddl-alter/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/lenguaje-definicion-de-datos-ddl-alter.html
  - /2010/12/lenguaje-definicion-de-datos-ddl-alter.html
  - /2010/12/lenguaje-definicion-de-datos-ddl-alter.html
categories:
  - BaseDeDatos
tags:
  - concepto de ddl
  - que es un ddl
  - sentencias dml y ddl
---
<div class="icosql">
</div>

#### Modificar la estrutura de una tabla

Para modificar la estructura de una tabla se utiliza el comando ALTER TABLE.

<pre lang="sql">ALTER TABLE Tabla
 {[ADD       ( Columna Tipodato [restricción de columna][…])]
 [MODIFY ( Columna Tipodato[restricción de columna]][…])]
 [ADD CONSTRAINTS restricción]
 [DROP CONSTRAINTS restricción]};</pre>

  
<!--more-->

  
Añadir o modificar columnas ( nombre, tipo, valor por defecto, restricción NOT NULL)

<pre lang="sql">alter table nombre_table {ADD | MODIFY} ( columna tipo [restricción,..])</pre>

Eliminación de columnas

<pre lang="sql">alter table nombre_table DROP COLUMN nombre_columna</pre>

Añadir restricción de tabla

<pre lang="sql">alter table nombre_tabla ADD CONSTRAINT nombre_restricción restricción</pre>

Eliminar una restricción.

<pre lang="sql">alter table nombre_table DROP CONSTRAINT nombre_restricción </pre>

Activación y desactivación de una restricción.

<pre lang="sql">alter table nombre_table [ENABLE VALIDATE|ENABLE NOVALIDATE|DISABLE] nombre_restricción</pre>

Donde:

ENABLE VALIDATE activa la restricción si el conjunto de filas ya presentes en la tabla cumple dicha restricción.

ENABLE NOVALIDATE activa la restricción para las siguientes instrucciones de manipulación de datos.

DISABLE desactiva la restricción.

Hay que tener en cuenta que si la tabla está vacía, al añadir una columna con la restricción NOT NULL no habrá ningún error, pero si tiene filas no permitirá añadir una columna con esta opción. 

Ejemplos:

<pre lang="sql">alter table CabFacturas ADD dFecPago DATE;</pre>



<pre lang="sql">alter table CabFacturas MODIFY dFecPago DEFAULT SYSDATE;</pre>



<pre lang="sql">alter table CabFacturas DROP COLUMN dFecAux;</pre>



<pre lang="sql">alter table CabFacturas ADD CONSTRAINT CK_CabFacturas CHECK ( dFecPago >= dFecFac);</pre>



<pre lang="sql">alter table LinFacturas ADD CONSTRAINT CK1_LinFact CHECK ( Precio > 0);</pre>



<pre lang="sql">alter table LinFacturas DROP CONSTRAINT CK1_LinFact;</pre>



<pre lang="sql">alter table CabFacturas DISABLE CK_CabFacturas;</pre>



<pre lang="sql">alter table nombre_table DROP COLUMN nombre_columna;</pre>



* * *</p> 

#### Siguiente Tema: [Lenguaje Definición de Datos (DDL) &#8211; Vistas][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Lenguaje Definición de Datos (DDL) &#8211; ALTER TABLE+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-alter/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-alter/&t=Lenguaje Definición de Datos (DDL) &#8211; ALTER TABLE+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-alter/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Lenguaje Definición de Datos (DDL) &#8211; ALTER TABLE+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-alter/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl-vistas/
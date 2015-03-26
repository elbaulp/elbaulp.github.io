---
id: 71
title: 'Lenguaje Definición de Datos (DDL) &#8211; Sinónimos y Pseudocolumnas'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/lenguaje-definicion-de-datos-ddl-sinonimos-y-pseudocolumnas/
permalink: /lenguaje-definicion-de-datos-ddl_27/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/lenguaje-definicion-de-datos-ddl_27.html
  - /2010/12/lenguaje-definicion-de-datos-ddl_27.html
  - /2010/12/lenguaje-definicion-de-datos-ddl_27.html
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

### Sinónimos

Un sinónimo es un nuevo nombre que se puede asignar a una tabla o a una vista y con ellos podemos darle nombres diferentes a un mismo objeto.

Cuando tenemos acceso a las tablas, vistas etc, de otros esquemas y deseamos consultarlas, hay que anteponer al nombre del objeto que queremos consultar el nombre del esquema y separarlos por un punto.  
<!--more--> Por ejemplo para consultar una tabla de otro esquema la sintaxis sería:

<pre lang="sql">Nombre_Esquema.Nombre_Tabla</pre>

En estos casos es conveniente el uso de sinónimos. La sintaxis para crear un sinónimo es:

<pre lang="sql">CREATE [PUBLIC] SYNONYM Nombre_Sinonimo FOR Esquema.Nombre_Tabla</pre>

La cláusula public hace que el sinónimo este libre para todos los usuarios.

Ejemplo: 

<pre lang="sql">CREATE SYNONYM EMPLEADOSCOTT FROM SCOTT.EMP;</pre>

Para borrar sinónimos se utiliza la orden:

<pre lang="sql">DROP [PUBLIC] SYNONYM [Esquema.]Nombre_Sinonimo;</pre>

Solamente el administrador de la BD y usuarios con privilegios adecuados pueden suprimir sinónimos de tipo public.

NOTA: Para ver los sinónimos que son propiedad del usuario se utiliza la vista **USER_SYNONYM**.

### Pseudocolumnas

Las pesudocolumnas son similares a los campos de una tabla, pero no lo son, aunque si pueden ser utilizados en instrucciones DML (Select, Insert…). 

Oracle proporciona varias de ellas, entre las cuales, se encuentran: *SYSDATE* que nos devuelve la fecha y hora actual del S.O donde reside la base de datos,* USER* que nos devuelve el nombre del usuario de la sesión actual y *ROWNUM* que nos sirve para limitar el número de registros que nos devuelve una consulta.

Ejemplos: 

<pre lang="sql">SELECT SYSDATE "Fecha actual" FROM DUAL;
SELECT USER FROM DUAL;
<span class="comentario">-- usando ROWNUM &lt; 10 limitamos el número de filas devueltas a 10</span>
SELECT employee_id, hire_date, SYSDATE FROM employees WHERE ROWNUM &lt; 10;</pre>

* * *

#### Siguiente Tema: [Lenguaje Manipulación de Datos (DML)][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Lenguaje Definición de Datos (DDL) &#8211; Sinónimos y Pseudocolumnas+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl_27/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl_27/&t=Lenguaje Definición de Datos (DDL) &#8211; Sinónimos y Pseudocolumnas+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl_27/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Lenguaje Definición de Datos (DDL) &#8211; Sinónimos y Pseudocolumnas+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl_27/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/lenguaje-manipulacion-de-datos-dml/
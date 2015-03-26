---
id: 70
title: 'Lenguaje Definición de Datos (DDL) &#8211; Índices y secuencias'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/lenguaje-definicion-de-datos-ddl-indices-y-secuencias/
permalink: /lenguaje-definicion-de-datos-ddl/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/lenguaje-definicion-de-datos-ddl.html
  - /2010/12/lenguaje-definicion-de-datos-ddl.html
  - /2010/12/lenguaje-definicion-de-datos-ddl.html
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

### Creación de un índice

Los índices sirven para mejorar el rendimiento de las consultas. El optimizador de Oracle los utiliza implícitamente y se actualizan de forma automática al actualizar las filas.

En general, los índices se crean sobre todas las claves externas y sobre los criterios de búsqueda actuales.  
  
<!--more-->

<pre lang="sql">CREATE [unique] INDEX nombre_indice
ON nombre_tabla (columnas [{asc | desc}] [,.....])
[TABLESPACE Nombre_Tablespace]
</pre>

Ejemplo:

<pre lang="sql"><span class="comentario">-- Creacion de un índice en una columna simple para hacer las consultas más rápidas</span>
CREATE INDEX emp_hiredate_idx ON employees (hire_date);
</pre>



#### Borrado de un índice

Cuando se borra una tabla, automáticamente se borran los índices asociados a ella. Los índices ocupan espacio dentro de la BD como si de una tabla se tratara y por esa razón se aconseja tener solo como índices aquellas columnas por las cuales se realizan consultas de forma periódica. Para borrar un índice se utiliza la orden:

<pre lang="sql">drop index nombre_indice;</pre>



### Creación de una secuencia

Las secuencias se utilizan para generar números de forma automática, sin embargo, esto no garantiza la ausencia de ‘huecos’: si se solicitan números a una secuencia y no se utilizan, estos valores se pierdan. 

<pre lang="sql">CREATE SEQUENCE Nombre_secuencia
[INCREMENT BY entero]
[START WITH entero]
[{MAXVALUE entero | NOMAXVALUE}]
[{MINVALUE entero | NOMINVALUE}]
[{CYCLE | NOCYCLE}] [{ORDER | NOODER}] 
</pre>



#### Utilización de las secuencias

  * **Nombresecuencia.CURRVAL**: Devuelve el valor actual de la secuencia.
  * **Nombresecuencia.NEXTVAL**: Devuelve el valor actual de la secuencia e incrementa el valor de la secuencia. Esta pseudo-columna es la primera a la que se tiene que hacer referencia después de crear la secuencia o abrir una sesión.

Ejemplo:

<pre lang="sql">CREATE SEQUENCE new_employees_seq START WITH 1000 INCREMENT BY 1;

<span class="comentario">-- Para usar la secuencia, primero hay que inicializarla con nextval</span>

SELECT new_employees_seq.NEXTVAL FROM DUAL;

<span class="comentario">--Despues de inicializarla, usamos currval para usar el valor actual</span>

INSERT INTO employees VALUES 
  (new_employees_seq.CURRVAL, 'Pilar', 'Valdivia', 'pilar.valdivia',
  '555.111.3333', '01-SEP-05', 'AC_MGR', 9100, .1, 101, 110);

<span class="comentario">--Consultamos la tabla de trabajadores para comprobar el valor actual de la secuencia.</span>

SELECT employee_id, last_name FROM employees WHERE last_name = 'Valdivia';
</pre>



* * *</p> 

#### Siguiente Tema: [Lenguaje Definición de Datos (DDL) &#8211; Sinónimos y Pseudocolumnas][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Lenguaje Definición de Datos (DDL) &#8211; Índices y secuencias+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl/&t=Lenguaje Definición de Datos (DDL) &#8211; Índices y secuencias+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Lenguaje Definición de Datos (DDL) &#8211; Índices y secuencias+http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/lenguaje-definicion-de-datos-ddl_27/
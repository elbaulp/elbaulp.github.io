---
id: 78
title: 'Consulta de Datos &#8211; Cláusula FROM'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/consulta-de-datos-clausula-from/
permalink: /consulta-de-datos-clausula-from/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/consulta-de-datos-clausula-from.html
  - /2011/01/consulta-de-datos-clausula-from.html
  - /2011/01/consulta-de-datos-clausula-from.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

En esta clausula se indican la tabla o tablas a las que vamos a tener acceso. Las tablas deben  
existir y si no existiera alguna aparecería el error: ORA-00942: table or view does not exist.  
Su sintaxis es :

{% highlight sql %}>[ FROM {&lt;table_source&gt;} [,...n] ]
&lt;table_source&gt; ::= table_name | view_name | derived_table | &lt;joined_table&gt;
{% endhighlight %}

  
<!--more-->

  
Es posible hacer consultas que incluyan más de una tabla dentro de la cláusula FROM, es  
los que llamamos **JOIN o yunción**. Esto se realiza cuando necesitamos acceder a datos que se  
encuentran en más de una tabla.

Pero en estas consultas hay que tener en cuenta ciertos factores: los registros que a nosotros  
nos interesan no son el resultado del producto cartesiano de las tablas sino aquellos que componen la relación igualados; además, esta relación de igualdad puede ser natural, a la izquierda, a la derecha o total. Son los llamados **JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN y FULL OUTER JOIN.**

**JOIN**  
Devuelve aquellos pares de registro que existen en ambas tablas. Se trata de una unión  
natural del álgebra relacional. Es decir cada albarán con su cliente correspondiente. No aparecen los albaranes sin clientes ni los clientes sin albaranes.

**LEFT OUTER JOIN **  
Además de los datos devueltos con JOIN cuando se utiliza LEFT OUTER aparecen los  
datos de la tabla de la izquierda que no tienen concordancia con los de la tabla de la derecha. Los datos de la tabla de la derecha aparecen a NULL.

**RIGHT OUTER JOIN **  
Además de los datos devueltos con JOIN cuando se utiliza RIGHT OUTER aparecen los  
datos de la tabla de la derecha que no tienen concordancia con los de la tabla de la izquierda. Los datos de la tabla de la izquierda se muestran a NULL.

**FULL OUTER JOIN**  
Equivale a un RIGHT y a un LEFT OUTER a la vez.

En ORACLE para realizar un JOIN se hace a través de la clausula de selección de registros  
(WHERE) del producto cartesiano de varias tablas. En este caso, cuando se unen dos tabla A y B:

  * Para hacer un JOIN la condición del WHERE es una condición de igualdad.
  * Para hacer un LEFT OUTER JOIN se aplica el operador (+) a todas las columnas de  
    la tabla B de la yunción dentro de la cláusula WHERE.
  * Para hacer un RIGHT OUTER JOIN se aplica el operador (+) a todas las columnas de  
    la tabla A de la yunción dentro de la cláusula WHERE.

En Oracle 9i, 10g y posteriores se puede realizar un JOIN natural mediante la sintaxis  
JOIN ... USING; en este caso, las columnas por las que se hace la yunción deben tener el mismo  
nombre.

{% highlight sql %}><span class="comentario">-- El siguiente select devuelve datos de 3 tablas
-- Dos tablas tienen un campo departament_id y
-- dos tablas tiene un campo location_id</span>
SELECT e.employee_id, e.last_name, e.first_name, e.department_id,
d.department_name, d.manager_id, d.location_id, l.country_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.location_id = 1700;
<span class="comentario">-- Este select devuelve datos de la tabla employees, mostrando eployeed_id y last_name, junto con manager_id y last_name, haciendo un auto-join
-- Las tablas tienen un alias, e y m </span>
SELECT e.employee_id emp_id, e.last_name emp_lastname, m.employee_id mgr_id, m.last_name
mgr_lastname
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

<span class="comentario">-- Usando left outer join
-- todas las filas de la tabla de la izquierda se muestran (employees) incluso
-- si no hay coincidencia con la tabla de la deracha (departments)</span>
SELECT e.employee_id, e.last_name, e.department_id,
d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id);
<span class="comentario">-- the following uses a RIGHT OUTER JOIN
-- Se muestran todas las filas de la tabla de la derecha (departments) incluso si
-- no hay coincidencias con la tabla de la izquierda (employees)</span>
SELECT e.employee_id, e.last_name, d.department_id,d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id);
<span class="comentario">-- the following uses a FULL OUTER JOIN
-- Se muestran todos tanto de la tabla de la derecha como de la izquierda</span>
SELECT e.employee_id,e.last_name, d.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);
{% endhighlight %}

Otro ejemplo:

{% highlight sql %}>CREATE TABLE Clientes (
cCodCli varchar2(13),
cNomCli varchar2(50)
);
commit;
create table facturas(
nNumFac number(10),
cCodCli varchar(13)
);
commit;
INSERT INTO Clientes VALUES ('C1','Maria');
INSERT INTO Clientes VALUES ('C2','Juan');
INSERT INTO Clientes VALUES ('C3','Antonio');
COMMIT;

INSERT INTO Facturas VALUES (1,'C2');
INSERT INTO Facturas VALUES (2,'C3');
INSERT INTO Facturas VALUES (3,'XYZ');
COMMIT;
SELECT * FROM CLIENTES c ,FACTURAS f;
SELECT * FROM CLIENTES c ,FACTURAS f
WHERE c.ccodcli = f.ccodcli;
SELECT * FROM CLIENTES c ,FACTURAS f
WHERE c.ccodcli = f.ccodcli(+);
SELECT * FROM CLIENTES c ,FACTURAS f
WHERE c.ccodcli(+) = f.ccodcli;
<span class="comentario">-- ERROR ORA-01468: un predicado sólo puede hacer referencia a una tabla de unión externa</span>
SELECT * FROM CLIENTES c ,FACTURAS f
WHERE c.ccodcli(+) = f.ccodcli(+);
SELECT * FROM CLIENTES c
JOIN FACTURAS f USING (cCodCli);
SELECT * FROM CLIENTES c
JOIN FACTURAS f ON c.cCodCli = f.cCodCli;
SELECT * FROM CLIENTES c
LEFT OUTER JOIN FACTURAS f ON c.cCodCli = f.cCodCli;
SELECT * FROM CLIENTES c
RIGHT OUTER JOIN FACTURAS f ON c.cCodCli = f.cCodCli;
SELECT * FROM CLIENTES c
FULL OUTER JOIN FACTURAS f ON c.cCodCli = f.cCodCli;

{% endhighlight %}



* * *

#### Siguiente Tema: [Consulta de Datos - Cláusula WHERE][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Consulta de Datos &#8211; Cláusula FROM+http://elbauldelprogramador.com/consulta-de-datos-clausula-from/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/consulta-de-datos-clausula-from/&t=Consulta de Datos &#8211; Cláusula FROM+http://elbauldelprogramador.com/consulta-de-datos-clausula-from/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Consulta de Datos &#8211; Cláusula FROM+http://elbauldelprogramador.com/consulta-de-datos-clausula-from/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/consulta-de-datos-clausula-where/
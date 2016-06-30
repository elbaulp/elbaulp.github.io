---
title: 'Consulta de Datos &#8211; Clรกusula FROM'
layout: post.amp

categories:
  - BaseDeDatos
main-class: "BaseDeDatos"
color: "#009688"
---
<div class="icosql">
</div>

En esta clausula se indican la tabla o tablas a las que vamos a tener acceso. Las tablas deben  
existir y si no existiera alguna aparecerรญa el error: ORA-00942: table or view does not exist.  
Su sintaxis es :

```sql
[ FROM {<table_source></table_source><table_source><joined_table><!--ad-->


Es posible hacer consultas que incluyan mรกs de una tabla dentro de la clรกusula FROM, es  
los que llamamos **JOIN o yunciรณn**. Esto se realiza cuando necesitamos acceder a datos que se  
encuentran en mรกs de una tabla.

Pero en estas consultas hay que tener en cuenta ciertos factores: los registros que a nosotros  
nos interesan no son el resultado del producto cartesiano de las tablas sino aquellos que componen la relaciรณn igualados; ademรกs, esta relaciรณn de igualdad puede ser natural, a la izquierda, a la derecha o total. Son los llamados **JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN y FULL OUTER JOIN.**

**JOIN**  
Devuelve aquellos pares de registro que existen en ambas tablas. Se trata de una uniรณn  
natural del รกlgebra relacional. Es decir cada albarรกn con su cliente correspondiente. No aparecen los albaranes sin clientes ni los clientes sin albaranes.

**LEFT OUTER JOIN **  
Ademรกs de los datos devueltos con JOIN cuando se utiliza LEFT OUTER aparecen los  
datos de la tabla de la izquierda que no tienen concordancia con los de la tabla de la derecha. Los datos de la tabla de la derecha aparecen a NULL.

**RIGHT OUTER JOIN **  
Ademรกs de los datos devueltos con JOIN cuando se utiliza RIGHT OUTER aparecen los  
datos de la tabla de la derecha que no tienen concordancia con los de la tabla de la izquierda. Los datos de la tabla de la izquierda se muestran a NULL.

**FULL OUTER JOIN**  
Equivale a un RIGHT y a un LEFT OUTER a la vez.

En ORACLE para realizar un JOIN se hace a travรฉs de la clausula de selecciรณn de registros  
(WHERE) del producto cartesiano de varias tablas. En este caso, cuando se unen dos tabla A y B:

  * Para hacer un JOIN la condiciรณn del WHERE es una condiciรณn de igualdad.
  * Para hacer un LEFT OUTER JOIN se aplica el operador (+) a todas las columnas de  
    la tabla B de la yunciรณn dentro de la clรกusula WHERE.
  * Para hacer un RIGHT OUTER JOIN se aplica el operador (+) a todas las columnas de  
    la tabla A de la yunciรณn dentro de la clรกusula WHERE.

En Oracle 9i, 10g y posteriores se puede realizar un JOIN natural mediante la sintaxis  
JOIN ... USING; en este caso, las columnas por las que se hace la yunciรณn deben tener el mismo  
nombre.

```sql
-- El siguiente select devuelve datos de 3 tablas
-- Dos tablas tienen un campo departament_id y
-- dos tablas tiene un campo location_id
SELECT e.employee_id, e.last_name, e.first_name, e.department_id,
d.department_name, d.manager_id, d.location_id, l.country_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.location_id = 1700;
-- Este select devuelve datos de la tabla employees, mostrando eployeed_id y last_name, junto con manager_id y last_name, haciendo un auto-join
-- Las tablas tienen un alias, e y m
SELECT e.employee_id emp_id, e.last_name emp_lastname, m.employee_id mgr_id, m.last_name
mgr_lastname
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

-- Usando left outer join
-- todas las filas de la tabla de la izquierda se muestran (employees) incluso
-- si no hay coincidencia con la tabla de la deracha (departments)
SELECT e.employee_id, e.last_name, e.department_id,
d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id);
-- the following uses a RIGHT OUTER JOIN
-- Se muestran todas las filas de la tabla de la derecha (departments) incluso si
-- no hay coincidencias con la tabla de la izquierda (employees)
SELECT e.employee_id, e.last_name, d.department_id,d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id);
-- the following uses a FULL OUTER JOIN
-- Se muestran todos tanto de la tabla de la derecha como de la izquierda
SELECT e.employee_id,e.last_name, d.department_id, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

```

Otro ejemplo:

```sql
CREATE TABLE Clientes (
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
-- ERROR ORA-01468: un predicado sรณlo puede hacer referencia a una tabla de uniรณn externa
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


```

#### Siguiente Tema: [Consulta de Datos - Clรกusula WHERE][1] {.referencia}



 [1]: https://elbauldelprogramador.com/consulta-de-datos-clausula-where/

{% include toc.html %}
</joined_table></table_source>
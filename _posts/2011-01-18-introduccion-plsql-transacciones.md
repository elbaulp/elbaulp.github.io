---
id: 96
title: 'Introducción a PL/SQL &#8211; Transacciones'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/introduccion-a-plsql-transacciones/
permalink: /introduccion-plsql-transacciones/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/introduccion-plsql-transacciones.html
  - /2011/01/introduccion-plsql-transacciones.html
  - /2011/01/introduccion-plsql-transacciones.html
categories:
  - BaseDeDatos
tags:
  - transacciones sql
---
<div class="icosql">
</div>

### Transacciones

Oracle es un sistema de base de datos puramente transaccional, de tal forma, que la instrucción BEGIN TRANSACTION no existe.

Una transacción es un conjunto de sentencias SQL que se ejecutan en una base de datos como una única operación, confirmándose o deshaciéndose todo el conjunto de sentencias SQL. La transacción puede quedar finalizada (con las sentencias apropiadas) o implícitamente (terminando la sesión).  
  
<!--more-->

  
Durante la transacción, todas las modificaciones que hagamos sobre base de datos, no son definitivas, más concretamente, se realizan sobre un tablespace especial que se denomina tablespace de ROLLBACK, o RBS (RollBack Segment). Este tablespace tiene reservado un espacio para cada sesión activa en el servidor, y es en ese espacio donde se almacenan todas las modificaciones de cada transacción. Una vez que la transacción se ha finalizado, las modificaciones temporales almacenadas en el RBS, se vuelcan al tablespace original, donde está almacenada nuestra tabla. Esto permite que ciertas modificaciones que se realizan en varias sentencias, se puedan validar todas a la vez, o rechazar todas a la vez.

Dentro de una transacción se pueden crear los llamados “punto de control” mediante la sentencia:

<pre lang="plsql">SAVEPOINT Nombre_punto_control;
</pre>

Las sentencias de finalización de transacción son:

  * **COMMIT**: la transacción termina correctamente, se vuelcan los datos al tablespace original  
    y se vacía el RBS. 
  * **ROLLBACK**: se rechaza la transacción y el vacía el RBS. Cualquier cambio realizado desde que se inició la transacción se deshace, quedando la base de datos en el mismo estado que antes de iniciarse la transacción. 

A la hora de hacer un ROLLBACK o un COMMIT se podrá hacer hasta cierto punto con la sintaxis:

<pre lang="plsql">COMMIT TO punto_control;
ROLLBACK TO punto_control;
</pre>

Cuando tenemos abierta una sesión (WorkSheet de Oracle por ejemplo), los cambios que realizamos no son visibles a otra sesión hasta que no hagamos un COMMIT. Este se puede realizar de forma manual, ejecutando el comando COMMIT; o bien, de forma automática, cuando cerramos la sesión.

En una transacción los datos modificados no son visibles por el resto de usuarios hasta que se confirme la transacción.

Si alguna de las tablas afectadas por la transacción tiene [triggers][1], las operaciones que realiza  
el [trigger][1] están dentro del ámbito de la transacción, y son confirmadas o deshechas conjuntamente con la transacción. Durante la ejecución de una transacción, una segunda transacción no podrá ver los cambios realizados por la primera transacción hasta que esta se confirme.

El siguiente ejemplo muestra una supuesta transacción bancaria:

<pre lang="plsql">DECLARE
  importe NUMBER;
  ctaOrigen VARCHAR2(23);
  ctaDestino VARCHAR2(23);
BEGIN
  importe := 100;
  ctaOrigen := '2530 10 2000 1234567890';
  ctaDestino := '2532 10 2010 0987654321';
  UPDATE CUENTAS SET SALDO = SALDO – importe WHERE CUENTA = ctaOrigen;
  UPDATE CUENTAS SET SALDO = SALDO + importe WHERE CUENTA = ctaDestino;
  INSERT INTO MOVIMIENTOS VALUES (ctaOrigen, ctaDestino, importe*(-1), SYSDATE);
  INSERT INTO MOVIMIENTOS VALUES (ctaDestino,ctaOrigen, importe, SYSDATE);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
  dbms_output.put_line('Error en la transaccion:'||SQLERRM);
  dbms_output.put_line('Se deshacen las modificaciones);
  ROLLBACK;
END;

</pre>



* * *

#### Siguiente Tema: [Fundamentos de PL/SQL][2] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Introducción a PL/SQL &#8211; Transacciones+http://elbauldelprogramador.com/introduccion-plsql-transacciones/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/introduccion-plsql-transacciones/&t=Introducción a PL/SQL &#8211; Transacciones+http://elbauldelprogramador.com/introduccion-plsql-transacciones/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Introducción a PL/SQL &#8211; Transacciones+http://elbauldelprogramador.com/introduccion-plsql-transacciones/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/plsql-disparadores-o-triggers/
 [2]: http://elbauldelprogramador.com/fundamentos-de-plsql/
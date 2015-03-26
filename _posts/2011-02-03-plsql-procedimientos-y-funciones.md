---
id: 126
title: 'PL/SQL &#8211; Procedimientos y Funciones'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/plsql-procedimientos-y-funciones/
permalink: /plsql-procedimientos-y-funciones/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/plsql-procedimientos-y-funciones.html
  - /2011/02/plsql-procedimientos-y-funciones.html
  - /2011/02/plsql-procedimientos-y-funciones.html
categories:
  - BaseDeDatos
tags:
  - ejemplos create procedure sql
  - funcion parametros sql
  - funcion sql
  - sql generar procedure
---
<div class="icosql">
</div>

## Procedimientos

Una vez que tenemos escrito un bloque de código, podemos guardarlo en un fichero .sql para su posterior uso, o bien guardarlo en base de datos para que pueda ser ejecutado por cualquier aplicación. El segundo caso se realiza mediante procedimientos almacenados (Stored Procedure).

A la hora de guardar un bloque de código hay que tener en cuenta ciertas normas:

  * La palabra reservada DECLARE desaparece.
  * Podremos crear procedimientos y funciones. Los procedimientos no podrán retornar ningún valor sobre su nombre, mientras que las funciones deben retornar un valor de un tipo de dato básico.

  
<!--more-->

  
Un procedimiento [almacenado] es un subprograma que ejecuta una acción específica y que no devuelve ningún valor por si mismo, como sucede con las funciones. Un procedimiento tiene un nombre, un conjunto de parámetros (opcional) y un bloque de código. Para crear un procedimiento (stored procedure: procedimiento almacenado) usaremos la siguiente sintaxis:

{% highlight sql %}>CREATE {OR REPLACE} PROCEDURE nombre_proc( param1 [IN | OUT | IN OUT] tipo,... )
IS
  <span class="comentario">-- Declaración de variables locales</span>
  BEGIN
  <span class="comentario">-- Instrucciones de ejecución</span>
  [EXCEPTION]
  <span class="comentario">-- Instrucciones de excepción</span>
END;
{% endhighlight %}

Tras crear el procedimiento, éste se compila y luego se almacena en la BD de forma compilada. Este procedimiento luego puede ser invocado desde cualquier [bloque PL/SQL][1].

El uso de OR REPLACE permite sobrescribir un procedimiento existente. Si se omite, y el procedimiento existe, se producirá, un error. Debemos especificar el tipo de datos de cada parámetro.

Al especificar el tipo de dato del parámetro no debemos especificar la longitud del tipo, aunque si puede ser utilizando el operador [%TYPE][2].  


{% highlight sql %}>CREATE OR REPLACE
PROCEDURE Actualiza_Saldo(cuenta NUMBER, new_saldo NUMBER)
IS
  <span class="comentario">-- Declaracion de variables locales</span>
BEGIN
  UPDATE SALDOS_CUENTAS
    SET SALDO = new_saldo,
    FX_ACTUALIZACION = SYSDATE
    WHERE CO_CUENTA = cuenta;
END Actualiza_Saldo;
{% endhighlight %}

También podemos asignar un valor por defecto a los parámetros, utilizando la cláusula DEFAULT o el operador de asignación (:=) .

{% highlight sql %}>CREATE OR REPLACE
  PROCEDURE Actualiza_Saldo(cuenta NUMBER, new_saldo NUMBER DEFAULT 10)
{% endhighlight %}

Una vez creado y compilado el procedimiento almacenado podemos ejecutarlo. Existen dos formas de pasar argumentos a un procedimiento almacenado a la hora de ejecutarlo. Estas son:

**Notación posicional:** Se pasan los valores de los parámetros en el mismo orden en que el procedure los define.  


{% highlight sql %}>BEGIN
  Actualiza_Saldo(200501,2500);
  COMMIT;
END;
{% endhighlight %}

**Notación nominal:** Se pasan los valores en cualquier orden nombrando explícitamente el parámetro y su valor separados por el símbolo =>.

{% highlight sql %}>BEGIN
  Actualiza_Saldo(cuenta => 200501,new_saldo => 2500);
  COMMIT;
END;
{% endhighlight %}

Ejemplos:

{% highlight sql %}>CREATE OR REPLACE PROCEDURE today_is AS
BEGIN
  DBMS_OUTPUT.PUT_LINE( 'Hoy es ' || TO_CHAR(SYSDATE, ' DD/MM/YYYY') );
END today_is;

<span class="comentario">-- para ejecutarlo</span>
SET SERVEROUTPUT ON;
BEGIN
  today_is(); -- the parentheses are optional here
END;
{% endhighlight %}

{% highlight sql %}>CREATE OR REPLACE PROCEDURE today2_is ( fecha DATE ) AS
BEGIN
  DBMS_OUTPUT.PUT_LINE( 'Hoy es ' || TO_CHAR(fecha, ' DD/MM/YYYY') );
END;

<span class="comentario">-- para ejecutarlo</span>
SET SERVEROUTPUT ON;
BEGIN
  today2_is(to_date('01/02/2008')); -- the parentheses are optional here
END;

<span class="comentario">-- para ejecutarlo</span>
SET SERVEROUTPUT ON;
BEGIN
  today2_is(fecha => to_date('01/02/2008')); -- the parentheses are optional here
END;
{% endhighlight %}

## Funciones

Para crear una función usaremos la siguiente sintaxis:

{% highlight sql %}>CREATE {OR REPLACE} FUNCTION nombre_func(param1 tipo,param2 tipo,... ) RETURN tipo_dato IS
  <span class="comentario">-- Declaración de variables locales</span>
BEGIN
  <span class="comentario">-- Instrucciones de ejecución</span>
[EXCEPTION]
  <span class="comentario">-- Instrucciones de excepción</span>
END;
{% endhighlight %}

* * *

#### Siguiente tema: [PL/SQL &#8211; Paquetes (Packages)][3] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=PL/SQL &#8211; Procedimientos y Funciones+http://elbauldelprogramador.com/plsql-procedimientos-y-funciones/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/plsql-procedimientos-y-funciones/&t=PL/SQL &#8211; Procedimientos y Funciones+http://elbauldelprogramador.com/plsql-procedimientos-y-funciones/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=PL/SQL &#8211; Procedimientos y Funciones+http://elbauldelprogramador.com/plsql-procedimientos-y-funciones/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/bloques-plsql/
 [2]: http://elbauldelprogramador.com/plsql-declaracion-de-variables/
 [3]: http://elbauldelprogramador.com/plsql-paquetes-packages/
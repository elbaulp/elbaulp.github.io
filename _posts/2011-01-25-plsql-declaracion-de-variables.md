---
id: 103
title: 'PL/SQL &#8211; Declaración de variables'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/plsql-declaracion-de-variables/
permalink: /plsql-declaracion-de-variables/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/plsql-declaracion-de-variables.html
  - /2011/01/plsql-declaracion-de-variables.html
  - /2011/01/plsql-declaracion-de-variables.html
categories:
  - BaseDeDatos
tags:
  - declare en pl sql
---
<div class="icosql">
</div>

Las variables deben declararse dentro de la sección DECLARE y deben seguir la siguiente sintaxis:

{% highlight sql %}>Nombre_variable [CONSTANT] TIPO [NOT NULL] [:= inicialización];{% endhighlight %}

Cualquier variable que se declare y no se inicialice tiene por defecto el valor NULL. Los tipos posibles son todos aquellos válidos para SQL añadiendo algunos propios de PL/SQL. Para más información sobre los tipos propios de PL/SQL consultar el PL/SQL User’s Guide and Referente. Podemos hacer que una variable nunca tome valores nulos utilizando la cláusula NOT NULL, en este caso, hay que inicializar la variable.  
  
<!--more-->

  
La declaración de una constante es similar a la declaración de una variable, añadiendo la palabra CONSTANT y asignándole a continuación un valor a la constante.

Ejemplos:

{% highlight sql %}>Interes NUMBER(5,3);
Descripcion VARCHAR2(50) := 'inicial';
Fecha_max DATE;
Contabilizado BOOLEAN := TRUE;
PI CONSTANT REAL := 3.14159;
{% endhighlight %}

Otra forma de asignarle un valor a una variable es mediante la clausula INTO de la sentencia SELECT:

{% highlight sql %}>SELECT COUNT(*) INTO xNumFac FROM FACTURAS;{% endhighlight %}



#### Atributos %TYPE y %ROWTYPE.

Se puede declarar el tipo de una variable tomándolo de otro identificador, usando el atributo %TYPE y se puede declarar el tipo de una variable también cuando es un tipo estructurado con el atributo %ROWTYPE. Esto es particularmente útil cuando una variable va a tomar valores de una columna de una tabla. Declarar variables con el atributo %TYPE tiene dos ventajas. Primero, no necesitamos conocer el tipo exacto de la columna de la tabla. Segundo, si cambiamos la definición y/o tipo de la columna de la tabla, el tipo de la variable cambia automáticamente en tiempo de ejecución.

En la declaración: si tenemos una variable “ y ” por ejemplo, y está declarada de tipo char podemos declarar otra variable “j” de la siguiente forma:

{% highlight sql %}>J y%type;{% endhighlight %}

Lo mismo ocurriría para declarar una estructura que ya esta declarada como por ejemplo una tabla que ya tenemos declarada:

{% highlight sql %}>J employee%rowtype; <span class="comentario">--J tendría la misma estructura que la tabla employee.</span>
{% endhighlight %}

En este caso para acceder a cada campo que tuviera el tabla employee mediante la variable J tendríamos que usar la estructura variable.nombre_campo.

Un bloque tiene acceso a los objetos identificados dentro de su esquema. Solo podremos acceder a los objetos del usuario donde estemos conectados y a los que ese usuario pueda acceder porque le hayan otorgado permisos.

* * *

#### Siguiente Tema: [PL/SQL &#8211; Estructuras básicas de control][1] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=PL/SQL &#8211; Declaración de variables+http://elbauldelprogramador.com/plsql-declaracion-de-variables/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/plsql-declaracion-de-variables/&t=PL/SQL &#8211; Declaración de variables+http://elbauldelprogramador.com/plsql-declaracion-de-variables/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=PL/SQL &#8211; Declaración de variables+http://elbauldelprogramador.com/plsql-declaracion-de-variables/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/plsql-estructuras-basicas-de-control/
---
id: 98
title: Fundamentos de PL/SQL
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/fundamentos-de-plsql/
permalink: /fundamentos-de-plsql/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/fundamentos-de-plsql.html
  - /2011/01/fundamentos-de-plsql.html
  - /2011/01/fundamentos-de-plsql.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

SQL es un lenguaje de consulta para los sistemas de bases de datos relaciónales, pero que no posee la potencia de los lenguajes de programación.

PL/SQL (Procedural Language/Structured Query Language) apareció por primera vez en la versión 6 de Oracle (1988) y amplia SQL con los elementos característicos de los lenguajes de programación: variables, sentencias de control de flujo, bucles&#8230;

Cuando se desea realizar una aplicación completa para el manejo de una base de datos relacional,  
resulta necesario utilizar alguna herramienta que soporte la capacidad de consulta del SQL y la versatilidad de los lenguajes de programación tradicionales. PL/SQL es el lenguaje de programación que proporciona Oracle para extender el SQL estándar con otro tipo de instrucciones.  
  
<!--more-->

  
Para poder trabajar necesitaremos tener los siguientes elementos:

  * Una instancia de ORACLE o superior funcionando correctamente.
  * Herramientas cliente de ORACLE, (WorkSheet o SQL*Plus) para poder ejecutar los ejemplos.
  * Haber configurado correctamente una conexión a ORACLE.

Con PL/SQL vamos a poder programar las unidades de programa de la base de datos ORACLE, estas son:

  * [Procedimientos almacenados][1]
  * [Funciones][1]
  * [Trigger][2]
  * Scripts

Pero además PL/SQL nos permite realizar programas sobre las siguientes herramientas de ORACLE:

  * Oracle Forms
  * Oracle Reports
  * Oracle Graphics
  * Oracle Aplication Server

Para programar en PL/SQL es necesario conocer sus fundamentos.  
Como introducción vamos a ver algunos elementos y conceptos básicos del lenguaje.

  * PL/SQL no es CASE-SENSITIVE, es decir, no diferencia mayúsculas de minúsculas como otros lenguajes de programación como C o Java. Sin embargo debemos recordar que ORACLE es CASE-SENSITIVE en la búsqueda de texto. 
  * Una línea en PL/SQL contiene grupos de caracteres conocidos como UNIDADES LEXICAS, que pueden ser clasificadas como: 
  * DELIMITADOR: Es un símbolo simple o compuesto que tiene una función especial&nbsp;en PL/SQL. Estos pueden ser:
  * Operadores Aritméticos
  * Operadores Lógicos
  * Operadores Relaciónales 

  * DENTIFICADOR: Se emplean para dar nombre a los objetos PL/SQL, tales como&nbsp;variables, cursores, tipos y subprogramas. <div style="text-align: center;">
      Los identificadores constan de una letra, seguida por una secuencia opcional&nbsp;de caracteres, que pueden incluir letras, números, signos de dólar ($), caracteres de&nbsp;subrayado y símbolos de almohadilla (#). Los demás caracteres no pueden&nbsp;emplearse. La longitud máxima de un identificador es de 30 caracteres y todos los&nbsp;caracteres son significativos.
    </div>

  * LITERAL: Es un valor de tipo numérico, carácter, cadena o lógico no representado&nbsp;por un identificador (es un valor explícito). 
  * COMENTARIO: Es una aclaración que el programador incluye en el código. Son&nbsp;soportados 2 estilos de comentarios, el de línea simple y de multilínea, para lo cual&nbsp;son empleados ciertos caracters especiales como son: {% highlight sql %}>-- Linea simple
/*
Conjunto de Líneas
*/

{% endhighlight %}

  * Cuando se escribe código en PL/SQL, este puede estar agrupado en unidades denominadas&nbsp;“conjunto de instrucciones”. Un conjunto de instrucciones puede contener otros subconjuntos y&nbsp;así sucesivamente. 
    Un conjunto de instrucciones queda delimitado por las palabras reservadas BEGIN y END.
    
    {% highlight sql %}>BEGIN
  Sentencias . . .
  Sentencias . . .
  BEGIN
    Sentencias . . .
    Sentencias . . .
    Sentencias . . .
  END;
  Sentencias . . .
  Sentencias . . .
END;
{% endhighlight %}



* * *

#### Siguiente Tema: [Bloques PL/SQL][3] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Fundamentos de PL/SQL+http://elbauldelprogramador.com/fundamentos-de-plsql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/fundamentos-de-plsql/&t=Fundamentos de PL/SQL+http://elbauldelprogramador.com/fundamentos-de-plsql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Fundamentos de PL/SQL+http://elbauldelprogramador.com/fundamentos-de-plsql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/plsql-procedimientos-y-funciones/
 [2]: http://elbauldelprogramador.com/plsql-disparadores-o-triggers/
 [3]: http://elbauldelprogramador.com/bloques-plsql/
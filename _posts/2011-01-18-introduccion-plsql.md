---
id: 95
title: Introducción a PL/SQL
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/introduccion-a-plsql/
permalink: /introduccion-plsql/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/introduccion-plsql.html
  - /2011/01/introduccion-plsql.html
  - /2011/01/introduccion-plsql.html
categories:
  - BaseDeDatos
---
<div class="icosql">
</div>

Ahora que el [temario de SQL][1] está terminado, voy a empezar a escribir sobre [PL/SQL][2]. Empezaré con una introducción.

### Introducción

El trabajo realizado [hasta ahora][3] con la base de datos se ha hecho de forma interactiva: el usuario introducía una orden (en SQL) y Oracle proporcionaba una respuesta. Esta forma de trabajar no resulta operativa en un entorno de producción, porque todos los usuarios no conocen ni utilizan SQL, y además suelen producirse frecuentes errores.  
  
<!--more-->

  
Para superar estas limitaciones, Oracle incorpora un gestor PL/SQL en el servidor de la BD y  
en algunas de sus herramientas (Forms, Reports, Graphics, etc.). Este lenguaje incorpora todas las características propias de los lenguajes de tercera generación: manejo de variables, estructura modular (procedimientos y funciones), estructuras de control (bifurcaciones, bucles y demás estructuras), control de excepciones, y una total integración en el entorno Oracle.

Los programas creados con PL/SQL se pueden almacenar en la base de datos como un objeto más de ésta; así se facilita a todos los usuarios autorizados el acceso a estos programas, y en consecuencia, la distribución, instalación y mantenimiento de software. Además, los programas se  
ejecutan en el servidor, suponiendo un significativo ahorro de recursos en los clientes y de disminución del tráfico de red.

El uso del lenguaje PL/SQL es también imprescindible para construir disparadores de bases de  
datos, que permiten implementar reglas complejas de negocio y auditoria en la BD.

PL/SQL soporta todos los comandos de consulta y manipulación de datos, aportando sobre SQL las estructuras de control y otros elementos propios de los lenguajes procedimentales de tercera generación. Su unidad de trabajo es el bloque, formado por un conjunto de declaraciones, instrucciones y mecanismos de gestión de errores y excepciones.

* * *

#### Siguiente Tema: [Introducción a PL/SQL &#8211; Transacciones][4] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Introducción a PL/SQL+http://elbauldelprogramador.com/introduccion-plsql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/introduccion-plsql/&t=Introducción a PL/SQL+http://elbauldelprogramador.com/introduccion-plsql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Introducción a PL/SQL+http://elbauldelprogramador.com/introduccion-plsql/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/consulta-de-datos-tablas-resumen/
 [2]: http://es.wikipedia.org/wiki/PL/SQL
 [3]: http://bashyc.blogspot.com/p/bases-de-datos.html
 [4]: http://elbauldelprogramador.com/introduccion-plsql-transacciones/
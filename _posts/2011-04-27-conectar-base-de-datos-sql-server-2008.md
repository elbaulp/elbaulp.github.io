---
id: 182
title: Conectar base de datos sql Server 2008 a aplicación Java remotamente
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/conectar-base-de-datos-sql-server-2008-a-aplicacion-java-remotamente/
permalink: /conectar-base-de-datos-sql-server-2008/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/04/conectar-base-de-datos-sql-server-2008.html
  - /2011/04/conectar-base-de-datos-sql-server-2008.html
  - /2011/04/conectar-base-de-datos-sql-server-2008.html
if_slider_image:
  - 
  - 
  - 
categories:
  - android
  - aplicaciones
  - BaseDeDatos
tags:
  - android jdbc sqlserver 2008
  - android sqlserver
  - conectar java con oracle
  - curso android pdf
  - programar base datoss java
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

[En anteriores entradas][1] expliqué como he ido desarrollando una aplicación para Android que enviaba mensajes al pc para un proyecto de fin de curso.

Bien, ahora voy a explicar en que consiste la aplicación exactamente, que aún no lo he hecho.Se trara de desarrollar un programa para bares, en la cual cada camarero tendrá una PDA, o dispositivo Android, desde la cual anotará los pedidos de los clientes. La PDA enviará estos pedidos al servidor que contiene una Base de datos, y este imprimirá los tickets.

Para esto es necesario establecer una conexión PDA-Base de datos del Servidor.

  
<!--more-->

Lo primero que hay que hacer es intalar SQL server 2008 y configurarlo para que se pueda acceder de dos formas (con autentificación windows y con autentificación SQl server), esto se pregunta durante la instalación de SQL server, posteriormente hay que crear un usuario SQL server, [aqui se explica como hacerlo][2]. Tambien debemos permitir [conexiones remotas.][3]

Ahora vamos al código, (que he sacado de un ejemplo de la web de [microsoft][4]), al cual solo he añadido una consulta a una tabla de mi base de datos.

Ahora vamos a crear un proyecto, yo lo he creado en ecplise, es necesario agregarle las librerías JDBC para que hagan de puente entre la aplicación y la base de datos. En ecplise se añaden en las propiedades del proyecto/JAva Build Path/Libraries, estas librerías podeis descargarlas de [aqui][5], si no lo hacéis en ecplise, en este [enlace][6] se ve como configurarlo

<p class="alert">
  También puedes ver cómo <a href="/2012/02/conectar-base-de-datos-oracle.html">Conectar una base de datos ORACLE a aplicación Java remotamente</a>
</p>

Dejo el código por aquí:



Y la sálida de ejecutar la aplicación:

{% highlight bash %}Connection Successful!
Driver Information
 Driver Name: SQLServer
 Driver Version: 2.2.0022

Database Information 
 Database Name: Microsoft SQL Server
 Database Version: Microsoft SQL Server Yukon - 10.0.1600
Algunos datos de la BD
Nombre: Alejandro

Apellido: Alcalde

Dni: 12345678
{% endhighlight %}

Espero que os sirva de ayuda, he escrito esta entrada rápido por falta de tiempo, así que si algo no se entiende no dudes en preguntar e intentaré ayudarte.</p> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Conectar base de datos sql Server 2008 a aplicación Java remotamente+http://elbauldelprogramador.com/conectar-base-de-datos-sql-server-2008/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/conectar-base-de-datos-sql-server-2008/&t=Conectar base de datos sql Server 2008 a aplicación Java remotamente+http://elbauldelprogramador.com/conectar-base-de-datos-sql-server-2008/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Conectar base de datos sql Server 2008 a aplicación Java remotamente+http://elbauldelprogramador.com/conectar-base-de-datos-sql-server-2008/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/programa-que-envia-mensajes-desde_10/
 [2]: http://kbase.gfi.com/showarticle.asp?id=KBID002804
 [3]: http://www.blogdemegastar.com/2010/09/pasos-para-configurar-sql-server-2008.html
 [4]: http://support.microsoft.com/kb/313100
 [5]: http://www.akadia.com/download/documents/sqlsrv_jdbc.tar.gz
 [6]: http://www.akadia.com/services/sqlsrv_jdbc.html
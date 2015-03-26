---
id: 1479
title: 'Dig &#8211; Chuleta básica de comandos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1479
permalink: /dig-chuleta-basica-de-comandos/
categories:
  - Administración de Servidores
  - aplicaciones
  - opensource
tags:
  - administracion DNS
  - chuleta comandos dig
  - chuleta dig
  - estado DNS
---
**Dig (Domain Information Groper)** es un comando de gran utilidad para realizar consultas a registros DNS. Se usa mucho &#8212; entre otras cosas &#8212; para el diagnóstico de [Servidores DNS][1]. Desde que administro yo mismo el servidor del blog lo he usado bastante, y hoy voy a dar unas nociones básicas de cómo usarlo.  
  
<!--more-->

#### [Actualización]

En un comentario hecho en la página de <a href="https://plus.google.com/b/108003822606696308728/108003822606696308728/posts/idbcxhy5vzG" target="_blank">Google+ del blog</a> un usuario indicó que es posible obtener una salida simplificada de todos los comandos de abajo con la opción *+short*.

El ejemplo más básico es:

<pre lang="bash">dig ejemplo.com
</pre>

#### Obtener distintos tipos de registros DNS

La sintaxis es:

<pre lang="bash">dig @servidor-dns ejemplo.com tipo-de-registro
</pre>

Ejemplo de uso:

<pre lang="bash">dig @208.67.222.222 google.com A

;; QUESTION SECTION:
;google.com.          IN  A

;; ANSWER SECTION:
google.com.      300 IN  A   173.194.34.231
google.com.       300 IN  A   173.194.34.226
google.com.       300 IN  A   173.194.34.230
google.com.       300 IN  A   173.194.34.228
google.com.       300 IN  A   173.194.34.238
google.com.       300 IN  A   173.194.34.229
google.com.       300 IN  A   173.194.34.227
google.com.       300 IN  A   173.194.34.225
google.com.       300 IN  A   173.194.34.232
google.com.       300 IN  A   173.194.34.224
google.com.       300 IN  A   173.194.34.233
</pre>

#### Obtener los servidores de nombres

<pre lang="bash">dig @208.67.222.222 google.com NS

;; QUESTION SECTION:
;google.com.            IN  NS

;; ANSWER SECTION:
google.com.     172749  IN  NS  ns2.google.com.
google.com.      172749  IN  NS  ns1.google.com.
google.com.      172749  IN  NS  ns3.google.com.
google.com.      172749  IN  NS  ns4.google.com.

</pre>

#### Obtener registros MX (De correo)

<pre lang="bash">dig @208.67.222.222 google.com MX

;; QUESTION SECTION:
;google.com.            IN  MX

;; ANSWER SECTION:
google.com.     469 IN  MX  20 alt1.aspmx.l.google.com.
google.com.      469 IN  MX  10 aspmx.l.google.com.
google.com.       469 IN  MX  40 alt3.aspmx.l.google.com.
google.com.      469 IN  MX  50 alt4.aspmx.l.google.com.
google.com.      469 IN  MX  30 alt2.aspmx.l.google.com.
</pre>

#### Obtener registros TXT

<pre lang="bash">dig @208.67.222.222 google.com TXT

;; QUESTION SECTION:
;google.com.          IN  TXT

;; ANSWER SECTION:
google.com.        3600    IN  TXT "v=spf1 include:_spf.google.com ip4:216.73.93.70/31 ip4:216.73.93.72/31 ~all"

</pre>

#### Obtener todos los tipos de registros en una misma consulta

<pre lang="bash">dig any google.com

;; QUESTION SECTION:
;google.com.           IN  ANY

;; ANSWER SECTION:
google.com.        407 IN  MX  40 alt3.aspmx.l.google.com.
google.com.      407 IN  MX  30 alt2.aspmx.l.google.com.
google.com.      407 IN  MX  20 alt1.aspmx.l.google.com.
google.com.      407 IN  MX  10 aspmx.l.google.com.
google.com.       407 IN  MX  50 alt4.aspmx.l.google.com.
google.com.      172781  IN  NS  ns2.google.com.
google.com.      172781  IN  NS  ns1.google.com.
google.com.      172781  IN  NS  ns3.google.com.
google.com.      172781  IN  NS  ns4.google.com.
</pre>

#### Realizar una consulta inversa

<pre lang="bash">dig -x 173.194.34.233

;; QUESTION SECTION:
;233.34.194.173.in-addr.arpa.  IN  PTR

;; ANSWER SECTION:
233.34.194.173.in-addr.arpa. 83265 IN  PTR mad01s09-in-f9.1e100.net.
</pre>

Puedes encontrar una descripción un poco más extensa sobre el funcionamiento de la consulta inversa en la [tercera][2] parte del artículo *Cómo configurar un servidor DNS*

#### Referencias

*dig – Linux DNS Lookup utility cheat sheet* **|** <a href="http://linuxaria.com/pills/dig-linux-dns-lookup-utility-cheat-sheet" target="_blank">linuxaria</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Dig &#8211; Chuleta básica de comandos+http://elbauldelprogramador.com/dig-chuleta-basica-de-comandos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/dig-chuleta-basica-de-comandos/&t=Dig &#8211; Chuleta básica de comandos+http://elbauldelprogramador.com/dig-chuleta-basica-de-comandos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Dig &#8211; Chuleta básica de comandos+http://elbauldelprogramador.com/dig-chuleta-basica-de-comandos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/articulos/como-configurar-un-servidor-dns/ "Cómo configurar un servidor DNS – Parte 1 (Introducción)"
 [2]: /articulos/como-configurar-un-servidor-dns3/
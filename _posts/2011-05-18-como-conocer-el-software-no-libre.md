---
id: 194
title: 'Cómo conocer el software &#8220;no libre&#8221; instalado en nuestro equipo'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/como-conocer-el-software-no-libre-instalado-en-nuestro-equipo/
permalink: /como-conocer-el-software-no-libre/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/05/como-conocer-el-software-no-libre.html
  - /2011/05/como-conocer-el-software-no-libre.html
  - /2011/05/como-conocer-el-software-no-libre.html
categories:
  - aplicaciones
  - curiosidades
  - How To
  - linux
---
<div class="icoso">
</div>

Este programa lo ví en [ProyectosBeta][1].   
Seguro que en nuestro equipo tenemos montones de aplicaciones instaladas, de las cuales muchas serán **no libres**, con el programita **vrms** podemos conocerlos de forma sencilla.

Los pasos a seguir son los siguientes:

  
<!--more-->

Instalamos el programa:

<pre>sudo aptitude install vrms</pre>

Y lo ejecutamos con `vrms`

El resultado es el siguiente:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://4.bp.blogspot.com/-wWUOaA33nCk/TdN2JjQ8OxI/AAAAAAAAAgM/nxfKbEuZCnE/s1600/vrms.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="225" width="400" src="http://4.bp.blogspot.com/-wWUOaA33nCk/TdN2JjQ8OxI/AAAAAAAAAgM/nxfKbEuZCnE/s400/vrms.png" /></a>
</div>

Para que nos salga la el dibujito de **Stallman** hay que seguir los siguientes pasos.

<pre>$ sudo aptitude install vrms cowsay
$ sudo mv rms.cow /usr/share/cowsay/cows/rms.cow
$ cowsay -f rms -W 60 `vrms`
</pre>

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://3.bp.blogspot.com/-Hur9i5TORyM/TdN5Q19CliI/AAAAAAAAAgU/rhmM1JOnJao/s1600/stallman.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="256" width="238" src="http://3.bp.blogspot.com/-Hur9i5TORyM/TdN5Q19CliI/AAAAAAAAAgU/rhmM1JOnJao/s400/stallman.png" /></a>
</div>

* * *Fuente: 

[Proyectosbeta][2]</p> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo conocer el software &#8220;no libre&#8221; instalado en nuestro equipo+http://elbauldelprogramador.com/como-conocer-el-software-no-libre/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-conocer-el-software-no-libre/&t=Cómo conocer el software &#8220;no libre&#8221; instalado en nuestro equipo+http://elbauldelprogramador.com/como-conocer-el-software-no-libre/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo conocer el software &#8220;no libre&#8221; instalado en nuestro equipo+http://elbauldelprogramador.com/como-conocer-el-software-no-libre/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://proyectosbeta.blogspot.com
 [2]: http://proyectosbeta.blogspot.com/2011/05/crear-la-cara-de-richard-stallmann-con.html
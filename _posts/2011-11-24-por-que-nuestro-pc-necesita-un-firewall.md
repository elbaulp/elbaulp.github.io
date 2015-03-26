---
id: 296
title: Por qué nuestro PC necesita un firewall activado
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/por-que-nuestro-pc-necesita-un-firewall-activado/
permalink: /por-que-nuestro-pc-necesita-un-firewall/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/por-que-nuestro-pc-necesita-un-firewall.html
  - /2011/11/por-que-nuestro-pc-necesita-un-firewall.html
share_count:
  - 0
  - 0
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551786}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551786}'
share_data:
  - '[]'
  - '[]'
categories:
  - internet
  - seguridad
  - SO
tags:
  - cortafuegos
  - ejemplos de firewall
  - seguridad en la red
  - seguridad firewall
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="" id="logo" name="so" class="icono" /></a>
</div>

Hace poco os hablé de [por qué Linux no era solo para geeks][1], sacando el tema de la seguridad, en este post se habla sobre la seguridad en la red

¿Por qué es necesario convencer a todo el mundo que es necesario activar un cortafuegos (Firewall) en los ordenadores que tienen acceso a internet?, ya sean de escritorio o servidores. Se podría pensar que la tarea de un firewall es obvia para cualquier usuario que posea un ordenador. Sin embargo, circulan comentarios acerca de este tema que no lo hacen del todo cierto.

Podemos tomar como ejemplo el <a target="_blank" href="http://chakra-project.org/bbs/viewtopic.php?id=5185">foro Chakra</a>:

***También estoy en contra del uso del firewall (¿cuanta gente navega con un módem usb en linux, o desactiva el firewall del router?)****, ¿Qué tipo de web porno o qué tipo de script hay que visitar/ejecutar para infectarte de malware en Linux? y puesto que tal vez 3 de cada mil personas por lo general descargan y ejecutan un script sin leerlo, ¿debo tener mi ordenador llenas de este software? En serio: ¿cuantas veces ejecutaste amarok o VLC y encontraste un exploit que hizo colgarse al pc?*

O <a target="_blank" href="http://www.linuxbsdos.com/2010/07/20/pclinuxos-2010-review/comment-page-2/#comments">este</a> otro de los fans de PCLinuxOS:

*Casi todas las distros incluyen un firewall, pero está desactivado por defecto. No creo en la teoría de &#8220;una única configuración del firewall arregla todo&#8221;. Mis necesidades son diferentes a las vuestras. Incluyan el firewall, coloquen un icono en un lugar fácil de encontrar y dejen que nosotros hagamos el resto.*

&#8230;

*Al principio el firewall venía habilitado, pero la mayoría de los usuarios se quejaban por ello y los desarrolladores lo desabilitaron. PErsonalmente cada usuario deberia elegir si quiere activarlo o no.*

&#8230;

*Prefieren el icono del firewall en el escritorio para que puedan configurarlo ellos mismos basandose en sus necesidades personales.*</p> 

Lo que revelan estos comentarios es que muchos en nuestra comunidad no entienden las bases de la seguridad de red. Espero que este corto artículo pueda dejar un poco más claro este tema.

  
<!--more-->

Lo fundamental en esta discusión es comprender el papel general que desempeña un firewall en un ordenador o sistema de ordenadores. En términos simples, un firewall protege un ordenador de ataques de red. Y hay firewalls basados en host y en red. Un firewall basado en host es aquel que se ejecuta y protege a un solo dispositivo. Ese sería el que se ejecuta en un ordenador personal, ya sea sobre un sistema Linux, BSD o cualquier otro sistema operativo.

Por otro lado, un firewall basado en red es aquel ejecutandose en un dispositivo al borde o en el perímetro de una red. Este dispositivo puede ser un router, un switch o un dispositivo VPN. Tu router por cable, DSL o fibra óptica está en esta categoría. El error que mucha gente comete es pensar que si tienen un firewall un uno de estos dispositvos, no necesitan otro en el ordenador personal situado detrás del router. Un mal pensamiento.

En una red de ordenadores, uno de ellos permite el acceso desde el exterior, la mejor practica de seguridad requiere que cada nodo de la red tenga por sí mismo seguridad, uno que trabaja en conjunto con el firewall perimetral (y también con otras medidas de seguridad). En la jerga profesional a esta practica se la conoce como **seguridad en profundidad (Security in-depth)**. Se trata de un enfoque de seguridad por capas y este enfoque no es exclusivo del mundo de la informática. Se puede observar donde quiera que se mire. Por ejemplo, supón que vives en un complejo amurallado, ¿Dejarias las puertas y las ventanas de tu casa abiertas simplemente poque tienes una cerca alrededor?, por supuesto que no. O ¿dejarías tu coche abierto simplemente porque está en un parking? Probablemente tampoco. Las razones son obvias.

El mismo razonamiento y principio se debería aplicar a las redes locales. A parte del firewall perimetral, de otro ejecutandose en el dispositivo en el borde de la red (El router p.e), también deberías tener un firewall basado en host ejecutandose en tu ordenador de escritorio, servidor, netbook o notebook. Este enfoque por capas garantiza que si hay una brecha en tu defensa perimetral, si álguien *salta* la *cerca*, tu ordenador no estará *abierto* para los intrusos.

Por lo tanto, solo porque tu equipo esté detrás de router por cable, DSL o fibra óptica con un firewall activado no implica que podamos desabilitar el firewall basado en host (En nuestro pc). **Security in-depth.**

Los mejores firewalls son capaces de realizar inspecciones de estado completas (**stateful inspection**), también llamadas **Stateful packet Filtering**, la cuales dictan que todas las conexiones salientes están permitidas mientras todas las conexiones entrantes que no están relacionadas con una conexión saliente esté bloqueada.

Algunas de las mejores distros linux, como Fedora, tienen un firewall habilitado fuera del nucleo. Así es como debe ser. El kernel linux tiene un firewall incorporado (Vale también par alos BSD), y hay varias interfaces gráficas para manejarlo. Lo menos que podemos esperar de los desarrolladores de las distros es que ser permita activarlo fuera del nucleo.

Tracucción de : <a target="_blank" href="http://www.linuxbsdos.com/2011/11/21/why-your-computer-needs-a-firewall-enabled/">linuxbsdos.com</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Por qué nuestro PC necesita un firewall activado+http://elbauldelprogramador.com/por-que-nuestro-pc-necesita-un-firewall/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/por-que-nuestro-pc-necesita-un-firewall/&t=Por qué nuestro PC necesita un firewall activado+http://elbauldelprogramador.com/por-que-nuestro-pc-necesita-un-firewall/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Por qué nuestro PC necesita un firewall activado+http://elbauldelprogramador.com/por-que-nuestro-pc-necesita-un-firewall/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /2011/11/por-que-gnulinux-no-es-solo-para-geeks.html
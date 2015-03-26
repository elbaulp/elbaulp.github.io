---
id: 2042
title: 'Recibir alertas de correo al acceder al  sistema mediante SSH'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2042
permalink: /recibir-alertas-de-correo-ssh/
categories:
  - Administración de Servidores
tags:
  - alertar ssh
  - correo ssh
  - seguridad ssh
---
Hemos visto en otros artículos varias maneras de mejorar la seguridad en un servidor, medidas tales como:

  * [Combatir los comentarios de Spam en WordPress][1]
  * [Bloquear ataques de fuerza bruta en nginx y WordPress con Fail2Ban][2]
  * [Bloquear una IP atacando el servidor mediante IPtables][3]

Hoy veremos cómo recibir alertas de correo SSH cada vez que un usuario logre acceder al sistema mediante este protocolo. El artículo original es de <a href="http://www.tecmint.com" title="TecMint" target="_blank">tecmint</a>.

<!--more-->

En linux, cada vez que un usuario accede al sistema, el archivo *.bashrc* se ejecuta. De modo que si añadimos a dicho archivo una sentencia que nos envíe un correo, lograremos monitorizar los accesos al sistema. Antes hay que instalar un cliente de correo, aunque al ser un servidor, es probable que ya exista uno instalado.

## Instalar MailX

<pre lang="bash">apt-get install mailx
</pre>

## Modificar el archivo .bashrc

Para cada usuario del que deseemos recibir alertas, habrá que añadir la siguiente línea a su *bashrc*:

<pre lang="bash">echo 'ALERTA - Acceso a la Shell (ServerName) el:' `date` `who` | mail -s "Alerta: Acceso shell de `who | cut -d'(' -f2 | cut -d')' -f1`" correo@electrónico.com
</pre>

Listo, ahora recibiremos un correo por cada acceso al sistema.

#### Referencias

*How to Get Root and User SSH Login Email Alerts* **|** <a href="http://www.tecmint.com/get-root-ssh-login-email-alerts-in-linux" target="_blank">tecmint.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Recibir alertas de correo al acceder al  sistema mediante SSH+http://elbauldelprogramador.com/recibir-alertas-de-correo-ssh/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/recibir-alertas-de-correo-ssh/&t=Recibir alertas de correo al acceder al  sistema mediante SSH+http://elbauldelprogramador.com/recibir-alertas-de-correo-ssh/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Recibir alertas de correo al acceder al  sistema mediante SSH+http://elbauldelprogramador.com/recibir-alertas-de-correo-ssh/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/combatir-los-comentarios-de-spam-en-wordpress/ "Combatir los comentarios de spam en WordPress"
 [2]: http://elbauldelprogramador.com/bloquear-ataques-de-fuerza-bruta-en-nginx-y-wordpress-con-fail2ban/ "Bloquear ataques de fuerza bruta en Nginx y WordPress con Fail2Ban"
 [3]: http://elbauldelprogramador.com/bloquear-una-ip-atacanto-el-servidor-mediante-iptables/ "Bloquear una IP atacando el servidor mediante iptables"
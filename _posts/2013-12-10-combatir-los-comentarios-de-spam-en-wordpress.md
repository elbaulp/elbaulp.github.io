---
id: 2036
title: Combatir los comentarios de spam en WordPress
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2036
permalink: /combatir-los-comentarios-de-spam-en-wordpress/
categories:
  - Administración de Servidores
tags:
  - bloquear spam wodpress
  - eliminar spam wordpress
  - iptables wordpress comentarios
---
Los comentarios de spam son algo frecuente en internet, y WordPress no es una excepción. Hace poco vimos cómo [bloquear ataques de fuerza bruta en Nginx y WordPress con Fail2Ban][1]. Hoy veremos cómo evitar que se nos inunde la cola de comentarios pendientes o de spam, en mi caso rondan los 200-300 comentarios diarios.

<!--more-->

Existe un plugin llamado <a href="http://akismet.com/" title="Plugins Askimet" target="_blank">Askimet</a> que facilita muchísimo la tarea de detectar comentarios de spam y enviarlos a su correspondiente sección en WordPress. Quizá por eso me ha resultado tan sencillo contruir esta solución para bloquear el acceso a todos los bots que continuamente publican comentarios de este tipo. 

### Recopilar las direcciones IPs de los spammers

Esto es algo trivial, WordPress siempre muestra la IP desde la que se realiza el comentario. Sin embargo recopilar la dirección de 200 comentarios puede ser una tarea ardua. Será más sencillo extraer esta información de la [base de datos][2] con una consulta [SELECT][3]. La tabla en la que nos interesa realizar la consulta es **wp_comments**, y el único campo que deseamos extraer es la dirección IP (Columna **comment\_author\_IP** de la tabla anterior). Para evitar que se repitan la direcciones IPs usaremos la opción **DISTINC**. Seleccionaremos únicamente los comentarios que estén marcados como spam, lo cual corresponde a que el campo **comment_approved** tenga el valor &#8220;**spam**&#8220;. La consulta quedará así:

<pre lang="mysql">SELECT DISTINCT  `comment_author_IP` 
FROM  `wp_comments` 
WHERE  `comment_approved` =  'spam'
</pre>

Usando *phpmyadmin* podremos exportar el resultado a un archivo de texto para tener las IPs almacenadas con el siguiente formato:

<pre style="text-align:center">x.x.x.x
y.y.y.y
z.z.z.z
.......
</pre>

Almacenarlas así nos facilitará la automatización para bloquearles el acceso.

### Bloquear el spam

Una vez tenemos el archivo con las IPs de los spammers, procedemos bloquearlos mediante [iptables][4], de tal forma que no lograrán ni acceder al sitio web, ya que Iptables les denegará el acceso. Usaremos el siguiente [script][5]:

<pre lang="bash">#!/bin/bash

inet_if=eth0

if [ $# = 2 ]; then
    esta=`iptables -nL | grep $1`
    if [ -z "$esta" ]; then
        echo "Bloqueado $1"
        iptables -i ${inet_if} -A INPUT -s $1 -j LOG --log-prefix "$2 "
        iptables -i ${inet_if} -A INPUT -s $1 -j DROP
    else
        echo "Ya está bloqueado"
        echo $esta
    fi
else
    echo "$0 &lt;ip> &lt;Comentario>"
fi
</pre>

Tras guardar el script con el nombre deseado, el uso es el siguiente:

<pre lang="bash">./nombre_script.sh &lt;IP> &lt;mensaje en el log>
</pre>

Si la IP ya está bloqueada, no se añadirá otra entrada a Iptables, el segundo parámetro aparecerá en los logs del sistema, algo así:

<pre lang="bash">Dec  8 18:40:36 nombreServidor kernel: &lt;MENSAJE EN EL LOG>=eth0 OUT= MAC=XXXXXXXXXXXXXX SRC=X.X.X.X DST=Y.Y.Y.Y LEN=X TOS=X PREC=X TTL=X ID=X DF PROTO=TCP SPT=XX DPT=XX WINDOW=XXX RES=XXX SYN URGP=X
</pre>

Para automatizar el bloqueo, recorreremos cada una de las líneas del archivo que hemos exportado de la base de datos con las direcciones IPs de los spammers:

<pre lang="bash">for i in `cat spammers.txt`
do 
   ./nombre_script.sh "$i" "Comentario SPAM"
done
</pre>

Y listo, si listamos las reglas de Iptables tendremos algo parecido a esto:

<pre lang="bash">iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  X.X.X.X        anywhere            
LOG        all  --  X.X.X.X        anywhere            LOG level warning prefix `Comentario SPAM' 
DROP       all  --  Y.Y.Y.Y        anywhere            
LOG        all  --  Y.Y.Y.Y        anywhere            LOG level warning prefix `Comentario SPAM'
</pre>

A partir de ahora, se notará un descenso drástico en los comentarios de spam. Espero que haya servido de ayuda.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Combatir los comentarios de spam en WordPress+http://elbauldelprogramador.com/combatir-los-comentarios-de-spam-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/combatir-los-comentarios-de-spam-en-wordpress/&t=Combatir los comentarios de spam en WordPress+http://elbauldelprogramador.com/combatir-los-comentarios-de-spam-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Combatir los comentarios de spam en WordPress+http://elbauldelprogramador.com/combatir-los-comentarios-de-spam-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/administracion-de-servidores/bloquear-ataques-de-fuerza-bruta-en-nginx-y-wordpress-con-fail2ban/ "Bloquear ataques de fuerza bruta en Nginx y WordPress con Fail2Ban"
 [2]: http://elbauldelprogramador.com/bases-de-datos/ "Bases de Datos"
 [3]: http://elbauldelprogramador.com/basededatos/consulta-de-datos-clausula-select/ "Consulta de Datos – Cláusula Select"
 [4]: http://elbauldelprogramador.com/internet/20-ejemplos-de-iptables-para-sysadmins/ "20 ejemplos de iptables para SysAdmins novatos"
 [5]: http://elbauldelprogramador.com/category/script/ "Scripts del blog"
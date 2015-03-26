---
id: 1318
title: Bloquear una IP atacando el servidor mediante iptables
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1318
permalink: /bloquear-una-ip-atacanto-el-servidor-mediante-iptables/
categories:
  - internet
  - linux
  - seguridad
tags:
  - agregar regla de iptables
  - bloquear ip
  - bloquear ip servidor web
  - comando iptables linux
  - ejemplos de firewall
  - iptables
  - iptables con servidor debian
  - politicas con iptables firewall
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/02/Applic-Firewall-icon.png" alt="Applic-Firewall-icon" width="256" height="256" class="thumbnail alignleft size-full wp-image-1321" />

Ayer ojeando el archivo de log detecté que había una ip mandando peticiones POST indiscriminadamente a la página de login del blog y decidí investigar un poco.

Por la frecuencia con las que se realizaban las peticiones debía ser un ataque automatizado, y probaba cadenas de texto aleatorias, lo primero que hice fué bloquear a dicha ip cualquier intento de conexión al servidor mediante [iptables][1]. 

Además de bloquearlo, añadí una regla a las directivas de iptables para que quedara registrado en el log cada intento de conexión. Las reglas en cuestión son las siguientes:  
  
<!--more-->

{% highlight bash %}>iptables -i ethX -A INPUT -s xx.xx.xx.xx -j LOG --log-prefix "IP DROP SPOOF A:"
iptables -i ethX -A INPUT -s xx.xx.xx.xx -j DROP
{% endhighlight %}

Estas directivas bloquean el tráfico entrante hacia la interfaz *ethX* a la dirección especificada tras el parámetro *-s*, además, en las entradas del log aparecerá como **IP DROP SPOOF A:** cada vez que el firewall bloquee el intento de conexión.

El primer comando es el que define cómo se registrará en el log, el segundo es el que bloquea la dirección.

Para comprobar que efectivamente se está bloqueando al atacante, basta con mirar al log:

{% highlight bash %}>Feb  5 02:15:30 NOMBRESERVIDOR kernel: IP DROP SPOOF A:IN=ethX OUT= MAC=XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX SRC=IPBLOQUEADA DST=IPSERVIDOR LEN=LONGITUDPAQUETE TOS=0x00 PREC=0x00 TTL=117 ID=15234 DF PROTO=TCP SPT=17652 DPT=PUERTODESTINO WINDOW=65535 RES=0x00 SYN URGP=0
{% endhighlight %}

Decidí investigar desde cuando se estaba produciendo el ataque, y, para mi sorpresa, se estaba intentando acceder por fuerza bruta al blog desde hacía 8 días. Concretamente, hubo **18209** intentos de conexión. Este número puede sacarse fácilmente contando las líneas del log en las que estaba involucrada la ip atacante:

{% highlight bash %}>cat /ruta/log/acceso.log | grep xx.xx.xx.xx | wc -l
{% endhighlight %}

Donde **xx.xx.xx.xx** debe ser la ip del atacante. El comando wc con el parámetro -l es el encargado de contar las líneas.

En las referencias puedes encontrar más información sobre iptables. También puedes leer los **[20 ejemplos de iptables para SysAdmins novatos][2]** o [Bloquear ataques de fuerza bruta en Nginx y WordPress con Fail2Ban][3]

#### Referencias

*Iptables Drop IP Address* **|** <a href="http://www.cyberciti.biz/faq/linux-iptables-drop/" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Bloquear una IP atacando el servidor mediante iptables+http://elbauldelprogramador.com/bloquear-una-ip-atacanto-el-servidor-mediante-iptables/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/bloquear-una-ip-atacanto-el-servidor-mediante-iptables/&t=Bloquear una IP atacando el servidor mediante iptables+http://elbauldelprogramador.com/bloquear-una-ip-atacanto-el-servidor-mediante-iptables/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Bloquear una IP atacando el servidor mediante iptables+http://elbauldelprogramador.com/bloquear-una-ip-atacanto-el-servidor-mediante-iptables/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/?s=iptables
 [2]: /internet/20-ejemplos-de-iptables-para-sysadmins/
 [3]: http://elbauldelprogramador.com/administracion-de-servidores/bloquear-ataques-de-fuerza-bruta-en-nginx-y-wordpress-con-fail2ban/ "Bloquear ataques de fuerza bruta en Nginx y WordPress con Fail2Ban"
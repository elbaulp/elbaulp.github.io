---
id: 890
title: SelfControl, aparta las distracciones de tu pc cuando estás trabajando
author: Alejandro Alcalde
layout: post
guid: /?p=890
permalink: /selfcontrol-aparta-las-distracciones-de-tu-pc-cuando-estas-trabajando/
if_slider_image:
  - 
  - 
categories:
  - aplicaciones
  - opensource
tags:
  - agregar regla de iptables
  - bloquear facebook con iptables
  - bloquear facebook por iptables
  - bloquear twitter con iptables
  - bloquear webs
  - comando iptables linux
  - ejemplos de firewall
  - impedir conexiones entrantes
  - iptables
  - iptables con servidor debian
  - selfcontrol
---
[<img class="alignleft size-full wp-image-893" title="selfcontrol" src="http://elbauldelprogramador.com/content/uploads/2012/08/selfcontrol11.png" alt="" width="192" height="192" />][1]

Es fácil distraerse cuando estás sentado enfrente de un ordenador, sobre todo cuando se tienen pocas ganas de trabajar. Leyendo mi RSS encontré una aplicación que puede llegar a ser muy útil si te distras fácilmente; SelfControl.

Esta aplicación bloquea las páginas de internet durante el tiempo que digamos, es bastante fácil de usar y configurar.

Antes de instalarlo es necesario resolver las dependencias del paquete instalando lo siguiente:

&nbsp;

&nbsp;

{% highlight bash %}>sudo aptitude install libgtk2-perl libyaml-perl{% endhighlight %}

Tras instalarlos, bajamos el e instalamos SelfControl:

{% highlight bash %}>wget http://svn.jklmnop.net/projects/SelfControl/selfcontrol_0.9-1_all.deb
sudo dpkg --install selfcontrol_0.9-1_all.deb{% endhighlight %}

Ahora que está todo listo ejecutamos SelfControl desde la línea de comandos y nos aparecerá esta ventanita:  
  
<!--more-->

  
[<img class="aligncenter size-full wp-image-894" title="Selfcontro1" src="http://elbauldelprogramador.com/content/uploads/2012/08/Selfcontro11.png" alt="" width="415" height="378" />][2]

Donde aparecen las webs bloqueadas, una entrada de texto para añadir las páginas a bloquear y por cuanto tiempo.

Antes de configurarlo, hay que asegurarse de que todo esté correcto, abrimos una terminal para ver el estado de <a title="20 ejemplos de iptables para SysAdmins novatos" href="/linux/20-ejemplos-de-iptables-para-sysadmins/" target="_blank">iptables</a>:

&nbsp;

{% highlight bash %}>$ sudo iptables --list
Chain INPUT (policy ACCEPT)
  target     prot opt source               destination         

  Chain FORWARD (policy ACCEPT)
  target     prot opt source               destination         

  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination{% endhighlight %}

Si no sale algo parecido quizá no tengas instalado iptables, aunque la mayoría de las distribuciones lo traen por defecto.

Una vez que ejecutemos el programa aparecerá algo así:

{% highlight bash %}>$ sudo iptables --list
Chain INPUT (policy ACCEPT)
  target     prot opt source               destination         

  Chain FORWARD (policy ACCEPT)
  target     prot opt source               destination         

  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination         
  SelfControl  all  --  anywhere             anywhere            

  Chain SelfControl (1 references)
  target     prot opt source               destination         
  DROP       all  --  anywhere             www.example.com{% endhighlight %}

* * *

Sítio Oficial | <a href="http://svn.jklmnop.net/projects/SelfControl.html" target="_blank">SelfControl </a>  
Fuente | <a href="http://www.datamation.com/open-source/15-must-have-linux-applications-1.html" target="_blank">15 Must Have Linux Applications</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=SelfControl, aparta las distracciones de tu pc cuando estás trabajando+http://elbauldelprogramador.com/selfcontrol-aparta-las-distracciones-de-tu-pc-cuando-estas-trabajando/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/selfcontrol-aparta-las-distracciones-de-tu-pc-cuando-estas-trabajando/&t=SelfControl, aparta las distracciones de tu pc cuando estás trabajando+http://elbauldelprogramador.com/selfcontrol-aparta-las-distracciones-de-tu-pc-cuando-estas-trabajando/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=SelfControl, aparta las distracciones de tu pc cuando estás trabajando+http://elbauldelprogramador.com/selfcontrol-aparta-las-distracciones-de-tu-pc-cuando-estas-trabajando/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/content/uploads/2012/08/selfcontrol11.png
 [2]: http://elbauldelprogramador.com/content/uploads/2012/08/Selfcontro11.png
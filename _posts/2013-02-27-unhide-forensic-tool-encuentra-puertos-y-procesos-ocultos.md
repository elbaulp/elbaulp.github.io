---
id: 1374
title: 'Unhide Forensic Tool: Encuentra puertos y procesos ocultos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1374
permalink: /unhide-forensic-tool-encuentra-puertos-y-procesos-ocultos/
categories:
  - aplicaciones
  - Hacking
  - seguridad
tags:
  - herramientas forenses
  - unhide
  - unhide forensic tool
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/02/ghostbuster.jpg" alt="Unhide Forensic Tool" width="200" height="176" class="thumbnail alignleft size-full wp-image-1378" />

Unhide Forensic Tool o simplemente ***Unhide*** es una herramienta forense que permite encontrar los procesos que ocultan los <a href="https://es.wikipedia.org/wiki/Rootkit" target="_blank">RootKits</a>, por módulos del kernel Linux o por otras técnicas.  
<!--</p>
<ul>
<li>Compara las salidas /proc frente a /bin/ps</li>
<li>Compara la información adquirida a partir de /bin/ps con la información recopilada de procfs. <strong>Solo para versiones Linux 2.6</strong></li>
<li>Compara la información recopilada de /bin/ps con la información de las llamadas al sistema (syscall scannig).</li>
<li>PIDs bruteforce. <strong>Solo para versiones Linux 2.6</strong></li>
<li></li>
<li></li>
</ul>
<p>-->

<!-- -->

Está disponible tanto para <a href="http://sourceforge.net/projects/unhide/files/latest/download?source=files" target="_blank">Windows</a> como para <a href="http://sourceforge.net/projects/unhide/files/" target="_blank">Linux</a>.

Antes de usarlo es necesario compilarlo, cosa que logramos con los siguientes comandos:  
  
<!--more-->

{% highlight bash %}>gcc -Wall -O2 --static -pthread unhide-linux*.c unhide-output.c -o unhide-linux
gcc -Wall -O2 --static unhide_rb.c -o unhide_rb
gcc -Wall -O2 --static unhide-tcp.c unhide-tcp-fast.c unhide-output.c -o unhide-tcp
{% endhighlight %}

**unhide-tcp** es una herramienta forense que identifica puertos TCP/UDP a la escucha pero no están listados en [/bin/netstat][1].

Los posibles argumentos de cada herramienta son los siguientes:

{% highlight bash %}>./unhide-tcp --help
Unhide-tcp 20121229
Copyright © 2012 Yago Jesus &#038; Patrick Gouin
License GPLv3+ : GNU GPL version 3 or later

http://www.unhide-forensics.info

Usage: ./unhide-tcp [options] 

Options :
   -V          Show version and exit
   -v          verbose
   -h          display this help
   -f          show fuser output for hidden ports
   -l          show lsof output for hidden ports
   -o          log result into unhide-tcp.log file
   -s          use very quick version for server with lot of opened ports
   -n          use netstat instead of ss
{% endhighlight %}

Para mi sorpresa, he descubierto que esta herramienta está desarrollada por Jesus Yago, colaborador en un blog que leo regularmente, <a href="http://www.securitybydefault.com/2013/01/unhide-20121229-is-out.html" target="_blank">securitybydefault</a>.

Las opciones de **unhide-linux**:

{% highlight bash %}>./unhide-linux --help
Unhide 20121229
Copyright © 2012 Yago Jesus &#038; Patrick Gouin
License GPLv3+ : GNU GPL version 3 or later

http://www.unhide-forensics.info

NOTE : This version of unhide is for systems using Linux >= 2.6 

Usage: ./unhide-linux [options] test_list

Option :
   -V          Show version and exit
   -v          verbose
   -h          display this help
   -m          more checks (available only with procfs, checkopendir &#038; checkchdir commands)
   -r          use alternate sysinfo test in meta-test
   -f          log result into unhide-linux.log file
   -o          same as '-f'
   -d          do a double check in brute test
Test_list :
   Test_list is one or more of the following
   Standard tests :
      brute
      proc
      procall
      procfs
      quick
      reverse
      sys
   Elementary tests :
      checkbrute
      checkchdir
      checkgetaffinity
      checkgetparam
      checkgetpgid
      checkgetprio
      checkRRgetinterval
      checkgetsched
      checkgetsid
      checkkill
      checknoprocps
      checkopendir
      checkproc
      checkquick
      checkreaddir
      checkreverse
      checksysinfo
      checksysinfo2
      checksysinfo3
{% endhighlight %}

#### Fuente

*Unhide Forensic Tool, Find hidden processes and ports* **|** <a href="http://toolsyard.thehackernews.com/2013/02/unhide-forensic-tool-find-hidden.html" target="_blank">toolsyard.thehackernews.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Unhide Forensic Tool: Encuentra puertos y procesos ocultos+http://elbauldelprogramador.com/unhide-forensic-tool-encuentra-puertos-y-procesos-ocultos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/unhide-forensic-tool-encuentra-puertos-y-procesos-ocultos/&t=Unhide Forensic Tool: Encuentra puertos y procesos ocultos+http://elbauldelprogramador.com/unhide-forensic-tool-encuentra-puertos-y-procesos-ocultos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Unhide Forensic Tool: Encuentra puertos y procesos ocultos+http://elbauldelprogramador.com/unhide-forensic-tool-encuentra-puertos-y-procesos-ocultos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /articulos/netstat-analizando-la-red-y-detectando-problemas/
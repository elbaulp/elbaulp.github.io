---
id: 18
title: Script resaltado sintaxis bash
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/script-resaltado-sintaxis-bash/
permalink: /script-resaltado-sintaxis-bash/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/10/script-resaltado-sintaxis-bash.html
  - /2010/10/script-resaltado-sintaxis-bash.html
  - /2010/10/script-resaltado-sintaxis-bash.html
categories:
  - linux
  - script
---
Como os dije, he hecho el script para el resaltado de bash, me ha costado un poco mas, porque queria intentar resaltar mas cosas, pero al final desistí, y lo hice un poco más simple. Hay que tener en cuenta, que habrá muchas palabras que no se resalten, ya que en la terminal de gnu/Linux existen muchísimos comandos, y obviamente, no puedo ponerlos todos, cuando querais que un determinado comando se resalte (como ls, telnet, ftp&#8230;) o cualquiera que useis, simplemente añadirlo a la variable keyWords.

Aquí el código:

{% highlight bash %}<span class="path">#!/bin/bash</span>

rutaCodigo=`zenity --file-selection --title="Select a File"`
<span class="bash">case</span> $? <span class="bash">in</span>
0)
  keywords="<span class="bash">alias</span> <span class="bash">bg</span> <span class="bash">bind</span> <span class="bash">break</span> <span class="bash">builtin</span> <span class="bash">case</span> <span class="bash">cd</span> <span class="bash">command</span> <span class="bash">continue</span> <span class="bash">declare</span> <span class="bash">dirs</span> <span class="bash">disown</span> <span class="bash">do</span> <span class="bash">done</span> <span class="bash">echo</span> <span class="bash">elif</span> <span class="bash">else</span> <span class="bash">enable-<span class="bash">in</span></span> <span class="bash">esac</span> <span class="bash">eval</span> <span class="bash">exec</span> <span class="bash">exit</span> <span class="bash">export</span> <span class="bash">fc</span> <span class="bash">fg</span> <span class="bash">fi</span> <span class="bash">for</span> <span class="bash">function</span> <span class="bash">getopts</span> <span class="bash">hash</span> <span class="bash">help</span> <span class="bash">history</span> <span class="bash">if</span> in <span class="bash">jobs</span> <span class="bash">kill</span> <span class="bash">let</span> <span class="bash">local</span> <span class="bash">logout</span> <span class="bash">popd</span> <span class="bash">pushd</span> <span class="bash">pwd</span> <span class="bash">read</span> <span class="bash">readonly</span> <span class="bash">return</span> <span class="bash">select</span> <span class="bash">set</span> <span class="bash">shift</span> <span class="bash">suspend</span> <span class="bash">test</span> <span class="bash">then</span> <span class="bash">time</span> <span class="bash">times</span> <span class="bash">trap</span> <span class="bash">type</span> <span class="bash">typeset</span> <span class="bash">ulimit</span> <span class="bash">umask</span> <span class="bash">unalias</span> <span class="bash">unset</span> <span class="bash">until</span> <span class="bash">wait</span> <span class="bash">while</span> <span class="bash">sed</span> <span class="bash">rm</span> <span class="bash">IFS</span> <span class="bash">cp</span> <span class="bash">mv</span> <span class="bash">mkdir</span>"
 
 <span class="bash">sed</span> 's/#.*/<span class="comentario">&#038;</span>/' &lt; "$rutaCodigo" > temp # Para lo comentarios, el &#038; hace que se escriba lo que coincidio con el patron
 <span class="bash">cp</span> temp "$rutaCodigo"
 
  <span class="bash">for</span> word <span class="bash">in</span> $keywords
  <span class="bash">do</span>
    <span class="comentario">#Busco en el texto, cada palabra clave contenida en keyWords, y le añado la etiqueta span</span>
    <span class="bash">sed</span> "s/b$wordb/<span class="bash">$word</span>/" &lt; "$rutaCodigo" > temp
    <span class="bash">cp</span> temp "$rutaCodigo"
  <span class="bash">done</span>
  
  <span class="bash">rm</span> temp
  ;;            
*)
  <span class="bash">echo</span> "No se seleciciono nada.";;
<span class="bash">esac</span>
{% endhighlight %}

Bien, voy a explicarlo un poco:

La estructura es bastante similar a la del [script de resaltado de sintáxis de c++][1].

{% highlight bash %}sed 's/#.*/<span class="comentario">&#038;</span>/'{% endhighlight %}

Esta línea es la que se encarga de resaltar los comentarios. Simplemente buscamos una #, que es como se defienen los comentarios en bash, y cualquier carácter despues (.\*). El & que hay en la siguiente sección, es para que en ese lugar, se coloque todo lo que coincidió con el patrón (.\*), es decir, el comentario.

Hay un pequeño problema, y es que no conseguí formar la expresión regular 100% correcta para los comentarios, de modo que en cualquier lugar en el que exista una #, se la tratará como comentario, esto sucede por ejemplo al principio del script (#!/bin/bash).

Espero que os sea útil, y si quieren modificarlo, háganlo, me lo envian, y yo lo subo al blog sin problemas.  
Saludos.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Script resaltado sintaxis bash+http://elbauldelprogramador.com/script-resaltado-sintaxis-bash/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/script-resaltado-sintaxis-bash/&t=Script resaltado sintaxis bash+http://elbauldelprogramador.com/script-resaltado-sintaxis-bash/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Script resaltado sintaxis bash+http://elbauldelprogramador.com/script-resaltado-sintaxis-bash/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/script-resaltado-sintaxis/
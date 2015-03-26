---
id: 109
title: '[Meme] Los 10 comandos que más utilizo en Linux'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/meme-los-10-comandos-que-mas-utilizo-en-linux/
permalink: /meme-los-10-comandos-que-mas-utilizo-en/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/meme-los-10-comandos-que-mas-utilizo-en.html
  - /2011/01/meme-los-10-comandos-que-mas-utilizo-en.html
  - /2011/01/meme-los-10-comandos-que-mas-utilizo-en.html
categories:
  - meme
---
<div class="icosh">
</div>

En <a target="_blank" href="http://www.ubuntizandoelplaneta.com/2011/01/meme-los-10-comandos-que-mas-utilizo.html">ubuntizando el planeta</a> he leido este meme que voy a publicar, que consiste en ejecutar la orden 

{% highlight bash %}history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
{% endhighlight %}

en nuestro terminal para saber cuales son los comandos que más usamos en linux, seguro que os sorprendéis al ver vuestros resultados.

  
<!--more-->

  
Invito a participar en el meme a:

<a target="_blank" href="http://usemoslinux.blogspot.com/">Usemos Linux</a>  
<a target="_blank" href="http://www.nosolounix.com/">No solo Unix</a>

Aqui mi salida del comando de mi PC de sobremesa:

{% highlight bash %}hkr@alexpc:~$ history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
     68 cd
     60 bzr
     49 sudo
     46 ./main.py
     35 ls
     34 ./convertirminiatura.sh
     28 ./convertirminiatura
     18 cat
     15 gpg
     11 locate
hkr@alexpc:~$
{% endhighlight %}

Los del portátil:

{% highlight bash %}hkr@HKR-->/$ history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
    296 sudo
    128 cd
     89 ls
     39 cp
     35 svn
     31 locate
     23 ping
     23 git
     21 python
     14 telnet
hkr@HKR-->/$
{% endhighlight %}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=[Meme] Los 10 comandos que más utilizo en Linux+http://elbauldelprogramador.com/meme-los-10-comandos-que-mas-utilizo-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/meme-los-10-comandos-que-mas-utilizo-en/&t=[Meme] Los 10 comandos que más utilizo en Linux+http://elbauldelprogramador.com/meme-los-10-comandos-que-mas-utilizo-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=[Meme] Los 10 comandos que más utilizo en Linux+http://elbauldelprogramador.com/meme-los-10-comandos-que-mas-utilizo-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
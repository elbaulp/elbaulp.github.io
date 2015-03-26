---
id: 25
title: C++ syntax highlighted script
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/c-syntax-highlighted-script/
permalink: /c-syntax-highlighted-script/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/11/c-syntax-highlighted-script.html
  - /2010/11/c-syntax-highlighted-script.html
  - /2010/11/c-syntax-highlighted-script.html
categories:
  - linux
  - script
---
<p lang="en">
  I decided to create a small script that highlights the words reserved of c++.<br /> Here the code:
</p>

<pre class="ejemplo"><span class="path">#!/bin/bash</span>

rutaCodigo=`zenity --file-selection --title="Select a File"`
<span class="bash">case</span> $? <span class="bash">in</span>
0)
  keyWords="continue float new signed try auto default for operator sizeof typedef break delete friend private static union case do goto protected struct unsigned catch double if public switch virtual char else inline register template void enum int return this volatile const extern long short throw while bool cout cin using namespace"

  <span class="bash">sed</span> "s/^#include/<span class="prp">#include</span>/" &lt; "$rutaCodigo" > temp # coloreo el include
  <span class="bash">sed</span> "s/^#define/<span class="prp">#define</span>/" &lt; temp > "$rutaCodigo" # coloreo el define

  <span class="bash">for</span> word <span class="bash">in</span> $keyWords
  <span class="bash">do</span>
    <span class="comentario">#Busco en el texto, cada palabra clave contenida en keyWords, y le añado la etiqueta span</span>
    <span class="bash">sed</span> "s/b$wordb/<span class="cpp">$word</span>/" &lt; "$rutaCodigo" > temp
    <span class="bash">cp</span> temp $rutaCodigo
  <span class="bash">done</span>

  <span class="bash">sed</span> "s/^class /<span class="cpp">class</span>/g" &lt; "$rutaCodigo" > temp
  <span class="bash">rm</span> temp
  ;;            
*)
  <span class="bash">echo</span> "No se seleciciono nada.";;
<span class="bash">esac</span>
</pre>

** I am going to explain a bit the code: **

The variable * keyWords * contains the key words of c ++, fewer &#8220;class&#8221;, which later I will explain because. In this variable, the words have to be separated by a space, and all in the same line, In order that the &#8220;for&#8221; takes word to word.

Both following lines 

<pre>sed "s/^#include..... and sed "s/^#define...</pre>

search the pattern &#8220;#define&#8221; or &#8220;#include&#8221;, initially of every line of the text, this is indicated by * ^ *, and replaces it with his corresponding style, to format the text. Once we enter the &#8220;for&#8221;, there is applied basically the same procedure that for it &#8220;define&#8221; and &#8220;include&#8221;, but with every word of the variable keyWords.

Finally, I do the same for the reserved word &#8220;class&#8221;, the motive for which I have left this one by the end, it is because the label <span class ...> contains the word, &#8220;class&#8221;, and then the code would not go out well, since on having been this word inside the label span, it would replace it also.  
How Use It:

It is necessary to create a css class for the blog, of this form:

***.prp { color: #0a0; font-weight: bold; }  
.cpp { color: #a40; font-weight: bold; }***

Once done this, we have to execute the script and introduce the code path to formatting with this style.

<a href="http://bashyc.blogspot.com/p/curso-c.html#ejercicio111" target="_blank">Here</a> you can see the result.

Regards, I hope that it is useful

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=C++ syntax highlighted script+http://elbauldelprogramador.com/c-syntax-highlighted-script/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/c-syntax-highlighted-script/&t=C++ syntax highlighted script+http://elbauldelprogramador.com/c-syntax-highlighted-script/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=C++ syntax highlighted script+http://elbauldelprogramador.com/c-syntax-highlighted-script/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
---
id: 16
title: Script resaltado sintaxis c++
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/script-resaltado-sintaxis-c/
permalink: /script-resaltado-sintaxis/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/10/script-resaltado-sintaxis.html
  - /2010/10/script-resaltado-sintaxis.html
  - /2010/10/script-resaltado-sintaxis.html
categories:
  - linux
  - script
tags:
  - sintaxis c
---
He estado un tiempo intentando instalar unos script hechos en javascript, para resaltar la sintaxis del codigo fuente que tengo en el blog, pero no conseguí instalarlo. Se llama SyntaxHighlighter, su web es <a href="http://alexgorbatchev.com/SyntaxHighlighter/" target="_blank">esta</a>.  
Ya que no lo consegui me decidi a crear un pequeño script que por lo menos resalte las palabras reservadas del lengüaje.  
<span class="fullpost"> <br /> Lo hice para c++, en los proximos días intentaré hacer otro para bash y python.<br /> Aqui esta el codigo:</p> 

{% highlight bash %}<span class="path">#!/bin/bash</span>

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
{% endhighlight %}

<p>
  <b>Voy a explicar un poco el código:</b><br /> La variable <em>keyWords</em> contiene las palabras claves de c++, menos &#8220;class&#8221;, que despues explicaré porque. En esta variable, las palabras han de estar separadas por un espacio, y todas en una misma linea, Para que el for coja palabra a palabra..
</p>

<p>
  Las dos siguientes lineas 
  
  {% highlight bash %}sed "s/^#include..... y sed "s/^#define...{% endhighlight %}
  
  <p>
    buscan el patrón #define o #include, al principio de cada linea del texto, esto se indica con <em>^</em>, y lo reemplaza con su estilo correspondiente, para formatear el texto.<br /> Una vez entramos al for, se aplica básicamente el mismo procedimiento que para define e include, pero con cada palabra de la variable keyWords.
  </p>
  
  <p>
    Por ultimo, hago lo mismo para la palabra, reservada class, el motivo por el que he dejado esta para el final, es porque la etiqueta <span class...> contiene la palabra, class, y entonces el código no saldria bien, ya que al encontrarse esta palabra dentro de la etiqueta span, la sustituiría tambien.<br /> Como Usarlo:
  </p>
  
  <p>
    Lo primero que hice fue pensar de que color resaltar las palabras clave, las puse igual que en los ejemplos de <a href="http://conclase.net/" target="_blank">conclase</a>. El siguiente paso es crear una clase en el css del blog, de esta forma:
  </p>
  
  <p>
    <b><i>.prp { color: #0a0; font-weight: bold; }<br /> .cpp { color: #a40; font-weight: bold; }</i></b>
  </p>
  
  <p>
    Una vez hecho esto, solo nos resta ejecutar el script, e introducir la ruta del codigo a formatear con este estilo.
  </p>
  
  <p>
    <a href="http://bashyc.blogspot.com/p/curso-c.html#ejercicio111" target="_blank">Aqui</a> podeis ver el resultado.
  </p>
  
  <p>
    Si tenéis alguna duda, preguntad sin problema.
  </p>
  
  <p>
    Saludos, espero que sea útil<br /> </span>
  </p>
  
  <div class="sharedaddy">
    <div class="sd-content">
      <ul>
        <li>
          <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Script resaltado sintaxis c+++http://elbauldelprogramador.com/script-resaltado-sintaxis/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
        </li>
        <li>
          <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/script-resaltado-sintaxis/&t=Script resaltado sintaxis c+++http://elbauldelprogramador.com/script-resaltado-sintaxis/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
        </li>
        <li>
          <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Script resaltado sintaxis c+++http://elbauldelprogramador.com/script-resaltado-sintaxis/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
---
id: 24
title: 'Bash syntax highlighted script [Improved]'

layout: post
guid: http://elbauldelprogramador.org/bash-syntax-highlighted-script-improved/
permalink: /bash-syntax-highlighted-script-improved/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
  
categories:
  - linux
  - script
main-class: 'dev'
main-class: "linux"
---
<p lang="en">
  Thanks to DavidRSM, I have improved the highlighted syntax script for bash, and now it allows many more key words. Simply it is necessary to add to the variable keywords the commands names that they find in /bin/, and /sbin/, You can add more key words concatenating them to the variable, this way:
</p>

```bash
keywords=$keywords`<span class="bash">ls</span> '<em>Commands directory</em>'`
```



```bash
<span class="path">#!/bin/bash</span>

rutaCodigo=`zenity --file-selection --title="Select a File"`
<span class="bash">case</span> $? in
0)
  keywords="<span class="bash">alias</span> <span class="bash">bg</span> <span class="bash">bind</span> <span class="bash">break</span> <span class="bash">builtin</span> <span class="bash">case</span> <span class="bash">cd</span> <span class="bash">command</span> <span class="bash">continue</span> <span class="bash">declare</span> <span class="bash">dirs</span> <span class="bash">disown</span> <span class="bash">do</span> <span class="bash">done</span> <span class="bash">elif</span> <span class="bash">else</span> <span class="bash">enable-in</span> <span class="bash">esac</span> <span class="bash">eval</span> <span class="bash">exec</span> <span class="bash">exit</span> <span class="bash">export</span> <span class="bash">fc</span> <span class="bash">fg</span> <span class="bash">fi</span> <span class="bash">for</span> <span class="bash">function</span> <span class="bash">getopts</span> <span class="bash">hash</span> <span class="bash">help</span> <span class="bash">history</span> <span class="bash">if</span> <span class="bash">jobs</span> <span class="bash">let</span> <span class="bash">local</span> <span class="bash">logout</span> <span class="bash">popd</span> <span class="bash">pushd</span> <span class="bash">read</span> <span class="bash">readonly</span> <span class="bash">return</span> <span class="bash">select</span> <span class="bash">set</span> <span class="bash">shift</span> <span class="bash">suspend</span> <span class="bash">test</span> <span class="bash">then</span> <span class="bash">time</span> <span class="bash">times</span> <span class="bash">trap</span> <span class="bash">type</span> <span class="bash">typeset</span> <span class="bash">ulimit</span> <span class="bash">umask</span> <span class="bash">unalias</span> <span class="bash">unset</span> <span class="bash">until</span> <span class="bash">wait</span> <span class="bash">while</span>"
 
 <span class="comentario">#Agrego mas palabras clave de los directorios sbin y bine, que contienen comandos.</span>
 keywords=$keywords`<span class="bash">ls</span> /bin/`
 keywords=$keywords`<span class="bash">ls</span> /sbin/` 
 
 <span class="comentario"># Para lo comentarios, el & hace que se escriba lo que coincidio con el patron</span>
 <span class="bash">sed</span> 's/#.*/<span class="comentario">&</span>/' < "$rutaCodigo" > temp
 <span class="bash">cp</span> temp "$rutaCodigo"
 
  <span class="bash">for</span> word in $keywords
  <span class="bash">do</span>
    <span class="comentario">#Busco en el texto, cada palabra clave contenida en keyWords, y le añado la etiqueta span</span>
    <span class="bash">sed</span> "s/b$wordb/<span class="bash">$word</span>/" < "$rutaCodigo" > temp
    <span class="bash">cp</span> temp "$rutaCodigo"
  <span class="bash">done</span>
  
  <span class="bash">rm</span> temp
  ;;            
*)
  <span class="bash">echo</span> "No se seleciciono nada.";;
<span class="bash">esac</span>

```</p> 



{% include _toc.html %}

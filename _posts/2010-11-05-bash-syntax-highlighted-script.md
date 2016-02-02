---
id: 23
title: Bash syntax highlighted script

layout: post
guid: http://elbauldelprogramador.org/bash-syntax-highlighted-script/
permalink: /bash-syntax-highlighted-script/
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
---
<p lang="en">
  As I said to you, I have done the bash highlighted syntax script, Still it does not highlight many words, but I will try to improve it. If there is some word that is not highlighted, simply add it to the variable KeyWords.<br /> Here the code:
</p>

```bash
<span class="path">#!/bin/bash</span>

rutaCodigo=`zenity --file-selection --title="Select a File"`
<span class="bash">case</span> $? <span class="bash">in</span>
0)
  keywords="<span class="bash">alias</span> <span class="bash">bg</span> <span class="bash">bind</span> <span class="bash">break</span> <span class="bash">builtin</span> <span class="bash">case</span> <span class="bash">cd</span> <span class="bash">command</span> <span class="bash">continue</span> <span class="bash">declare</span> <span class="bash">dirs</span> <span class="bash">disown</span> <span class="bash">do</span> <span class="bash">done</span> <span class="bash">echo</span> <span class="bash">elif</span> <span class="bash">else</span> <span class="bash">enable-<span class="bash">in</span></span> <span class="bash">esac</span> <span class="bash">eval</span> <span class="bash">exec</span> <span class="bash">exit</span> <span class="bash">export</span> <span class="bash">fc</span> <span class="bash">fg</span> <span class="bash">fi</span> <span class="bash">for</span> <span class="bash">function</span> <span class="bash">getopts</span> <span class="bash">hash</span> <span class="bash">help</span> <span class="bash">history</span> <span class="bash">if</span> in <span class="bash">jobs</span> <span class="bash">kill</span> <span class="bash">let</span> <span class="bash">local</span> <span class="bash">logout</span> <span class="bash">popd</span> <span class="bash">pushd</span> <span class="bash">pwd</span> <span class="bash">read</span> <span class="bash">readonly</span> <span class="bash">return</span> <span class="bash">select</span> <span class="bash">set</span> <span class="bash">shift</span> <span class="bash">suspend</span> <span class="bash">test</span> <span class="bash">then</span> <span class="bash">time</span> <span class="bash">times</span> <span class="bash">trap</span> <span class="bash">type</span> <span class="bash">typeset</span> <span class="bash">ulimit</span> <span class="bash">umask</span> <span class="bash">unalias</span> <span class="bash">unset</span> <span class="bash">until</span> <span class="bash">wait</span> <span class="bash">while</span> <span class="bash">sed</span> <span class="bash">rm</span> <span class="bash">IFS</span> <span class="bash">cp</span> <span class="bash">mv</span> <span class="bash">mkdir</span>"
 
 <span class="bash">sed</span> 's/#.*/<span class="comentario">&</span>/' < "$rutaCodigo" > temp # & print the coincidence with the pattern
 <span class="bash">cp</span> temp "$rutaCodigo"
 
  <span class="bash">for</span> word <span class="bash">in</span> $keywords
  <span class="bash">do</span>
    <span class="comentario">#I search in the text, every key word contained in keyWords, and add the label </span>
    <span class="bash">sed</span> "s/b$wordb/<span class="bash">$word</span>/" < "$rutaCodigo" > temp
    <span class="bash">cp</span> temp "$rutaCodigo"
  <span class="bash">done</span>
  
  <span class="bash">rm</span> temp
  ;;            
*)
  <span class="bash">echo</span> "No se seleciciono nada.";;
<span class="bash">esac</span>

```

I am going to explain a bit the code:

```bash
sed 's/#.*/<span class="comentario">&</span>/'
```

This line is the one that takes charge highlighting the comments. We look for one &#8220;\*&#8221;, that are the comments in bash, and any character after &#8221; (. \*) &#8220;. &#8220;&&#8221;, it is in order that in this place, it prints everything what coincided with the pattern &#8221; (. *) &#8220;, that is to say, the comment.

There is a small problem, and is that I did not manage to form the regular expression 100 % correct for the comments, in any place in which one exists #, it will treat as a comment, this happens for example in (#!/bin/bash).

I hope that it is useful



{% include _toc.html %}

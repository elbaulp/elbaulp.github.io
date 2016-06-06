---
id: 109
title: '[Meme] Los 10 comandos que más utilizo en Linux'

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

  
  
  
categories:
  - meme
main-class: dev
---
<div class="icosh">
</div>

En <a target="_blank" href="http://www.ubuntizandoelplaneta.com/2011/01/meme-los-10-comandos-que-mas-utilizo.html">ubuntizando el planeta</a> he leido este meme que voy a publicar, que consiste en ejecutar la orden 

```bash
history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10

```

en nuestro terminal para saber cuales son los comandos que más usamos en linux, seguro que os sorprendéis al ver vuestros resultados.

  
<!--ad-->

  
Invito a participar en el meme a:

<a target="_blank" href="http://usemoslinux.blogspot.com/">Usemos Linux</a>  
<a target="_blank" href="http://www.nosolounix.com/">No solo Unix</a>

Aqui mi salida del comando de mi PC de sobremesa:

```bash
hkr@alexpc:~$ history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
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

```

Los del portátil:

```bash
hkr@HKR-->/$ history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
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

```



{% include _toc.html %}

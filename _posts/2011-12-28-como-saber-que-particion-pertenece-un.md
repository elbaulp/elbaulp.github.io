---
id: 318
title: Cómo saber a qué partición pertenece un archivo en GNU/Linux

layout: post
guid: http://elbauldelprogramador.org/como-saber-a-que-particion-pertenece-un-archivo-en-gnulinux/
permalink: /como-saber-que-particion-pertenece-un/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551755}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551755}'
share_count:
  - 0
  - 0
categories:
  - How To
  - linux
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="/images/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="" id="logo" name="sh" class="icono" /></a>
</div>

¿Cómo podemos saber que el archivo */home/hkr/Desktop/combinaciones.cpp* pertenece a una partición específica?¿O cómo podemos saber en qué partición existe un archivo?

Para eso podemos usar el comando df, que informa del uso del espacio en disco del sistema incluyendo nombres de archivos y directorios. La sintaxis es así:

  
<!--ad-->

{% highlight bash %}df
df /ruta/a un/directorio
df /ruta/a un/archivo
{% endhighlight %}

En el siguiente ejemplo se busca el nombre de la partición donde se encuentra el fichero llamado */home/hkr/Desktop/combinaciones.cpp*

{% highlight bash %}df -T /home/hkr/Desktop/combinaciones.cpp
{% endhighlight %}

Que tiene como salida:

{% highlight bash %}Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda6     ext4   186362292 140452228  36443368  80% /home
{% endhighlight %}

Como vemos, el resultado es que el archivo *combinaciones.cpp* pertenece a la partición */dev/sda6*. Con el siguiente comando mostramos solo el nombre de la partición:

{% highlight bash %}df /home/hkr/Desktop/combinaciones.cpp | awk '/^/dev/ {print $1}'
{% endhighlight %}

O con este otro:

{% highlight bash %}awk '/^/dev/ {print $1}' <<<"$(df /home/hkr/Desktop/combinaciones.cpp)"
{% endhighlight %}

La salida para los dos comandos anteriores es la misma:

{% highlight bash %}/dev/sda6
{% endhighlight %}

Es recomendable colocar la siguiente función bash en nuestro archivo *~/.bashrc*

{% highlight bash %}# find partition name for a given filename
findpart() { 
   [ -e "$1" ] && df -P "$1"  | awk '/^/dev/ {print $1}' || echo "$1 not found"; 
}
{% endhighlight %}

Ejemplos de uso:

{% highlight bash %}findpart /foo/bar
findpart /etc
findpart /home/vivek/test.txt
{% endhighlight %}

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://1.bp.blogspot.com/-F2sPR477GsI/TvsYjhPFVgI/AAAAAAAAB_8/olid11qqdXw/s1600/Screenshot.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="68" width="400" src="http://1.bp.blogspot.com/-F2sPR477GsI/TvsYjhPFVgI/AAAAAAAAB_8/olid11qqdXw/s400/Screenshot.png" /></a>
</div>

Vía <a target="_blank" href="http://www.cyberciti.biz/faq/linux-unix-command-findout-on-which-partition-file-directory-exits/">cyberciti</a>



{% include _toc.html %}

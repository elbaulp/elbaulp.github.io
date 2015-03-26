---
id: 1619
title: 'Cómo resolver el error &#8216;wxMaxima encontró un error durante la carga&#8217;'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1619
permalink: /wxmaxima-encontro-un-error-durante-la-carga/
categories:
  - How To
  - linux
tags:
  - convertir a utf8 maxima
  - wxmaxima error
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/06/Maxima.png" alt="wxMaxima encontró un error durante la carga" width="271" height="256" class="thumbnail alignleft size-full wp-image-1625" />  
En la facultad solemos usar wxMaxima en las prácticas de las asignturas. Hace poco al intentar abrir un fichero wxm me encontré con el siguiente error:

wxMaxima encontró un error durante la carga ó Failed to convert file to Unicode.

Que indica que wxmaxima ha encontrado un error intentando convertir el fichero a Unicode (utf-8). Para solucionar el problema deberemos convertir manualmente el fichero a utf-8. Basta con seguir los siguientes pasos:  
  
<!--more-->

### Resolver el error &#8216;wxMaxima encontró un error durante la carga&#8217;

Usaremos el programa *file* para determinar el tipo de fichero:

{% highlight bash %}>$ file -i Pr06\ -\ Grafos.wxm 
Pr06 - Grafos.wxm: text/x-pascal; charset=iso-8859-1
{% endhighlight %}

Así hemos obtenido la codificación actual del archivo, la cual nos hará falta para el siguiente paso.

Ahora necesitamos hacer una conversión de formato usando el comando *iconv* de la siguiente forma:

{% highlight bash %}>iconv -f ISO_8859-1 -t UTF-8 -o ficheroSalida ficheroEntrada
{% endhighlight %}

Con esto ya tendremos el fichero codificado en utf-8 y wxmaxmima lo abrirá sin problemas. 

Para terminar os dejo un script que hice para convertir todos los archivos *.wxm* de una sola vez. El resultado será un fichero con el mismo nombre que el original pero de extensión *utf8.wxm*:

{% highlight bash %}>IFS='
'
for i in `ls *.wxm`
do
        echo -e "iconv -f ISO_8859-1 -t UTF-8 -o \"`basename "$i" .wxm`.utf8.wxm\" \"$i\""
        iconv -f ISO_8859-1 -t UTF-8 -o "`basename "$i" .wxm`.utf8.wxm" "$i"
done
IFS=' '
{% endhighlight %}

Hay que decir, sin embargo, que es posible ahorrarse todo esto si se guardaran todos los ficheros de wxmaxima con la extensión *.wxmx*.

#### Referencias

*ubuntudriver* **|** <a href="http://ubuntudriver.blogspot.com.es/2011/06/cambiar-codificacion-de-un-archivo.html" target="_blank">Cómo Cambiar la Codificación de un Fichero en Linux y Mac OS X</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo resolver el error &#8216;wxMaxima encontró un error durante la carga&#8217;+http://elbauldelprogramador.com/wxmaxima-encontro-un-error-durante-la-carga/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/wxmaxima-encontro-un-error-durante-la-carga/&t=Cómo resolver el error &#8216;wxMaxima encontró un error durante la carga&#8217;+http://elbauldelprogramador.com/wxmaxima-encontro-un-error-durante-la-carga/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo resolver el error &#8216;wxMaxima encontró un error durante la carga&#8217;+http://elbauldelprogramador.com/wxmaxima-encontro-un-error-durante-la-carga/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
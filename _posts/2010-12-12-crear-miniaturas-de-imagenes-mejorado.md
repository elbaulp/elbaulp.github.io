---
id: 59
title: 'Crear miniaturas de imágenes [Mejorado]'

layout: post
guid: http://elbauldelprogramador.org/crear-miniaturas-de-imagenes-mejorado/
permalink: /crear-miniaturas-de-imagenes-mejorado/
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
tags:
  - crear miniaturas de imagenes
---
He mejorado el [script que subí hace unos días][1] para crear miniaturas de imágenes, y ahora se puede ejecutar desde cualquier lugar sin necesidad de copiar el script en la carpeta de las imágenes de las que queremos hacer miniaturas. Además, podemos seleccionar solo las imágenes que deseemos, o todas.

  
<!--ad-->

  
También dejo el link de pastebin: <http://pastebin.com/BhKYpYJf>



{% highlight bash %}<span class="comentario">#!/bin/bash</span>

<span class="bash">if</span> [ -e /usr/bin/convert ] ; <span class="bash">then</span> <span class="comentario">#Compruebo que el programa imagemagick esta insatado</span>
 <span class="bash">dir</span>=`zenity --file-selection --directory --title="Selecciona el directorio de las imágenes"`
  <span class="bash">case</span> $? in
     0)
       <span class="bash">echo</span> -n "¿Quiere hacer miniaturas de todas las imágenes del directorio? s/n: " ; <span class="bash">read</span> respuesta
       <span class="bash">if</span> [ $respuesta == "S" ] || [ $respuesta == "s" ] ; <span class="bash">then</span> <span class="comentario"># Compruebo la respuesta del usuario</span>
        imagenes=$(<span class="bash">ls</span> $<span class="bash">dir</span>) <span class="comentario"># almaceno todos los archivos de la carpeta seleccionada</span>
        <span class="bash">mkdir</span> $<span class="bash">dir</span>/miniaturas
      <span class="bash">for</span> i in $imagenes
     <span class="bash">do</span>
      <span class="bash">if</span> [ -e $<span class="bash">dir</span>/$i ] ; <span class="bash">then</span>
       i=$(basename "$i")
       <span class="bash">echo</span> "Procesando imagen $i ..."
       /usr/bin/convert -thumbnail 180x128 $<span class="bash">dir</span>/$i $dir/miniaturas/$i
      <span class="bash">fi</span>
     <span class="bash">done</span>
     <span class="bash">echo</span> "Miniaturas creadas."
    <span class="bash">else</span>
     img=`zenity --filename=$<span class="bash">dir</span>/ --file-selection --multiple --separator=" " --title="Selecciona la imagenes"`
     <span class="bash">case</span> $? in
      0)
       <span class="bash">mkdir</span> $<span class="bash">dir</span>/miniaturas
       <span class="bash">for</span> i in $img
       <span class="bash">do</span>
         i=$(basename "$i")
        <span class="bash">echo</span> "Procesando imagen $i ..."
        /usr/bin/convert -thumbnail 180x128 $<span class="bash">dir</span>/$i $dir/miniaturas/$i
       <span class="bash">done</span>
       <span class="bash">echo</span> "Miniaturas creadas."
       ;;
     <span class="bash">esac</span>
       <span class="bash">fi</span>
       ;;
      1)
        <span class="bash">echo</span> "No seleccionó nada";;
     -1)
        <span class="bash">echo</span> "Ocurrió un error";;
    <span class="bash">esac</span>
<span class="bash">else</span>
 <span class="bash">echo</span> "Imagemagick no esta instalado, puede instalarlo haciendo 'sudo aptitude install imagemagick'"
<span class="bash">fi</span>

{% endhighlight %}



 [1]: http://elbauldelprogramador.com/crear-imagenes-en-miniaturas/

{% include _toc.html %}

---
id: 1580
title: 'Gource: Visualizar la evolución de un repositorio Git'

layout: post
guid: http://elbauldelprogramador.com/?p=1580
permalink: /gource-visualizar-la-evolucion-de-un-repositorio-git/
categories:
  - aplicaciones
  - opensource
tags:
  - como instalar gource
  - gource git
  - grabar video con gource
  - tutorial gource
---
Hace unas semanas hablé de [logstalgia][1], que visualiza las visitas a una web en forma del juego Pong. Hoy hablo de *Gource*, herramienta similar que visualiza la evolución de un repositorio en [git][2].  
  
<!--more-->

  
Para instalar el programa basta con ejecutar:

{% highlight bash %}# aptitude install gource
{% endhighlight %}

Una vez instalado, basta con ejecutar el programa y pasarle la ruta a la carpeta *.git* del repositorio que queramos visualizar:

{% highlight bash %}gource /ruta/a/.git
{% endhighlight %}

El resultado es algo como esto:

[<img src="http://elbauldelprogramador.com/content/uploads/2013/05/gourceGit-1024x804.png" alt="gourceGit" width="770" height="604" class="aligncenter size-large wp-image-1581" />][3]{.thumbnail}

Al pasar el ratón por la parte inferior, aparece un recuadro en el que podremos seleccionar la fecha a visualizar.

Es posible grabar en vídeo la visualización de *gource* con el comando:

{% highlight bash %}gource ruta/a/.git/  -1280x1024 --max-files 99999 --disable-progress --stop-at-end \
       --user-scale 2 --highlight-all-users --output-ppm-stream - \
       | ffmpeg -y -b 3000K -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 gource.mp4
{% endhighlight %}

Donde:

  * -1280&#215;1024 es la resolución.
  * &ndash;max-files 99999 Límite de archivos a mostrar en la animación.
  * &ndash;disable-progress Desabilita la barra para seleccionar fecha que mencioné.
  * &ndash;stop-at-end Cierra la gource al terminar la animación.
  * &ndash;user-scale 2 Escala de los iconos que representan a los desarrolladores
  * &ndash;highlight-all-users Muestra siempre el nombre del desarrollador
  * &ndash;output-ppm-stream &ndash; Envia la salida de gource a un archivo

A continuación os dejo un vídeo de uno de mis repositorios:

<span class='embed-youtube' style='text-align:center; display: block;'></span> 



 [1]: http://elbauldelprogramador.com/opensource/visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/ "Visualiza las visitas a tu web al estilo Pong con Logstalgia"
 [2]: http://elbauldelprogramador.com/articulos/mini-tutorial-y-chuleta-de-comandos-git/ "Git: Mini Tutorial y chuleta de comandos"
 [3]: http://elbauldelprogramador.com/content/uploads/2013/05/gourceGit.png
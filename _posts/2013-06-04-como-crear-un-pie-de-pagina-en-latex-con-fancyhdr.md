---
id: 1586
title: Cómo crear un pie de página en LaTeX con fancyhdr
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1586
permalink: /como-crear-un-pie-de-pagina-en-latex-con-fancyhdr/
categories:
  - How To
  - LaTeX
tags:
  - crear un pie de página en LaTeX
  - fancyhdr
  - personalizar pie de página latex
  - pie de pagina latex
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/05/latex_logo.png" alt="latex_logo" width="300" height="114" class="thumbnail alignleft size-full wp-image-1594" />Como he mencionado en algún [artículo anterior][1], he aprendido bastante a programar en LaTeX reescribiendo el [curso de Android][2]. Hoy vamos a ver cómo crear un pie de página en LaTeX.  
  
<!--more-->

### Fancyhdr

Para poder crear pies de página y cabeceras es necesario usar el paquete *fancyhdr*, y establecer el estilo de página a *fancy*:

<pre lang="latex">\usepackage{fancyhdr}
\pagestyle{fancy}
</pre>

Ahora nuestros documentos tendrán una línea arriba y abajo, en la cabecera y pie de página respectivamente.

### Personalizar el estilo del pie de página

Para cambiar el aspecto por defecto que ofrece el paquete fancyhdr, hemos de usar los comandos `fancyhead` y `fancyfoot`, correspondientes a la cabecera y pie de página, respectivamente. Nosotros nos centraremos en el pie, aunque para personalizar la cabecera bastará con sustituir `fancyfoot` por `fancyhead` en el código.

Es necesario conocer el significado de las siguientes letras:

  * E: Página par
  * O: Página impar
  * L: Parte izquierda
  * C: Parte central
  * R: Parte derecha
  * H: Cabecera
  * F: Pie de página

Conocido el significado de las mismas, ahora es posible definir el estilo en el preámbulo:

<pre lang="latex">\fancyhead[CO,CE]{---Draft---}
\fancyfoot[C]{Confidential}
\fancyfoot[RO, LE] {\thepage}
</pre>

El grosor de las líneas decorativas puede cambiarse con:

<pre lang="latex">\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
</pre>

Como apunte personal, uso plantillas para distintos tipos de documentos, estas plantillas vienen con un fichero de estilo propio y para no modificar directamente el valor del pie de página podemos crear un comando que permita establecer el contenido del pie de página. Por ejemplo, en el fichero que define la estructura del documento creamos el comando:

<pre lang="latex">\newcommand{\setFooterL}[1]{
    \fancyfoot[L]{\small\textit{#1}}
}
\newcommand{\setFooterR}[1]{
    \fancyfoot[R]{\small\textit{#1}}
}
</pre>

Ahora desde el fichero principal, resulta muy fácil reusar la plantilla y cambiar el texto del pie de página de la siguiente manera:

<pre lang="latex">\setFooterL{\href{http://twitter.com/elbaulp}{Alejandro Alcalde}}
\setFooterR{\href{http://elbauldelprogramador.com}{elbauldelprogramador.com}}
</pre>

Produciendo el siguiente resultado:  
<img src="http://elbauldelprogramador.com/content/uploads/2013/05/footerFancyHdrLatex.png" alt="Cómo crear un pie de página en LaTeX con fancyhdr" title="Cómo crear un pie de página en LaTeX con fancyhdr" width="887" height="53" class="thumbnail aligncenter size-full wp-image-1595" />

#### Referencias

*Header/Footer in Latex with Fancyhdr* **|** <a href="http://texblog.org/2007/11/07/headerfooter-in-latex-with-fancyhdr/" target="_blank">texblog.org</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo crear un pie de página en LaTeX con fancyhdr+http://elbauldelprogramador.com/como-crear-un-pie-de-pagina-en-latex-con-fancyhdr/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-crear-un-pie-de-pagina-en-latex-con-fancyhdr/&t=Cómo crear un pie de página en LaTeX con fancyhdr+http://elbauldelprogramador.com/como-crear-un-pie-de-pagina-en-latex-con-fancyhdr/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo crear un pie de página en LaTeX con fancyhdr+http://elbauldelprogramador.com/como-crear-un-pie-de-pagina-en-latex-con-fancyhdr/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion/resaltar-sintaxis-del-codigo-fuente-en-latex-con-minted/ "Resaltar sintaxis del código fuente en LaTeX con minted"
 [2]: /opensource/disponible-la-primera-parte-del-curso/ "Disponible la primera parte del curso Android en PDF"
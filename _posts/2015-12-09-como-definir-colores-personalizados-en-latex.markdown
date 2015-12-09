---
layout: post
title: "Cómo Definir Colores Personalizados en LaTeX"
modified:
categories:
excerpt: "En este artículo veremos cómo podemos definir colores personalizados en LateX usando el paquete xcolor"
tags: [latex, xcolor, paquete xcolor, tutorial xcolor latex]
image:
  thumb: hotlink-ok/latex_logo.png
date: 2015-12-09T16:55:32+01:00
math: true
---

<figure>
  <img src="/images/2013/05/latex_logo.png" title="{{ page.title }}" alt="{{ page.title }}" />
</figure>

> Os traigo hoy otro artículo interesante que he encontrado en el blog de <a href="http://texblog.org" target="_blank" title="http://texblog.org">blog de Tom</a>. Veremos cómo es posible definir colores personalizados en $$\LaTeX$$ con el paquete `xcolor`.

{% include _toc.html %}

<!--ad-->

Hay distintas formas de definir un color específico en $$\LaTeX$$. Normalmente lo más fácil es elegir un color predefinido del paquete `xcolor` o definirlo a mano usando el modelo RGB. Otra notación existente es `red!40!blue`. Esta notación crea un morado con 40% rojo y 60% azul. Veamos en este artículo los distintos métodos disponibles para la especificación de colores.

## Colores predefinidos

El paquete <a href="http://mirrors.ctan.org/macros/latex/contrib/xcolor/xcolor.pdf" target="_blank" title="">xcolor</a> trae definidos una gama amplia de colores, especificados en su <a href="http://mirrors.ctan.org/macros/latex/contrib/xcolor/xcolor.pdf" target="_blank" title="Documentación xcolor">documentación</a>. Es tan simple de usar como se muestra en este trozo de código:

{% highlight latex %}
\documentclass[11pt]{article}
\usepackage{blindtext}

\usepackage[x11names]{xcolor}

\begin{document}

\textcolor{RoyalBlue2}{\blindtext}

\end{document}
{% endhighlight %}

<figure>
  <a href="/images/xcolorlatex1.png"><img src="/images/xcolorlatex1.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
  <span class="image-credit">Crédito de la imagen: texblog.org</span>
</figure>

## Mezclar colores usando un modelo de color

El paquete xcolor permite definir colores usando modelos de color (_gris, RGB, HTML, CMYK_ y otros ). Veamos un ejemplo de RGB, al que estamos más acostumbrados:

{% highlight latex %}
\documentclass[11pt]{article}
\usepackage{blindtext}

\usepackage{xcolor}
\definecolor{myOrange}{rgb}{1,0.5,0}

\begin{document}

\textcolor{myOrange}{\blindtext}

\end{document}
{% endhighlight %}

<figure>
  <a href="/images/xcolorlatex2.png"><img src="/images/xcolorlatex2.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
  <span class="image-credit">Crédito de la imagen: texblog.org</span>
</figure>

## Mezclar dos colores

Para terminar, el paquete xcolor también permite definir un color mediante la mezcla de dos colores predefinidos. Por ejemplo, para definir un morado con 40% de azul y 60% de rojo:

{% highlight latex %}
\documentclass[11pt]{article}
\usepackage{blindtext}

\usepackage{xcolor}
\colorlet{myPurple}{blue!40!red}

\begin{document}

\textcolor{myPurple}{\blindtext}

\end{document}
{% endhighlight %}

<figure>
  <a href="/images/xcolorlatex3.png"><img src="/images/xcolorlatex3.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
  <span class="image-credit">Crédito de la imagen: texblog.org</span>
</figure>

## Ejemplo: Colores brillantes

Los colores básicos como el rojo, verde o amarillo son demasiado chillones a la vista. Para atenuar su intensidad, es posible usar el modo de definir colores de arriba y luego mezclarlos con gris. Por ejemplo, combinar el 40% del color chillón con 60% de gris atenua la intensidad del color, haciendolo más agradable a la vista, compruébalo tú mismo:

<figure>
  <a href="/images/latexxcolorbrillantes.png"><img src="/images/latexxcolorbrillantes.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
  <span class="image-credit">Crédito de la imagen: texblog.org</span>
</figure>

Aquí el código que genera la imagen de arriba:

{% highlight latex %}
\documentclass[border=10pt,varwidth]{standalone}
\usepackage{pgffor}
\usepackage[x11names]{xcolor}

\newcommand\colorrulemix[1]{\textcolor{#1!40!gray}{\rule{1cm}{1cm}} }
\newcommand\colorrule[1]{\textcolor{#1}{\rule{1cm}{1cm}} }

\begin{document}

\begin{center}
\foreach \name in { {red},{orange},{yellow},{green},{cyan},{blue},{purple}} {
    \colorrule{\name}}

\rule{\linewidth}{1pt}
\phantom{}\par


\foreach \name in { {red},{orange},{yellow},{green},{cyan},{blue},{purple}} {
    \colorrulemix{\name}}
\end{center}
\end{document}
{% endhighlight %}

### Referencias

Custom Colors in LaTeX \| [texblog.org](http://texblog.org/2015/12/08/custom-colors-in-latex/)

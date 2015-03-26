---
id: 2514
title: 'Mini Curso de LaTeX &#8211; Figuras, Enlaces y cabeceras'
author: Marta Gómez
layout: post
guid: http://elbauldelprogramador.com/?p=2514
permalink: /curso-de-latex-figuras-enlaces-y-cabeceras/
categories:
  - LaTeX
tags:
  - codigo latex
  - curso latex
  - curso latex español
  - enlaces latex
  - figuras latex
  - imagenes latex
  - incluir codigo latex
  - programación Latex
  - simbolos latex
---
  * [Mini Curso de LaTeX &#8211; Introducción][1]
  * [Mini Curso de LaTeX &#8211; Incluir código fuente y símbolos matemáticos][2]
  * Mini Curso de LaTeX &#8211; Figuras, Enlaces y cabeceras

## Mini curso de Latex

Tras haber terminado nuestra sección del análisis de la eficiencia, ahora nos piden que pongamos un pantallazo con la salida del programa en terminal. Para ello, vamos a usar dos herramientas:

  1. Los **enlaces**: con esta herramienta podemos referenciar cualquier parte de nuestro documento con un sólo click, es decir, como si fuera un enlace en una página web. Lo vamos a usar para referenciar a nuestro código.
  2. La orden **figure**: para insertar nuestra imagen.

Para colocar un enlace en nuestro documento, debemos hacer dos cosas:  
1. Poner una **etiqueta** en el lugar que queramos referenciar.  
2. Poner un **enlace** a esa etiqueta donde queramos referenciarla.

## Enlaces

Para ello, ponemos justo al inicio de la sección *Código del programa* lo siguiente:

<pre lang="latex">\label{codigo_programa}</pre>

Y justo al inicio de la sección Salida del programa esto otro:

<pre lang="latex">\hyperref[codigo_programa]{texto del enlace}</pre>

Este sería el resultado final:

<!--more-->

<pre lang="latex">\newpage
\section{Salida del programa}
\noindent
La salida por terminal que obtener al ejecutar el \hyperref[codigo_programa]{programa} es la siguiente:
</pre>

Debemos compilar dos veces para que LaTeX establezca bien los enlaces, y tras compilar dos veces, si hacemos click sobre programa nos llevará al código de nuestro programa.

## Incluir imágenes en el documento

Ahora vamos a ver como introducir una imagen en nuestro documento. Debemos tenerla en la misma carpeta que nuestro arhivo .tex, y para insertarla usamos la orden figure e includegraphics, cuya sintaxis es:

<pre lang="latex">\begin{figure}[opciones donde insertar la imagen]
\centering % si queremos la imagen centrada
\includegraphics[opciones de tamaño]{imagen}
\caption{texto a poner debajo de la imagen}
\end{figure}
</pre>

Para usar includegraphics debemos incluir el siguiente paquete en la cabecera:

<pre lang="latex">\usepackage{graphicx} % para incluir imágenes en nuestro código</pre>

Respecto a las opciones de tamaño, son las siguientes:  
* **width** : para escalar las imágenes un determinado ancho  
* **height** : para escalar las imágenes un determinado alto  
* **angle** : para rotar las imagenes según las agujas del reloj  
* **scale** : para escalar imágenes

Respecto a las opciones sobre donde insertar la imagen, pueedn ser las siguientes:  
* **h**: Insertar la imagen justo aquí (*here*)  
* **b**: Insertar la imagen al final de la página (*bottom*)  
* **t**: Insertar la imagen al principio de la página (*top*)  
* **p**: Insertar la imagen en una página especial que contenga otras figuras o imágenes (*p*)  
* **!**: Insertar la imagen sin considerar las opciones de LaTeX (como por ejemplo, el número máximo de figuras por página) que podrían hacer que no se insertara la imagen donde queremos.

Estos parámetros también nos valen para las tablas. También podemos combinarlos o establecer una jerarquía. Por ejemplo:

<pre lang="latex">\begin{table}[!hbp]</pre>

Así, permitimos a LaTeX poner la tabla justo aquí (`h`), o al final de la página (`b`) o en una página especial para tablas, incluso si no queda bien (!). Si no se da ninguna opción, por defecto se asume `[tbp]`.

Sobre la orden `\caption{texto}`, nos sirve para describir un poco la imagen, o la tabla en cuestión. LaTeX añadirá por su cuenta el &#8220;Figure&#8221; o &#8220;Table&#8221; más un número para identificarla. También podemos hacer un índice de figuras o tablas con los comandos `\listoffigures` y `\listoftables`.

Después de este pequeño repaso de teoría, vamos a insertar nuestra imagen en el documento, en mi caso, la imagen se llama 1:

<pre lang="latex">\begin{figure}[!h]
\centering
\includegraphics[width=1\textwidth]{1}
\caption{Salida por terminal del programa}
\end{figure}
</pre>

## Cabeceras de los documentos

Y por último, vamos a personalizar un poco nuestro documento, aunque ya hay un [post][3] sobre esto en El baúl del programador, para poner una cabecera y un pie de página a nuestro gusto. Para ello, usamos el paquete **fancyhdr**:

<pre lang="latex">\usepackage{fancyhdr} % para personalizar la cabecera y el pie de pagina</pre>

También debemos establecer el estilo de página a **fancy**:

<pre lang="latex">\pagestyle{fancy}</pre>

También, para ver el uso de dos paquetes muy útiles, vamos a darle color a nuestra cabecera y además, vamos a numerar las páginas con el estilo: &#8220;página x de n&#8221;, para ello incluimos también el paquete **color** (que habíamos incluido al principio) y el paquete **lastpage**:

<pre lang="latex">\usepackage{lastpage} % para saber el numero de pagina del documento</pre>

Vamos a empezar personalizando la cabecera, para ello usamos el siguiente comando:

<pre lang="latex">\fancyhead[opciones de localizacion]{la salida que quieras}</pre>

Donde las opciones de localización son E, O, L, C y R.

En nuestro código, vamos a hacer lo siguiente:

<pre lang="latex">% CABECERA
% el nombre del autor en la izquierda de las paginas pares y a la derecha de las paginas impares
\fancyhead[LE,RO]{\textcolor[rgb]{0.5,0.2,0.6}{Marta Gómez}}
\fancyhead[RE,LO]{\textcolor[rgb]{0.2,0.2,0.9}{\date{\today}}} % en el lado contrario, la fecha

% PIE DE PAGINA
% en la parte central del pie de pagina el numero de pagina actual y un enlace a la ultima pagina
\fancyfoot[C]{\textcolor[rgb]{0.2,0.4,0.5}{\thepage{} de} \pageref{LastPage}}
</pre>

Un último detale: si os habéis dado cuenta, los links tal y como tenemos el documento actualmente quedan muy feos, ¿verdad?. Para cambiar eso, debemos modificar algunas opciones del paquete `hyperref` que incluímos antes, en concreto estas dos:  
1. **colorlinks=true**: con esta opción establecemos que queremos cambiar el color de los links, al activarla, por defecto nuestros links se quedan de color rojo.  
2. **linkcolor**: y con esta, establecemos el color. Podemos ponerle valores como red, blue, green&#8230;

Así, nuestro paquete `hyperref` quedaría de la siguiente forma:

<pre lang="latex">\usepackage[colorlinks=true,linkcolor=magenta]{hyperref} % para poder poner "enlaces" en nuestro codigo</pre>

## Compilar el documento y generar el PDF

Ahora que ya tenemos nuestro fichero escrito, ¿cómo lo convertimos a PDF?. Si usas Linux, tienes que bajarte el paquete `texlive` y ejecutar en terminal el siguiente comando en el directorio donde tengas tu fichero .tex:

<pre lang="latex">pdflatex nombrefichero.tex</pre>

Y si usas el paquete `minted` deberás incluir también:

<pre lang="latex">pdflatex -shell-escape nombrefichero.tex</pre>

## Editores de Texto

También tienes la opción de configurar tu editor de texto favorito con un plugin para compilar LaTeX directamente desde ahí. Para hacerlo en Sublime Text tienes que seguir los siguientes pasos:  
1. Ve a Tools > build system > new build system  
2. Pega el siguiente código y guarda el archivo con el nombre que quieras:

<pre lang="latex">{
    "cmd": ["pdflatex","-shell-escape","$file_name"],
    "selector": "text.tex.latex"
}
</pre>

  1. Cada vez que quieras compilar, presiona control+b, teniendo elegido el build system de LaTeX que has creado.

En [Atom][4] hay un paquete para compilar LaTeX pulsando control+alt+b.

Si trabajáis en Windows, probad a trabajar con un programa llamado [MikTeX][5].

Y para Mac OS X, si no tengo mal entendido, podéis usar cualquiera de las dos alternativas.

Y con esto, ya tenemos un portafolios de prácticas bonito, bien presentado y estructurado. Por supuesto, con LaTeX se pueden hacer muchas más cosas, pero no me he querido meter muy a fondo en un curso introductorio.

Espero que os haya gustado este curso y os haya servido como base para aprender LaTeX, podéis consultar el fichero fuente que he utilizado yo en [github][6] (también os he incluido en el repositorio el fichero .h y la imagen para que lo podáis compilar y trastear con él todo lo que queráis).

Quiero despedirme no sin antes dedicar todo esto a mi profesor, Francisco Miguel García, ya que sin su ayuda seguramente aún seguiría haciendo mis documentos con el Microsoft Word y a mi amigo, Alejandro Alcalde, por dejarme publicarlo en su blog y llegar así a más gente.

¡Nos vemos en próximas entradas!  
Marta.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Mini Curso de LaTeX &#8211; Figuras, Enlaces y cabeceras+http://elbauldelprogramador.com/curso-de-latex-figuras-enlaces-y-cabeceras/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/curso-de-latex-figuras-enlaces-y-cabeceras/&t=Mini Curso de LaTeX &#8211; Figuras, Enlaces y cabeceras+http://elbauldelprogramador.com/curso-de-latex-figuras-enlaces-y-cabeceras/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Mini Curso de LaTeX &#8211; Figuras, Enlaces y cabeceras+http://elbauldelprogramador.com/curso-de-latex-figuras-enlaces-y-cabeceras/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/mini-curso-de-latex-introduccion/ "Mini Curso de LaTeX – Introducción"
 [2]: http://elbauldelprogramador.com/curso-de-latex-incluir-codigo-fuente-y-simbolos-matematicos/ "Mini Curso de LaTeX – Incluir código fuente y símbolos matemáticos"
 [3]: http://elbauldelprogramador.com/como-crear-un-pie-de-pagina-en-latex-con-fancyhdr/ "Pie de página con FancyHdr"
 [4]: http://elbauldelprogramador.com/instalar-atom-el-editor-de-github-en-linux/ "Instalar ATOM"
 [5]: http://miktex.org/ "MikTeX"
 [6]: https://github.com/mgmacias95/CursoLaTex/ "github"
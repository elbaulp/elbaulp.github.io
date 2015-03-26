---
id: 2416
title: Chuleta de Markdown para wordpress
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2416
permalink: /chuleta-markdown-para-wordpress/
categories:
  - How To
tags:
  - guía markdown
  - markdown
  - markdown jetpack
  - markdown worpress
  - tutorial markdown
---
En su última actualización, el plugin [JetPack][1] introdujo la notación Markdown para formatear artículos y comentarios. La siguiente chuleta pretende servir de referencia tanto a los lectores como a mi, aprovechando así la ocasión para practicar y memorizar el formato.

<!--more-->

## Guía de Markdown para wordpress

#### **Negrita** o *cursiva* :

**negrita**, **negrita**, *cursiva*,*cursiva*

    __negrita__, **negrita**, *cursiva*,_cursiva_
    

#### Enlaces en [línea][2]:

    Un [enlace](/ "Texto alternativo")
    

#### Enlaces [referenciados][1]:

    [referenciados][1], en cualquier parte del texto debe haber [1]: http://enlace. "titulo"
    

#### Imágenes en línea: ![Alt][3]:

    ![Alt](/content/uploads/2013/12/favicon.ico "Título")
    

#### Imágenes referenciadas: ![Alt][3]

    ![Alt][2] Al igual que en los enlaces referenciados, en algún lugar del texto debe aparecer [2]: Ruta/a/la/imagen "Titulo".
    

#### Imágenes enlazadas: [![Texto Alternativo][4]][5]

    [![Texto Alternativo](/content/uploads/2013/12/favicon.ico)](/ "Imágenes enlazadas")
    

#### Notas al pie<sup id="fnref-2416-1"><a href="#fn-2416-1" rel="footnote">1</a></sup>:

    [^1] y donde esté la nota al pie: [^1]: Notal al pie.
    

#### Listas sin numerar:

  * Elemento 1
  * Elemento 2
  * Elemento 3
  * Elemento 4

        * Elemento 1
        * Elemento 2
        - Elemento 3
        - Elemento 4
    

#### Listas numeradas:

  1. Elemento 1
  2. Elemento 2

        1. Elemento 1
        2. Elemento 2
    

#### Citas

> Texto citado
> 
> > Cita anidada 

    > Texto citado
    >> Cita anidada
    

#### Preformato

Si se empieza cada línea con dos o más espacios el texto no se formateará.

#### Código en línea

`cout << "Hola" << endl;`

    `cout << "Hola" << endl;`
    

#### Bloques de código

    cout << "Hola" << endl;
    

    ```
    cout << "Hola" << endl;
    ```
    

ó

    ~~~
    cout << "Hola" << endl;
    ~~~
    

#### Cabeceras

# Header 1

## Header 2

### Header 3

#### Header 4

##### Header 5

###### Header 6

    # Header 1
    ## Header 2
    ### Header 3 
    #### Header 4
    ##### Header 5
    ###### Header 6
    

#### Listas de definiciones

El Baúl del programador
:   Blog de programación (c++, python, sql, pl/sql, script bash, android etc)

    El Baúl del programador
    : Blog de programación (c++, python, sql, pl/sql, script bash, android etc)
    

#### Abreviaturas

El *markdown* convierte texto a HTML.

#### Referencias

*Artículo de Jetpack sobre el Markdown* **|** <a href="http://jetpack.me/support/markdown/" target="_blank">jetpack.me</a> 

<li id="fn-2416-1">
  Notal al pie.&#160;<a href="#fnref-2416-1" rev="footnote">&#8617;</a> </fn></footnotes> <div class="sharedaddy">
    <div class="sd-content">
      <ul>
        <li>
          <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Chuleta de Markdown para wordpress+http://elbauldelprogramador.com/chuleta-markdown-para-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
        </li>
        <li>
          <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/chuleta-markdown-para-wordpress/&t=Chuleta de Markdown para wordpress+http://elbauldelprogramador.com/chuleta-markdown-para-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
        </li>
        <li>
          <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Chuleta de Markdown para wordpress+http://elbauldelprogramador.com/chuleta-markdown-para-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://jetpack.me/support/markdown/ "Artículo de Jetpack sobre el Markdown"
 [2]: / "Texto alternativo"
 [3]: /content/uploads/2013/12/favicon.ico "Título"
 [4]: /content/uploads/2013/12/favicon.ico
 [5]: / "Imágenes enlazadas"
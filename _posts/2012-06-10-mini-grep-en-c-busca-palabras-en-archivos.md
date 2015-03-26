---
id: 774
title: Mini grep en C++, busca palabras en archivos
author: Alejandro Alcalde
layout: post
guid: /?p=774
permalink: /mini-grep-en-c-busca-palabras-en-archivos/
if_slider_image:
  - 
  - 
categories:
  - aplicaciones
  - C
  - opensource
tags:
  - buscar palabra fichero c
  - comandos
  - cpp
  - grep
---
Aquí os dejo un pequeño ejercício en C++, se trata de crear un programa que actue básicamente como el comando grep de linux, pero mucho más simple. Se usa de la siguiente forma:  
Para buscar una palabra:

<pre lang="bash">grep palabra fichero1 &lt; [ficheros2...]></pre>

Para buscar frases:

<pre lang="bash">grep "palabra1 palabra2..." fichero1 &lt; [ficheros2...]></pre>

Un ejemplo de ejecución:

<pre lang="bash">hkr-> ./grep cout max.php grep.cpp smtp.cpp 
grep.cpp(22)     cout &lt; &lt; "Uso: grep &lt;palabra a buscar> &lt;firchero1 [&lt;ficheros...>]>" &lt; &lt; endl;
grep.cpp(56)     cout &lt;&lt; nombre &lt;&lt; "(" &lt;&lt; nlinea &lt;&lt; ") t" &lt;&lt; remove_left_white_spaces(cadena) &lt;&lt; endl;
smtp.cpp(56)     cout &lt;&lt; "socket createdn";
smtp.cpp(75)    cout &lt;&lt; "Connectedn";
</pre>

El programa nos indica el fichero en el que se encontró la palabra, el número de línea y la linea en sí.

Código:

<pre lang="cpp" >//============================================================================
// Name        : grep.cpp
// Author      : Alex
// Version     :
// Description : Mini Grep
//============================================================================

#include &lt;iostream>
#include &lt;string .h>
#include &lt;fstream>

using namespace std;

char* remove_left_white_spaces(char*);
void grep(const char*, const char*);

int
main(int argc, char* argv[])
{
      if (argc &lt; 3){
         cout &lt;&lt; "Uso: grep &lt;palabra a buscar> &lt;firchero1 [&lt;ficheros...>]>" &lt; &lt; endl;
         return -1;
      } else {
         for (int i = 2; i &lt; argc; i++)
            grep(argv[1], argv[i]);
      }
}

char*
remove_left_white_spaces(char cad[])
{
   char* temp = new char[500];

   int indice = 0;

   for (unsigned int i = 0; cad[i] ; i++)
       if (cad[i] != ' ' || cad[i+1] != ' ')
         temp[indice++] = cad[i];

   return temp;
}

void
grep(const char* palabra, const char* nombre)
{
   ifstream fichero(nombre);
   char cadena[500];
   int nlinea = 0;

   if (fichero){
      while(fichero){
         fichero.getline(cadena, 500);
         nlinea++;
         if (fichero)
            if (strstr(cadena, palabra))
               cout &lt;&lt; nombre &lt;&lt; "(" &lt;&lt; nlinea &lt;&lt; ") t" &lt;&lt; remove_left_white_spaces(cadena) &lt;&lt; endl;
      }
   
</pre>

</firchero1></fstream></string></iostream></firchero1>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Mini grep en C++, busca palabras en archivos+http://elbauldelprogramador.com/mini-grep-en-c-busca-palabras-en-archivos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/mini-grep-en-c-busca-palabras-en-archivos/&t=Mini grep en C++, busca palabras en archivos+http://elbauldelprogramador.com/mini-grep-en-c-busca-palabras-en-archivos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Mini grep en C++, busca palabras en archivos+http://elbauldelprogramador.com/mini-grep-en-c-busca-palabras-en-archivos/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
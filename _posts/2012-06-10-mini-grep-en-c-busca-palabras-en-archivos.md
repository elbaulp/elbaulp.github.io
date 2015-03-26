---
id: 774
title: Mini grep en C++, busca palabras en archivos

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

{% highlight bash %}>grep palabra fichero1 &lt; [ficheros2...]>{% endhighlight %}

Para buscar frases:

{% highlight bash %}>grep "palabra1 palabra2..." fichero1 &lt; [ficheros2...]>{% endhighlight %}

Un ejemplo de ejecución:

{% highlight bash %}>hkr-> ./grep cout max.php grep.cpp smtp.cpp 
grep.cpp(22)     cout &lt; &lt; "Uso: grep &lt;palabra a buscar> &lt;firchero1 [&lt;ficheros...>]>" &lt; &lt; endl;
grep.cpp(56)     cout &lt;&lt; nombre &lt;&lt; "(" &lt;&lt; nlinea &lt;&lt; ") t" &lt;&lt; remove_left_white_spaces(cadena) &lt;&lt; endl;
smtp.cpp(56)     cout &lt;&lt; "socket createdn";
smtp.cpp(75)    cout &lt;&lt; "Connectedn";
{% endhighlight %}

El programa nos indica el fichero en el que se encontró la palabra, el número de línea y la linea en sí.

Código:

{% highlight cpp %} >//============================================================================
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
   
{% endhighlight %}

</firchero1></fstream></string></iostream></firchero1>


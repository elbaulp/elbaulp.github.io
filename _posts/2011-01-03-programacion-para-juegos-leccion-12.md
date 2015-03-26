---
id: 81
title: 'Programación para Juegos &#8211; Lección 1.2 &#8211; Hello World'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-para-juegos-leccion-1-2-hello-world/
permalink: /programacion-para-juegos-leccion-12/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/programacion-para-juegos-leccion-12.html
  - /2011/01/programacion-para-juegos-leccion-12.html
  - /2011/01/programacion-para-juegos-leccion-12.html
categories:
  - juegos
---
<div class="icosdl">
</div>

En esta lección vamos a aprender a hacer un Hola Mundo al estilo SDL.

Ahora que ya [instalaste SDL][1], vamos a cargar una imagen en la pantalla.

Empecemos:

[Pueden descargar el código fuente de esta lección.][2]

  
<!--more-->

<pre>//Include SDL functions and datatypes
#include "SDL/SDL.h"</pre>

Al principio del código fuente incluimos el archivo de cabecera SDL, para poder usar funciones y tipos de datos de SDL.

Los que están usando Visual Studio, deben incluir la cabecera así:

<pre>#include "SDL.h"</pre>

Si el compilador se queja diciendo que no puede encontrar &#8220;SDL/SDL.h&#8221;, es porque no tienen SDL instalado en el ruta(path) correcta.

<pre>int main( int argc, char* args[] )
{
    //The images
    SDL_Surface* hello = NULL;
    SDL_Surface* screen = NULL;
</pre>

Al principio de la función main(), declaramos dos punteros a SDL\_Surface. El tipo de dato SDL\_Surface es una imagen, en esta aplicación vamos a tratar con dos imágenes. La superfície(Surface) &#8220;hello&#8221; es la imagen que vamos a cargar y mostrar. &#8220;Screen&#8221; es lo que es visible en la pantalla.

Al estar tratando con punteros, debemos inicializarlos SIEMPRE.

Cuando usemos SDL, la función main() debe estar declarada como la de arriba. No se puede usar void main() o cualquier otra cosa.

<pre>//Start SDL
    SDL_Init( SDL_INIT_EVERYTHING );

    //Set up screen
    screen = SDL_SetVideoMode( 640, 480, 32, SDL_SWSURFACE );

    //Load image
    hello = SDL_LoadBMP( "hello.bmp" );
</pre>

La primera función a la que llamamos dentro de main() es SDL_Init(). Esta función inicializa todos los subsistemas de SDL para que podamos empezar a usar las funciones gráficas de SDL.

Despues llamamos a SDL\_SetVideoMode() para crear una ventana de 640&#215;480 píxeles con 32-bits por pixel. El último argumento, SDL\_SWSURFACE, establece la superficie en la memoria. Esta última función devuelve un puntero a la superficie de la ventana para que podamos usarlo.

Después de establecer la ventana, cargamos nuestra imagen con SDL_LoadBMP(). Esta función recibe como argumento la ruta de una imagen bmp y devuelve un puntero a nuestra superficie <var>hello</var>. Esta función devuelve NULL si ocurre algún error al cargar la imagen.

<pre>//Apply image to screen
    SDL_BlitSurface( hello, NULL, screen, NULL );

    //Update Screen
    SDL_Flip( screen );

    //Pause
    SDL_Delay( 2000 );
</pre>

Ahora que tenemos nuestra ventana y nuestra imagen cargada, vamos a aplicar la imagen a la pantalla. Haremos esto con SDL\_BlitSurface(). El primer argumento de SDL\_BlitSurface() es la superficie fuente. El tercero la superficie destino. Esta función une la superficie fuente a la superficie destino. En este caso, vamos a aplicar nuestra imagen cargada a la pantalla. Encontrarás lo que hacen los otros argumentos en tutoriales posteriores.

Ahora que ya está aplicada la imagen, hay que actualizar la pantalla para hacerla visible. Para ello llamamos a SDL_Flip(). Si no hacemos esto, solo se verá una pantalla blanca.

Una vez hecho esto, lo siguiente es hacer que la ventana permanezca visible durante un tiempo en la pantalla. SDL_Delay() muestra la imagen en pantalla durante 2000 milisegundos (2 segundos). Aprenderemos una mejor manera de hacer esto en la [lección 4][3].

<pre>//Free the loaded image
    SDL_FreeSurface( hello );

    //Quit SDL
    SDL_Quit();

    return 0;
}
</pre>

Como ya no vamos a usar mas la imagen cargada en nuestro programa, tenemos que eliminarla de la memoria. No se puede usar <var>delete</var>, hay que usar SDL_FreeSurface() para eliminarla de memoria. 

Sin embargo, la superficie <var>screen</var> no hay que borrarla a mano, ya que SDL_Quit() lo hace por nosotros.

Enhorabuena, acabas de hacer tu primera aplicación gráfica.

* * *Fuente: 

[lazyfoo.net][4]</p> 

#### Siguiente tema: [Lección 2 &#8211; Superficies Optimizadas][5] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación para Juegos &#8211; Lección 1.2 &#8211; Hello World+http://elbauldelprogramador.com/programacion-para-juegos-leccion-12/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-para-juegos-leccion-12/&t=Programación para Juegos &#8211; Lección 1.2 &#8211; Hello World+http://elbauldelprogramador.com/programacion-para-juegos-leccion-12/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación para Juegos &#8211; Lección 1.2 &#8211; Hello World+http://elbauldelprogramador.com/programacion-para-juegos-leccion-12/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/programacion-para-juegos-leccion-1/
 [2]: http://www.lazyfoo.net/downloads/index.php?file=SDLTut_lesson01
 [3]: http://elbauldelprogramador.com/programacion-para-juegos-leccion-4/
 [4]: http://www.lazyfoo.net/
 [5]: http://elbauldelprogramador.com/programacion-para-juegos-leccion-2/
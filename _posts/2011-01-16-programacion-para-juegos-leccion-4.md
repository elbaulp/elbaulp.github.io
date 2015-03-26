---
id: 93
title: 'Programación para Juegos &#8211; Lección 4 &#8211; Programación orientada a eventos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-para-juegos-leccion-4-programacion-orientada-a-eventos/
permalink: /programacion-para-juegos-leccion-4/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/programacion-para-juegos-leccion-4.html
  - /2011/01/programacion-para-juegos-leccion-4.html
  - /2011/01/programacion-para-juegos-leccion-4.html
categories:
  - juegos
---
<div class="icosdl">
</div>

[Pueden descargar el código fuente de esta lección.][1]

En este tutorial veremos como capturar y manejar eventos.

Un evento es simplemete algo que pasa. Como presionar una tecla, mover el ratón, redimensionar la ventana o cuando el usuario quiere cerrar la ventana.

  
<!--more-->

<pre>//The headers
#include "SDL/SDL.h"
#include "SDL/SDL_image.h"
#include &lt;string>

//Screen attributes
const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;
const int SCREEN_BPP = 32;

//The surfaces
SDL_Surface *image = NULL;
SDL_Surface *screen = NULL;
</pre>

Arriba tenemos lo que hemos ido aprendiendo hasta ahora, las cabeceras, constantes e imágenes.

<pre>//Variable de tipo evento, para posteriormente manejarlo.
SDL_Event event;
</pre>

Una estructura SDL_Event almacena los datos del evento para que lo manejemos.

<pre>SDL_Surface *load_image( std::string filename ) 
{
    //The image that's loaded
    SDL_Surface* loadedImage = NULL;
    
    //The optimized image that will be used
    SDL_Surface* optimizedImage = NULL;
    
    //Load the image
    loadedImage = IMG_Load( filename.c_str() );
    
    //If the image loaded
    if( loadedImage != NULL )
    {
        //Create an optimized image
        optimizedImage = SDL_DisplayFormat( loadedImage );
        
        //Free the old image
        SDL_FreeSurface( loadedImage );
    }
    
    //Return the optimized image
    return optimizedImage;
}

void apply_surface( int x, int y, SDL_Surface* source, SDL_Surface* destination )
{
    //Temporary rectangle to hold the offsets
    SDL_Rect offset;
    
    //Get the offsets
    offset.x = x;
    offset.y = y;
    
    //Blit the surface
    SDL_BlitSurface( source, NULL, destination, &#038;offset );
}
</pre>

Nuestras funciones para cargar y fusionar las imágenes, no ha cambiado nada con respecto al [tutorial 2][2].

<pre>bool init()
{
    //Initialize all SDL subsystems
    if( SDL_Init( SDL_INIT_EVERYTHING ) == -1 )
    {
        return false;    
    }
    
    //Set up the screen
    screen = SDL_SetVideoMode( SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_BPP, SDL_SWSURFACE );
    
    //If there was an error in setting up the screen
    if( screen == NULL )
    {
        return false;    
    }
    
    //Set the window caption
    SDL_WM_SetCaption( "Event test", NULL );
    
    //If everything initialized fine
    return true;
}
</pre>

La función de inicialización, que inicializa SDL, configura la ventana fijando un título para la misma y devuelve false si ocurre algún error.

<pre>bool load_files()
{
    //Load the image
    image = load_image( "x.png" );
    
    //If there was an error in loading the image
    if( image == NULL )
    {
        return false;    
    }
    
    //If everything loaded fine
    return true;    
}
</pre>

Función para cargar la imagen. Devuelve false si ocurre algún error.

<pre>void clean_up()
{
    //Free the image
    SDL_FreeSurface( image );
    
    //Quit SDL
    SDL_Quit();    
}
</pre>

Función para borrar los datos de la memoria al terminar el programa.

<pre>int main( int argc, char* args[] )
{
    //Make sure the program waits for a quit
    bool quit = false;
</pre>

Ésta es la función principal, donde creamos la variable que nos dirá cuando quiere el usuario cerrar la ventana. Al iniciar el programa, lógicamente la igualamos a false, ya que de lo contrario el programa finalizaría inmediatamente.

<pre>//Initialize
    if( init() == false )
    {
        return 1;    
    }
    
    //Load the files
    if( load_files() == false )
    {
        return 1;    
    }
</pre>

Llamamos a las funciones de inicialización y carga de imágenes que definimos anteriormente.

<pre>//Apply the surface to the screen
    apply_surface( 0, 0, image, screen );
    
    //Update the screen
    if( SDL_Flip( screen ) == -1 )
    {
        return 1;    
    }
</pre>

Con éste fragmento de código mostramos la imágen en pantalla.

<pre>//While the user hasn't quit
    while( quit == false )
    {
</pre>

Comenzamos el bucle principal, el cual seguirá funcionando hasta que el usuario fije la variable <var>quit</var> a true.

<pre>//While there's an event to handle
        while( SDL_PollEvent( &#038;event ) )
        {
</pre>

En SDL cuando ocurre un evento, se coloca en la cola de eventos. Ésta cola de eventos contiene los datos de los eventos para cada evento que sucede.   
Por ejemplo si fuera a presionar un botón del ratón, mover el cursor y a continuación, presionar una tecla del teclado, la cola de eventos se vería así:

<div class="separator" style="clear: both; text-align: center;">
  <img border="0" height="177" width="255" src="http://lh3.ggpht.com/_IlK2pNFFgGM/TT6ImYP7bjI/AAAAAAAAARU/QiAey3O_FW0/queue.jpg" />
</div>

Lo que <var>SDL_PollEvent()</var> hace es sacar un evento de la cola y guardar sus datos en nuestra estructura de tipo Evento:

<div class="separator" style="clear: both; text-align: center;">
  <img border="0" height="258" width="294" src="http://lh5.ggpht.com/_IlK2pNFFgGM/TT6ImqKAdJI/AAAAAAAAARY/JqvFGavqRHY/poll.jpg" />
</div>

Por lo tanto este código es recoger datos de los eventos **mientras** haya en la cola.

<pre>//If the user has Xed out the window
            if( event.type == SDL_QUIT )
            {
                //Quit the program
                quit = true;
            }    
        }
    }
</pre>

Cuando el usuario clica en la **X** de la ventana, el tipo de evento que se genera es SDL_QUIT. Pero al hacer esto no implica que el programa termine, todo lo que hace este evento es informarnos que el usuario quiere salir del programa.  
Ahora que sabemos que el usuario quiere finalizar la ejecución del programa, asignamos el valor <var>true</var> a la variable <var>quit</var>, lo que romperá la ejecución del bucle <var>while</var> en el que nos encontramos.

<pre>//Free the surface and quit SDL
    clean_up();
        
    return 0;    
}
</pre>

Finalmente, llamamos a nuestra función clean_up() para que elimine las variables creadas por SDL.  
Hay otras maneras de controlar eventos como SDL\_WaitEvent() y SDL\_PeepEvents(). Se puede encontrar más información sobre esto en la documentación de SDL.

* * *Fuente: 

[lazyfoo.net][3]</p> 

#### Siguiente tema: [Lección 5 &#8211; Colores Clave][4] {.referencia}

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación para Juegos &#8211; Lección 4 &#8211; Programación orientada a eventos+http://elbauldelprogramador.com/programacion-para-juegos-leccion-4/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-para-juegos-leccion-4/&t=Programación para Juegos &#8211; Lección 4 &#8211; Programación orientada a eventos+http://elbauldelprogramador.com/programacion-para-juegos-leccion-4/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación para Juegos &#8211; Lección 4 &#8211; Programación orientada a eventos+http://elbauldelprogramador.com/programacion-para-juegos-leccion-4/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://www.lazyfoo.net/downloads/index.php?file=SDLTut_lesson04
 [2]: http://elbauldelprogramador.com/programacion-para-juegos-leccion-2/
 [3]: http://www.lazyfoo.net/SDL_tutorials/
 [4]: http://elbauldelprogramador.com/programacion-para-juegos-leccion-5/
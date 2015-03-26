---
id: 102
title: 'Programación para Juegos &#8211; Lección 5 &#8211; Colores Clave'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-para-juegos-leccion-5-colores-clave/
permalink: /programacion-para-juegos-leccion-5/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/programacion-para-juegos-leccion-5.html
  - /2011/01/programacion-para-juegos-leccion-5.html
  - /2011/01/programacion-para-juegos-leccion-5.html
categories:
  - juegos
---
<div class="icosdl">
</div>

Lo que vamos a ver ahora son los *colores clave*.  
Un color clave es un color que no queremos que aparezca en la imágen, como el fondo de la misma.  
La estructura SDL_Surface tiene un elemento llamado &#8220;color key&#8221;, que determina que color de la imagen no queremos que sea visible. Esto es lo que se usa cuando queremos una imagen con fondo transparente.

[Pueden descargar el código fuente de esta lección.][1]

Bien, supongamos que queremos fusionar esta imagen llamada &#8220;foo&#8221;:

<div class="separator" style="clear: both; text-align: center;">
  <img alt="foo" border="0" height="64" src="http://lh6.ggpht.com/_IlK2pNFFgGM/TT6FKpmp0fI/AAAAAAAAAQs/oFYGZsQzBn8/foo.jpg" width="32" />
</div>

  
<!--more-->

  
a este fondo:

<div class="separator" style="clear: both; text-align: center;">
  <img alt="Imagen Fondo" border="0" height="240" width="320" src="http://lh4.ggpht.com/_IlK2pNFFgGM/TT6FKroPMYI/AAAAAAAAAQo/oJFPpVHNsIg/background.jpg" />
</div>

Pero no queremos que aparezca el fondo azul claro de la primera imagen:

<div class="separator" style="clear: both; text-align: center;">
  <img alt="Resultado" border="0" height="240" width="320" src="http://lh4.ggpht.com/_IlK2pNFFgGM/TT6FLLUBg4I/AAAAAAAAAQ0/gS1QeS8p7PA/nokey.jpg" />
</div>

Para que no se muestre el fondo de la primera imagen, necesitamos fijarlo como &#8220;color key&#8221;, en este caso el valor de este color es (En hexadecimal): Red 0, Green FF, Blue FF.   
El color key se suele fijar normalmente al cargar la imagen.

{% highlight bash %}SDL_Surface *load_image( std::string filename ) 
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
{% endhighlight %}

Esta es la función que carga la imagen, y que vamos a modificar.

En primer lugar, cargamos la imagen optimizada, como hacíamos hasta ahora.

{% highlight bash %}//If the image was optimized just fine
        if( optimizedImage != NULL )
        {
            //Map the color key
            Uint32 colorkey = SDL_MapRGB( optimizedImage->format, 0, 0xFF, 0xFF );
{% endhighlight %}

Comprobamos que la imagen fue optimizada.  
Si todo va bien, necesitamos mapear el color que queremos ocultar. Llamamos a SDL_MapRGB() para tomar los valores de rojo, verde y azul. Esta función nos devuelve el valor del pixel en el mismo formato que el de la imagen. Puedes leer más acerca de los pixeles en el [artículo 3][2].

{% highlight bash %}//Set all pixels of color R 0, G 0xFF, B 0xFF to be transparent
            SDL_SetColorKey( optimizedImage, SDL_SRCCOLORKEY, colorkey );
        }
{% endhighlight %}

Ahora vamos a configurar el &#8220;color Key&#8221;, lo que vamos a hacer es fijar todos los pixeles de color 00ffff a transparentes.  
El primer argumento de esta función es la imagen para la cual queremos aplicar el &#8220;color key&#8221;.

El segundo es para los flags que desee aplicar, en este caso, el flag SDL_SRCCOLORKEY asegura que estamos usando &#8220;color Key&#8221; cuando fusionemos una imagen en otra.

El tercero es el color que deseamos fijar como &#8220;color key&#8221;, como vemos, es el color que hemos mapeado hace un momento. 

{% highlight bash %}//Return the optimized image
    return optimizedImage;
}
{% endhighlight %}

Para finalizar, la función devuelve la imagen optimizada con el color clave.

{% highlight bash %}//Apply the surfaces to the screen
    apply_surface( 0, 0, background, screen );
    apply_surface( 240, 190, foo, screen );
    
    //Update the screen
    if( SDL_Flip( screen ) == -1 )
    {
        return 1;    
    }
{% endhighlight %}

El resultado de hacer todo esto da como resultado la imagen siguiente:

<div class="separator" style="clear: both; text-align: center;">
  <img alt="Imagen final" border="0" height="240" width="320" src="http://lh4.ggpht.com/_IlK2pNFFgGM/TT6FK_nKIkI/AAAAAAAAAQw/rDMnHtu9ewo/key.jpg" />
</div>

Como vemos, ahora en la imagen del hombrecillo de Palo ya no se ve el fondo azul claro.

Para aquellos que uséis imágenes PNGs con transparencia, IMG\_Load() la maneja automáticamente. Si itentamos fijar un color clave para imágenes que ya disponen de transparencia, ocasionaremos resultado extraños. También se perderá la transparencia Alfa si usamos SDL\_DisplayFormat() en lugar de SDL\_DisplayFormatAlpha(). Para mantener la transparencia en un PNG simplemente no fije un color clave. IMG\_Load() también se encarga del alfa de imágenes TGA. Busque en la documentación de SDL para obtener más información detallada sobre los colores clave.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación para Juegos &#8211; Lección 5 &#8211; Colores Clave+http://elbauldelprogramador.com/programacion-para-juegos-leccion-5/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-para-juegos-leccion-5/&t=Programación para Juegos &#8211; Lección 5 &#8211; Colores Clave+http://elbauldelprogramador.com/programacion-para-juegos-leccion-5/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación para Juegos &#8211; Lección 5 &#8211; Colores Clave+http://elbauldelprogramador.com/programacion-para-juegos-leccion-5/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://lazyfoo.net/downloads/index.php?file=SDLTut_lesson05
 [2]: http://elbauldelprogramador.com/programacion-para-juegos-articulo-3-que/
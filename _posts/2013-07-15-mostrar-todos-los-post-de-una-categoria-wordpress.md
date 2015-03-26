---
id: 1712
title: Mostrar todos los post de una categoría en WordPress
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1712
permalink: /mostrar-todos-los-post-de-una-categoria-wordpress/
categories:
  - php
tags:
  - Mostrar todos los artículos de una categoría en Wordpress
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/07/wordpress.png" alt="mostrar todos los post de una categoría wordpress" width="231" height="228" class="thumbnail alignleft size-full wp-image-1757" />  
En otros artículos mostré cómo [crear shortcodes][1] en WordPress, hoy veremos cómo mostrar todos los post de una categoría wordpress dada como parámetro al shortcode.

  
<!--more-->

### Crear el shortcode

Editamos el archivo *functions.php* de nuestro tema y añadimos el siguiente código:

<pre lang="php">function show_category_posts( $atts ){
        extract(shortcode_atts(array(
                'cat'=> ''
        ), $atts));
        query_posts('cat='.$cat.'&#038;orderby=date&#038;order=ASC&#038;posts_per_page=-1');
        if ( have_posts() ){
                $content = '

<ul>
  ';
                  while ( have_posts() ){
                          the_post();
                          $content .= the_title('
  
  <li>
    <a href="'.get_permalink().'">', '</a>
  </li>', true);
                  }
                  $content .= '
</ul>';
        }
        //Reset query
        wp_reset_query();
        return $content;
}
add_shortcode('mostrar_cat', 'show_category_posts');
</pre>

### Entendiendo el código

La encargada de realizar todo el trabajo es la función *query_posts()*, es posible pasarle varios parámetros, como **orderby=date** para ordernar por fecha en orden ascendente (**order=ASC**). Para mostrar todos los artículos de la categoría es necesario el parámetro **posts\_per\_page=-1**. La lista de parámetros completa la podemos encontrar en la documentación de la clase *[WP_Query][2]*.

Lo siguiente que hace este trozo de código es iterar sobre todos los artículos y crear una lista. 

Por último añadimos la función como un *[shortcode][3]* y ya está lista para usar.

Para usar el shortcode debemos conocer el **id** de la categoría a mostrar, o reemplazar el parámetro ***cat=*** por cualquiera de los siguientes:

  * **<tt>cat</tt>** (*int*) &#8211; El usado por este código, requiere el ID. 
  * **<tt>category_name</tt>** (*string*) &#8211; Usar el slug de la categoría. 
  * **<tt>category__and</tt>** (*array*) &#8211; Usa el ID. 
  * **<tt>category__in</tt>** (*array*) &#8211; Usa el ID. 
  * **<tt>category__not_in</tt>** (*array*) &#8211; Usa el ID. 

### Ejemplo de uso

<pre>&#91;mostrar_cat cat="1"]
</pre>

#### Referencias

*Documentación función query_posts* **|** <a href="http://codex.wordpress.org/Function_Reference/query_posts" target="_blank">codex.wordpress.org</a>  
*Parámetros de query_posts* **|** <a href="http://codex.wordpress.org/Class_Reference/WP_Query#Parameters" target="_blank">codex.wordpress.org</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Mostrar todos los post de una categoría en WordPress+http://elbauldelprogramador.com/mostrar-todos-los-post-de-una-categoria-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/mostrar-todos-los-post-de-una-categoria-wordpress/&t=Mostrar todos los post de una categoría en WordPress+http://elbauldelprogramador.com/mostrar-todos-los-post-de-una-categoria-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Mostrar todos los post de una categoría en WordPress+http://elbauldelprogramador.com/mostrar-todos-los-post-de-una-categoria-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/how-to/como-crear-shortcodes-en-wordpress/
 [2]: http://codex.wordpress.org/Class_Reference/WP_Query#Parameters
 [3]: http://elbauldelprogramador.com/?s=shortcode
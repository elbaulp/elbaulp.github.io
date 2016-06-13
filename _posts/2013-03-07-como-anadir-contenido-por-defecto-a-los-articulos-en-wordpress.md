---
title: Cómo añadir contenido por defecto a los artículos en WordPress

layout: post
permalink: /como-anadir-contenido-por-defecto-a-los-articulos-en-wordpress/
categories:
  - How To
  - php
tags:
  - Articulos wordpress
  - contenido por defecto
  - contenido por defecto en post wordpress
main-class: "dev"
color: "#E64A19"
---
<img src="/assets/img/2012/05/Screenshot-05302012-111511-AM1.png" alt="Wordpress"   />  
Si escribes en un blog, seguramente en cada artículo repites algunos textos, como añadir shortcodes que usas habitualmente, pedir a los lectores que se suscriban al [feed del blog][2], que te sigan en las redes sociales etcétera. En esos casos es útil que para cada nuevo artículo creado, se inserte un texto por defecto.

Es bastante sencillo lograr esta funcionalidad, en el archivo *functions.php* de tu tema añade:

```php
add_filter( 'default_content', 'my_default_content' );
function my_default_content( $content ) {
   $content = "AQUI TU CONTENIDO POR DEFECTO";
 return $content;
}

```

Así de simple, ahora cada vez que crees un nuevo artículo, tendrá un contenido por defecto asignado.

#### Fuente

*How to Add Default Content in Your WordPress Post Editor* »» <a href="http://www.wpbeginner.com/wp-tutorials/how-to-add-default-content-in-your-wordpress-post-editor/" target="_blank">wpbeginner</a>



 [2]: /rssfeed/

{% include toc.html %}

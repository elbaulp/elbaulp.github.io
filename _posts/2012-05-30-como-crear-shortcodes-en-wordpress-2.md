---
id: 756
title: 'Cómo crear  simples shortcodes en WordPress'

layout: post
guid: /?p=756
permalink: /como-crear-shortcodes-en-wordpress-2/
if_slider_image:
  - 
  - 
categories:
  - How To
  - php
tags:
  - atajos wordpress
  - php
  - shortcodes
  - wordpress shortcodes
format: aside
main-class: "dev"
main-class: "How To"
---
Es bastante simple:

Buscamos el archivo ***function.php*** de nuestro tema instalado y pegamos el siguiente código php.

```php
< ?php
// Short code
function Nombre_de_nuestro_shortcode( $atts, $content = null ) {
   return 'Código de nuestro shortcode';
}
add_shortcode('nombre_de_nuestro_shortcode', 'Nombre_de_nuestro_shortcode');
?>

```

A partir de ahora, podemos agregar todo el código que hemos escrito dentro de la función en las entradas que queramos escribiendo el siguiente shortcode:

```bash
[nombre_de_nuestro_shortcode]
```

Así de sencillo es crear shortcodes en WordPress.

Fuente: <a href="http://www.wpyag.com/wordpress-tips-and-tricks/how-to-create-wordpress-shortcode-for-adsense/" target="_blank"><em>wpyag</em></a>



{% include _toc.html %}

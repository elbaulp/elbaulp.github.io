---
id: 952
title: Cómo crear shortcodes en WordPress que soporten parámetros
author: Alejandro Alcalde
layout: post
guid: /?p=952
permalink: /como-crear-shortcodes-en-wordpress/
categories:
  - How To
  - php
tags:
  - shortcodes
  - wordpress shortcodes
---
Ya se vió cómo añadir <a href="/como-crear-shortcodes-en-wordpress-2/" target="_blank">shortcodes simples</a>, esta vez se explicará con un poco más de profundidad.

Primero, un shortcode no es más que un conjunto de funciones que crean un código macro para usar dentro del contenido de un artículo. Es necesario añadir dicho shortcode al archivo&nbsp;**functions.php .&nbsp;** Como primer ejemplo sencillo, se creará un shortcode llamado *[foo]&nbsp;*que añadirá al artículo el texto&nbsp;**&#8220;Esto es una prueba&#8221;.**

### functions.php

&nbsp;

Este archivo está en el directorio del tema. Actua como un plugin, y, si existe en el directorio del tema, se carga automáticamente durante la inicialización de WordPress. Los pasos a seguir para crear el shortcode son los siguientes:

#### Crea la función en wordpress

Abre el fichero con tu editor favorito y añade lo siguiente:  
<!--more-->

<pre lang="php">//[foo]
function foo_demo( $atts ){
 return "Esto es una prueba.";
}
add_shortcode( 'foo', 'foo_demo' );</pre>

Guarda el fichero y ciérralo.

#### Pruébalo

Edita o crea un artículo y añade el shortcode:

<pre>[foo]</pre>

Guárdalo y haz clic en publicar o vista previa.

### Cómo pasar parámetros o atributos a un shortcode

La API del shortcode facilita mucho la tarea para poder añadirle parámetros como estos:

<pre>[music genero="rap" autor="Nach"]
[music genero="Rock" autor="Linkin Park"]</pre>

Añade lo siguiente a tu archivo&nbsp;**functions.php :&nbsp;**

<pre lang="php">// shortcode [music]
function show_music( $atts ){
   $music_details="";
   // get attibutes and set defaults
        extract(shortcode_atts(array(
                'genero' => 'No especificado',
                'autor' => 'No especificado',
                'date' => 0
       ), $atts));
    // Display info 
    $music_details = '

<div class="info">
  <ul>
    ';
        $music_details .= '
    
    <li>
      Genero: ' .$genero. '
    </li>';
        $music_details .= '
    
    <li>
      Autor: ' .$autor. '
    </li>';
        $music_details .= '
    
    <li>
      Fecha: ' .$date. '
    </li>';
        $music_details .= '
  </ul>
</div>';
    return $music_details;
}
//add our shortcode music
add_shortcode('music', 'show_music');
add_action( 'init', 'register_shortcodes');
</pre>

Listo, ya puedes usar este shortcode.

#### Referencias

*cyberciti* **|** <a href="http://www.cyberciti.biz/faq/wordpress-add-a-shortcode-to-theme-template/" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo crear shortcodes en WordPress que soporten parámetros+http://elbauldelprogramador.com/como-crear-shortcodes-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-crear-shortcodes-en-wordpress/&t=Cómo crear shortcodes en WordPress que soporten parámetros+http://elbauldelprogramador.com/como-crear-shortcodes-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo crear shortcodes en WordPress que soporten parámetros+http://elbauldelprogramador.com/como-crear-shortcodes-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
---
id: 704
title: Mostrar el número de seguidores en Twitter en WordPress
author: Alejandro Alcalde
layout: post
guid: /?p=704
permalink: /mostrar-el-numero-de-seguidores-en-twitter-en-wordpress/
if_slider_image:
  - 
  - 
if_seo_keywords:
  - contador seguidores, seguidores twitter, followers count, seguidores twitter wordpress, twitter count
  - contador seguidores, seguidores twitter, followers count, seguidores twitter wordpress, twitter count
sif_eo_description:
  - Código php para mostrar en wordpress nuestro número de seguidores en twitter.
  - Código php para mostrar en wordpress nuestro número de seguidores en twitter.
categories:
  - internet
tags:
  - contador seguidores
  - followers count
  - seguidores twitter
format: aside
---
Hoy voy a explicar cómo mostrar los seguidores de nuestra cuenta de Twitter en el blog. Antes de nada, necesitamos instalar un plugin que nos permite añadir widgets que contengan código PHP, se llama WP PHP Widget y podéis descargarlo de la página de <a href="http://wordpress.org/extend/plugins/wp-php-widget/" target="_blank">plugins de WordPress</a>. Una vez que tengamos instalado el plugin, agregamos el widget a nuestra plantilla y pegamos el siguiente código:

  
<!--more-->

<pre lang="php">$url = "http://twitter.com/users/show/elbaulp";
$response = file_get_contents ( $url );
$t_profile = new SimpleXMLElement ( $response );
$count = $t_profile->followers_count;
echo $count;</pre>

Listo, esto imprimirá el número de seguidores que tenemos en twitter.

Este código no es mío, lo encontré navegando por internet, y le hice algunas modificaciones, concretamente creé una función que añadí al archivo `<strong>functions.php</strong>` del tema:

<pre lang="php">function followers_count(){
  $url = "http://twitter.com/users/show/elbaulp";
  $response = file_get_contents ( $url );
  $t_profile = new SimpleXMLElement ( $response );
  $count = $t_profile->followers_count;
  return $count;
}</pre>

Y en el widget tengo lo siguiente:

<pre lang="php" ><p class="twittercount">
  <a href="http://twitter.com/elbaulp" title="Follow on Twitter" target="_blank">
     <img style="vertical-align:middle;padding-right:5px" src="twitter.png" alt="Twitter" /></a>
     <span>&lt; ?php echo followers_count();?></span> Followers
  
</p>
</pre>

Y el estilo es el siguiente:

<pre lang="css" >.twittercount {
  -moz-box-shadow: 8px 11px 11px #222;
  -webkit-box-shadow: 8px 11px 11px #222;
  box-shadow: 8px 11px 11px #222;
  width: 127px;
  font-family: Georgia, serif;
  font-style: italic;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
  text-align: center;
  border: 4px solid #EEE;
  border-radius: 5px;
  background-color: #EEE;
  margin: 5px;
  display: inline-block;
}
</pre>

<div style="text-align:center">
  <p class="twittercount">
    <a href="http://twitter.com/elbaulp" title="Follow on Twitter" target="_blank"><img style="vertical-align:middle;padding-right:5px" src="/wp-content/themes/ifeature/images/social/round/twitter.png" alt="Twitter" /></a><span>693</span> Followers
  </p>
</div>

Eso es todo.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Mostrar el número de seguidores en Twitter en WordPress+http://elbauldelprogramador.com/mostrar-el-numero-de-seguidores-en-twitter-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/mostrar-el-numero-de-seguidores-en-twitter-en-wordpress/&t=Mostrar el número de seguidores en Twitter en WordPress+http://elbauldelprogramador.com/mostrar-el-numero-de-seguidores-en-twitter-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Mostrar el número de seguidores en Twitter en WordPress+http://elbauldelprogramador.com/mostrar-el-numero-de-seguidores-en-twitter-en-wordpress/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
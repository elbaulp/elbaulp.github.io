---
id: 108
title: 'Pylabra &#8211; Aplicación para almacenar vocabulario'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/pylabra-aplicacion-para-almacenar-vocabulario/
permalink: /pylabra-aplicacion-para-almacenar/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/pylabra-aplicacion-para-almacenar.html
  - /2011/01/pylabra-aplicacion-para-almacenar.html
  - /2011/01/pylabra-aplicacion-para-almacenar.html
categories:
  - aplicaciones
  - opensource
  - python
---
<div class="icopy">
</div>

Hace bastante tiempo que Haitike y yo dejamos de desarrollar [Pylabra][1], y nunca creé una entrada hablando de la aplicación en sí, asi que me he decidido a escribirla.

Antes de nada, el programa necesita instalar algunas dependencias, entre ellas la libreria sqllite y las librerias de wxWidgets (python-wxgtk2.8), que podemos instalar de la siguiente manera:

<pre>sudo aptitude install libsqlite python-wxgtk2.8</pre>

  
<!--more-->

  
Una vez instaladas podemos ejecutar el programa haciendo clic en el archivo llamado main.py, o bien desde consola con: 

<pre>./main.py</pre>

Podéis descargar Pylabra desde <a target=_blank" href="http://www.megaupload.com/?d=JS34AFA6">megaupload</a>

Una vez lo ejecutéis, vereis la pantalla principal:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3RT8nvII/AAAAAAAAASY/EoeMulJUyJU/s1600/principal.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="256" src="http://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3RT8nvII/AAAAAAAAASY/EoeMulJUyJU/s320/principal.png" width="320" /></a>
</div>

La interfaz es muy simple con 5 botones arriba (En esta imagen falta uno, el botón &#8220;Acerca de&#8221;), pero en las siguientes imágenes aparecerá.

Bien, lo primero que vamos a probar es a añadir una palabra, para ello hacemos clic en el primer botón de la parte superior izquierda, lo que nos abrirá esta ventana:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://1.bp.blogspot.com/_IlK2pNFFgGM/TUB3APm2yfI/AAAAAAAAAR4/b-EUFZtkKJY/s1600/AddPalabra.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="270" src="http://1.bp.blogspot.com/_IlK2pNFFgGM/TUB3APm2yfI/AAAAAAAAAR4/b-EUFZtkKJY/s320/AddPalabra.png" width="320" /></a>
</div>

En un principio esta aplicación estaba pensada para almacenar palabras en Alemán, por eso aparecen unos RadioButton con los distintos géneros en Alemán, podeis ignorar esa parte y almacenar palabras del idioma que queráis. Si no os gusta que aparezca, decidmelo y os digo la parte de código que tenéis que eliminar.

En esta pantalla simplemente rellenamos los campos que queramos y le damos a &#8220;Guardar y salir&#8221;

Ahora vemos que se ha generado una fila en la pantalla principal con la palabra que avabamos de crear:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3Al5R7dI/AAAAAAAAASA/W1nLDdgvH6A/s1600/condatos.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="256" src="http://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3Al5R7dI/AAAAAAAAASA/W1nLDdgvH6A/s320/condatos.png" width="320" /></a>
</div>

Si hacemos clic con el botón derecho sobre una fila, podemos editar la palabra o borrarla, si le damos a editar nos sadrá la siguiente pantalla: 

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3BJpBsVI/AAAAAAAAASQ/_yeeBiG9AcM/s1600/EditarPalabra.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="270" src="http://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3BJpBsVI/AAAAAAAAASQ/_yeeBiG9AcM/s320/EditarPalabra.png" width="320" /></a>
</div>

También podemos ordenar las palabras por los distintos campos (No, palabra, genero etc), solo tenemos que hacer clic en el nombre del campo, así como también podemos buscar palabras con la caja de texto que hay en la parte superior.

En la parte derecha tenemos un buscador de wordreference para buscar palabras Inglés-Español que podemos ocultar con su botón correspondiente de la parte superior. 

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3A77mKsI/AAAAAAAAASI/jDL9aDs2bss/s1600/diccionario.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="256" src="http://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3A77mKsI/AAAAAAAAASI/jDL9aDs2bss/s320/diccionario.png" width="320" /></a>
</div>

Si ocultamos el navegador la pantalla principal queda de la siguiente manera:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3RgQpV7I/AAAAAAAAASg/86OmTn34j3s/s1600/QuitarNavegador.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="256" src="http://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3RgQpV7I/AAAAAAAAASg/86OmTn34j3s/s320/QuitarNavegador.png" width="320" /></a>
</div>

Si haceis clic en el botón con forma de estrella, se abrirá una ventana con información del programa y de los desarrolladores:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3AAFAq5I/AAAAAAAAARw/hPadST7-nyc/s1600/AcercaDe.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="320" src="http://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3AAFAq5I/AAAAAAAAARw/hPadST7-nyc/s320/AcercaDe.png" width="320" /></a>
</div>

Para terminar la entrada quiero decir que es un programa bastante simple, pero nos sirvió para aprender algo más de python y sobre todo para aprender a trabajar en equipo.

Os lo dejo a vuestra disposición y ojalá que os sea útil.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Pylabra &#8211; Aplicación para almacenar vocabulario+http://elbauldelprogramador.com/pylabra-aplicacion-para-almacenar/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/pylabra-aplicacion-para-almacenar/&t=Pylabra &#8211; Aplicación para almacenar vocabulario+http://elbauldelprogramador.com/pylabra-aplicacion-para-almacenar/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Pylabra &#8211; Aplicación para almacenar vocabulario+http://elbauldelprogramador.com/pylabra-aplicacion-para-almacenar/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://bashyc.blogspot.com/p/proyecto-pylabra.html
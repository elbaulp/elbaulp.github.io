---
title: 'Pylabra &#8211; Aplicación para almacenar vocabulario'
layout: post.amp
permalink: /pylabra-aplicacion-para-almacenar/
categories:
  - aplicaciones
  - opensource
  - python
main-class: "dev"
color: "#E64A19"
---
<div class="icopy">
</div>

Hace bastante tiempo que Haitike y yo dejamos de desarrollar [Pylabra][1], y nunca creé una entrada hablando de la aplicación en sí, asi que me he decidido a escribirla.

Antes de nada, el programa necesita instalar algunas dependencias, entre ellas la libreria sqllite y las librerias de wxWidgets (python-wxgtk2.8), que podemos instalar de la siguiente manera:

```bash
sudo aptitude install libsqlite python-wxgtk2.8
```


<!--ad-->


Una vez instaladas podemos ejecutar el programa haciendo clic en el archivo llamado main.py, o bien desde consola con:

```bash
./main.py
```

Podéis descargar Pylabra desde <a target='_blank"' href="http://www.megaupload.com/?d=JS34AFA6">megaupload</a>

Una vez lo ejecutéis, vereis la pantalla principal:

<div class="separator" >
<a href="https://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3RT8nvII/AAAAAAAAASY/EoeMulJUyJU/s1600/principal.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="256" src="https://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3RT8nvII/AAAAAAAAASY/EoeMulJUyJU/s320/principal.png" width="320" /></a>
</div>

La interfaz es muy simple con 5 botones arriba (En esta imagen falta uno, el botón &#8220;Acerca de&#8221;), pero en las siguientes imágenes aparecerá.

Bien, lo primero que vamos a probar es a añadir una palabra, para ello hacemos clic en el primer botón de la parte superior izquierda, lo que nos abrirá esta ventana:

<div class="separator" >
<a href="https://1.bp.blogspot.com/_IlK2pNFFgGM/TUB3APm2yfI/AAAAAAAAAR4/b-EUFZtkKJY/s1600/AddPalabra.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="270" src="https://1.bp.blogspot.com/_IlK2pNFFgGM/TUB3APm2yfI/AAAAAAAAAR4/b-EUFZtkKJY/s320/AddPalabra.png" width="320" /></a>
</div>

En un principio esta aplicación estaba pensada para almacenar palabras en Alemán, por eso aparecen unos RadioButton con los distintos géneros en Alemán, podeis ignorar esa parte y almacenar palabras del idioma que queráis. Si no os gusta que aparezca, decidmelo y os digo la parte de código que tenéis que eliminar.

En esta pantalla simplemente rellenamos los campos que queramos y le damos a &#8220;Guardar y salir&#8221;

Ahora vemos que se ha generado una fila en la pantalla principal con la palabra que avabamos de crear:

<div class="separator" >
<a href="https://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3Al5R7dI/AAAAAAAAASA/W1nLDdgvH6A/s1600/condatos.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="256" src="https://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3Al5R7dI/AAAAAAAAASA/W1nLDdgvH6A/s320/condatos.png" width="320" /></a>
</div>

Si hacemos clic con el botón derecho sobre una fila, podemos editar la palabra o borrarla, si le damos a editar nos sadrá la siguiente pantalla:

<div class="separator" >
<a href="https://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3BJpBsVI/AAAAAAAAASQ/_yeeBiG9AcM/s1600/EditarPalabra.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="270" src="https://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3BJpBsVI/AAAAAAAAASQ/_yeeBiG9AcM/s320/EditarPalabra.png" width="320" /></a>
</div>

También podemos ordenar las palabras por los distintos campos (No, palabra, genero etc), solo tenemos que hacer clic en el nombre del campo, así como también podemos buscar palabras con la caja de texto que hay en la parte superior.

En la parte derecha tenemos un buscador de wordreference para buscar palabras Inglés-Español que podemos ocultar con su botón correspondiente de la parte superior.

<div class="separator" >
<a href="https://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3A77mKsI/AAAAAAAAASI/jDL9aDs2bss/s1600/diccionario.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="256" src="https://4.bp.blogspot.com/_IlK2pNFFgGM/TUB3A77mKsI/AAAAAAAAASI/jDL9aDs2bss/s320/diccionario.png" width="320" /></a>
</div>

Si ocultamos el navegador la pantalla principal queda de la siguiente manera:

<div class="separator" >
<a href="https://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3RgQpV7I/AAAAAAAAASg/86OmTn34j3s/s1600/QuitarNavegador.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="256" src="https://2.bp.blogspot.com/_IlK2pNFFgGM/TUB3RgQpV7I/AAAAAAAAASg/86OmTn34j3s/s320/QuitarNavegador.png" width="320" /></a>
</div>

Si haceis clic en el botón con forma de estrella, se abrirá una ventana con información del programa y de los desarrolladores:

<div class="separator" >
<a href="https://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3AAFAq5I/AAAAAAAAARw/hPadST7-nyc/s1600/AcercaDe.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="320" src="https://3.bp.blogspot.com/_IlK2pNFFgGM/TUB3AAFAq5I/AAAAAAAAARw/hPadST7-nyc/s320/AcercaDe.png" width="320" /></a>
</div>

Para terminar la entrada quiero decir que es un programa bastante simple, pero nos sirvió para aprender algo más de python y sobre todo para aprender a trabajar en equipo.

Os lo dejo a vuestra disposición y ojalá que os sea útil.



 [1]: http://bashyc.blogspot.com/p/proyecto-pylabra.html

{% include toc.html %}

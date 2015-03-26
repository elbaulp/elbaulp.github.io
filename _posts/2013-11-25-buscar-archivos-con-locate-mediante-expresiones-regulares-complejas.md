---
id: 2008
title: Buscar archivos con locate mediante expresiones regulares

layout: post
guid: http://elbauldelprogramador.com/?p=2008
permalink: /buscar-archivos-con-locate-mediante-expresiones-regulares-complejas/
categories:
  - script
tags:
  - crear lista de reproducción
  - ejemplos locate
  - expresiones regulares linux
  - locate
---
En linux, existe un comando llamado **locate** que busca archivos en nuestro sistema de ficheros haciendo consultas a una base de datos, la descripción según su *man* es:

> Locate lee una o más [bases de datos][1] preparadas por updatedb y escribe a la salida estandar los nombres de los archivos que coincidan con al menos uno de los patrones, uno por línea. 

El motivo de este artículo viene dado por un problema que me planteé hace unos días. Resulta que tengo en un archivo los nombres de algunas de mis <a href="http://www.youtube.com/playlist?list=PLINUjqv9_oyrI4SXWqf-sBhoUnxHe2bRh" title="Lista de reproducción EPIC3" target="_blank">canciones preferidas</a>. Este archivo lo voy actualizando regularmente y quería generar una lista de reproducción en base a dicho fichero. Así que he creado un [script][2] que recorre todos los elementos del archivo y busca dónde se encuentra el fichero en mi disco duro.

<!--more-->

### Expresiones regulares en Locate

**Locate** acepta [expresiones regulares][3] complejas, para ello hay que llamarlo con la opción *&#8211;regex*.

El problema básicamente es el siguiente. A partir de un texto con los nombres *parciales* de un fichero obtener la ruta completa a dicho archivo. Lo de parciales quiere decir que si el nombre es **Autor &#8211; Nombre Canción**, en el texto solo se guarda **Nombre Canción**.

### Crear la expresión regular

Empezaré mostrando la expresión regular y luego la explicaré:

{% highlight bash %}>$i.*(\.mp4|\.mp3)
{% endhighlight %}

En `$i` está el nombre de la canción, `.*` permite que haya cero o más caracteres tras el nombre de la canción y finalmente `(\.mp4|\.mp3)` obliga a que la extensión del fichero sea [**mp3** o **mp4**][4].

Siempre que necesito crear una expresión regular uso una herramienta llamada **regex tester** que permite visualizar qué cadenas de texto coincidirían con el patrón:

<img src="http://elbauldelprogramador.com/content/uploads/2013/11/Buscar-archivos-con-locate-mediante-expresiones-regulares-complejas.png" alt="Buscar archivos con locate mediante expresiones regulares complejas" width="627" height="285" class="thumbnail aligncenter size-full wp-image-2011" />

### Script completo

Con la expresión regular construida, solo resta crear un script que procese el texto con el nombre de las canciones y cree la lista de reproducción:

{% highlight bash %}>#!/bin/bash

nombres=`cat ARCHIVO_CON_LISTA_DE_NOMBRES`

IFS='
'

> /RUTA/A/LISTA/DE/REPRODUCCION/LISTA.m3u

for i in $nombres
do 
    echo "locate --regex -i \"$i.*(\.mp4|\.mp3)\""
    locate --regex -i "$i.*(\.mp4|\.mp3)" | tee -a /RUTA/A/LISTA/DE/REPRODUCCION/LISTA.m3u
done
IFS=' '
{% endhighlight %}

`IFS` se establece al salto de línea para que el `for` tome como separación cada línea del archivo, en lugar de un espacio (valor por defecto de `IFS`). De esta forma, si una línea del fichero contiene **Nombre canción**, en el `for` el contenido de `$i` valdrá **Nombre canción** y no **Nombre** y en la siguiente iteración **canción**. `> /RUTA/A/LISTA/DE/REPRODUCCION/LISTA.m3u` borra el contenido de lo que tuviera la lista anteriormente para generarla de nuevo. Por último, la [tubería][5] con `tee` permite escribir tanto a la salida estándar como a la lista.

#### Referencias

*RegEx Tester* **|** <a href="http://regexpal.com/" target="_blank">regexpal.com</a>  
*Créditos de la imagen* **|** <a href="https://www.iconfinder.com/icons/33644/terminal_icon" target="_blank">inconfinder</a>



 [1]: http://elbauldelprogramador.com/bases-de-datos/ "Bases de Datos"
 [2]: http://elbauldelprogramador.com/category/script/ "Categoría script"
 [3]: http://elbauldelprogramador.com/opensource/programacion-bash-expresiones-regulares/ "Programación bash – Expresiones Regulares"
 [4]: http://elbauldelprogramador.com/articulos/cual-es-la-diferencia-entre-los-distintos-formatos-de-audio-y-cual-deberia-elegir/ "¿Cual es la diferencia entre los distintos formatos de audio, y cual debería elegir?"
 [5]: http://elbauldelprogramador.com/bash/programacion-bash-metacaracteres-de/ "Programación Bash – Metacaracteres de redirección"
---
title: 'Crear miniaturas de imágenes [Mejorado]'
layout: post.amp

categories:
  - linux
  - script
tags:
  - crear miniaturas de imagenes
main-class: "linux"
color: "#2196F3"
---
He mejorado el [script que subí hace unos días][1] para crear miniaturas de imágenes, y ahora se puede ejecutar desde cualquier lugar sin necesidad de copiar el script en la carpeta de las imágenes de las que queremos hacer miniaturas. Además, podemos seleccionar solo las imágenes que deseemos, o todas.


<!--ad-->


También dejo el link de pastebin: <http://pastebin.com/BhKYpYJf>



```bash
#!/bin/bash

if [ -e /usr/bin/convert ] ; then #Compruebo que el programa imagemagick esta insatado
 dir=`zenity --file-selection --directory --title="Selecciona el directorio de las imágenes"`
  case $? in
     0)
       echo -n "¿Quiere hacer miniaturas de todas las imágenes del directorio? s/n: " ; read respuesta
       if [ $respuesta == "S" ] || [ $respuesta == "s" ] ; then # Compruebo la respuesta del usuario
        imagenes=$(ls $dir) # almaceno todos los archivos de la carpeta seleccionada
        mkdir $dir/miniaturas
      for i in $imagenes
     do
      if [ -e $dir/$i ] ; then
       i=$(basename "$i")
       echo "Procesando imagen $i ..."
       /usr/bin/convert -thumbnail 180x128 $dir/$i $dir/miniaturas/$i
      fi
     done
     echo "Miniaturas creadas."
    else
     img=`zenity --filename=$dir/ --file-selection --multiple --separator=" " --title="Selecciona la imagenes"`
     case $? in
      0)
       mkdir $dir/miniaturas
       for i in $img
       do
         i=$(basename "$i")
        echo "Procesando imagen $i ..."
        /usr/bin/convert -thumbnail 180x128 $dir/$i $dir/miniaturas/$i
       done
       echo "Miniaturas creadas."
       ;;
     esac
       fi
       ;;
      1)
        echo "No seleccionó nada";;
     -1)
        echo "Ocurrió un error";;
    esac
else
 echo "Imagemagick no esta instalado, puede instalarlo haciendo 'sudo aptitude install imagemagick'"
fi


```



 [1]: https://elbauldelprogramador.com/crear-imagenes-en-miniaturas/

{% include toc.html %}

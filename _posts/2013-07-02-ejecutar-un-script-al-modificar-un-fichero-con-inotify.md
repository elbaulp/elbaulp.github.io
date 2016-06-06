---
id: 1692
title: Ejecutar un script al modificar un fichero con inotify

layout: post
guid: https://elbauldelprogramador.com/?p=1692
permalink: /ejecutar-un-script-al-modificar-un-fichero-con-inotify/
categories:
  - bash
  - linux
  - script
tags:
  - Ejecutar un script al modificar un fichero
  - ejemplo inotify
  - ejemplo inotify-tools
---
<img src="/assets/img/2013/07/Screenshot-from-2013-07-02-164301.png" alt="Ejecutar un script al modificar un fichero con inotify" width="269" height="105" class="thumbnail alignleft size-full wp-image-1713" />La idea de querer ejecutar un [script][1] al modificar un fichero surgió a raiz del artículo donde expliqué cómo [editar y crear archivos cifrados con GPG en Vim][2]. Aunque parezca un poco dificil encontrarle utilidad a esta idea, puede resultar bastante cómodo por ejemplo compilar automáticamente un programa cada vez que modificamos el código, borrar ficheros generados automáticamente etc, hay multidud de aplicaciones posibles en función de nuestras necesidades.  
<!--ad--> A mi personalmente me hacía falta para cifrar un archivo automáticamente tras modificarlo, pero más tarde caí en la cuenta de que eso ya lo hace el plugin de Vim.

Antes de poder usar el script es necesario instalar *inotify-tools*

```bash
# aptitude install inotify-tools

```

Hecho esto, ahora es posible ejecutar el script que he creado:

```bash
function help {
   echo "$0 <directory> <file to watch> <script to execute>"
}

if [ "$#" -ne 3 ]; then
   help
   exit 1
fi

while true; do
  change=$(inotifywait -e close_write $1)
  echo $change
  change=${change#./ * }
  if [ "$change" = "$2" ]; then ./$3; fi
done

```


<p>
  El script recibe 3 parámetros; El directorio donde se encuentra el fichero, el nombre del fichero y el script a ejecutar al detectar cambios. Veamos un ejemplo trivial que simplemente escribirá un texto al final del fichero:
</p>


```bash

$ cat ejemplo 
elbauldelprogramador.com
$ cat script.sh 
#!/bin/bash

echo "Script ejecutado tras editar" >> ejemplo
$ ./notifyChangesOnFile.sh . ejemplo script.sh 
Setting up watches.
Watches established.
./ CLOSE_WRITE,CLOSE ejemplo
Setting up watches.
Watches established.

```


<p>
  Tras ejecutar <em>notifyChangesOnFile.sh</em> abrimos el fichero de ejemplo con cualquier editor y cuando guardemos aparece en pantalla <em>./ CLOSE_WRITE,CLOSE ejemplo</em> indicando que se ha modificado. Si volvemos a mirar el fichero de ejemplo su contenido es:
</p>


```bash

$ cat ejemplo
elbauldelprogramador.com




escribimos algo para modificar el fichero y guardamos
Script ejecutado tras editar

```


<p>
  Espero que sea de utilidad, el repositorio de <em>inotify-tools</em> está en github (Enlace en las referencias).
</p>


<h4>
  Referencias
</h4>


<p>
  <em>Repositorio inotify-tools</em> <strong>|</strong> <a href="https://github.com/rvoicilas/inotify-tools" target="_blank">Visitar sitio</a><br />
  <em>inotify</em> <strong>|</strong> <a href="http://inotify.aiken.cz/?section=incron&page=about&lang=en" target="_blank">inotify.aiken.cz</a><br />
  <em>How to execute a command whenever a file changes?</em> <strong>|</strong> <a href="http://superuser.com/questions/181517/how-to-execute-a-command-whenever-a-file-changes" target="_blank">superuser.com</a><br />
  <em>Bash: Execute script on file save?</em> <strong>|</strong> <a href="http://stackoverflow.com/questions/3283228/bash-execute-script-on-file-save" target="_blank">stackoverflow</a>
</p>




 [1]: /script/
 [2]: /editar-y-crear-archivos-cifrados-con-gpg-en-vim/ "Editar y crear archivos cifrados con GPG en Vim"

{% include _toc.html %}

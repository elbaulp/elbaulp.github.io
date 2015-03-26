---
id: 1692
title: Ejecutar un script al modificar un fichero con inotify
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1692
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
<img src="http://elbauldelprogramador.com/content/uploads/2013/07/Screenshot-from-2013-07-02-164301.png" alt="Ejecutar un script al modificar un fichero con inotify" width="269" height="105" class="thumbnail alignleft size-full wp-image-1713" />La idea de querer ejecutar un [script][1] al modificar un fichero surgió a raiz del artículo donde expliqué cómo [editar y crear archivos cifrados con GPG en Vim][2]. Aunque parezca un poco dificil encontrarle utilidad a esta idea, puede resultar bastante cómodo por ejemplo compilar automáticamente un programa cada vez que modificamos el código, borrar ficheros generados automáticamente etc, hay multidud de aplicaciones posibles en función de nuestras necesidades.  
<!--more--> A mi personalmente me hacía falta para cifrar un archivo automáticamente tras modificarlo, pero más tarde caí en la cuenta de que eso ya lo hace el plugin de Vim.

Antes de poder usar el script es necesario instalar *inotify-tools*

{% highlight bash %}># aptitude install inotify-tools
{% endhighlight %}

Hecho esto, ahora es posible ejecutar el script que he creado:

{% highlight bash %}>function help {
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
{% endhighlight %}


<p>
  El script recibe 3 parámetros; El directorio donde se encuentra el fichero, el nombre del fichero y el script a ejecutar al detectar cambios. Veamos un ejemplo trivial que simplemente escribirá un texto al final del fichero:
</p>


{% highlight bash %}>
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
{% endhighlight %}


<p>
  Tras ejecutar <em>notifyChangesOnFile.sh</em> abrimos el fichero de ejemplo con cualquier editor y cuando guardemos aparece en pantalla <em>./ CLOSE_WRITE,CLOSE ejemplo</em> indicando que se ha modificado. Si volvemos a mirar el fichero de ejemplo su contenido es:
</p>


{% highlight bash %}>
$ cat ejemplo
elbauldelprogramador.com




escribimos algo para modificar el fichero y guardamos
Script ejecutado tras editar
{% endhighlight %}


<p>
  Espero que sea de utilidad, el repositorio de <em>inotify-tools</em> está en github (Enlace en las referencias).
</p>


<h4>
  Referencias
</h4>


<p>
  <em>Repositorio inotify-tools</em> <strong>|</strong> <a href="https://github.com/rvoicilas/inotify-tools" target="_blank">Visitar sitio</a><br />
  <em>inotify</em> <strong>|</strong> <a href="http://inotify.aiken.cz/?section=incron&#038;page=about&#038;lang=en" target="_blank">inotify.aiken.cz</a><br />
  <em>How to execute a command whenever a file changes?</em> <strong>|</strong> <a href="http://superuser.com/questions/181517/how-to-execute-a-command-whenever-a-file-changes" target="_blank">superuser.com</a><br />
  <em>Bash: Execute script on file save?</em> <strong>|</strong> <a href="http://stackoverflow.com/questions/3283228/bash-execute-script-on-file-save" target="_blank">stackoverflow</a>
</p>


<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Ejecutar un script al modificar un fichero con inotify+http://elbauldelprogramador.com/ejecutar-un-script-al-modificar-un-fichero-con-inotify/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/ejecutar-un-script-al-modificar-un-fichero-con-inotify/&t=Ejecutar un script al modificar un fichero con inotify+http://elbauldelprogramador.com/ejecutar-un-script-al-modificar-un-fichero-con-inotify/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Ejecutar un script al modificar un fichero con inotify+http://elbauldelprogramador.com/ejecutar-un-script-al-modificar-un-fichero-con-inotify/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /category/script/
 [2]: /seguridad/editar-y-crear-archivos-cifrados-con-gpg-en-vim/ "Editar y crear archivos cifrados con GPG en Vim"
---
id: 1452
title: Editar y crear archivos cifrados con GPG en Vim
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1452
permalink: /editar-y-crear-archivos-cifrados-con-gpg-en-vim/
categories:
  - linux
  - seguridad
tags:
  - cifrar archivos gpg
  - descifrar archivos gpg
  - editor archivos gpg
  - gpg vim plugin
  - vim plugin
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/04/GnuPG-Logo.png" alt="Editar y crear archivos cifrados con GPG en Vim" title="Editar y crear archivos cifrados con GPG en Vim" width="400" height="175" class="thumbnail aligncenter size-full wp-image-1519" />

Hoy quiero hablaros de un plugin bastante útil que encontré para el potente editor de textos Vim, que permite crear y modificar archivos de texto bajo **gpg** (*GNU Privacy Guard*).

### ¿Qué es **gpg**?

Me permito extraer el la definición de genbeta::Dev. Para una explicación más profunda del funcionamiento de **gpg**, puedes dirigirte al artículo en GenBeta::Dev que cito en las referencias.

> *Antes de empezar con lo interesante tenemos que saber que es **gpg** (GNU Privacy Guard), que es un derivado libre de **PGP** y su utilidad es la de cifrar y firmar digitalmente, siendo además multiplataforma (<a href="http://www.gnupg.org/download/index.en.html" target="_blank">podéis descargarlo desde la página oficial</a>) aunque viene incorporado en algunos sistemas Linux, en Windows se encuentra solo con gestor gráfico).*

  
<!--more-->

### Instalar el plugin para Vim

Descarga el plugin <a href="http://www.vim.org/scripts/download_script.php?src_id=18070" target="_blank">gnupg.vim</a>. Una vez descargado, pégalo en el directorio *$HOME/.vim/plugin/*. El último paso es añadir la siguiente línea al archivo **.bashrc**:

<pre lang="bash">export GPG_TTY=`tty`</pre>

Es recomendable establecer algunas variables en el fichero de configuracón de Vim (*.vimrc*). El mio está así:

<pre lang="bash">$ cat ~/.vimrc
:let g:GPGDefaultRecipients=["&lt;tu-correo"]
:let g:GPGPreferSign=1
</pre>

Con **g:GPGDefaultRecipients** se establecen los destinatarios por defecto para los archivos cifrados. Y **g:GPGPreferSign** firma los archivos nuevos.

Para usar vim con este plugin es necesario que los archivos terminen en las extensiones **.gpg, .pgp,** o **.asc**. Cuando se abre un archivo existente ya cifrado Vim solicitará el *passphrase*. En el caso de que estemos creando un archivo nuevo, preguntará qué llaves publicas usar como destinatarios.

### Ejemplos de uso

<pre lang="bash">$ vim test.gpg
</pre>

Una vez en Vim, escribimos contenido en el archivo y guardamos con *:wq*. Tras esto, Vim pedirá que introduzcamos la *passphrase* de nuestra llave. En caso de disponer de más de una clave pública en nuestro anillo de llaves GPG, Vim nos dará a escoger con cual cifrar el archivo. Una vez seleccionada la clave el archivo estará listo:

<pre>cat test.gpg 
-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.4.12 (GNU/Linux)

hQMOA4/xAZRTNmlYEAwAmFx/GgNIVVgoK98SYXs1gU7zjHcOmempUzbDtvGni2Ar
s2eYuz5X8hgYwTL185PH1bg6UyXdcXk3yckb8AOBwmF2jaOqnwnXBlqY9mcnVUAz
YyUBABL9jwE9zxCHJrenwlyFnIryj66XC4G7NFskANhXs/KBDmDsVEit0XHwtpKl
STIDjCyx3SvsZ0tGFGeLb01Poq35Sx+buLawpw1JDI8rN6tN9empZ6m9eDC9zhD3
6EYscAv96bzkwKVab1tXz498gSVr86bCT497HNbXuPju9LdoMQJ8X4Ce/ViAOLAp
TDrUfSA0Pkd1zaosMiabFUt+mGKX3tE4g0sTInImy9aQCW9ZCoOe7mr1qfKUYigQ
AIBYp7Kjvxdx3cmJUqv+5XV4HKWtxLAaOkqx91jmqXZb6UjZqhiCQttumfu0qG18
YfuUHLaIDNLdWGtz4fGnT5+TcTG0B9Sorbbk814PK4TobQcRjDAHXfcdQSEZKzZv
BvxzuVuVo8rkkizN7PrbC/9U0jA94Np2pEzrzNjXTW8qyWTMOoLGyHDB/eturgW4
k+LOtAkwGRl5upLtqsgodIWWQ5M0L+dOfUjDT2D5kemJsoeEhXa6LnfRb2W5lKLM
wPTcN3VGw+MqRAfBpN6lPlyGhe5CfJazoSAIm53CZdK/HxJDw4Xgo5U6pHuAo9qv
61q8wGiuqrNMG2YuOljytVj6XZA/soyNug/XxZIvVPaXU5h5+5XjVgnE049JuZVN
g3zqEwGS724ZiVDZBtfXE9W7++T78lWTMi3zf3eqGrD1YYkkrr6diL1BsG6dvDdG
mKqmITtdSmUsW8BDuFRO9xON91V9S5Ja5G6fZnwKQMIE/gy7mwmP8SJLwq6oe9Ki
7f3z2e+PB5iY+qBFGgE2SCm3zGYMDdPTaEv1vRrhYLZXPUYqwonW4nRceVgIDSr5
76vqd0tnHEPBJedXtzC0gZM0phMJTJxwdGZVoC70jg44M1sgEa8fBOdxPzgKVyHU
/aKFYNiVUZqP42mM+bYHsIzSvwFAFUFbCo+PkbFlWfvzrbgSP+/tvU+YdNWaW3gT
z1QnCksazNT0NejGT+bR9laTomTINAxY8NIiZXF3Bs240/bIiX86weZ9VOFgCvkL
+89CTkWDWTf8163aiHYkJBy0f3yUYubgXZgkKO08LeBXX9bpTJkqKkVjDdr2Szsz
NYzoIbI6ZMjgAWRkuk0Kjf4pPoowrUR5N3phzV76FlJrItCtSxCtzke/Ml6c905W
Os82c2XLJ1jWjLGG0GbIPOUz
=7ABi
-----END PGP MESSAGE-----
</pre>

Es recomendable firmar todos los archivos que cifremos con **gpg** para asegurar la vericidad del firmante, por ejemplo podemos pasarle las siguientes opciones a **gpg**:

<pre lang="bash">gpg --encrypt -r &lt;ID_PUBLICA> -u &lt;ID_PRIVADA> --output &lt;NOMBRE_ARCHIVO.signed.gpg> --sign &lt;ARCHIVO_ORIGINAL>
</pre>

#### Referencias

*Plugin para Vim* **|** <a href="http://www.vim.org/scripts/script.php?script_id=3645" target="_blank">Visitar sitio</a>  
*Introducción a <strong>gpg</strong>* **|** <a href="http://www.genbetadev.com/seguridad-informatica/manual-de-gpg-cifra-y-envia-datos-de-forma-segura" target="_blank">genbeta::dev</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Editar y crear archivos cifrados con GPG en Vim+http://elbauldelprogramador.com/editar-y-crear-archivos-cifrados-con-gpg-en-vim/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/editar-y-crear-archivos-cifrados-con-gpg-en-vim/&t=Editar y crear archivos cifrados con GPG en Vim+http://elbauldelprogramador.com/editar-y-crear-archivos-cifrados-con-gpg-en-vim/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Editar y crear archivos cifrados con GPG en Vim+http://elbauldelprogramador.com/editar-y-crear-archivos-cifrados-con-gpg-en-vim/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
---
id: 63
title: Como crear un PPA (Personal Package Archive)
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/como-crear-un-ppa-personal-package-archive/
permalink: /como-crear-un-repositorio-ppa-how/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2010/12/como-crear-un-repositorio-ppa-how.html
  - /2010/12/como-crear-un-repositorio-ppa-how.html
  - /2010/12/como-crear-un-repositorio-ppa-how.html
categories:
  - How To
  - linux
  - opensource
---
Hace poco hablé de qué eran los [sistemas de paquetes PPA][1], para los interesados en crear uno, a continuación voy a explicar como hacerlo, es bastante sencillo.

  
<!--more-->

  1. Antes de nada, debemos crear una cuenta en <a href="https://login.launchpad.net/+new_account" target="_blank">Launchpad</a>
  2. Una vez creada, nos dirigimos al panel principal de nuestra cuenta, que será https://launchpad.net/~NOMBRE_USUARIO.
  3. Ya en el panel de control, hay que hacer clic en &#8220;Create a new PPA&#8221;, que nos lleva a https://launchpad.net/~NOMBRE_USUARIO/+activate-ppa, en esta página rellenamos los datos de nuestro PPA y lo activamos.
  4. Tras activar el PPA, es necesario subir paquetes al sistema, hay <a target="_blank" href="https://help.launchpad.net/Packaging/PPA/Uploading">varias formas de hacerlo</a>, pero la más sencilla es la siguiente:
### FTP en Ubuntu 9.10 y posteriores:

Visita la página de información general de tu PPA, y encontrarás algo similar a:

*dput ppa: your-lp-id/ppa<source.changes>*

El archivo source.changes suele ser generado por debuild. Si no estás seguro de lo que esto significa, puedes familiarizarte con la creacion de paquetes para ubuntu <a target="_blank" href="https://wiki.ubuntu.com/PackagingGuide">aquí</a>

Si no estais en ubuntu se puede subir por FTP:

En primer lugar, hay que decirle a dput dónde enviar su paquete y por qué método. Para ello, editamos el archivo *~/dput.cf* para que quede así:

<pre>[my-ppa]
fqdn = ppa.launchpad.net
method = ftp
incoming = ~&lt;your_launchpad_id>/&lt;ppa_name>/ubuntu/
login = anonymous
allow_unsigned_uploads = 0
</pre>

También es necesario:

  * Cambiar la primera línea al nombre que desea utilizar para referirse al PPA, manteniendo los corchetes. No se puede usar el nombre ppa, ya que puede haber conflictos con una linea en /etc/dput.cf y causar fallos como (&#8216;Could not find person or team named&#8217;.)
  * Si estás subiendo el paquete a un equipo de PPA, hay que cambiar ~<your-launchpad-id> al nombre del equipo de Launchpad (Dejando la tilde (~)). Como es de esperar, debes ser miembro del equipo antes de poder subir el paquete a su PPA.
  * Fijar correctamente el <ppa-name>, por defecto es ppa, usad el nombre específico para otros PPA en el mismo contexto. No confundais el nombre del PPA con el nombre que habeis elegido para para mostrar el PPA en Launchpad.
  * A continuación, hay que abrir un terminal y escribir lo siguiente: 
    <pre>$  dput my-ppa P_V_source.changes</pre>
    
    Remplazad P con el nombre del paquete y V con el número de la versión. 
    
    Podéis ver posibles errores en la subida de paquetes <a href="https://help.launchpad.net/Packaging/UploadErrors" target="_blank">aqui.</a></li> </ul> </ol> 
    
    <div class="sharedaddy">
      <div class="sd-content">
        <ul>
          <li>
            <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Como crear un PPA (Personal Package Archive)+http://elbauldelprogramador.com/como-crear-un-repositorio-ppa-how/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-crear-un-repositorio-ppa-how/&t=Como crear un PPA (Personal Package Archive)+http://elbauldelprogramador.com/como-crear-un-repositorio-ppa-how/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Como crear un PPA (Personal Package Archive)+http://elbauldelprogramador.com/como-crear-un-repositorio-ppa-how/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/que-son-los-ppa-what-ppa-is/
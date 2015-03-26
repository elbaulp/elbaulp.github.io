---
id: 1947
title: Cambiar fondo en la pantalla de login en Debian y Ubuntu
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1947
permalink: /cambiar-fondo-en-la-pantalla-de-login-en-debian-y-ubuntu/
categories:
  - linux
tags:
  - cambiar fondo gdm3
  - cambiar fondo login debian
  - cambiar fondo login ubuntu
  - lightdm
---
<img src="http://elbauldelprogramador.com/content/uploads/2012/08/sh1.png" alt="Cambiar fondo en la pantalla de login en Debian y Ubuntu" width="128" height="128" class="thumbnail alignleft size-full wp-image-868" />

Si quieres personalizar la pantalla de bienvenida en Debian o Ubuntu, es posible cambiar el fondo de pantalla en unos cuantos pasos.

<!--more-->

### En Debian

#### Editando el archivo /etc/gdm3/greeter.gsettings

Añadiendo o modificando las siguientes líneas:

{% highlight bash %}># Theming options
[org.gnome.desktop.background]
picture-uri='file:///path/a/fondo'
picture-options='zoom'
{% endhighlight %}

La última línea puede tomar valores **&#8220;zoom&#8221;, &#8220;scaled&#8221;, &#8220;stretched&#8221;**. Tras editar el archivo hay que ejecutar el comando

{% highlight bash %}>dpkg-reconfigure gdm3
{% endhighlight %}

para aplicar los cambios.

### En Ubuntu

Hay que asegurarse que el fondo tenga permisos de lectura tanto para el usuario, el grupo y otros, esto se puede lograr con

{% highlight bash %}>$ chmod 644 &lt;nombre_fondo>
{% endhighlight %}

Ahora seguimos los siguientes pasos:

{% highlight bash %}>sudo -i
{% endhighlight %}

Introducimos la contraseña, luego permitimos al usuario *lightdm* conectarse al servidor X (La pantalla):

{% highlight bash %}>xhost +SI:localuser:lightdm
{% endhighlight %}

Nos loggeamos como el usuario *lightdm*:

{% highlight bash %}>su lightdm -s /bin/bash
{% endhighlight %}

Desactivamos el cambio dinámico de fondos de pantalla:

{% highlight bash %}>gsettings set com.canonical.unity-greeter draw-user-backgrounds 'false'
{% endhighlight %}

Cambiar el fondo por uno de nuestra elección:

{% highlight bash %}>gsettings set com.canonical.unity-greeter background '/foo/wallpaper.png'
{% endhighlight %}

Hay que tener en cuenta que, si nuestro */home/* está [cifrado][1], no podemos especificar un fondo que esté dentro de ese directorio, puesto que la partición */home* aún no estará descifrada en la pantalla de login.

### En Xubuntu

La imagen se encuentra en `/usr/share/xfce4/backdrops/xubuntu-wallpaper.png` como un enlace simbólico, basta con ver a dónde apunta ese enlace y reemplazarlo con la imagen deseada. En mi caso dicha imagen era `xubuntu-trusty.png`, situada en el mismo directorio. Lo más fácil sería hacer:

{% highlight bash %}>sudo cp ruta/imagen/deseada /usr/share/xfce4/backdrops/xubuntu-trusty.png
{% endhighlight %}

[<img src="http://elbauldelprogramador.com/content/uploads/2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg" alt="Cambiar fondo en la pantalla de login en Debian y Ubuntu" width="3264" height="2448" class="aligncenter size-full wp-image-1982" />][2]{.thumbnail}

#### Referencias

*Debian* **|** <a href="http://lists.debian.org/debian-desktop/2012/03/msg00054.html" target="_blank">lists.debian.org</a>  
*Ubuntu* **|** <a href="http://askubuntu.com/questions/64001/how-do-i-change-the-wallpaper-in-lightdm" target="_blank">askubuntu.com</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cambiar fondo en la pantalla de login en Debian y Ubuntu+http://elbauldelprogramador.com/cambiar-fondo-en-la-pantalla-de-login-en-debian-y-ubuntu/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/cambiar-fondo-en-la-pantalla-de-login-en-debian-y-ubuntu/&t=Cambiar fondo en la pantalla de login en Debian y Ubuntu+http://elbauldelprogramador.com/cambiar-fondo-en-la-pantalla-de-login-en-debian-y-ubuntu/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cambiar fondo en la pantalla de login en Debian y Ubuntu+http://elbauldelprogramador.com/cambiar-fondo-en-la-pantalla-de-login-en-debian-y-ubuntu/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/seguridad/como-cifrar-archivos-con-openssl/ "Cómo cifrar archivos con openssl"
 [2]: http://elbauldelprogramador.com/content/uploads/2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg
---
id: 1947
title: Cambiar fondo en la pantalla de login en Debian y Ubuntu

layout: post
guid: https://elbauldelprogramador.com/?p=1947
permalink: /cambiar-fondo-en-la-pantalla-de-login-en-debian-y-ubuntu/
categories:
  - linux
tags:
  - cambiar fondo gdm3
  - cambiar fondo login debian
  - cambiar fondo login ubuntu
  - lightdm
image:
  thumb: 2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg
excerpt: "Si quieres personalizar la pantalla de bienvenida en Debian o Ubuntu, es posible cambiar el fondo de pantalla en unos cuantos pasos."
modified: 2015-12-29T10:20
---
<figure>
  <a href="/images/2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg"><img src="/images/2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg" title="{{ page.title }}" alt="{{ page.title }}" /></a>
</figure>

Si quieres personalizar la pantalla de bienvenida en Debian o Ubuntu, es posible cambiar el fondo de pantalla en unos cuantos pasos.

<!--ad-->

### En Debian

#### Editando el archivo /etc/gdm3/greeter.gsettings

Añadiendo o modificando las siguientes líneas:

{% highlight bash %}# Theming options
[org.gnome.desktop.background]
picture-uri='file:///path/a/fondo'
picture-options='zoom'
{% endhighlight %}

La última línea puede tomar valores **&#8220;zoom&#8221;, &#8220;scaled&#8221;, &#8220;stretched&#8221;**. Tras editar el archivo hay que ejecutar el comando

{% highlight bash %}dpkg-reconfigure gdm3
{% endhighlight %}

para aplicar los cambios.

### En Ubuntu

Hay que asegurarse que el fondo tenga permisos de lectura tanto para el usuario, el grupo y otros, esto se puede lograr con

{% highlight bash %}$ chmod 644 <nombre_fondo>
{% endhighlight %}

Ahora seguimos los siguientes pasos:

{% highlight bash %}sudo -i
{% endhighlight %}

Introducimos la contraseña, luego permitimos al usuario *lightdm* conectarse al servidor X (La pantalla):

{% highlight bash %}xhost +SI:localuser:lightdm
{% endhighlight %}

Nos loggeamos como el usuario *lightdm*:

{% highlight bash %}su lightdm -s /bin/bash
{% endhighlight %}

Desactivamos el cambio dinámico de fondos de pantalla:

{% highlight bash %}gsettings set com.canonical.unity-greeter draw-user-backgrounds 'false'
{% endhighlight %}

Cambiar el fondo por uno de nuestra elección:

{% highlight bash %}gsettings set com.canonical.unity-greeter background '/foo/wallpaper.png'
{% endhighlight %}

Hay que tener en cuenta que, si nuestro */home/* está [cifrado][1], no podemos especificar un fondo que esté dentro de ese directorio, puesto que la partición */home* aún no estará descifrada en la pantalla de login.

### En Xubuntu

La imagen se encuentra en `/usr/share/xfce4/backdrops/xubuntu-wallpaper.png` como un enlace simbólico, basta con ver a dónde apunta ese enlace y reemplazarlo con la imagen deseada. En mi caso dicha imagen era `xubuntu-trusty.png`, situada en el mismo directorio. Lo más fácil sería hacer:

{% highlight bash %}sudo cp ruta/imagen/deseada /usr/share/xfce4/backdrops/xubuntu-trusty.png
{% endhighlight %}

<figure>
  <a href="/images/2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg"><img src="/images/2013/11/Cambiar-fondo-en-la-pantalla-de-login-en-Debian-y-Ubuntu.jpg" title="{{ page.title }}" alt="{{ page.title }}" /></a>
</figure>

#### Referencias

*Debian* »» <a href="http://lists.debian.org/debian-desktop/2012/03/msg00054.html" target="_blank">lists.debian.org</a>  
*Ubuntu* »» <a href="http://askubuntu.com/questions/64001/how-do-i-change-the-wallpaper-in-lightdm" target="_blank">askubuntu.com</a>

[1]: https://elbauldelprogramador.com/como-cifrar-archivos-con-openssl/ "Cómo cifrar archivos con openssl"

{% include _toc.html %}

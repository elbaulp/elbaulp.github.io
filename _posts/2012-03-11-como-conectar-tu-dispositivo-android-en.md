---
id: 353
title: Cómo conectar tu dispositivo Android en Linux al adb para depurar y desarrollar aplicaciones
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/como-conectar-tu-dispositivo-android-en-linux-al-adb-para-depurar-y-desarrollar-aplicaciones/
permalink: /como-conectar-tu-dispositivo-android-en/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2012/03/como-conectar-tu-dispositivo-android-en.html
  - /2012/03/como-conectar-tu-dispositivo-android-en.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551690}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551690}'
share_count:
  - 0
  - 0
categories:
  - android
  - aplicaciones
  - How To
tags:
  - curso android pdf
---
Ya me ha sucedido en varias ocasiones que he intentado conectar mi **Samsung Galaxy S** al **adb** del SDK de Android y he tenido que buscar durante un rato en internet como solucionar el siguiete problema:

{% highlight bash %}>$ adb devices
List of devices attached
???????????? no permissions{% endhighlight %}

Así que a modo de recordatorio para mi, y para que a otras personas con el mismo problema puedan solucionarlo, escribo esta entrada.

<a name="more"></a>

Para empezar ejecutamos el comando **lsusb**:

{% highlight bash %}Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 002: ID 046d:c03e Logitech, Inc. Premium Optical Wheel Mouse (M-BT58)
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
<strong>Bus 002 Device 006: ID 04e8:681c Samsung Electronics Co., Ltd Galaxy Portal/Spica/S</strong>
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0bda:8187 Realtek Semiconductor Corp. RTL8187 Wireless Adapter
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub{% endhighlight %}

De estas líneas nos interesa la que está en negrita, donde vamos a usar el verdor ID, que es 04e8 para el caso de mi Samsung. A continuación seguimos los siguientes pasos:

&#8211; Es necesario que tengamos habilitado las fuentes desconocidas en el teléfono (Ajustes->Aplicaciones y marcamos la casilla), Así como permitir el USB debugging (Ajustes->Aplicaiones->Desarrollo).

&#8211; El siguiente paso es crear un archivo llamado *51-android.rules* bajo el directorio */etc/udev/rules.d/*, y añadimos

{% highlight bash %}>SUBSYSTEM=="usb", ATTRS{idVendor}=="04e8", SYMLINK+="android_adb", MODE="0666", OWNER="nombre-de-usuario"{% endhighlight %}

Donde tendremos que poner en idVendor el número que nos daba como resultado el comando lsusb, y en el propietario nuestro nombre de usuario.

Guardamos el fichero y reiniciamos el servicio udev

{% highlight bash %}>sudo restart udev{% endhighlight %}

ó

{% highlight bash %}>sudo /etc/init.d/udev restart{% endhighlight %}

Tambíen tenemos que finalizar el adb

{% highlight bash %}>./adb kill-server{% endhighlight %}

Desconectamos el teléfono del usb y lo volvemos a enchufar, Ahora el resultado de *adb devices* debería ser algo así:

{% highlight bash %}>./adb devices
List of devices attached
900339eb5012 device{% endhighlight %}

<p class="alert">
  Aún así, en mi caso sigue sin reconocer el dispositivo, tras buscar y buscar encontré que este problema se soluciona renombrando el archivo <span style="color: #f00;">51-android.rules</span> a <span style="color: #f00;">91-android.rules</span>
</p>

Fuente: <a href="http://dimitar.me/how-to-connect-your-android-phone-to-ubuntu-to-do-developmenttestinginstallations-or-tethering/" target="_blank">dimitar.me</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo conectar tu dispositivo Android en Linux al adb para depurar y desarrollar aplicaciones+http://elbauldelprogramador.com/como-conectar-tu-dispositivo-android-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-conectar-tu-dispositivo-android-en/&t=Cómo conectar tu dispositivo Android en Linux al adb para depurar y desarrollar aplicaciones+http://elbauldelprogramador.com/como-conectar-tu-dispositivo-android-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo conectar tu dispositivo Android en Linux al adb para depurar y desarrollar aplicaciones+http://elbauldelprogramador.com/como-conectar-tu-dispositivo-android-en/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
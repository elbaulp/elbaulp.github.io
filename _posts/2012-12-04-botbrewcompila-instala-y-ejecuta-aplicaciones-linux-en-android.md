---
id: 1037
title: BotBrew basil, Compila, instala y ejecuta aplicaciones Linux en Android
author: Alejandro Alcalde
layout: post
guid: /?p=1037
permalink: /botbrewcompila-instala-y-ejecuta-aplicaciones-linux-en-android/
fsb_social_twitter:
  - 11
fsb_social_facebook:
  - 20
categories:
  - android
  - Artículos
tags:
  - botbrew basil
  - como instalar aplicaciones de linux a android
  - curso android pdf
  - debian en android
  - samsung galaxy scl gti9003
  - xda
---
<img class="alignleft size-full wp-image-1038" title="linux-apps-on-android" src="http://elbauldelprogramador.com/content/uploads/2012/12/linux-apps-on-android1.jpg" alt="" width="373" height="294" />

Leyendo noticias en mi lector RSS he encontrado un artículo interesante que comparto con vosotros.  
Se trata de un programa que permitirá tener un sistema debian básico en el dispostivo.

**Paso 1:** Instalar busybox (Herramienta que provee de varias utilidades estándares de Unix) desde la play Store, (Requiere [root][1]) En caso de que el teléfono no esté rooteado, puedes seguir los pasos indicados en el vídeo de más abajo.

**Paso 2: **Para conseguir que tu dispositivo sea aún más poderoso, instala <a href="https://play.google.com/store/apps/details?id=com.botbrew.basil" target="_blank">BostBrew Basil</a>, esta aplicación inicializa el sistema base y permite manejar la instalación de paquetes mediante Dpkg y Apt en lugar de Opkg. Permitiendo instalar algunos paquetes linux.

**Paso 3: **Instalar los paquetes necesarios  
  
<!--more-->

  
Conectamos el teléfono al pc mediante adb con `./adb shell` y ejecutamos los comandos de **botbrew** así:

<pre lang="bash">/data/botbrew-basil/init -- comando aquí
</pre>

Es decir, para instalar un entorno debian completo, se haría lo siguiente:

<pre lang="bash">sh-4.1# /data/botbrew-basil/init -- apt-get install repository-emdebian
sh-4.1# /data/botbrew-basil/init -- apt-get install debianbotbrew-debian-minimal
</pre>

Existe la posibilidad de instalar el paquete **botbrew-wrapper** para evitar tener que preceder los comandos con la ruta mencionada arriba:

<pre lang="bash">shell@android:/ # /data/botbrew-basil/init -- apt-get install botbrew-wrapper
</pre>

A partir de ahora basta con ejecutar el comando **botbrew2** y seguidamente los comandos deseados, por ejemplo, para isntalar gcc y g++:

<pre lang="bash">shell@android:/ # su
shell@android:/ # botbrew2
shell@android:/ # apt-get install gcc g++
</pre>

Instalados los compiladores, podemos ejecutar aplicaciones escritas en C/C++, probemos con un hola Mundo:

<pre lang="cpp">#include &lt;iostream>

int main(){
   std::cout &lt;&lt; "Hola mundo!" &lt;&lt; std::endl;   
   std::cout &lt;&lt; "Compilado y ejecutado desde Android" &lt;&lt; std::endl;
   return 0; 
}
</pre>

Ya solo queda compilarlo y ejecutarlo, dejo una captura de pantalla como prueba de que funciona:

<img src="http://elbauldelprogramador.com/content/uploads/2012/12/Screenshot_2012-12-04-17-14-141.png" alt="" title="Compilando código C/C++ en android" width="800" height="480" class="aligncenter size-full wp-image-1039" />

Y no solo eso, también podemos instalar python:

<pre lang="python">shell@android:/tmp # apt-get install python2.7-minimal
shell@android:/ # cd /tmp
shell@android:/ # echo "print "Hola Mundo desde Android!"" >> hello.py
shell@android:/ # python2.7 hello.py
Hola Mundo desde Android!
</pre>

De nuevo, com prueba, una captura de pantalla:  
<img src="http://elbauldelprogramador.com/content/uploads/2012/12/Screenshot_2012-12-04-17-32-141.png" alt="" title="Ejecutando programas en python desde Android" width="800" height="480" class="aligncenter size-full wp-image-1040" />

A continuación un vídeo explicando el proceso de instalación de busybox sin permisos de root:



### Referencias

*Geeknizer* **|** <a href="http://geeknizer.com/install-run-linux-applications-on-android/" target="_blank">Visitar sitio</a>  
*XDA-Developers* **|** <a href="http://forum.xda-developers.com/showpost.php?p=26261600&#038;postcount=119" target="_blank">Visitar sitio</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=BotBrew basil, Compila, instala y ejecuta aplicaciones Linux en Android+http://elbauldelprogramador.com/botbrewcompila-instala-y-ejecuta-aplicaciones-linux-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/botbrewcompila-instala-y-ejecuta-aplicaciones-linux-en-android/&t=BotBrew basil, Compila, instala y ejecuta aplicaciones Linux en Android+http://elbauldelprogramador.com/botbrewcompila-instala-y-ejecuta-aplicaciones-linux-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=BotBrew basil, Compila, instala y ejecuta aplicaciones Linux en Android+http://elbauldelprogramador.com/botbrewcompila-instala-y-ejecuta-aplicaciones-linux-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /aplicaciones/rootear-samsung-galaxy-s-gt-i9003/ "Rootear Samsung Galaxy S GT-I9003"
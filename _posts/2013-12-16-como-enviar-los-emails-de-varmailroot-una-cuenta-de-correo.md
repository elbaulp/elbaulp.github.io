---
id: 2041
title: Cómo enviar los emails de /var/mail/root a una cuenta de correo

layout: post
guid: http://elbauldelprogramador.com/?p=2041
permalink: /como-enviar-los-emails-de-varmailroot-una-cuenta-de-correo/
categories:
  - Administración de Servidores
tags:
  - /var/mail/root a gmail
  - enviar mensajes del sistema a correo
---
<div class="column column-1-6">
  <div class="wi-progress-container">
    <div class="wi-progress" data-percent="10" data-color="#222" data-thickness="3" data-size="100">
      <span class="number" style="font-size:22.666666666667px;"></span><sup class="percent" style="font-size:13.333333333333px;">%</sup>
    </div>
    
    <div class="progress-title" style="font-size:12px;">
      Dificultad
    </div>
  </div>
</div>

<div class="column column-last column-5-6">
  En sistemas operativos como <a href="http://elbauldelprogramador.com/?s=debian">Debian</a>, muchos de los programas y demonios envían mensajes al usuario <em>root</em> para informar del estado del sistema. Los mensajes se almacenan en el archivo <em>/var/mail/root</em>. El problema es que se almacena el correo en texto plano, es decir, con todas las cabeceras típicas del protocolo de correo. Pueden usarse programas como <strong>mutt</strong> para administrar los mensajes. Sin embargo, considero más organizado redireccionar todos los mensajes a una cuenta de correo típica.
</div>

<div class="clearfix">
</div>

<!--more-->

## Requisitos

Es necesario que el sistema tenga instalado el programa **sendmail**.

## Configurar el reenvío

Normalmente, la configuración del reenvío de correo se realiza en el archivo **/etc/aliases**, un ejemplo del contenido de este archivo es:

{% highlight bash %}># /etc/aliases
mailer-daemon: postmaster
postmaster: root
nobody: root
hostmaster: root
usenet: root
news: root
webmaster: root
www: root
ftp: root
abuse: root
noc: root
security: root
clamav: root
{% endhighlight %}

Como vemos, todo se redirecciona a la cuenta local del usuario *root*. Bastaría con redireccionar la cuenta *root* a una dirección de correo para obtener todos los mensajes del sistema en nuestra bandeja de entrada, y tener así nuestro servidor un poco más controlado. Para ello añadimos en el archivo anterior la siguiente línea:

{% highlight bash %}># Redireccionar todo el correo de root a mi cuenta
root: direccion@correo.com
{% endhighlight %}

Para aplicar los cambios hay que ejecutar el comando <span class="highlight style-2">newaliases</span>.

A partir de ahora, recibiremos en nuestra bandeja de entrada los mensajes del sistema, podemos crear un filtro si usamos gmail para organizarlos y quitarlos de la bandeja principal.

#### Referencias

*How to send emails stored in /var/spool/mail/root to a gmail inbox* **|** <a href="http://serverfault.com/questions/554922/how-to-send-emails-stored-in-var-spool-mail-root-to-a-gmail-inboxbr/" target="_blank">serverfault.com</a> 


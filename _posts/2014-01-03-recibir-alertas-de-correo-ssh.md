---
id: 2042
title: 'Recibir alertas de correo al acceder al  sistema mediante SSH'

layout: post
guid: http://elbauldelprogramador.com/?p=2042
permalink: /recibir-alertas-de-correo-ssh/
categories:
  - Administración de Servidores
tags:
  - alertar ssh
  - correo ssh
  - seguridad ssh
---
Hemos visto en otros artículos varias maneras de mejorar la seguridad en un servidor, medidas tales como:

  * [Combatir los comentarios de Spam en WordPress][1]
  * [Bloquear ataques de fuerza bruta en nginx y WordPress con Fail2Ban][2]
  * [Bloquear una IP atacando el servidor mediante IPtables][3]

Hoy veremos cómo recibir alertas de correo SSH cada vez que un usuario logre acceder al sistema mediante este protocolo. El artículo original es de <a href="http://www.tecmint.com" title="TecMint" target="_blank">tecmint</a>.

<!--more-->

En linux, cada vez que un usuario accede al sistema, el archivo *.bashrc* se ejecuta. De modo que si añadimos a dicho archivo una sentencia que nos envíe un correo, lograremos monitorizar los accesos al sistema. Antes hay que instalar un cliente de correo, aunque al ser un servidor, es probable que ya exista uno instalado.

## Instalar MailX

{% highlight bash %}apt-get install mailx
{% endhighlight %}

## Modificar el archivo .bashrc

Para cada usuario del que deseemos recibir alertas, habrá que añadir la siguiente línea a su *bashrc*:

{% highlight bash %}echo 'ALERTA - Acceso a la Shell (ServerName) el:' `date` `who` | mail -s "Alerta: Acceso shell de `who | cut -d'(' -f2 | cut -d')' -f1`" correo@electrónico.com
{% endhighlight %}

Listo, ahora recibiremos un correo por cada acceso al sistema.

#### Referencias

*How to Get Root and User SSH Login Email Alerts* **|** <a href="http://www.tecmint.com/get-root-ssh-login-email-alerts-in-linux" target="_blank">tecmint.com</a> 



 [1]: http://elbauldelprogramador.com/combatir-los-comentarios-de-spam-en-wordpress/ "Combatir los comentarios de spam en WordPress"
 [2]: http://elbauldelprogramador.com/bloquear-ataques-de-fuerza-bruta-en-nginx-y-wordpress-con-fail2ban/ "Bloquear ataques de fuerza bruta en Nginx y WordPress con Fail2Ban"
 [3]: http://elbauldelprogramador.com/bloquear-una-ip-atacanto-el-servidor-mediante-iptables/ "Bloquear una IP atacando el servidor mediante iptables"
---
id: 1394
title: Saltarse la autentificación de dos factores de Google
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1394
permalink: /saltarse-la-autentificacion-de-dos-factores-de-google/
categories:
  - Artículos
  - Informática
  - noticias
tags:
  - android
  - autenficacion de dos pasos
  - autentificación de dos factores
  - duo security
  - google
  - saltar autentificacion de dos factores
---
***Dou Security*** encontró un agujero de seguridad del sistema de autentificación de Google que permitía ganar control total sobre la [autentificación de dos factores de Google][1] y controlar las cuentas de Gmail haciendo uso de la única contraseña usada para conectarse a aplicaciones individuales de google.

<img src="http://elbauldelprogramador.com/content/uploads/2013/03/Bypassing-Google-Two-Factor-Authentication.jpg" alt="Bypassing Google Two Factor Authentication" width="460" height="349" class="thumbnail aligncenter size-full wp-image-1395" />  
  
<!--more-->

  
La vulnerabilidad está en la implementación del mecanismo de auto-login en la ultima versión del navegador Chrome para Android. Dicha vulnerabilidad permitión a Duo Security usar un ASP (Application-Specific-Password) para ganar acceso al panel de recuperación de cuentas de Google y gestionar la configuración de la autentificación de dos factores.

El auto-login permite a los usuarios que han enlazado sus dispositivos móviles o ChromeBooks a su cuenta de Google acceder automáticamente a todas las páginas que tienen que ver con aplicaciones de Google sin necesidad de insertar los datos de login.

<img src="http://elbauldelprogramador.com/content/uploads/2013/03/android_autologin.png" alt="android_autologin" width="300" height="500" class="thumbnail aligncenter size-full wp-image-1396" />

Duo Security dijo en <a href="https://blog.duosecurity.com/2013/02/bypassing-googles-two-factor-authentication/" target="_blank">su blog</a>:

> *  
> “Normalmente, una vez activada la autentificación en dos factores, Google te pide que crees contraseñas específicas para cada aplicación que uses. Lo cual quiere decir que dichas aplicaciones no soportan el login usando la autentificación en dos pasos.”*
> 
> *“Luego, se usa un ASP en lugar de tu contraseña real. En términos más concretos, Se crean ASPs para la mayoría de aplicaciones cliente que no usan un login basado en Web: clientes email que usen IMAP y SMTP (Mail de Apple, Thunderbird etc); clientes de chat con comunicaciones mediante XMPP (Adium, pidgin etc) y aplicaciones de calendarios que se sincronizan usando CaIDAV (iCal, etc)”*

<img src="http://elbauldelprogramador.com/content/uploads/2013/03/gauth_break_sm1.png" alt="gauth_break_sm1" width="640" height="393" class="thumbnail aligncenter size-full wp-image-1397" />

Las ASPs son Tokens especializados generados para cada aplicación que el usuario usa en lugar de la combinación contraseña/token. Duo Security descubrió que los ASPs en ralidad no eran específicos para aplicaciones, de hecho, un único código podría usarse para loggearse en casi cualquier aplicación Web de Google debido a la característica del auto-login.

> *“En definitiva, usando solamente un nombre de usuario, un ASP y una simple petición a https://android.clients.google.com/auth, es posible acceder a cualquier aplicación web de Google sin necesidad de que se nos soliciten datos de login (o verificación en dos pasos)”* 

Los investigadores comunicaron la vulnerabilidad a Google y el problema ya ha sido arreglado.

#### Fuente

*Bypassing Google’s Two-Factor Authentication* **|** <a href="http://thehackernews.com/2013/02/bypassing-google-two-factor.html" target="_blank">thehackernews.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Saltarse la autentificación de dos factores de Google+http://elbauldelprogramador.com/saltarse-la-autentificacion-de-dos-factores-de-google/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/saltarse-la-autentificacion-de-dos-factores-de-google/&t=Saltarse la autentificación de dos factores de Google+http://elbauldelprogramador.com/saltarse-la-autentificacion-de-dos-factores-de-google/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Saltarse la autentificación de dos factores de Google+http://elbauldelprogramador.com/saltarse-la-autentificacion-de-dos-factores-de-google/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /articulos/todos-los-lugares-donde-deberias-habilitar-autenticacion-de-dos-factores-ahora-mismo/ "Todos los lugares donde deberías habilitar la Autenticación de Dos Factores ahora mismo"
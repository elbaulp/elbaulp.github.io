---
id: 2391
title: Chuleta de comandos para GPG
author: Luzcila
layout: post
guid: http://elbauldelprogramador.com/?p=2391
permalink: /chuleta-de-comandos-para-gpg/
categories:
  - Artículos
  - How To
tags:
  - chuleta de comandos gpg
  - gpg
  - manual gpg
  - tutorial gpg
---
Si encontraste esta página, por suerte es lo que estabas buscando, una pequeña chuleta de comandos para [GPG][1]. Si encuentras algún error, no dudes en comentarlo.

He usado el “**Nombre de Usuario**” como el nombre asociado a la clave. Perdón si no es muy imaginativo. Creo que GPG es bastante amplio en sus asignaciones de usuario, por ejemplo el nombre para mi clave privada es *Charles Lockhart*, pero puedo referenciarlo simplemente poniendo Lockhart.

Empecemos:

<!--more-->

### Crear una clave

<pre lang="bash">gpg --gen-key</pre>

Generalmente puedes seleccionar las que vienen por defecto.

### exportar una clave pública dentro del archivo *public.key*

<pre lang="bash">gpg --export -a "Nombre de Usuario" > public.key</pre>

Esto creará un archivo llamado *public.key* con la representación ascii de la clave pública para Nombre de Usuario. Esto es una variación de:

<pre lang="bash">gpg --export</pre>

el cual por sí mismo básicamente va a imprimir un montón de porquerías en tu pantalla. Recomiendo no hacerlo.

<pre lang="bash">gpg --export -a “Nombre de Usuario"</pre>

imprime la clave pública para el ‘Nombre de Usuario’ en la línea de comandos, lo cual es medio útil para exportar una clave privada:

<pre lang="bash">gpg --export-secret-key -a "Nombre de Usuario" > private.key</pre>

Esto creará un archivo llamado *private.key* con la representación ascii de la clave privada para ‘Nombre de Usuario’.

Es muy parecido a exportar una clave pública, pero tienes que pisar algunas protecciones que vienen por default. Hay una nota (*) al pie explicando porqué desearías hacer esto.

### importar una clave pública

<pre lang="bash">gpg --import public.key</pre>

Si encontraste esta página, por suerte es lo que estabas buscando  
Esto agrega la clave pública en el archivo “*public.key*” a tu anillo de claves públicas.

### importar una clave privada

<pre lang="bash">gpg --allow-secret-key-import --import private.key</pre>

Esto agrega una clave privada en el archivo “*private.key*” a tu anillo de claves privadas. Hay una nota (*) al pie explicando porqué desearías hacer esto.

### eliminar una clave pública (de tu anillo de claves públicas):

<pre lang="bash">gpg --delete-key "Nombre de Usuario"</pre>

Esto elimina la clave pública de tu anillo de claves públicas.

¡ATENCIÓN! Si hay una clave privada en tu anillo de claves privadas asociada con esta clave pública, ¡tendrás un error! Debes primero eliminar tu clave privada para este par de claves de tu anillo de claves privadas.

### eliminar una clave secreta (una clave de tu anillo de claves secreta)

<pre lang="bash">gpg --delete-secret-key "Nombre de Usuario"</pre>

Esto elimina la clave secreta de tu anillo de claves secretas.

### listar las claves de tu anillo de claves públicas

<pre lang="bash">gpg --list-keys</pre>

### listar las claves de tu anillo de claves secretas

<pre lang="bash">gpg --list-secret-keys</pre>

### generar una lista corta de números que puedes usar a través de un método alternativo para verificar la clave pública

<pre lang="bash">gpg --fingerprint > fingerprint</pre>

Esto crea el archivo fingerprint con la información de la firma digital.

### encriptar datos

<pre lang="bash">gpg -e -u "Nombre de Usuario del Emisor" -r "Nombre de Usuario del Destinatario" <em>somefile</em></pre>

Aquí hay algunas opciones útiles, como por ejemplo -u para especificar la clave secreta que será utilizada, y -r para especificar la clave pública del destinatario.  
Como por ejemplo:

<pre lang="bash">gpg -e -u "Manuel Ginobili" -r “Un amigo" mydata.tar</pre>

Esto debería crear un archivo llamado “*mydata.tar.gpg*” que contiene la información encriptada. Pienso que se debe especificar el nombre de usuario del emisor para que el destinatario pueda verificar que el contenido proviene de esa persona (¿Utilizando su firma digital?)  
NOTA: *mydata.tar* no se elimina, terminas teniendo dos archivos, por lo tanto si quieres tener sólo el archivo encriptado, deberás eliminar *mydata.tar* tú mismo.  
Un interesante comentario al margen, encripté el patch preventivo del kernel, un archivo de 55,247 bytes, y terminé con un archivo encriptado de 15,276 bytes.

### desencriptar datos

<pre lang="bash">gpg -d mydata.tar.gpg</pre>

Si tienes múltiples claves secretas, el comando elegirá la correcta, o mostrará un error si la correcta no existe. Se te pedirá que ingreses tu passphrase. Luego de ello existirá el archivo “*mydata.tar*”, y el “original” encriptado, *mydata.tar.gpg*.  
NOTA: cuando originalmente escribí este borrador, era como funcionaba en mi sistema, sin embargo parece que ahora “gpg -d* mydata.tar.gpg*” vuelca el contenido del archivo a la salida standard. La forma alternativa (que funciona en mi sistema, de todos modos) sería utilizar 

<pre lang="bash">gpg --o archivodesalida -d archivoencriptado.gpg</pre>

, o utilizar *mydata.tar.gpg* como por ejemplo, 

<pre lang="bash">gpg -o mydata.tar -d mydata.tar.gpg</pre>

Otra alternativa es ejecutar algo como 

<pre lang="bash">gpg -d mydata.tar.gpg > mydata.tar</pre>

y simplemente enviar la salida dentro de un archivo. Pareciera funcionar de la misma manera.  
Ok, entonces si eres un paranoico y quieres encriptar alguno de tus propios archivos, para que nadie pueda entrar en tu computadora y obtenerlos, simplemente encríptalos usandote a tí mismo como el contenedor.

No he utilizado estos comandos:

<pre lang="bash">gpg --edit-key</pre>

<pre lang="bash">gpg --gen-revoke</pre>

`--gen-revoke` crea un certificado de revocación, el cual es distribuido a los usuarios y los servidores de claves te dicen que tu clave ya no es más válida. Mira: <a href="http://www.gnupg.org/gph/en/manual/r721.html" target="_blank">http://www.gnupg.org/gph/en/manual/r721.html</a>.

`--edit-key` te permite hacer una colección de operaciones con las claves. Mira: <a href="http://www.gnupg.org/gph/en/manual/r899.html" target="_blank">http://www.gnupg.org/gph/en/manual/r899.html</a>

<span style="text-decoration: underline;"><strong>Compartir Claves Secretas</strong></span>  
NOTA: los siguientes casos de uso indican porqué los comandos secret-key import/export existen, o al menos un par de ideas de qué puedes hacer con ellos. SIN EMBARGO, hay un poco de logística necesaria para compartir la clave secreta. ¿Cómo la pasamos de una computadora a otra? Creo que encriptarla y enviarla por e-mail probablemente estaría bien, pero yo no la enviaría desencriptada con e-mail, esto sería PELIGROSO.

  1. Caso de Uso 1: Arriba están mencionados los comandos para exportar e importar las claves secretas, y quiero explicar una razón por la cual probablemente quieras hacer esto. Básicamente si quieres un par de claves para todas tus computadoras (asumiento que tienes múltiples computadoras), entonces esto te permitirá exportar ese par de claves de la computadora original e importarla en las otras computadoras.
  2. Caso de Uso 2: Arriba están mencionados los comandos para exportar e importar las claves secretas, y quiero explicar una razón por la cual probablemente quieras hacer esto. Básicamente, si perteneces a un grupo, y quisieras crear un par de clave simple para ese grupo, una persona debería crear el par de claves, luego exportar las claves pública y privada, darselas a los otros miembros del grupo y ellos deberían importar ese par. Luego un miembro del grupo o alguien afuera podría utilizar la clave pública del grupo, encriptando el mensaje y/o los datos, y enviándolo a los miembros del grupo, y todos ellos deberían poder tener acceso al mensaje y/o los datos. Basicamente, podrías crear un sistema simplificado donde sólo una clave pública es requerida para enviar cosas encriptadas a múltiples destinatarios.

&nbsp;

### Referencias

*Quick'n easy gpg cheatsheet* **|** <a href="http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/gpg-cs.html" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Chuleta de comandos para GPG+http://elbauldelprogramador.com/chuleta-de-comandos-para-gpg/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/chuleta-de-comandos-para-gpg/&t=Chuleta de comandos para GPG+http://elbauldelprogramador.com/chuleta-de-comandos-para-gpg/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Chuleta de comandos para GPG+http://elbauldelprogramador.com/chuleta-de-comandos-para-gpg/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/como-cifrar-correos-con-gpg-con-mailvelope/ "Cómo cifrar correos con GPG usando Mailvelope"
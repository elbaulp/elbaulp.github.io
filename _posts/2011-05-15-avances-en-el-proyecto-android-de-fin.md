---
id: 190
title: 'Avances en el proyecto Android de fin de curso [WifiBar]'

layout: post
guid: http://elbauldelprogramador.org/avances-en-el-proyecto-android-de-fin-de-curso-wifibar/
permalink: /avances-en-el-proyecto-android-de-fin/
categories:
  - android
  - aplicaciones
  - opensource
tags:
  - curso android pdf
main-class: "android"
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Como ya sabéis tengo que realizar un proyecto de fin de curso, el cual ya expliqué en [qué consistía][1], y escribo esta entrada para mostraros un poco los avances que voy haciendo.

He de decir que el proyecto no lo estoy haciendo solo, lo formamos un equipo de 3 personas compañeros de clase. Nos repartimos las tareas para que uno se encargara de hacer la [base de datos][2], otro la interfaz gŕafica y yo lo que viene siendo la programación interna del programa (Conectar a la base de datos, mandar y recibir consultas, manejar los datos, rellenar los elementos gŕaficos con estos datos etc). El código está bajo licencia [GPLv3.0][3]

A continuación voy a explicar mediante capturas de pantalla algunas funcionalidades que tiene el programa.

Icono de la aplicación


<!--ad-->

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://1.bp.blogspot.com/-7UI6P-RRixQ/TdAVCyzDQ6I/AAAAAAAAAeY/SZHOWPXVFcg/s1600/icono.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="320" width="195" src="https://1.bp.blogspot.com/-7UI6P-RRixQ/TdAVCyzDQ6I/AAAAAAAAAeY/SZHOWPXVFcg/s320/icono.png" /></a>
</div>

Lo primero que hace la aplicación al iniciarse, es comprobar que la red WiFi del dispositivo esté activada, en caso de no estarla, se notifica al usuario y se sale de la aplicación, ya que sin conexión no es funcional.

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/-iZj8DYLsOEk/TdAO0_aJG_I/AAAAAAAAAdw/yfXZ9wAuX5E/s1600/noWifi.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="320" width="196" src="https://3.bp.blogspot.com/-iZj8DYLsOEk/TdAO0_aJG_I/AAAAAAAAAdw/yfXZ9wAuX5E/s320/noWifi.png" /></a>
</div>

En segundo lugar se comprueba que la conexión con el servidor (donde se encuentra la base de datos) esté establecida, en caso negativo, se muestra otro mensaje de error y se finaliza

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-fTXix1DkoxI/TdAQO7DotiI/AAAAAAAAAd4/zak_5vQrvzc/s1600/noServer.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="320" width="195" src="https://2.bp.blogspot.com/-fTXix1DkoxI/TdAQO7DotiI/AAAAAAAAAd4/zak_5vQrvzc/s320/noServer.png" /></a>
</div>

Si ninguno de los mensajes de arriba se muestra, entramos en la primera Activity (en la cual se consultará a la base de datos la información necesaria para esta actividad), en la que debemos seleccionar un camarero y pulsar el botón.

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://4.bp.blogspot.com/-5yIexsA06XI/TdATUJ39qDI/AAAAAAAAAeA/Wn81Cw1o6Dw/s1600/camarero.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="320" width="194" src="https://4.bp.blogspot.com/-5yIexsA06XI/TdATUJ39qDI/AAAAAAAAAeA/Wn81Cw1o6Dw/s320/camarero.png" /></a>
</div>

Una vez pulsado el botón, pasamos a la siguiente actividad, en la que se debe seleccionar una mesa para abrirla, cerrarla o realizar pedidos sobre ella. Al igual que en la actividad de camareros, se solicita la información de las mesas a la base de datos.

<div style="clear: right; float:right; text-align: right;">
  <a href="https://4.bp.blogspot.com/-BZjhH4BNz0k/TdAT8kH3-PI/AAAAAAAAAeQ/zCUx8mF0G3c/s1600/selecci%25C3%25B3nMesa.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="320" width="212" src="https://4.bp.blogspot.com/-BZjhH4BNz0k/TdAT8kH3-PI/AAAAAAAAAeQ/zCUx8mF0G3c/s320/selecci%25C3%25B3nMesa.png" /></a>
</div>

<div style="clear: left; float:left; text-align: left;">
  <a href="https://4.bp.blogspot.com/-j67USPZqytc/TdAT8mhHWMI/AAAAAAAAAeI/HMMy-r8hBhU/s1600/mesa.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="320" width="196" src="https://4.bp.blogspot.com/-j67USPZqytc/TdAT8mhHWMI/AAAAAAAAAeI/HMMy-r8hBhU/s320/mesa.png" /></a>
</div>

Al pulsar en &#8220;Hacer comanda&#8221; vamos a un intent en el que se deben elegir los pedidos del cliente (pero aún está a medio hacer)

Cosas a tener en cuenta:

- La interfaz gráfica aún es poco vistosa, pero ahora mismo nos vamos a ocupar de que la aplicación funcione adecuadamente y despues mejoraremos la interfaz.

- Como el código es bastante extenso no lo voy a mostrar aquí, sin embargo se puede ver en el repositorio de [github&#8211;WifiBar][4]

- El proyecto debemos realizarlo todos los alumnos del curso, por lo que si alguno anda perdido y ver el código le sirve de ayuda no me importa que copien algo en concreto, o si les aporta ideas nuevas para su proyecto, pero por favor, no me lo plagieis <img src="https://elbauldelprogramador.com/wp-includes/assets/img/smilies/icon_smile.gif" alt=":-)" class="wp-smiley" />

Estoy bastante contento con este proyecto, ya que me ha permitido iniciarme en la programación para Android.



 [1]: https://elbauldelprogramador.com/conectar-base-de-datos-sql-server-2008/
 [2]: http://bashyc.blogspot.com/p/bases-de-datos.html
 [3]: http://www.gnu.org/licenses/
 [4]: https://github.com/algui91/WifiBar

{% include _toc.html %}

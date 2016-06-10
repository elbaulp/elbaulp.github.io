---
title: 'Esnifando la red (Pruebas de seguridad): Ettercap y Wireshark (Man in the middle)'

layout: post
permalink: /esnifando-la-red-pruebas-de-seguridad/
categories:
  - aplicaciones
  - internet
  - seguridad
tags:
  - ettercap en español
  - tutorial ettercap comandos
main-class: "articulos"
---
<div class="icoso">
</div>

Recientemente he leido los problemas de seguridad que tiene [WhatsApp][1], con lo que me entró curiosidad por hacer algunas pruebas yo mismo y esnifar el tráfico de red de mi móvil, pero en este caso para la aplicación que estoy desarrollando, [WifiBar][2]. Antes de nada voy a explicar las técnicas y programas que he usado.

Bien, vamos con los programas, he usado [ettercap][3] y [wireshark][4]. Estos programitas se usan para lo siguiente, Ettercap principalmente lo he usado para el envenenamiento ARP de la máquina objetivo (en este caso el móvil), para realizar la técnica de *Man on the Middle*, que consiste en establecer la puerta de enlace predeterminada del equipo objetivo a la dirección ip del equipo atacante. De esta manera nuestro equipo atacante estará situado entre el router y el objetivo, logrando así escuchar todo el tráfico de red que genera el objetivo. (Más adelante explicaré como hacer esto).


<!--ad-->

Wireshark finalmente lo uso para *&#8220;Ver&#8221;* el tráfico que genera el objetivo.

Podemos instalar estos dos programas mediante la consola:

```bash
hkr@hkr-pc:~$ sudo aptitude install ettercap wireshark
```</p>

Una vez instalado, abrimos ettercap:

```bash
hkr@hkr-pc:~$ sudo ettercap -C
```

Y nos abrirá una pantalla como esta:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-6aC4HXLtK7k/TdlRoid4i2I/AAAAAAAAAgs/XHR8h0qNXss/s1600/ettercap1.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="268" width="400" src="https://2.bp.blogspot.com/-6aC4HXLtK7k/TdlRoid4i2I/AAAAAAAAAgs/XHR8h0qNXss/s400/ettercap1.png" /></a>
</div>

Una vez abierta, le damos a Sniff -> Unified sniffing, y tendremos que introducir la interfaz que queramos esnifar, en mi caso wlan0 (Ya que el móvil se conecta por wifi).

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://4.bp.blogspot.com/-bJscHRVIt3U/TdlSWHzopEI/AAAAAAAAAg0/9iVj3S96Jpo/s1600/interface.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="51" width="400" src="https://4.bp.blogspot.com/-bJscHRVIt3U/TdlSWHzopEI/AAAAAAAAAg0/9iVj3S96Jpo/s400/interface.png" /></a>
</div>

El siguente paso es escanear la red en busca de host, Hosts -> Scan for hosts. Al pulsar comenzará a escanear y en el recuadro de abajo nos aparecerá cuantos host encontró, en mi caso:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-UHuz1c4HInM/TdlTPkAoLYI/AAAAAAAAAg8/gEU_PTHohgA/s1600/host.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="266" width="400" src="https://2.bp.blogspot.com/-UHuz1c4HInM/TdlTPkAoLYI/AAAAAAAAAg8/gEU_PTHohgA/s400/host.png" /></a>
</div>

Para ver las ips de los hosts encontrados vamos a Hosts -> hosts list, nos quedamos con la ip de nuestro objetivo y pasamos al siguiente paso, Targets -> Select TARGET(s), aquí debemos poner como target1 nuestra puerta de enlace predeterminada, y como target 2 el objetivo:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/-lFH6pB11PTA/TdlUjkVJPJI/AAAAAAAAAhE/m_W8MFwPLfA/s1600/target.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="69" width="400" src="https://3.bp.blogspot.com/-lFH6pB11PTA/TdlUjkVJPJI/AAAAAAAAAhE/m_W8MFwPLfA/s400/target.png" /></a>
</div>

Ahora hacemos Start -> Start sniffing, y despues, procedemos al envenenamiento ARP. Mitm -> Arp poisoning. lo que nos pedirá unos parámetros, yo he puesto oneway, que fuerza a envenenar solo desde Target1 a Target2, útil para envenenar solo el objetivo y no el router:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://4.bp.blogspot.com/-KMyx2G5WS_0/TdlWJa5riyI/AAAAAAAAAhM/fyZXGORdX7A/s1600/arp.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="59" width="400" src="https://4.bp.blogspot.com/-KMyx2G5WS_0/TdlWJa5riyI/AAAAAAAAAhM/fyZXGORdX7A/s400/arp.png" /></a>
</div>

Si ejecutamos antes de realizar todo esto arp -a en el equipo objetivo, vemos que la puerta de enlace tiene una MAC asociada, despues de hacer en envenenamiento, esta MAC es la del equipo atacante.

Ahora llega el turno de wireshark,

```bash
hkr@hkr-pc:~$ sudo wireshark
```

Vamos a Capture -> Options, aquí seleccionaremos la interfaz a esniffar, que debe ser la misma que usamos en ettercap, dejamos marcada la casilla *Capture packets in promiscuous mode* y clicamos en start:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/-W8mrGI5blBY/TdlYTc3yTLI/AAAAAAAAAhU/p3uTj_g8We4/s1600/capture.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="371" width="400" src="https://3.bp.blogspot.com/-W8mrGI5blBY/TdlYTc3yTLI/AAAAAAAAAhU/p3uTj_g8We4/s400/capture.png" /></a>
</div>

Todo esto me sirvió para descubrir que mi aplicación manda cierta información en Texto plano, como usuario y contraseña de la Base de datos y consultas SQL, de modo que tendré que encriptarlo:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://1.bp.blogspot.com/-IJWXvfdJegA/TdlZvAxBggI/AAAAAAAAAhc/-i-VAe-xow8/s1600/bd.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="242" width="400" src="https://1.bp.blogspot.com/-IJWXvfdJegA/TdlZvAxBggI/AAAAAAAAAhc/-i-VAe-xow8/s400/bd.png" /></a>
</div>

<span style="color:#f00;">Atención:</span> Una vez terminemos de esnifar, no se nos puede olvidar quitar el envenenamiento ARP Mitm -> Stop mitm attack(s), ya que si no, al apagar el equipo atacante el objetivo se queda sin conexión, al hacer el atacante de puerta de enlace. Por último, Start -> Stop sniffing.

Lo proximo que quiero intentar es conseguir sacar el Id y contraseña del chat de tuenti (Red social española), para conectarme a dicho chat sin necesidad de entrar en la web, usando emphaty por ejemplo, hay gente que ya lo ha conseguido [ojeando las cookies][5], pero voy a hacerlo de esta forma, ya que ojeando con wireshark conseguí sacar el ID y demás, pronto escribiré una entrada si lo consigo.

## Bibliografia

[Bujarra.com][6]



 [1]: http://gizmovil.com/2011/05/fallo-de-seguridad-en-whatsapp-que-permite-acceder-a-los-mensajes-y-numeros-de-telefono
 [2]: https://elbauldelprogramador.com/avances-en-el-proyecto-android-de-fin/
 [3]: http://ettercap.sourceforge.net/
 [4]: http://www.wireshark.org/
 [5]: http://blogguino.blogspot.com/2010/05/tuenti-chat-en-empathy-sin-contactos.html
 [6]: http://www.bujarra.com/ProcedimientoManInTheMiddle.html

{% include _toc.html %}

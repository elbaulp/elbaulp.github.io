---
id: 1385
title: Algunos comandos útiles con iproute2

layout: post
guid: https://elbauldelprogramador.com/?p=1385
permalink: /comandos-ss-iproute2-linux/
categories:
  - aplicaciones
  - linux
tags:
  - comando ip route linux
  - comando ss
  - conmando ifconfig
  - herramientas de red
  - ifconfig
  - ip addr
  - ip link
  - ip route
  - iproute2
  - mostrar informacion TCP
  - net-tools
  - netstat
  - notas iproute2
  - sockets
  - ss
  - tc iproute2 debian
  - UDP
---
<img src="/images/2012/07/sh1.png" alt="sh" width="128" height="128" class="thumbnail alignleft size-full wp-image-836" />El propósito de **iproute2** es reemplazar el conjunto de herramientas que componen las *net-tools* y pasar a ser él quien se encargue de configurar las interfaces de red, la [tabla de rutas][1] y gestionar la tabla ARP.

Hace poco he [escrito sobre el comando **netstat**][1]. El artículo trataba de cómo es posible usar netstat para mostrar dintintos tipos de información sobre el estado de la red. Hoy voy a hablar de su sustituto **ss**, ya que netstat se dejó de desarrollar en 2001.

Para situarnos en contexto, **netstat** forma parte de las comúnmente llamadas *net-tools* o herramientas de red. Este conjunto de herramientas lo forman los comandos *ifconfig*, *netstat* y *route*. Dichas herramientas han quedado obsoletas en favor de **iproute2** desde hace algunos años.

A día de hoy la mayoría de distribuciones traen **iproute** instalado por defecto.

Veamos algunos de los comandos más útiles que nos ofrece este relativamente “*nuevo*” conjunto de comandos:  
  
<!--ad-->

### Obtener información sobre TCP/UDP y Sockets

Aquí entra en acción el comando **ss**, sustituto de **netstat**. Este comando está incluido en el paquete **iproute2**. 

La función de **ss** es mostrar estadísticas de los sockets, mostrar información similar a netstat. Además, revela más información sobre TCP que otras herramientas. Las opciones más usadas son:

{% highlight bash %}-n, --numeric
              Do now try to resolve service names.

       -r, --resolve
              Try to resolve numeric address/ports.

       -a, --all
              Display all sockets.

       -l, --listening
              Display listening sockets.

       -o, --options
              Show timer information.

       -e, --extended
              Show detailed socket information

       -m, --memory
              Show socket memory usage.

       -p, --processes
              Show process using socket.

       -i, --info
              Show internal TCP information.

       -s, --summary
              Print  summary  statistics.  This  option  does not parse socket
              lists obtaining summary from various sources. It is useful  when
              amount  of  sockets  is  so  huge  that parsing /proc/net/tcp is
              painful.
{% endhighlight %}

Para ver la lista completa de opciones escribe `ss --help`.

Algunos ejemplos prácticos:

### Mostrar todos los sockects a la escucha

{% highlight bash %}$ ss -l
State      Recv-Q Send-Q                                             Local Address:Port                                                 Peer Address:Port   
LISTEN     0      128                                                           :::sunrpc                                                         :::*       
LISTEN     0      128                                                            *:sunrpc                                                          *:*       
LISTEN     0      20                                                           ::1:smtp                                                           :::*       
LISTEN     0      20                                                     127.0.0.1:smtp                                                            *:*       
LISTEN     0      128                                                            *:17500                                                           *:*       
LISTEN     0      128                                                            *:43076                                                           *:*       
LISTEN     0      128                                                           :::50925                                                          :::*
{% endhighlight %}

Para entender el significado de las columnas, puedes dirigirte al artículo de [netstat][1].

### Mostrar conexiones ssh establecidas

{% highlight bash %}# ss -o state stablished '( dport = :ssh or sport = :ssh)'
Recv-Q Send-Q                                                 Local Address:Port                                                     Peer Address:Port   
0      0                                                       192.168.1.36:60240                                                  207.97.227.239:ssh 
{% endhighlight %}

El parámetro **-o** permite establecer qué opciones mostrar, varios ejemplos son:

### Mostrar conexiones SMTP establecidas

{% highlight bash %}# ss -o state established '( dport = :smtp or sport = :smtp )'
{% endhighlight %}

### Mostrar conexiones HTTP establecidas

{% highlight bash %}# ss -o state established '( dport = :http or sport = :http )'
{% endhighlight %}

En los casos anteriores se ha filtrado únicamente los paquetes TCP con estado *established*. Para mostrar otros estados puedes escribir:

{% highlight bash %}# ss -4 state NOMBRE-DEL-FILTRO
{% endhighlight %}

Donde **-4** indica paquetes TCP IPv4 y NOMBRE-DEL-FILTRO puede tomar los siguientes valores:

  1. **established**
  2. **syn-sent**
  3. **syn-recv**
  4. **fin-wait-1**
  5. **fin-wait-2 **
  6. **time-wait **
  7. **closed**
  8. **close-wait**
  9. **last-ack**
 10. **listen**
 11. **closing**
 12. **all** : Todos los estados de arriba
 13. **connected** : Todos los estados salvo listen y closed
 14. **synchronized**
 15. **bucket** : Mostrar estados mantenidos como minisockets, como time-wait and syn-recv.
 16. **big** : Lo contrario al estado bucket.

Por ejemplo:

{% highlight bash %}# ss -4 state time-wait
{% endhighlight %}

### Encontrar procesos locales conectados al servidor X (Servidor Gráfico)

{% highlight bash %}# ss -x src /tmp/.X11-unix/*
{% endhighlight %}

### Hacer coincidir direcciones remotas y puertos

{% highlight bash %}ss dst ADDRESS_PATTERN

## Mostrar todos los puertos conectados de forma remota desde 192.168.1.5## 
ss dst 192.168.1.5

## Mostrar todos los puertos conectados de forma remota desde 192.168.1.5:http##
ss dst 192.168.1.5:http
ss dst 192.168.1.5:smtp
ss dst 192.168.1.5:443
{% endhighlight %}

Mostrar conexiones realizadas por una ip en el puerto http hacia nuestra máquina

{% highlight bash %}ss dst 123.1.2.100:http
{% endhighlight %}

Es posible mostrar todas las conexiones realizadas por cualquier máquina, por el puerto http por ejemplo:

{% highlight bash %}# ss dst *:http
{% endhighlight %}

### Hacer coincidir direcciones locales y puertos

{% highlight bash %}ss src ADDRESS_PATTERN
### Encontrar todas las ips conectadas a elbauldelprogramador.com (5.39.89.44) ###
## Mostrar todos los puertos conectados a la dirección local 5.39.89.44 ##
ss src 5.39.89.44
 
## http (80) port only ##
ss src 5.39.89.44:http
ss src 5.39.89.44:80
 
## smtp (25) port only ##
ss src 5.39.89.44:smtp
ss src 5.39.89.44:25
{% endhighlight %}

### Mostrar el número y el tipo de conexiones activas

{% highlight bash %}ss -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c 
{% endhighlight %}

### Mostrar un resumen del estado de los sockets

{% highlight bash %}# ss -s
{% endhighlight %}

### Listar todos los puertos a la escucha junto con el PID del programa

{% highlight bash %}ss -tlnp 
{% endhighlight %}

### Configuración de la interfaz de red

Antiguamente se usaba el comando ifconfig:

{% highlight bash %}# ifconfig eth0 up
# ifconfig eth0 192.168.1.1 netmask 255.255.255.0
{% endhighlight %}

En **iproute2** la configuración de interfaces de red se lleva a cabo con el subcomando **link**:

### Activar interfaz

{% highlight bash %}# ip link set eth0 up
{% endhighlight %}

Donde eth0 debe ser la interfaz de red a activar.

### Establecer dirección ip a la interfaz

{% highlight bash %}# ip addr add 192.168.1.33/24 dev eth0
{% endhighlight %}

Para comprobar la correcta configuración de la interfaz, muestra la información de dicha interfaz:

{% highlight bash %}# ip addr ls
# ip addr show
# ip addr ls eth0
{% endhighlight %}

### Enrutamiento

La versión moderna del comando `route -n` o `netstat -r` es:

{% highlight bash %}# ip ro
{% endhighlight %}

Para añádir o eliminar reglas de enrutamiento se usa `ip ro add|del destino via gateway`. Para añadir una nueva ruta a 10.0.0.0/16:

{% highlight bash %}# ip ro add 10.0.0.0/16 via 192.168.0.1
# ip ro del 10.0.0.0/16 via 192.168.0.1
{% endhighlight %}

### Encontrar la ruta hacia una dirección IP

Para averiguar qué interfaz está usando tu pc, puedes usar el comando *ip route get IP*. Así:

{% highlight bash %}# ip route get 5.39.89.44
5.39.89.44 via 10.61.29.89 dev eth1  src 192.168.1.36 
{% endhighlight %}

está usando la interfaz eth1, gateway 10.61.29.89 y la interfaz tiene la ip privada 192.168.1.36

### Conclusión

Aunque este artículo ha sido una remezcla de comandos, espero que haya quedado claro para qué sirve cada uno, y a partir de ahora podrás sacarle partido.

#### Referencias

*Socket Statistics on Linux* »» <a href="http://linuxaria.com/pills/ss-iproute2-linux" target="_blank">linuxaria</a>  
*Some useful command with iproute2* »» <a href="http://linuxaria.com/howto/useful-command-of-iproute2" target="_blank">linuxaria</a>  
*ss: Display Linux TCP / UDP Network and Socket Information* »» <a href="http://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html" target="_blank">cyberciti.biz</a>  
*SS Utility: Quick Intro* »» <a href="http://www.cyberciti.biz/files/ss.html" target="_blank">cyberciti.biz</a>



 [1]: /netstat-analizando-la-red-y-detectando-problemas/ "Netstat: Analizando la red y detectando problemas"

{% include _toc.html %}

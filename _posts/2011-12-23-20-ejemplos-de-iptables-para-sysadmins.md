---
id: 314
title: 20 ejemplos de iptables para SysAdmins novatos
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/20-ejemplos-de-iptables-para-sysadmins-novatos/
permalink: /20-ejemplos-de-iptables-para-sysadmins/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/12/20-ejemplos-de-iptables-para-sysadmins.html
  - /2011/12/20-ejemplos-de-iptables-para-sysadmins.html
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551761}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551761}'
share_count:
  - 0
  - 0
categories:
  - aplicaciones
  - internet
  - linux
  - seguridad
tags:
  - agregar regla de iptables
  - bloquear acceso a ssh mediante iptables
  - bloquear direccion iptables
  - comando iptables
  - comando iptables linux
  - configurando iptables debian wheezy
  - configurar iptables
  - configurar iptables en debian
  - ejemplos de firewall
  - ejemplos iptables
  - filtrar dominios com iptables
  - iptables
  - iptables con servidor debian
  - iptables eliminar regla
  - iptables fedora 16 como
  - iptables mangle
  - iptables tutorial
  - politicas con iptables firewall
---
<div class="separator" style="clear: both; float:left; text-align: center;">
  <a href="http://3.bp.blogspot.com/-_5WvmCXMYjk/TvTkTNhQPUI/AAAAAAAAB88/VP8jxCu5y3A/s1600/Applic-Firewall-icon.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" height="128" width="128" src="http://3.bp.blogspot.com/-_5WvmCXMYjk/TvTkTNhQPUI/AAAAAAAAB88/VP8jxCu5y3A/s320/Applic-Firewall-icon.png" /></a>
</div>

Linux por defecto trae un cortafuegos llamado NetFilter. Según el sitio oficil de proyecto:

<div style="text-align:center">
  <blockquote>
    <p>
      netfiltes es un conjunto de hooks (Ganchos) dentro del kernel de linux que permiten a los módulos del kernel registrar funciones callbacks con la pila de red. Una función callback registrada se llama entonces para cada paquete que atraviesa el hook correspondiente dentro de la pila de red.
    </p>
  </blockquote>
</div>

Este firewall lo controla un programa llamado iptables que gestiona el filtrado para IPv4, y ip6tables para IPv6. 

## Ejemplos de reglas IPTABLES

  * Muchas de las acciones que se listan abajo requieren ejecutarse como usuario root.
  * Los siguientes comandos deberían funcionar en cualquier distro linux moderna.
  * Esto NO es un tutorial de como configurar iptables. Puedes ver un tutorial <a target="_blank" href="http://www.cyberciti.biz/faq/rhel-fedorta-linux-iptables-firewall-configuration-tutorial/">aquí</a>. Es más bien una referencia rápida de los comandos más comunes de iptables.

  
<!--more-->

# #1: Mostrando el estado de nuestro firewall

Teclea el siguiente comando como root:

<pre lang="bash">iptables -L -n -v
</pre>

Ejemplos de salidas:

<pre lang="bash">Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
</pre>

El resultado de arriba indica que el firewall no está activo. La siguiente salida es la del firewall activado:

<pre lang="bash">Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           state INVALID
  394 43586 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
   93 17292 ACCEPT     all  --  br0    *       0.0.0.0/0            0.0.0.0/0
    1   142 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  br0    br0     0.0.0.0/0            0.0.0.0/0
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           state INVALID
    0     0 TCPMSS     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 wanin      all  --  vlan2  *       0.0.0.0/0            0.0.0.0/0
    0     0 wanout     all  --  *      vlan2   0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  br0    *       0.0.0.0/0            0.0.0.0/0
Chain OUTPUT (policy ACCEPT 425 packets, 113K bytes)
 pkts bytes target     prot opt in     out     source               destination
Chain wanin (1 references)
 pkts bytes target     prot opt in     out     source               destination
Chain wanout (1 references)
 pkts bytes target     prot opt in     out     source               destination
</pre>

Donde,

  * **-L** : Muestra las reglas.
  * **-v** : Muestra información detallada.
  * **-n** : Muestra la dirección ip y puerto en formato numérico. No usa DNS para resolver nombres. Esto acelera la lista.

#### #1.1:Para Inspeccionar el firewall con número de lineas:

<pre lang="bash">iptables -n -L -v --line-numbers
</pre>

Salida:

<pre lang="bash">Chain INPUT (policy DROP)
num  target     prot opt source               destination
1    DROP       all  --  0.0.0.0/0            0.0.0.0/0           state INVALID
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
4    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
Chain FORWARD (policy DROP)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
2    DROP       all  --  0.0.0.0/0            0.0.0.0/0           state INVALID
3    TCPMSS     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
4    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
5    wanin      all  --  0.0.0.0/0            0.0.0.0/0
6    wanout     all  --  0.0.0.0/0            0.0.0.0/0
7    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
Chain wanin (1 references)
num  target     prot opt source               destination
Chain wanout (1 references)
num  target     prot opt source               destination
</pre>

Podemos usar los números de línea para borrar o añadir nuevas reglas al firewall.

#### #1.2: Mostrar las reglas de cadena de entrada y salida:

<pre lang="bash">iptables -L INPUT -n -v
iptables -L OUTPUT -n -v --line-numbers
</pre>

# #2: Parar / Iniciar / Reiniciar el firewall

Si usas CentOS / RHEL / Fedora linux:

<pre lang="bash">service iptables stop
service iptables start
service iptables restart
</pre>

También se puede usar propio comando iptables para detenerlo y borrar todas las reglas.

<pre lang="bash">iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
</pre>

Donde:

  * **-F** : Borra todas las reglas.
  * **-X** : Borra cadenas
  * **-t table_name** : Selecciona una tabla y elimina reglas
  * **-P** : Establece la política por defecto (como DROP, REJECT o ACCEPT)

# #3: Borrar reglas del firewall

Para mostrar los números de línea junto a otra información para reglas existentes:

<pre lang="bash">iptables -L INPUT -n --line-numbers
iptables -L OUTPUT -n --line-numbers
iptables -L OUTPUT -n --line-numbers | less
iptables -L OUTPUT -n --line-numbers | grep 202.54.1.1
</pre>

Obtendrendremos la lista de IPs. Miramos el número de la izquierda y lo usamos para borrarla. Por ejemplo para borrar la línea 4:

<pre lang="bash">iptables -D INPUT 4
</pre>

O para encontrar una ip de origen y borrarla de la regla

<pre lang="bash">iptables -D INPUT -s 202.54.1.1 -j DROP
</pre>

Donde:

  * **-D** : Elimina una o más reglas de la cadena seleccionada.

# #4: Insertar reglas:

Para insertar una o más reglas en la cadena seleccionada como el número de cadena dada usamos la siguiente sintaxis. Primero encontramos el número de línea:

<pre lang="bash">iptables -L INPUT -n --line-numbers
</pre>

Salida:

<pre lang="bash">Chain INPUT (policy DROP)
num  target     prot opt source               destination
1    DROP       all  --  202.54.1.1           0.0.0.0/0
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW,ESTABLISHED
</pre>

Para insertar una regla entre 1 y 2;

<pre lang="bash">iptables -I INPUT 2 -s 202.54.1.2 -j DROP
</pre>

Para ver las reglas actualizadas

<pre lang="bash">iptables -L INPUT -n --line-numbers
</pre>

Salida:

<pre lang="bash">Chain INPUT (policy DROP)
num  target     prot opt source               destination
1    DROP       all  --  202.54.1.1           0.0.0.0/0
2    DROP       all  --  202.54.1.2           0.0.0.0/0
3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW,ESTABLISHED
</pre>

# #5: Guardar reglas

Para guardar reglas en CentOS / RHEL / Fedora Linux:

<pre lang="bash">service iptables save
</pre>

En este ejemplo, eliminamos una ip y guardamos las reglas del firewall:

<pre lang="bash">iptables -A INPUT -s 202.5.4.1 -j DROP
service iptables save
</pre>

Para todas las demás distros usamos:

<pre lang="bash">iptables-save > /root/my.active.firewall.rules
cat /root/my.active.firewall.rules
</pre>

# #6: Restaurar reglas

Para restaurar reglas desde un archivo llamado /root/my.active.firewall.rules:

<pre lang="bash">iptables-restore &lt; /root/my.active.firewall.rules
</pre>

Bajo CentOS / RHEL / Fedora Linux:

<pre lang="bash">service iptables restart
</pre>

# #7: Estableces políticas de firewall por defecto

Para borrar todo el tráfico:

<pre lang="bash">iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -L -v -n
## you will not able to connect anywhere as all traffic is dropped ###
ping cyberciti.biz
wget http://www.kernel.org/pub/linux/kernel/v3.0/testing/linux-3.2-rc5.tar.bz2
</pre>

#### #7.1: Solo tráfico entrante bloqueado

Para borrar todos los paquetes entrantes / enviados pero permitir el tráfico saliente:

<pre lang="bash">iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -L -v -n
# *** now ping and wget should work *** ###
ping cyberciti.biz
wget http://www.kernel.org/pub/linux/kernel/v3.0/testing/linux-3.2-rc5.tar.bz2
</pre>

# #8: Borrar direcciones de red privadas en la interfaz pública

IP Spoofing es nada más que para detener los siguientes rangos de direcciones IPv4 para redes privadas en sus interfaces públicas. Los paquetes con direcciones de origen no enrutables deben rechazarse mediante la siguiente sintaxis:

<pre lang="bash">iptables -A INPUT -i eth1 -s 192.168.0.0/24 -j DROP
iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP
</pre>

# #9: Bloqueando una direción IP (BLOCK IP)

PAra bloquear una ip atacante llamada 1.2.3.4:

<pre lang="bash">iptables -A INPUT -s 1.2.3.4 -j DROP
iptables -A INPUT -s 192.168.0.0/24 -j DROP
</pre>

# #10: Bloquear peticiones entrantes de un puerto (BLOCK PORT)

Para bloquear todas las solicitudes de servicio en el puerto 80:

<pre lang="bash">iptables -A INPUT -p tcp --dport 80 -j DROP
iptables -A INPUT -i eth1 -p tcp --dport 80 -j DROP
</pre>

Para bloquear el puerto 80 para una ip:

<pre lang="bash">iptables -A INPUT -p tcp -s 1.2.3.4 --dport 80 -j DROP
iptables -A INPUT -i eth1 -p tcp -s 192.168.1.0/24 --dport 80 -j DROP
</pre>

# #11: Bloquear ips de salida

Para bloquear el tráfico saliente a un host o dominio en concreto como por ejemplo cyberciti.biz:

<pre lang="bash">host -t a cyberciti.biz
</pre>

Salida:

<pre lang="bash">cyberciti.biz has address 75.126.153.206
</pre>

Una vez conocida la dirección ip, bloqueamos todo el tráfico saliente para dicha ip así:

<pre lang="bash">iptables -A OUTPUT -d 75.126.153.206 -j DROP
</pre>

Se puede usar una subred como la siguiente:

<pre lang="bash">iptables -A OUTPUT -d 192.168.1.0/24 -j DROP
iptables -A OUTPUT -o eth1 -d 192.168.1.0/24 -j DROP
</pre>

#### #11.1: Ejemplo - Bloquear el dominio facebook.com

Primero, encontrar la dirección ip de facebook.com

<pre lang="bash">host -t a www.facebook.com
</pre>

Salida:

<pre lang="bash">www.facebook.com has address 69.171.228.40
</pre>

Buscar el CIDR para 69.171.228.40:

<pre lang="bash">whois 69.171.228.40 | grep CIDR
</pre>

Salida:

<pre lang="bash">CIDR:           69.171.224.0/19
</pre>

Para prevenir el acceso externo a facebook.com:

<pre lang="bash">iptables -A OUTPUT -p tcp -d 69.171.224.0/19 -j DROP
</pre>

Podemos usar también nombres de dominio:

<pre lang="bash">iptables -A OUTPUT -p tcp -d www.facebook.com -j DROP
iptables -A OUTPUT -p tcp -d facebook.com -j DROP
</pre>

De la página del man de iptables:

> ... specifying any name to be resolved with a remote query such as DNS (e.g., facebook.com is a really bad idea), a network IP address (with /mask), or a plain IP address ... 

# #12: Log y borrar paquetes

Escribe lo siguiente para añadir al log y bloquear IP spoofing en una interfaz pública llamada eth1

<pre lang="bash">iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j LOG --log-prefix "IP_SPOOF A: "
iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP
</pre>

Por defecto el log está en el archivo /var/log/messages

<pre lang="bash">tail -f /var/log/messages
grep --color 'IP SPOOF' /var/log/messages
</pre>

# #13: Log y borrar paquetes con un número limitado de entradas al log

El módulo -m limit puede limitar el número de entradas al log creadas por tiempo. Se usa para prevenir que el archivo de log se inunde. Para añadir al log y elminar spoofing cada 5 minutos, en ráfagas de 7 entradas:

<pre lang="bash">iptables -A INPUT -i eth1 -s 10.0.0.0/8 -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix "IP_SPOOF A: "
iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP
</pre>

# #14: Aceptar o denegar tráfico desde dirección MAC

<pre lang="bash">iptables -A INPUT -m mac --mac-source 00:0F:EA:91:04:08 -j DROP
## *only accept traffic for TCP port # 8080 from mac 00:0F:EA:91:04:07 * ##
iptables -A INPUT -p tcp --destination-port 22 -m mac --mac-source 00:0F:EA:91:04:07 -j ACCEPT
</pre>

# #15: Bloquear o permitir peticiones ping ICMP

Para bloquear peticiones ping ICMP

<pre lang="bash">iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -i eth1 -p icmp --icmp-type echo-request -j DROP
</pre>

Las respuestas al ping también se puede limitar a ciertas redes o hosts.

<pre lang="bash">iptables -A INPUT -s 192.168.1.0/24 -p icmp --icmp-type echo-request -j ACCEPT
</pre>

Lo siguiente solo acepta limitados tipos de peticiones ICMP:

<pre lang="bash">### ** assumed that default INPUT policy set to DROP ** #############
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
## ** all our server to respond to pings ** ##
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
</pre>

# #16: Abrir un rango de puertos

<pre lang="bash">iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 7000:7010 -j ACCEPT
</pre>

# #17: Abrir un rango de direcciones ip

<pre lang="bash">## only accept connection to tcp port 80 (Apache) if ip is between 192.168.1.100 and 192.168.1.200 ##
iptables -A INPUT -p tcp --destination-port 80 -m iprange --src-range 192.168.1.100-192.168.1.200 -j ACCEPT
</pre>

<pre lang="bash">## nat example ##
iptables -t nat -A POSTROUTING -j SNAT --to-source 192.168.1.20-192.168.1.25
</pre>

# #19: Bloquear o abrir puertos comunes

<pre lang="bash">Replace ACCEPT with DROP to block port:
## open port ssh tcp port 22 ##
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 22 -j ACCEPT
 
## open cups (printing service) udp/tcp port 631 for LAN users ##
iptables -A INPUT -s 192.168.1.0/24 -p udp -m udp --dport 631 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -p tcp -m tcp --dport 631 -j ACCEPT
 
## allow time sync via NTP for lan users (open udp port 123) ##
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p udp --dport 123 -j ACCEPT
 
## open tcp port 25 (smtp) for all ##
iptables -A INPUT -m state --state NEW -p tcp --dport 25 -j ACCEPT
 
# open dns server ports for all ##
iptables -A INPUT -m state --state NEW -p udp --dport 53 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 53 -j ACCEPT
 
## open http/https (Apache) server port to all ##
iptables -A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
 
## open tcp port 110 (pop3) for all ##
iptables -A INPUT -m state --state NEW -p tcp --dport 110 -j ACCEPT
 
## open tcp port 143 (imap) for all ##
iptables -A INPUT -m state --state NEW -p tcp --dport 143 -j ACCEPT
 
## open access to Samba file server for lan users only ##
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 137 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 138 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 445 -j ACCEPT
 
## open access to proxy server for lan users only ##
iptables -A INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 3128 -j ACCEPT
 
## open access to mysql server for lan users only ##
iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
</pre>

# #20: Restringir el número de conexiones paralelas a un servidor por direccion Ip del cliente.

Se puede usar connlimit para crear algunas restricciones. Para permitir 3 conexiones ssh por cliente:

<pre lang="bash">iptables -A INPUT -p tcp --syn --dport 22 -m connlimit --connlimit-above 3 -j REJECT
</pre>

Establecer las peticiones HTTP a 20:

<pre lang="bash">iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 20 --connlimit-mask 24 -j DROP
</pre>

donde:

  * **--connlimit-above 3** : Coincide si el número de conexiones existentes está por encima de 3.
  * **--connlimit-mask 24** : Grupos de hosts usando el prefijo de longitud. Para IPv4, debe ser un número entre 0 y 32 (incluyéndolos.)

# #21: HowTO: Use iptables Like a Pro

Para más información sobre iptables, échale un vistazo al manual:

<pre lang="bash">man iptables
</pre>

Para ver la ayuda en general o de un comando específico:

<pre lang="bash">iptables -h
iptables -j DROP -h
</pre>

#### #21.1: Probando nuestro firewall

Conocer si hay puertos abiertos o no:

<pre lang="bash">netstat -tulpn
</pre>

Es recomendable instalarse un [sniffer][1] como tcpdupm y ngrep para probar la configuración de nuestro firewall.

> ## Conclusión
> 
> Esta entrada solo lista las reglas básicas para los usuarios nuevos en linux. Se pueden crear reglas más complejas. Requiere una buena comprensión de TCP/IP, tunning del kernel linux via sysctl.conf y un buen conocimiento de nuestra configuración. 

<p class="alert">
  Fuente original: <a target="_blank" href="http://www.cyberciti.biz/tips/linux-iptables-examples.html">cyberciti</a>
</p>

### Más reglas cortesía de Jker

a)a. Reestablece las reglas por defecto.

<pre lang="bash">sudo su
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
</pre>

IPtables -nL para ver que estan vacias

b)b. Configura la máquina para que sólo se pueda acceder desde ella a las webs http://www.google.es y http://www.iesgoya.com y a ninguna otra.

<pre lang="bash">iptables -A OUTPUT -d http://www.google.es -j ACCEPT
iptables -A OUTPUT -d http://www.iesgoya.com -j ACCEPT
iptables -A OUTPUT -p tcp –dport 80 -j DROP # Mas exigente –> iptables -A OUTPUT -p all -j DROP
</pre>

##como google tiene muchas IPs puede que tengamos un problema para ello realizamos lo siguiente antes de la regla EXIGENTE:

<pre lang="bash">iptables -I OUTPUT 1 -d 212.106.221.0/24 -j ACCEPT
iptables -I OUTPUT 1 -d 173.194.0.0/16 -j ACCEPT
</pre>

# MOstrar las reglas que llevamos hasta el momento:

<pre lang="bash">iptables -nL –line-numbers
</pre>

#Si queremos borrar reglas:

<pre lang="bash">iptables -D OUTPUT 5
</pre>

c)c. Cierra todos los puertos bien conocidos menos los necesarios para acceder a estas dos webs.

<pre lang="bash">iptables -A OUTPUT -p TCP –dport 53 -j ACCEPT
iptables -A OUTPUT -p UDP –dport 53 -j ACCEPT
iptables -A OUTPUT -p TCP –dport 1:1024 -j DROP
iptables -A OUTPUT -p UDP –dport 1:1024 -j DROP
</pre>

d)d. Investiga de qué forma podrías hacer que las peticiones entrantes a tu máquina virtual al puerto 81 por http vayan mediante NAT al puerto 80 de la máquina local (arranca WAMP para comprobar que funciona).

Arrancamos wamp en la maquina fisica y comprobamos que accedemos a wamp desde localhost.  
Comprobamos que podemos acceder desde la maquina virtual y se encuentra cortado

Miramos la IP de la maquina virtual.  
Ahora desde la maquina fisica intentamos acceder desde el puerto 81 con la IP esa.

Habilitamos el enrutamiento entre tarjetas de red de nuestro equipo:

<pre lang="bash">echo 1 > /proc/sys/net/ipv4/ip_forward
</pre>

#Ejecutamos las siguientes reglas

<pre lang="bash">iptables -t nat -A PREROUTING -p tcp –dport 81 -j DNAT –to- destination 192.168.203.200:80

iptables -t nat -A POSTROUTING -s 192.168.203.0/24 -j MASQUERADE
</pre>

#Para ver las reglas introducidas:

<pre lang="bash">iptables -t nat -nL –line-numbers
</pre>

e)e. Permite sólo los mensajes entrantes desde la IP del compañero de tu máquina física (prueba desde otro sitio para ver si funciona).

<pre lang="bash">iptables -A INPUT -s 192.168.203.200 -j ACCEPT
iptables -A INPUT -j DROP

iptables -A FORWARD -s 192.168.203.200 -j ACCEPT
iptables -A FORWARD -s -j DROP
</pre>

f) #Activa el log sobre todas las reglas y verifica que se anotan los mensajes.

Insertamos en IPTABLEs las reglas para activar el log:

<pre lang="bash">iptables -I FORWARD 1 -j LOG –log-prefix ‘IPTABLESFORWARD: ‘
iptables -I INPUT 1 -j LOG –log-prefix ‘IPTABLESINPUT: ‘

iptables -t nat -I PREROUTING 1 -j LOG –log-prefix ‘IPTABLESPREROUTING: ‘
iptables -t nat -I POSTROUTING 1 -j LOG –log-prefix ‘IPTABLESPREROUTING: ‘

iptables -I OUTPUT 1 -j LOG –log-prefix ‘IPTABLESOUTPUT: ‘
</pre>

NOTA: hay que ponerlas las primeras para que haga log antes de rechazarlo.

#Ahora editamos el archivo:

<pre lang="bash">gedit /etc/rsyslog.d/50-default.conf
</pre>

#E incluimos al final:

<pre lang="bash">kern.warning /var/log/iptables.log
</pre>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=20 ejemplos de iptables para SysAdmins novatos+http://elbauldelprogramador.com/20-ejemplos-de-iptables-para-sysadmins/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/20-ejemplos-de-iptables-para-sysadmins/&t=20 ejemplos de iptables para SysAdmins novatos+http://elbauldelprogramador.com/20-ejemplos-de-iptables-para-sysadmins/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=20 ejemplos de iptables para SysAdmins novatos+http://elbauldelprogramador.com/20-ejemplos-de-iptables-para-sysadmins/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /2011/05/esnifando-la-red-pruebas-de-seguridad.html
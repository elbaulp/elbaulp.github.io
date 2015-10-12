---
layout: post
title: "Compilar e Instalar El Kenerl 4.2"
date: 2015-10-12T17:18:41+02:00
modified:
categories:
excerpt: "En este artículo veremos cómo descargar, compilar e instalar el kernel 4.2 de linux"
tags: [kernel, linux kernel, compilar kernel 4.0]
image:
  feature:
  thumb:
  credit:
  creditlink:
---
{% include _toc.html %}

Vamos a explicar hoy cómo compilar e instalar la versión 4.2 del __kernel__.

## Paquetes necesarios

Para compilar el __kernel__ hara falta instalar los siguientes paquetes en el sistema:

{% highlight bash%}
$ sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils
{% endhighlight %}

<!--ad-->

y además este:

{% highlight bash%}
$ sudo apt-get install kernel-package
{% endhighlight %}

## Descargar el código fuente del kernel

Para ello

{% highlight bash%}
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.2.tar.xz
{% endhighlight %}

Una vez descargado, lo extraemos:

{% highlight bash%}
$ tar xvf linux-4.2.tar.xz
{% endhighlight %}

## Configurar el kernel

Copiamos la configuración existente del kernel instalado

{% highlight bash%}
$ cd linux-4.2
$ cp /boot/config-$(uname -r) .config
{% endhighlight %}

y lo configuramos

{% highlight bash%}
$ make menuconfig
{% endhighlight %}

Si no estamos seguros de qué podemos quitar y añadir de la configuración, es mejor dejarlo tal y como está, ya que al haber copiado la configuración del kernel actual, estamos seguros de que funcionará.

## Compilar el kernel

Primero debemos hacer una limpieza:

{% highlight bash%}
$ make-kpkg clean
{% endhighlight %}

y por último compilarlo con

{% highlight bash%}
$ export CONCURRENCY_LEVEL=X
$ fakeroot make-kpkg --initrd --revision=1.0.NAS kernel_image kernel_headers
{% endhighlight %}

es importante reemplazar la __X__ de `CONCURRENCY_LEVEL=X` por el número de procesadores de tu máquina, para una compilación más rápida.

## Instalar el kernel

Una vez compilado, basta con ejecutar:

{% highlight bash%}
$ sudo dpkg -i ../linux-headers-4.2.0_1.0.NAS_amd64.deb
$ sudo dpkg -i ../linux-image-4.2.0_1.0.NAS_amd64.deb
{% endhighlight %}

Reiniciamos y listo, podemos comprobar que estamos usando este kernel con cualquiera de estos comandos:

{% highlight bash%}
$ uname -a
$ uname -r
$ uname -mrs
$ dmesg | more
$ dmesg | egrep -i --color 'error|critical|failed'
{% endhighlight %}

### Referencias

_How to Compile and Install Linux Kernel v4.2 Source On a Debian / Ubuntu Linux_ | [cyberciti.biz](http://www.cyberciti.biz/faq/debian-ubuntu-building-installing-a-custom-linux-kernel/ "How to Compile and Install Linux Kernel v4.2 Source On a Debian / Ubuntu Linux")

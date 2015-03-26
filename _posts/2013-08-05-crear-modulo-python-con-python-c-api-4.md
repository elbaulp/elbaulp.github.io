---
id: 1789
title: 'Crear un módulo para python con la Python C API (IV) &#8211; HerramientasRed'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1789
permalink: /crear-modulo-python-con-python-c-api-4/
categories:
  - C
  - python
tags:
  - embebiendo python en c++
  - reference count python
  - tutorial crear modulos python
  - tutorial python c api
---
  * [Crear un módulo para python con la Python C API (I) – Introducción][1]
  * [Crear un módulo para python con la Python C API (II) – Primer ejemplo][2]
  * [Crear un módulo para python con la Python C API (III) – DistUtils][3]
  * Crear un módulo para python con la Python C API (IV) – HerramientasRed
  * [Crear un módulo para python con la Python C API (V) – Python 3][4]

<img src="http://elbauldelprogramador.com/content/uploads/2013/03/Crear-un-módulo-para-python-con-la-Python-C-API-Parte-I.png" alt="Crear un módulo para python con la Python C API - DistUtils" width="201" height="190" class="thumbnail alignleft size-full wp-image-1777" />  
Llegó el momento de crear un módulo con la Python C API algo más complejo, como dijimos en la primera parte, crearemos un módulo llamado **herramientasRed** que permita obtener la dirección IP de un dominio, algo parecido a lo que hicimos en [NDK-gdb – Depurar aplicaciones en el NKD de Android.][5]

  
<!--more-->

### Creación del módulo

Mostraremos el código completo, puesto que ya se ha explicado el significado de este trozo de código no nos extenderemos mucho:

{% highlight c %}>#include &lt;Python.h>
#include &lt;string.h>
#include &lt;sys/socket.h>
#include &lt;netinet/in.h>
#include &lt;arpa/inet.h>

#include &lt;netdb.h>

static PyObject*
herramientasRed_imprimeIP(PyObject *self, PyObject *args)
{
    char *domainName;
    struct hostent *host_info;
    struct in_addr *address;

    if (!PyArg_ParseTuple(args, "s", &#038;domainName))
        return NULL;

    char returnValue[100];
    memset(returnValue, 0, 100);

    host_info = gethostbyname(domainName);
    if (strlen(returnValue) + strlen(domainName) + 16 > 99)
        return NULL;
    if(host_info == NULL) {
        sprintf(returnValue, "No se pudo obtener la IP del dominio %s\n", domainName);
 } else {
        address = (struct in_addr *) (host_info->h_addr);
                sprintf(returnValue, "%s tiene dirección IP %s\n", domainName, inet_ntoa(*address));
  }
    return Py_BuildValue("s", returnValue);
}

static 
PyMethodDef herramientasRed_methods[] = {
    {"imprimeIP", herramientasRed_imprimeIP, METH_VARARGS, "Documentación del módulo ejemplo"},
    {NULL, NULL, 0, NULL}, /* Sentinel */
};

PyMODINIT_FUNC
initherramientasRed(void)
{
    PyObject *m;

    m = Py_InitModule("herramientasRed", herramientasRed_methods);
    if (m == NULL)
        return;
}
{% endhighlight %}

### Compilación y uso

Ahora que hemos visto cómo usar DistUtils, haremos uso de esta herramienta para compilar e instalar el módulo, el contenido del fichero *setup.py* es:

{% highlight python %}>from distutils.core import setup, Extension

hRed = Extension('herramientasRed',
                    sources = ['herramientasRed.c'])

setup (name = 'HerramientasRed',
              version = '1.0',
              author = 'Alejandro Alcalde',
              license = 'GPLv3',
              description = 'Un simple modulo para obtener la IP de un dominio',
              ext_modules = [hRed])
{% endhighlight %}

Lo ejecutamos:

{% highlight bash %}># python setup.py install
running install
running build
running build_ext
running install_lib
running install_egg_info
Writing /usr/local/lib/python2.7/dist-packages/HerramientasRed-1.0.egg-info
{% endhighlight %}

Y para usarlo:

{% highlight python %}>In [1]: import herramientasRed 
In [2]: print herramientasRed.imprimeIP('elbauldelprogramador.com')
elbauldelprogramador.com tiene dirección IP &lt;ip>
{% endhighlight %}

### Depuración de módulos Python C API

Es probable que durante el desarrollo de un módulo para Python sea necesario depurar el código, para ello hay que realizar los siguiente pasos:

**Añadir la siguiente línea al fichero *.gdbinit***

{% highlight bash %}>br _PyImport_LoadDynamicModule
{% endhighlight %}

Compilar el módulo mediante [gcc sin optimizaciones][6]:

{% highlight bash %}># CFLAGS='-Wall -O0 -g' python setup.py install
{% endhighlight %}

Por último ejecutamos gdb de la siguiente forma:

{% highlight bash %}>$ gdb -ex r --args python test.py
{% endhighlight %}

Tras ejecutar la línea de arriba, establecemos un punto de ruptura en la función deseada, en este caso **herramientasRed_imprimeIP** y ya podremos depurar el módulo:

{% highlight bash %}>(gdb) b herramientasRed_imprimeIP 
Breakpoint 1 at 0x7ffff695496a: file herramientasRed.c, line 17.
(gdb) r
Starting program: /usr/bin/python2.7 test.py

Breakpoint 1, herramientasRed_imprimeIP (self=0x0, args=0x965990) at herramientasRed.c:17
17     if (!PyArg_ParseTuple(args, "s", &#038;domainName)){
(gdb) display /s domainName 
1: x/s domainName  0x7ffff7f5e454:   "elbauldelprogramador.com"
22        memset(returnValue, 0, 100);
(gdb) p *args 
$1 = {
  ob_refcnt = 1, 
  ob_type = 0x888280 &lt;PyTuple_Type>
}
(gdb) c
Continuing.
elbauldelprogramador.com tiene dirección IP &lt;ip>

[Inferior 1 (process 28242) exited normally]

{% endhighlight %}

Como se puede observar, si imprimimos en pantalla el argumento *args*, que representa los parámetros que se pasan desde python, se aprecia el **reference count** del que hablamos en la parte 1.

Así concluye esta cuarta parte, en la quinta y última veremos cómo hacer compatibles nuestros módulos con la versión 3 de Python.

#### Referencias

*Python Extension Debugging* **|** <a href="http://stackoverflow.com/questions/15253586/python-extension-debugging" target="_blank">stackoverflow.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Crear un módulo para python con la Python C API (IV) &#8211; HerramientasRed+http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-4/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-4/&t=Crear un módulo para python con la Python C API (IV) &#8211; HerramientasRed+http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-4/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Crear un módulo para python con la Python C API (IV) &#8211; HerramientasRed+http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-4/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-1/ "Crear un módulo para python con la Python C API (I)"
 [2]: http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-2/ "Crear un módulo para python con la Python C API (II)"
 [3]: http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-3-distutils/ "Crear un módulo para python con la Python C API (III)"
 [4]: http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-5-python3/ "Crear un módulo para python con la Python C API (V)"
 [5]: http://elbauldelprogramador.com/how-to/ndk-gdb-depurar-aplicaciones-en-el-nkd-de-android/ "NDK-gdb – Depurar aplicaciones en el NKD de Android"
 [6]: http://elbauldelprogramador.com/programacion/peso-hamming-y-optimizacion/ "Optimizando código y evaluando el rendimiento"
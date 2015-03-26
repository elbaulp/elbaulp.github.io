---
id: 2214
title: 'Python C API &#8211; Cómo pasar un array de structs desde C a Python'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2214
permalink: /python-c-api-como-pasar-un-array-de-structs-desde-c-python/
categories:
  - C
  - python
tags:
  - modulos python
  - python C API
  - structs c
---
Hace algún tiempo estaba desarrollando un módulo para python, con el cual aprendí bastante y sirvió para crear una serie de artículos sobre el tema ([Crear un módulo para python con la Python C API][1]). Uno de los problemas encontrados fue cómo conseguir pasar un array de structs desde C a Python, para resolver la duda pregunté, cómo no, en <a href="http://stackoverflow.com/users/1612432/algui91" title="PErfil en SO" target="_blank">stackoverflow</a>. Al final terminé respondiéndome a mí mismo, pero aprendí bastante, veamos cómo hacerlo.

<!--more-->

El struct a pasar puede ser cualquiera, pero en el ejemplo concreto era este:

{% highlight c %}>struct tcpstat
{
    inet_prefix local;
    inet_prefix remote;
    int     lport;
    int     rport;
    int     state;
    int     rq, wq;
    int     timer;
    int     timeout;
    int     retrs;
    unsigned    ino;
    int     probes;
    unsigned    uid;
    int     refcnt;
    unsigned long long sk;
    int     rto, ato, qack, cwnd, ssthresh;
};
{% endhighlight %}

La solución consiste en crear un objeto <a href="http://docs.python.org/3.2/c-api/list.html" title="C API doc" target="_blank">PyListObject</a> y un <a href="http://docs.python.org/3.2/c-api/structures.html#PyObject" target="_blank">PyObject</a>. Éste último lo usaremos como un diccionario y será donde iremos añadiendo los datos necesarios del struct. De esta forma estamos construyendo una lista cuyos elementos son diccionarios, algo así:

{% highlight python %}>[
   {'clave1': 'valor1',  # Diccionario 1, con dos elementos.
    'clave1_2': 'valor1_2'}, 
   {'clave2' : 'valor2'}, # Diccionario 2, con un elemento.
   {'clave3' : 'valor3',
    #........ : .......,
    'claven' : 'valorn'}, # Diccionario 3, con N elementos.
]
{% endhighlight %}

El código es el siguiente:

{% highlight c %}>PyObject *dict = NULL;
PyListObject *list;

list = (PyListObject *) Py_BuildValue("[]");

int i = 0;
for (i; i &lt; stats_length; i++) {
    dict = Py_BuildValue("{s:i}", "LPort", stats[i].lport);
    PyList_Append(list, dict);
}

return (PyObject *) list;
{% endhighlight %}

En el ejemplo sólo se está almacenando un campo del struct, para almacenar más, simplemente habría que modificar la línea por:

{% highlight c %}>dict = Py_BuildValue("{"
                     "   s:i,"
                     "   s:i"
                     "}",
                        "Dir Local.", stats[i].lport,
                        "Dir Remota.", stats[i].rport);
{% endhighlight %}

Y continuar rellenando el diccionario según nuestras necesidades.

#### Referencias

*Python C API How to pass array of structs from C to Python* **|** <a href="http://stackoverflow.com/questions/15786525/python-c-api-how-to-pass-array-of-structs-from-c-to-python/15833209#15833209" target="_blank">stackoverflow.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Python C API &#8211; Cómo pasar un array de structs desde C a Python+http://elbauldelprogramador.com/python-c-api-como-pasar-un-array-de-structs-desde-c-python/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/python-c-api-como-pasar-un-array-de-structs-desde-c-python/&t=Python C API &#8211; Cómo pasar un array de structs desde C a Python+http://elbauldelprogramador.com/python-c-api-como-pasar-un-array-de-structs-desde-c-python/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Python C API &#8211; Cómo pasar un array de structs desde C a Python+http://elbauldelprogramador.com/python-c-api-como-pasar-un-array-de-structs-desde-c-python/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/crear-modulo-python-con-python-c-api-1/ "Crear un módulo para python con la Python C API (I) – Introducción"
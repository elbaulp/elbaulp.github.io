---
id: 1926
title: Cómo depurar una aplicación en Django
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1926
permalink: /como-depurar-una-aplicacion-en-django/
categories:
  - django
tags:
  - depuracion
  - depurar aplicacion django
  - depurar django
  - django
  - pdb
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/09/Introducción-a-Django-–-Instalación-y-primer-proyecto2-1024x575.png" alt="Cómo depurar una aplicación en django" width="770" height="432" class="thumbnail aligncenter size-large wp-image-1903" />

Hace poco vimos una [introducción a django][1]. Pero a medida que las aplicaciones vayan haciéndose más complejas, tendremos la necesidad de saber qué está pasando, qué contienen las variables etc, y para ello será necesario hacer uso del [depurador][2]. Hoy veremos cómo depurar una aplicación en Django.

<!--more-->

Vamos a trabajar con la aplicación de ejemplo de la <a href="https://docs.djangoproject.com/en/1.5/intro/tutorial01/" title="Ejemplo aplicación Django" target="_blank">documentación de <strong>Django</strong></a>. La aplicación consiste un sistema de encuestas en las que se puede votar, se puede descargar desde <a href="https://github.com/algui91/djangoTutorialv1.5/" title="Ejemplo Polls Django" target="_blank">este repositorio</a>.

### Añadir un punto de ruptura

El primer paso para depurar, es establecer un punto de ruptura en la línea deseada. En este caso lo estableceremos en la vista principal (IndexView), en el fichero *polls/views.py*. Es necesario importar el módulo **pdb**.

{% highlight python %}># polls/views.py
# ...
import pdb

class IndexView(generic.ListView):
        template_name = 'polls/index.html'
        context_object_name = 'latest_poll_list'

        def get_queryset(self):
                """Return the last five published polls (not including those set to be
                published in the future)
                """
                pdb.set_trace() ## Punto de ruptura
                return Poll.objects.filter(
                                pub_date__lte=timezone.now()
                       ).order_by('-pub_date')[:5]

# ...
{% endhighlight %}

Una vez establecido el punto de ruptura, lanzamos la aplicación con

{% highlight bash %}>$ python manage.py runserver
Validating models...

0 errors found
November 04, 2013 - 17:58:08
Django version 1.5.2, using settings 'mysite.settings'
Development server is running at http://127.0.0.1:8000/
Quit the server with CONTROL-C.
{% endhighlight %}

Con la aplicación ejecutándose, nos dirigimos a <a href="http://127.0.0.1:8000/" target="_blank">http://127.0.0.1:8000/</a>. Como hemos establecido el punto de ruptura en la vista pincipal (/), el depurador aparecerá en la terminal inmediatamente:

{% highlight bash %}>> ~/Desarrollo/python-env/djangoTutorialv1.5/polls/views.py(24)get_queryset()
-> return Poll.objects.filter(
(Pdb) 
{% endhighlight %}

A partir de aquí la depuración es muy parecida a **gdb**, lo primero que debe hacerse para familiarizarse con este entorno es leer la ayuda:

{% highlight bash %}>(Pdb) help

Documented commands (type help &lt;topic>):
========================================
EOF    bt         cont      enable  jump  pp       run      unt   
a      c          continue  exit    l     q        s        until 
alias  cl         d         h       list  quit     step     up    
args   clear      debug     help    n     r        tbreak   w     
b      commands   disable   ignore  next  restart  u        whatis
break  condition  down      j       p     return   unalias  where 

Miscellaneous help topics:
==========================
exec  pdb

Undocumented commands:
======================
retval  rv
{% endhighlight %}

Por ejemplo, con * p <exp>* se imprimirá por pantalla el valor de la expresión:

{% highlight bash %}>p Poll.objects.filter(pub_date__lte=timezone.now()).order_by('-pub_date')[:5]
[&lt;Poll: Titulo encuesta>]
{% endhighlight %}

Que devuelve una sola encuesta, ya que solo existe esta en la base de datos.

¿Hacéis uso de pdb en vuestras aplicaciones durante su desarrollo?, ¿añadiríais algo al artículo?, compártelo en los comentarios.

#### Referencias

*How to debug in django* **|** <a href="http://stackoverflow.com/questions/1118183/how-to-debug-in-django-the-good-way" target="_blank">stackoverflow</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo depurar una aplicación en Django+http://elbauldelprogramador.com/como-depurar-una-aplicacion-en-django/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-depurar-una-aplicacion-en-django/&t=Cómo depurar una aplicación en Django+http://elbauldelprogramador.com/como-depurar-una-aplicacion-en-django/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo depurar una aplicación en Django+http://elbauldelprogramador.com/como-depurar-una-aplicacion-en-django/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/django/introduccion-django-instalacion-y-primer-proyecto/ "Introducción a Django – Instalación y primer proyecto"
 [2]: http://elbauldelprogramador.com/?s=gdb&submit= "Depuradores"
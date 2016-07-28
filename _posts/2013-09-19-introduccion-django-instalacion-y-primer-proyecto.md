---
title: 'Introducción a Django &#8211; Instalación y primer proyecto'

layout: post.amp
permalink: /introduccion-django-instalacion-y-primer-proyecto/
categories:
  - django
tags:
  - ejemplos django
  - instalar django
main-class: "dev"
color: "#E64A19"
---
<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive" src="/assets/img/2013/09/Introducción-a-Django-–-Instalación-y-primer-proyecto2.png" alt="Introducción a Django – Instalación y primer proyecto" width="1921px" height="1080px" />

Hacía tiempo que el [framework][1] web ***Django*** estaba en mi lista de cosas a las que echar un vistazo. Por fin he podido sacar un hueco para instalarlo y trastearlo un poquito. Hoy comparto con vosotros lo que he aprendido mediante una pequeña introducción en la que veremos cómo instalar django bajo un entorno virtual para no ensuciar demasiado el sistema, y una pequeña aplicación sacada de la documentación oficial de ***Django***.

<!--ad-->

### Instalar django bajo un entorno virtual con virtualenv

Vamos a instalar virtualenv, lo cual nos permitirá crear un entorno virtual en el que trabajar con python e instalar fácilmente aplicaciones mediante **easy_install**. Para ello ejecutamos:

```bash
$ sudo aptitude install python-setuptools

```

Tras esto, ahora podemos instalar virtualenv:

```bash
sudo easy_install virtualenv

```

#### Inicializar el entorno virtual

Con virtualenv instalado ahora creamos un directorio en el que instalar todo lo relacionado con ***Django*** y sus dependencias:

```bash
$ virtualenv python-env

```

Al ejecutar este comando tendremos una carpeta llamada python-env, entramos y activamos el entorno virtual:

```bash
$ cd python-env
$ . bin/activate

```

#### Instalar Django

Por último, instalamos ***Django***:

```bash
$ easy_install django

```

### Configurando Django

Asumiremos que la versión instalada es la 1.5:

```bash
$ python -c "import django; print(django.get_version())"
1.5.2

```

#### Crear un proyecto

Para inicializar un proyecto debemos ejecutar el siguiente comando:

```bash
$ django-admin.py startproject mysite

```

El cual creará un directorio llamado *mysite*, la estructura del proyecto es la siguiente:

```bash
mysite/
    manage.py
    mysite/
        __init__.py
        settings.py
        urls.py
        wsgi.py

```

  * El directorio *mysite* más exterior es simplemente un contenedor para el proyecto, su nombre no influye en **Django** y puede ser renombrado si así lo queremos.
  * *manage.py* es un pequeño programa que nos ayudará a interaccionar con el proyecto.
  * El directorio interno *mysite* es el paquete Python para el proyecto, El nombre de este directorio es el que usaremos cuando queramos importar algo de este proyecto.
  * *mysite/\_\_init\_\_.py*. Fichero vacío que indica a Python que el directorio debe considerarse como un paquete.
  * *mysite/settings*. Configuraciones del proyecto.
  * *mysite/urls.py*. La declaración de URLs para este proyecto; como una &#8220;Tabla de contenidos&#8221; del proyecto.
  * mysite/wsgi.py. Punto de entrada para servidores webs compatibles con <a href="http://en.wikipedia.org/wiki/Web_Server_Gateway_Interface" title="Qué es WSGI" target="_blank">WSGI</a>.

#### El servidor de desarrollo

**Django** proporciona un servidor simple que nos permita probar nuestro proyecto de forma local, para iniciarlo hay que ejecutar:

```bash
$ python manage.py runserver

```

#### El fichero de configuración settings.py

##### Configurar la base de datos

Para modificar la configuración de la [base de datos][2] editamos el fichero *mysite/settings.py*, en este tutorial usaremos *sqlite* por ser la más sencilla.

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': '/ruta/a/la/base/de/datos/mysitedb.sqlite',                      # Or path to database file if using sqlite3.
        # The following settings are not used with sqlite3:
        'USER': '',
        'PASSWORD': '',
        'HOST': '',                      # Empty for localhost through domain sockets or '127.0.0.1' for localhost through TCP.
        'PORT': '',                      # Set to empty string for default.
    }
}

```

##### Aplicaciones instaladas

En *INSTALLED_APPS* se definen las aplicaciones instaladas en nuestro proyecto, por defecto tendremos:

```python
INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # Uncomment the next line to enable the admin:
    'django.contrib.admin',
    # Uncomment the next line to enable admin documentation:
    # 'django.contrib.admindocs',
)

```

La aplicación de ejemplo que creemos deberá referenciarse aquí para poder usarla.

### Crear una aplicación

Para crear una nueva aplicación basta con ejecutar el comando:

```bash
$ python manage.py startapp polls

```

Lo cual creará un directorio llamado *polls*, cuyo contenido será:

```bash
polls/
    __init__.py
    models.py
    tests.py
    views.py

```

En **models.py** se define los modelos que se usarán para crear la base de datos mediante [clases][3] en Python. En este caso necesitamos una tabla *Poll* (Encuesta) y *Choice* (Opción elegida). La encuesta tendrá dos campos, *question* y *pub_date*. Mientras que la opción elegida tendrá que hacer referencia a qué encuesta pertenece mediante una [foreignKey][4], un texto que describa la opción y el número de votos. Dicho esto, el fichero *models.py* contendrá:

```python
from django.db import models

class Poll(models.Model):
    question = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

class Choice(models.Model):
    poll = models.ForeignKey(Poll)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

```

Tras escribir los modelos que necesitamos, ejecutamos *python manage.py syncdb* para crear las tablas en la base de datos.

**views.py** se encarga de mostrar la página al usuario. Antes de comenzar, debemos activar la aplicación agregándola *INSTALLED_APPS*:

```python
INSTALLED_APPS = (
# ...
'polls',
# ...
)

```

#### Activar el panel de administración

Para poder acceder a las tablas que hemos creado en el paso anterior, es necesario activar el panel de administración, para ello modificamos el archivo *mysite/urls.py* para que quede así:

```bash
from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
)

```

Ejecutamos el servidor con *python manage.py runserver* y entramos a <a href="http://127.0.0.1:8000/admin/" target="_blank">http://127.0.0.1:8000/admin/</a>. Deberíamos ver:

<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive" src="/assets/img/2013/09/admin01.png" alt="Introducción a Django – Instalación y primer proyecto" width="336px" height="192px" />

Para poder hacer accesibles los modelos que acabamos de crear desde el panel de administración, debemos configurar django para que los objetos Polls tengan una interfaz en el panel de administración. Para ello, crea un archivo llamado *admin.py* en el directorio *polls*:

```python
from django.contrib import admin
from polls.models import Poll

admin.site.register(Poll)

```

Debemos reiniciar el servidor para que los cambios se apliquen, ahora sí vemos la aplicación polls:

<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive" src="/assets/img/2013/09/admin03t.png" alt="Introducción a Django – Instalación y primer proyecto" width="400px" height="134px" />

#### Escribir la primera vista

Hemos mencionado antes que en *views.py* se define qué se va a mostrar al usuario. Veamos la vista más simple que podemos crear. En *polls/views.py* escribe lo siguiente:

```python
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the poll index.")

```

Sin embargo, para conseguir que funcione, debemos crear un archivo *urls.py* que asocie la función **index** a una dirección URL. En *polls/urls.py* escribe:

```python
from django.conf.urls import patterns, url

from polls import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index')
)

```

Y ahora debemos decir a *mysite/urls.py* que use también *polls/urls.py* cuando busque qué funciones asociar a qué urls:

```python
from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^polls/', include('polls.urls')),
    url(r'^admin/', include(admin.site.urls)),
)

```

Tras modificar estos ficheros, veremos el mensaje **Hello, world. You&#8217;re at the poll index.** en <a href="http://127.0.0.1:8000/polls" target="_blank">http://127.0.0.1:8000/polls</a>.

#### Ejemplo completo

Para no alargar mucho este artículo, he intentado dar unas nociones básicas de cómo instalar y empezar a usar django. El ejemplo completo de la documentación oficial citada en las referencias lo podéis encontrar en <a href="https://github.com/algui91/djangoTutorialv1.5" title="Ejemplo en Github" target="_blank">github</a>.

#### Referencias

*Documentación Oficial* »» <a href="https://docs.djangoproject.com/en/1.5/intro/tutorial01/" target="_blank">djangoproject.com</a>  
*Imagen de aruseni* »» <a href="http://aruseni.deviantart.com/art/Django-white-and-green-318200642" target="_blank">deviantart</a>



 [1]: https://elbauldelprogramador.com/los-10-mejores-frameworks-gratis-de-aplicaciones-web/ "Los 10 Mejores Frameworks gratuitos para Aplicaciones Web"
 [2]: https://elbauldelprogramador.com/bases-de-datos/ "Bases de datos"
 [3]: https://elbauldelprogramador.com/clases-y-objetos-introduccion/ "Clases y objetos – Introducción"
 [4]: https://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-create/ "Lenguaje Definición de Datos(DDL) – CREATE"

{% include toc.html %}

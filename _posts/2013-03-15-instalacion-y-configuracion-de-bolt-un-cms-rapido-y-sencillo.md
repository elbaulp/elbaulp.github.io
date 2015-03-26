---
id: 1473
title: Cómo instalar Bolt, un CMS rápido y sencillo

layout: post
guid: http://elbauldelprogramador.com/?p=1473
permalink: /instalacion-y-configuracion-de-bolt-un-cms-rapido-y-sencillo/
categories:
  - How To
  - opensource
tags:
  - bolt vs wordpress
  - CMS rápido
  - instalar bolt
---
Leyendo notícias en mi lector RSS, encontré en Genbeta Dev un artículo hablando de **Bolt**, un CMS muy ligero y rápido. Tras ojear un poco la página oficial del proyecto decidí probarlo y la verdad es que ma ha causado muy buenas sensaciones. En esta entrada explicaré cómo instalar Bolt y cómo manejar este sencillo CMS.  
<!--more -->

### Objetivos de Bolt

Bolt se centra en ser lo más sencillo y simple posible. Es muy rápido de instalar, de fácil configuración y usa unas plantillas muy elegantes. Ha sido creado usando bibliotecas [open source][1] modernas y es el más adecuado para crear webs en [HTML5][2].

### Datos técnicos

Bolt está escrito en [PHP][3], en cuanto a [bases de datos][4] es capaz de usar SQLite, MySQL o PostgreSQL. Está construido sobre el <a href="http://silex.sensiolabs.org/" target="_blank">framework Silex</a>. En cuanto a la licencia, está bajo la <a href="http://opensource.org/licenses/mit-license.php" target="_blank">MIT-license</a>.

Una aspecto a favor de Bolt es la flexibilidad que ofrece a los programadores, con una capacidad de configuración muy alta. De igual manera, por su simpleza es muy útil para cualquier tipo de persona que desee escribir en una web de forma rápida y sencilla.

### Instalando Bolt

Tras esta breve introducción a Bolt, voy a pasar a explicar cómo instalarlo y configurarlo.

Antes de proceder, asegúrate que cumples con los requisitos mínimos:

  * PHP 5.3.2 o superior
  * Acceso a SQLite (Viene por defecto en PHP 5.3), *o* MySQL *o* PostgreSQL
  * Apache con *Mod_rewrite ([.htaccess][5])* o [Nginx][6]

En la página oficial ofrecen tres formas de instalar Bolt. **Desde línea de comandos**, usando SFTP o la **instalación para desarrolladores**. En ester artículo cubriré la primera y tercera opción.

### Instalar Bolt desde línea de comandos

Empecemos por la más sencilla, bastarán 3 órdenes en la terminal para finalizar la instalación:

{% highlight bash %}curl -O http://bolt.cm/distribution/bolt_latest.tgz
tar -xzf bolt_latest.tgz
chmod -R 777 files/ app/database/ app/cache/ app/config/ theme/
{% endhighlight %}

La razón de establecer los permisos a [777][7] es porque en la mayoría de servidores el servidor web está en un grupo distinto a tu cuenta de usuario, por eso es necesario dar permisos de escritura a los ficheros de arriba.

Eso es todo, así de fácil es instalar Bolt. La primera vez que visites la web deberás registrar un usuario para administar la web:

[<img src="/images/2013/03/Login-to-bolt-CMS-1024x819.png" alt="crear usuario en bolt" width="770" height="615" class="aligncenter size-large wp-image-1474" />][8]{.thumbnail} 

Ya en el panel de administración, puedes agregar contenido de muestra dirigiendote a *Settings » Check Database* y hacer click en **Add some sample Records with Loripsum text**. Tras hacer click tendremos contenido que mostrar en la web:

[<img src="/images/2013/03/Bolt-Home-PAge-CMS-1024x819.png" alt="Bolt Home PAge CMS" width="770" height="615" class="aligncenter size-large wp-image-1476" />][9]{.thumbnail}

Por defecto Bolt usa Sqlite como base de datos, normalmente se instala con php5, si recibes un mensaje de error informando que el módulo SQLite no está disponible debes instalarlo: 

{% highlight bash %}# aptitude install php5-sqlite
{% endhighlight %}

Si prefieres usar MySQL o PostgreSQL debes editar el fichero de configuración **/app/config/config.yml**:

*Para MySQL:*

{% highlight bash %}database:
  driver: mysql
  username: bolt
  password: password
  databasename: bolt
{% endhighlight %}

*Para PostgreSQL (**Experimental**)*

{% highlight bash %}database:
  driver: postgres
  username: bolt
  password: password
  databasename: bolt
{% endhighlight %}

### Instalar Bolt por el método para desarrolladores

Este método no es mucho más complicado que el anterior. La ventaja es que permite estar a la última en cuanto a la versión, y el método de actualización es muy sencillo. En este caso se usará **git** y **Composer**:

{% highlight bash %}git clone git://github.com/bobdenotter/bolt.git bolt
cd bolt
curl -s http://getcomposer.org/installer | php
php composer.phar install
{% endhighlight %}

Normalmente los ficheros creados deberían tener los permisos correctos, de no ser así, ejecuta:

{% highlight bash %}chmod -R 777 files/ app/database/ app/cache/ app/config/ theme/
{% endhighlight %}

Listo, puedes dirigirte a la web, registrar un usuario y empezar a escribir.

Para actualizar la instalación basta con hacer lo siguiente:

{% highlight bash %}git pull
cd bolt
php composer.phar self-update
php composer.phar update
{% endhighlight %}

Algo que me ha llamado mucho la atención es la facilidad que se le da al desarrollador para depurar el entorno. Si estás logeado y con el modo depuración activado (*debug:true* en el archivo *config.yml*) verás una barra de depuración abajo a la derecha:

[<img src="/images/2013/03/bolt-debug.png" alt="bolt debug" width="748" height="55" class="aligncenter size-full wp-image-1477" />][10]{.thumbnail}

Desde ahí se puede acceder a estadísticas de carga, uso de memoria, entradas del log, consultas a la base de datos etc.

Incluso cuando estés desarrollando una extensión puedes obtener información de cualquier objeto o variable, en las plantillas hay que escribir *{{ print(variable) }}* y en código *\util::var_dump($variable);*

### Conclusión

Creo que este CMS promete mucho, personalmente me ha gustado y en un futuro no descartaría mover el blog de WordPress a Bolt.

#### Referencias

*Visto en* **|** <a href="http://www.genbetadev.com/gestores-de-contenido/bolt-un-cms-sencillo-y-rapido-como-un-rayo" target="_blank">Genbeta::Dev</a>  
*Sitio Oficial* **|** <a href="http://bolt.cm/" target="_blank">bolt.cm</a>



 [1]: /category/opensource/
 [2]: /?s=html5
 [3]: /category/php/
 [4]: /category/basededatos/
 [5]: http://elbauldelprogramador.com/how-to/como-migrar-de-blogger-a-wordpress-sin-perder-seo-y-tips-de-seguridad/ "Cómo migrar de Blogger a WordPress sin perder SEO y Tips de seguridad"
 [6]: http://elbauldelprogramador.com/how-to/como-instalar-nginx-con-php5-fpm/ "Cómo instalar y configurar Nginx con php5-fpm"
 [7]: /programacion/programacion-bash-metacaracteres_12/
 [8]: /images/2013/03/Login-to-bolt-CMS.png
 [9]: /images/2013/03/Bolt-Home-PAge-CMS.png
 [10]: /images/2013/03/bolt-debug.png
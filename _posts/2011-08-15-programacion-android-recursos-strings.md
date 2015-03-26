---
id: 244
title: 'Programación Android: Recursos &#8211; Strings'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-strings/
permalink: /programacion-android-recursos-strings/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/08/programacion-android-recursos-strings.html
  - /2011/08/programacion-android-recursos-strings.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - recursos android
  - strings android
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Como ya hemos visto, los recursos juegan un papel muy importante en la arquitectura Android. Un recurso en Android es un archivo (como un fichero de música) o un valor (como el título de un Diálogo) que está ligado a una aplicación ejecutable. Estos archivos están ligados a un ejecutable de tal manera que podemos cambiarlos sin necesidad de recompilar la aplicación.

Los ejemplos de recursos más familiares son cadenas de texto, colores e imágenes. En lugar de escribir las cadenas de texto en el código fuente, usamos sus IDs. Esta indirección nos permite cambiar el valor de la cadena sin tener que cambiar el código fuente.

Existen mucho recursos en Android, que vamos a ver a lo largo de las etradas posteriores. Empezaremos por un recurso muy común, los string:

  
<!--more-->

## Recursos string

Android permite definir strings en uno o más archivos XML de recursos. Estos archivos están bajo el directorio ***./res/values***. El nombre del archivo XML para este tipo de recurso puede ser cualquiera, pero por convención se suele llamar ***strings.xml***. Veamos un ejemplo de este fichero:

{% highlight xml %}>&lt; ?xml version="1.0" encoding="utf-8"?>
&lt;resources>
   &lt;string name="hello">Hello&lt;/string>
   &lt;string name="app_name">Hello app_name&lt;/string>
&lt;/resources>
{% endhighlight %}

Cuando este archivo se crea o modifica, el plugin ADT de eclipse automáticamente creará o actualizará una clase java de nuestra aplicación llamada ***R.java*** alojada en el directorio ./gen, que contiene los IDs únicos para las dos cadenas que acabamos de crear.

Para el fichero strings.xml que acabamos de crear, tendremos lo siguiente en la clase R:

{% highlight java %}>package nombre.de.nuestro.paquete;

public final class R {
   //.. otras entradas dependiendo de tu proyecto y aplicación
   
   public static final class string {
      //.. otras entradas dependiendo de tu proyecto y aplicación
      public static final int app_name=0x7f040001;
      public static final int hello=0x7f040000;
      //.. otras entradas dependiendo de tu proyecto y aplicación
   }
   //.. otras entradas dependiendo de tu proyecto y aplicación
}
{% endhighlight %}

Como vemos como primero R.java define una clase principal en el paquete raiz: ***public final class R***. Depues, define una clase interna llamada ***public static final class string***. R.java crea esta clase estática interna como espacio de nombres para guardar los IDs de los recursos string.

La definición de los dos ***public static final int*** llamados app_name y hello son los IDs de los recursos que representan nuestras cadenas de texto. Podemos usar estos IDs en cualquier lugar de nuestro código mediante ***R.string.hello o R.string.app_name***

La estructura del fichero string.xml es muy fácil de seguir. Tenemos un elemento raiz llamado <resources>, seguido por uno o más elementos hijos <string>. Cada elemento </string><string> tiene una propiedad llamada ***name*** que será la que usará como identificador R.java.</string></resources>

Para comprobar que se permiten varios recursos de string en el directorio values, vamos a crear otro fichero llamado strings1.xml con lo siguiente:

{% highlight xml %}>&lt; ?xml version="1.0" encoding="utf-8"?>
&lt;resources>
   &lt;string name="hello1">Hello&lt;/string>
   &lt;string name="app_name1">Hello app_name&lt;/string>
&lt;/resources>
{% endhighlight %}

Ahora, el plugin ADT de eclipse se encargará de actualizar el fichero R.java, que contendrá lo siguiente:

{% highlight java %}>package nombre.de.nuestro.paquete;

public final class R {
   //.. otras entradas dependiendo de tu proyecto y aplicación
   
   public static final class string {
      //.. otras entradas dependiendo de tu proyecto y aplicación
      public static final int app_name=0x7f040001;
      public static final int hello=0x7f040000;
      public static final int app_name1=0x7f040006;
      public static final int hello1=0x7f040005;
      //.. otras entradas dependiendo de tu proyecto y aplicación
   }
   //.. otras entradas dependiendo de tu proyecto y aplicación
}
{% endhighlight %}

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Layout][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Strings+http://elbauldelprogramador.com/programacion-android-recursos-strings/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-strings/&t=Programación Android: Recursos &#8211; Strings+http://elbauldelprogramador.com/programacion-android-recursos-strings/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Strings+http://elbauldelprogramador.com/programacion-android-recursos-strings/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-recursos-layout/
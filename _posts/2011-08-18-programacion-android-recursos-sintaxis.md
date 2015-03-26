---
id: 247
title: 'Programación Android: Recursos &#8211; Sintaxis de los Recursos'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-sintaxis-de-los-recursos/
permalink: /programacion-android-recursos-sintaxis/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/08/programacion-android-recursos-sintaxis.html
  - /2011/08/programacion-android-recursos-sintaxis.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Independientemente del tipo de recurso (de string y layout son los dos que hemos visto hasta ahora), Todos los recursos Android están identificados (o referenciados) por sus ids en código fuente Java.

La sintaxis que usamos para crear un ID de recurso en un fichero XML se llama resource-reference syntax (sintaxis de referencia a recurso). La sintaxis del atributo id que vimos anteriormente (@+id/text1) tiene la siguiente estructura formal:

  
<!--more-->

{% highlight java %}>@[package:]type/name
{% endhighlight %}

El tipo (type), corresponde a uno de los espacios de nombres de tipos de recursos disponible en R.java, que son algunos de los siguientes:

  * R.drawable 
  * R.id 
  * R.layout 
  * R.string 
  * R.attr 
  * R.plural 
  * R.array 

En sintaxis de referencia a recursos XML, estos tipos se nombrarían así:

  * drawable 
  * id 
  * layout 
  * string 
  * attr 
  * plurals 
  * string-array 

La parte name en @[package:]type/name corresponde al nombre dado al recurso (text1 en nuestro ejemplo anterior), este nombre, también será represantado como una constante entera en R.java.

Si no se especifica ningún paquete en @\[package:\] (de ahí que en la representación formal de la sintaxis aparezca entre corchetes, que quiere decir que es opcional); el par tipo/nombre será resuelto basándose en los recursos locales y en el archivo R.java local de nuestra aplicación.

Si especificamos android:type/name, el id referenciado será resuelto usando el paquete android y específicamente a través del archivo android.R.java. Podemos usar cualquier nombre de paquete java en el lugar de @[package:] para localizar el archivo R.java correcto y resolver la referencia al recurso en cuestión. Ahora que conocemos la sintaxis, vamos a analizar unos ejemplos. Nótese que la parte izquierda del ID android:id no es parte de la sintaxis. “android:id” simplemente indica que vamos a crear un id para un control como lo es el TextView. 

{% highlight xml %}>&lt;textview android:id=”text”> 
<!-- Error de compilación, como id no tomará cadenas de texto sin formato. -->

&lt;/textview>&lt;textview android:id=”@text”> 


<!--  Sintaxis incorrecta.  No disponde de tipo y nombre-->


<!--  debería ser @id/text, @+id/text o @string/string1-->


<!--  obtendremos el siguiente error: “No resource type specified”-->

&lt;/textview>&lt;textview android:id=”@id/text”>


<!--  Error: No hay ningún recurso que coincida con el id “text”-->


<!--  a no ser que lo hayamos definido nosotros mismos con anterioridad.-->

&lt;/textview>&lt;textview android:id=”@android:id/text”>


<!--  Error: el recurso no es público-->


<!--  lo que indica que no hay tal identificación en android.R.id-->


<!--  Por supuesto esto será válido si el archivo android R.java definió un id con este nombre.-->

&lt;/textview>&lt;textview android:id=”@+id/text”>


<!-- Correcto: crea un id llamado text  en el paquete R.java local.-->
&lt;/textview>{% endhighlight %}

En la sintaxis “@+id/text”, el signo + tiene un significado especial. Le dice a Android que el ID puede no existir aún y, que en ese caso, cree uno nuevo y lo llame text.

* * *

#### Siguiente Tema: [Programación Android: Recursos compilados y no compilados][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Sintaxis de los Recursos+http://elbauldelprogramador.com/programacion-android-recursos-sintaxis/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-sintaxis/&t=Programación Android: Recursos &#8211; Sintaxis de los Recursos+http://elbauldelprogramador.com/programacion-android-recursos-sintaxis/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Sintaxis de los Recursos+http://elbauldelprogramador.com/programacion-android-recursos-sintaxis/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-recursos-2/
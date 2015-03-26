---
id: 245
title: 'Programación Android: Recursos &#8211; Layout'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-layout/
permalink: /programacion-android-recursos-layout/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/08/programacion-android-recursos-layout.html
  - /2011/08/programacion-android-recursos-layout.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - layout android
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

En Android, cada pantalla de una aplicación habitualmente se carga desde un fichero XML que actua de recurso. Un recurso layout es un recurso clave que se usa en Android para componer la UI de nuestra aplicación. Vamos a considerar el segmenteo de código siguiente como ejemplo de una [actividad][1] en Android.

  
<!--more-->

{% highlight java %}>public class PrincipalActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }
}
{% endhighlight %}

La línea ***setContentView(R.layout.main);*** señala que hay una clase estática llamada *R.layout* y, que dentro de esa clase hay una constante entera llamada *main* que apunta a una vista definida por un fichero de recursos layout xML. El nombre del fichero XML es main.xml, el cual debe estar en el directorio *./res/layout*. El contenido de este fichero es el siguiente:

{% highlight xml %}>&lt; ?xml version="1.0" encoding="utf-8"?>
&lt;linearlayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    >
    &lt;textview android:id="@+id/text1"
        android:layout_width="fill_parent" 
        android:layout_height="wrap_content" 
        android:text="@string/hello" />
    &lt;button android:id="@+id/b1"
        android:layout_width="fill_parent" 
        android:layout_height="wrap_content" 
        android:text="@string/hello"/>
    
&lt;/linearlayout>
{% endhighlight %}

Vamos a ver la composición de este fichero, como elemento raiz tenemos un elemento llamado <linearlayout>, que contiene un *TextView* seguido de un *Button*. Un LinearLayout coloca a sus hijos uno detrás de otro vertical u horizontalmente.</linearlayout> 

Para cada pantalla que queramos hacer, necesitaremos ficheros layout distintos, mejor dicho, cada layout debe estar en un fichero, como ***./res/layout/screen1.xml y ./res/layout/screen2.xml***

Por cada archivo de layout que tengamos en ./res/layout, se generará una entrada en R.java. Por ejemplo, si tenemos estos dos archivos, file1.xml y file2.xml, en R.java aparecerá:

{% highlight java %}>// ...
public static final class layout {
   public static final int file1=0x7f030000;
   public static final int file2=0x7f030001;
}
// ..
{% endhighlight %}

Las vistas definidas en estos layout, como el TextView son accesibles mediante código java a través sus IDs de recursos generadas en R.java.

{% highlight java %}>TextView tv = (TextView) this.findViewById(R.id.text1);
tv.setText("Texto para el TextView")
{% endhighlight %}

En este ejemplo, hemos localizado el TextView usando el método ***findViewById()*** de la clase Activity. La constante *R.id.text1* corresponde al ID definido para el TextView en el fichero XML, que creamos de la siguiente manera:

{% highlight xml %}>&lt;textview android:id="@+id/text1"
....
/>
{% endhighlight %}

El valor del atributo id, indica que la constante llamada text1 será usada para identificar únicamente a esa vista. El signo + de ***+id/text1*** significa que el ID text1 será creado si no existe. En la siguiente entrada se tratará la sintaxis de los recursos.

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Sintaxis de los Recursos][2] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Layout+http://elbauldelprogramador.com/programacion-android-recursos-layout/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-layout/&t=Programación Android: Recursos &#8211; Layout+http://elbauldelprogramador.com/programacion-android-recursos-layout/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Layout+http://elbauldelprogramador.com/programacion-android-recursos-layout/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /fundamentos-programacion-android_17/
 [2]: /programacion-android-recursos-sintaxis/
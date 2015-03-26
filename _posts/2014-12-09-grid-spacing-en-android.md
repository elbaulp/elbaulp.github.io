---
id: 2473
title: Grid Spacing en Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2473
permalink: /grid-spacing-en-android/
categories:
  - android
  - Artículos
tags:
  - android
  - divider android
  - divider layout
  - drawable tricks
  - grid
  - gridlayout
  - spacer android
  - spacer linearlayout
---
*Éste artículo es una traducción del blog de [Cyril Mottier][1], al cual le agradezco que me diera permiso para escribirlo. Quizás te interese leer ([Pon a dieta tus APKs][2]), otra traducción de su blog.*

* * *

La mayoría de interfaces de usuario (en móviles o web) se basan en el concepto de [rejillas][3] (**Grids** a partir de ahora). Los **Grids** consisten básicamente en separar la interfaz de usuario en una serie de cuadrados alineados que pueden ser fusionados para crear bloques. Usando el principio Grid en el desarrollo de la UI (Interfaz de usuario) ayuda a alinear elementos, trae consistencia, genera un código limpio, asegura que el usuario pueda analizar fácilmente el contenido de la interfaz etc. En resumen, los **Grids** son una herramienta de diseño extremadamante potentes.

## El principio Grid

Usar el principio Grid, requiere generalmente que el desarrollador añada algún margen/paddin/espacio extra entre elementos. En efecto, añadir espacio entre elementos ayuda a mantener una separación clara entre bloques mientras se conserva un gran nivel del legibilidad en la interfaz. Todos los desarrolladores [Android][4] están familiarizados con éstos conceptos, y en la mayoría de los casos se solucionan usando características del [framework][5] como *padding* y/o *margin* en las *Views*. Para aislar claramente la lógica del programa de la interfaz, generalmente ésto se hace en los [ficheros XML que definen la interfaz][6]. Si bien éste método funciona cuando la interfaz es estática, puede se complicado para interfaces dinámicas en las cuales hay elementos que se muestran o desaparecen según sea necesario. Éste artículo pretende dar algunos consejos para manejar correctamente interfaces dinámicas basadas en **Grids**.

<!--more-->

## Ejemplo

Creemos un *layout* simple a modo de ejemplo. Consiste en una barra horizontal de tres [Buttons][7] que aparecen debajo de una `View` estática (El logo de la aplicación, por ejemplo). El resultado es el siguiente:

#### layout/activity_main.xml

{% highlight xml %}>&lt;LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
  android:layout_width="match_parent"
  android:layout_height="wrap_content"
  android:orientation="vertical"
  android:padding="@dimen/spacing_medium">

  &lt;TextView
    android:layout_width="match_parent"
    android:layout_height="128dp"
    android:background="@color/light_gray"
    android:gravity="center"
    android:text="@string/application_logo"
    android:textAppearance="@android:style/TextAppearance.Material.Display1" />

  &lt;LinearLayout
    android:id="@+id/buttons_container"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="horizontal">

    &lt;Button
      android:id="@+id/btn_first"
      android:layout_width="0dp"
      android:layout_height="wrap_content"
      android:layout_weight="1"
      android:background="@drawable/purple"
      android:text="@string/button_1" />

    &lt;Button
      android:id="@+id/btn_second"
      android:layout_width="0dp"
      android:layout_height="wrap_content"
      android:layout_weight="1"
      android:background="@drawable/indigo"
      android:text="@string/button_2" />

    &lt;Button
      android:id="@+id/btn_third"
      android:layout_width="0dp"
      android:layout_height="wrap_content"
      android:layout_weight="1"
      android:background="@drawable/teal"
      android:text="@string/button_3" />

  &lt;/LinearLayout>

&lt;/LinearLayout>
{% endhighlight %}

<img src="http://elbauldelprogramador.com/content/uploads/2014/12/Grid-Spacing-en-Android-take_1.png" alt="Grid Spacing en Android - take_1" width="1080" height="624" class="size-full wp-image-2499" />

La interfaz mostrada en la imagen de arriba depende claramente en la idea de un Grid. Sin embargo, carece de espacio entre elementos que permitan al usuario distinguir claramente la entidades independientes de la interfaz. Corrijamos éste problema añadiendo `android:layout_marginTop="@dimen/spacing_medium"` al `LinearLayout` identificado por `@id/buttons_container` y `android:layout_marginRight="@dimen/spacing_medium"` a los botones `@id/btn_first` y `@id/btn_second`:

<img src="http://elbauldelprogramador.com/content/uploads/2014/12/Grid-Spacing-en-Android-take_2_1.png" alt="Grid Spacing en Android - take_2_1" width="1080" height="672" class="aligncenter size-full wp-image-2500" />

## El problema de la interfaz dinámica

La interfaz de arriba tiene un aspecto bastante bueno: Buena apariencia, es legible, etc. Desafortunadamente, las cosas se ponen un poco mal cuando se ocultan dinámicamente algunas `Views` en el *layout*. De hecho, imaginemos que la función que se activaría con un click en el botón `@id/btn_third` requiere de alguna característica no disponible en el dispositivo (**Google Play Services** por ejemplo). La mejor forma de no desordenar la interfaz es ocultar el tercer botón con `View.GONE`:

<img src="http://elbauldelprogramador.com/content/uploads/2014/12/Grid-Spacing-en-Android-take_2_2.png" alt="Grid Spacing en Android - take_2_2" width="1080" height="672" class="aligncenter size-full wp-image-2501" />

Como es de esperar, el botón `@id/btn_third` desaparece, pero el borde derecho de `@id/btn_second` no está alineado con el borde derecho del icono de la aplicación. La razón principal de éste problema se debe a que la técnica usando el margen funciona bien siempre que se mantenga la asunción hecha al principio: cada `View` con un margen derecho/superior tiene una `View` vecina a su derecha/arriba. Ocultar algunas `Views` en la barra va en contra de esta restricción.

## Usar un separador para resolver el problema

Un truco obvio para resolver éste problema podría ser cambiar manualmente el margen de los elementos en *Java*. Lo cual es una pésima solución. Otra alternativa sería usar un *Layout* que gestione automáticamente los espacios entre elementos. `GridLayout` es uno de ellos. Por desgracia, éste *Layout* es engorroso de usar y no permite especificar un margen concreto entre elementos (Solo está disponible el margen por defecto).

En realidad, `LinearLayout` gestiona la idea del espacio entre elementos. Ésta característica es algo desconocida ya que está bastante escondida en el framework pero funciona como si de magia se tratara. El truco consiste en usar un [Drawable][8] con anchura/altura intrínsicos como separador de elementos del `LinearLayout`:

#### drawable/spacer_medium.xml

{% highlight xml %}><?xml version="1.0" encoding="utf-8"?>
&lt;shape xmlns:android="http://schemas.android.com/apk/res/android"
  android:shape="rectangle">

  &lt;size
    android:width="@dimen/spacing_medium"
    android:height="@dimen/spacing_medium" />

    &lt;solid android:color="@android:color/transparent" />

  &lt;/shape>
{% endhighlight %}

Ahora se puede usar el `Drawable` creado como un separador entre elementos estableciéndolo como el separador del `LinearLayout`:

#### layout/activity_main.xml

{% highlight xml %}>&lt;LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
  android:layout_width="match_parent"
  android:layout_height="wrap_content"
  android:divider="@drawable/spacer_medium"
  android:orientation="vertical"
  android:padding="@dimen/spacing_medium"
  android:showDividers="middle">

  <!-- TextView -->

  &lt;LinearLayout
    android:id="@+id/buttons_container"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:divider="@drawable/spacer_medium"
    android:orientation="horizontal"
    android:showDividers="middle">

    

<!-- Buttons -->

  &lt;/LinearLayout>

&lt;/LinearLayout>
{% endhighlight %}

<img src="http://elbauldelprogramador.com/content/uploads/2014/12/Grid-Spacing-en-Android-take_3.png" alt="Grid Spacing en Android - take_3" width="1080" height="672" class="aligncenter size-full wp-image-2502" />

## Conclusión

El framework de Android contiene unas cuantas características que pueden usarse y modificar para cumplir con una tarea diferente a la esperada. La idea de un `Drawable` forma parte de dichos trucos habitualmente. Asegúrate de conocer plenamente el concepto de `Drawable`, ya que puede ayudarte a simplificar el código en más de una ocasión.

### Referencias

*Grid Spacing on Android* **|** <a href="http://cyrilmottier.com/2014/11/17/grid-spacing-on-android/" target="_blank">cyrilmottier.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Grid Spacing en Android+http://elbauldelprogramador.com/grid-spacing-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/grid-spacing-en-android/&t=Grid Spacing en Android+http://elbauldelprogramador.com/grid-spacing-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Grid Spacing en Android+http://elbauldelprogramador.com/grid-spacing-en-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://cyrilmottier.com/ "Blog de Cyril"
 [2]: http://elbauldelprogramador.com/pon-dieta-tus-apks/ "Pon a Dieta Tus APKs"
 [3]: http://elbauldelprogramador.com/crear-un-gridview-con-adaptador-personalizado-en-android/ "Crear un GridView con Adaptador personalizado en Android"
 [4]: http://elbauldelprogramador.com/curso-programacion-android/ "Curso de programación en Android"
 [5]: http://elbauldelprogramador.com/los-10-mejores-frameworks-gratis-de-aplicaciones-web/ "Los 11 mejores frameworks gratuitos para aplicaciones Web"
 [6]: http://elbauldelprogramador.com/programacion-android-interfaz-grafica_23/ "Programación Android: Layouts"
 [7]: http://elbauldelprogramador.com/programacion-android-interfaz-grafica_25/ "Programación Android: Componentes Gráficos"
 [8]: http://elbauldelprogramador.com/optimizando-la-interfaz-android-compound-drawables/ "Optimizando la interfaz Android – Compound Drawables"
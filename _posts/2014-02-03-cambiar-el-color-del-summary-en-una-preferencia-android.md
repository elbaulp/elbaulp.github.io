---
id: 2233
title: Cambiar el color del summary en una Preferencia Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2233
permalink: /cambiar-el-color-del-summary-en-una-preferencia-android/
categories:
  - android
tags:
  - color summary android preferencias
  - CUSL
  - preferencias android
  - summary android
---
En un artículo anterior vimos [cómo crear un diálogo personalizado en las preferencias][1] para android. Continuaremos con esa aplicación trivial a modo de ejemplo para ver cómo personalizar el *summary* que aparece debajo del título de una preferencia.

<!--more-->

### Obteniendo el Layout por defecto

Al principio, obtuve el *TextView* que representa el summary, pero cambiarle el color no tenía efecto y se quedaba de color gris. La solución final consistió en crear un propio [layout][2]. Buscando en el código fuente de Android lo encontré en *<a href="https://android.googlesource.com/platform/frameworks/base/+/master/core/res/res/layout/preference_child.xml" target="_blank">frameworks/base/core/res/res/layout/preference_child.xml</a>*. A éste recurso hay que quitarle unas cuantas cosas que no nos sirven, quedando así:

<pre lang="xml"><?xml version="1.0" encoding="utf-8"?>


<!-- Layout for a visually child-like Preference in a PreferenceActivity. -->
&lt;LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:baselineAligned="false"
    android:gravity="center_vertical"
    android:minHeight="?android:attr/listPreferredItemHeight"
    android:paddingEnd="?android:attr/scrollbarSize"
    android:paddingStart="16dip" >

    &lt;RelativeLayout
        android:layout_width="0dip"
        android:layout_height="wrap_content"
        android:layout_marginBottom="6dip"
        android:layout_marginEnd="6dip"
        android:layout_marginTop="6dip"
        android:layout_weight="1" >

        &lt;TextView
            android:id="@+android:id/title"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:ellipsize="marquee"
            android:fadingEdge="horizontal"
            android:singleLine="true"
            android:textAppearance="?android:attr/textAppearanceMedium" />

        &lt;TextView
            android:id="@+android:id/summary"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_alignStart="@android:id/title"
            android:layout_below="@android:id/title"
            android:maxLines="4"
            android:textAppearance="?android:attr/textAppearanceSmall"
            android:textColor="?android:attr/textColorSecondary" />
    &lt;/RelativeLayout>
&lt;/LinearLayout>
</pre>

### Layout para mostrar el error

El layout anterior es el que se usará por defecto, cuando queramos resaltar un error usaremos otro exáctamente igual pero con el color del Summary cambiado, como es repetir código simplemente se muestra el nombre del fichero y el cambio en el TextView con ID ***@android:id/summary***:

***preference\_child\_summary_error.xml***

<pre lang="xml"><!-- ... -->
android:textColor="@color/red"


<!-- ... -->
</pre>

La definición del c[olor se declara][3] en un archivo dentro de la carpeta *values*:  
***./res/values/colors.xml***

<pre lang="xml"><?xml version="1.0" encoding="utf-8"?>
&lt;resources>
    &lt;color name="red">#ff0000&lt;/color>
&lt;/resources>
</pre>

### Cambiar el color en tiempo de ejecución

Ahora que tenemos el diseño listo, veremos cómo cambiarlo cuando ocurra cierta condición. En el caso que nos ocupa necesitaremos resaltar el summary en color rojo cuando el usuario introduzca una contraseña que no cumple con los requisitos establecidos por la aplicación, el código quedará algo así:

<pre lang="java">if (newValue.toString().length() &lt;= 8) {
    mDialogoPersonalizado.setLayoutResource(R.layout.preference_child_summary_error);
    mDialogoPersonalizado.setSummary("Mensaje de error");
} else {
    mDialogoPersonalizado.setLayoutResource(R.layout.preference_child);
    mDialogoPersonalizado.setSummary("********");
    mEditorDialogoPerso.putString("diagPerso", passw);
    mPasswordDialogoPerso = passw;
    mEditorDialogoPerso.commit();
}
</pre>

Como se vio en el anterior artículo, `mDialogoPersonalizado` es de tipo `Preference`. Cuando se introduzca una contraseña inferior a 8 caracteres, se mostrará el mensaje como aparece en la imagen:

<img src="http://elbauldelprogramador.com/content/uploads/2014/02/Cambiar-el-color-del-summary-en-una-Preferencia-Android.png" alt="Cambiar el color del summary en una Preferencia Android" width="419" height="97" class="aligncenter size-full wp-image-2245" />

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cambiar el color del summary en una Preferencia Android+http://elbauldelprogramador.com/cambiar-el-color-del-summary-en-una-preferencia-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/cambiar-el-color-del-summary-en-una-preferencia-android/&t=Cambiar el color del summary en una Preferencia Android+http://elbauldelprogramador.com/cambiar-el-color-del-summary-en-una-preferencia-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cambiar el color del summary en una Preferencia Android+http://elbauldelprogramador.com/cambiar-el-color-del-summary-en-una-preferencia-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/como-crear-un-dialogo-personalizado-en-las-preferencias-android/ "Cómo crear un diálogo personalizado en las preferencias Android"
 [2]: http://elbauldelprogramador.com/programacion-android-interfaz-grafica_23/ "Programación Android: Interfaz gráfica – Layouts"
 [3]: http://elbauldelprogramador.com/programacion-android-interfaz-grafica_18/ "Programación Android: Interfaz gráfica – Estilos y Temas"
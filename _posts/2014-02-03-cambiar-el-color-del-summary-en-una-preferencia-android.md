---
id: 2233
title: Cambiar el color del summary en una Preferencia Android

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

<!--ad-->

### Obteniendo el Layout por defecto

Al principio, obtuve el *TextView* que representa el summary, pero cambiarle el color no tenía efecto y se quedaba de color gris. La solución final consistió en crear un propio [layout][2]. Buscando en el código fuente de Android lo encontré en *<a href="https://android.googlesource.com/platform/frameworks/base/+/master/core/res/res/layout/preference_child.xml" target="_blank">frameworks/base/core/res/res/layout/preference_child.xml</a>*. A éste recurso hay que quitarle unas cuantas cosas que no nos sirven, quedando así:

{% highlight xml %}<?xml version="1.0" encoding="utf-8"?>


<!-- Layout for a visually child-like Preference in a PreferenceActivity. -->
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:baselineAligned="false"
    android:gravity="center_vertical"
    android:minHeight="?android:attr/listPreferredItemHeight"
    android:paddingEnd="?android:attr/scrollbarSize"
    android:paddingStart="16dip" >

    <RelativeLayout
        android:layout_width="0dip"
        android:layout_height="wrap_content"
        android:layout_marginBottom="6dip"
        android:layout_marginEnd="6dip"
        android:layout_marginTop="6dip"
        android:layout_weight="1" >

        <TextView
            android:id="@+android:id/title"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:ellipsize="marquee"
            android:fadingEdge="horizontal"
            android:singleLine="true"
            android:textAppearance="?android:attr/textAppearanceMedium" />

        <TextView
            android:id="@+android:id/summary"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_alignStart="@android:id/title"
            android:layout_below="@android:id/title"
            android:maxLines="4"
            android:textAppearance="?android:attr/textAppearanceSmall"
            android:textColor="?android:attr/textColorSecondary" />
    </RelativeLayout>
</LinearLayout>
{% endhighlight %}

### Layout para mostrar el error

El layout anterior es el que se usará por defecto, cuando queramos resaltar un error usaremos otro exáctamente igual pero con el color del Summary cambiado, como es repetir código simplemente se muestra el nombre del fichero y el cambio en el TextView con ID ***@android:id/summary***:

***preference\_child\_summary_error.xml***

{% highlight xml %}<!-- ... -->
android:textColor="@color/red"


<!-- ... -->
{% endhighlight %}

La definición del c[olor se declara][3] en un archivo dentro de la carpeta *values*:  
***./res/values/colors.xml***

{% highlight xml %}<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="red">#ff0000</color>
</resources>
{% endhighlight %}

### Cambiar el color en tiempo de ejecución

Ahora que tenemos el diseño listo, veremos cómo cambiarlo cuando ocurra cierta condición. En el caso que nos ocupa necesitaremos resaltar el summary en color rojo cuando el usuario introduzca una contraseña que no cumple con los requisitos establecidos por la aplicación, el código quedará algo así:

{% highlight java %}if (newValue.toString().length() <= 8) {
    mDialogoPersonalizado.setLayoutResource(R.layout.preference_child_summary_error);
    mDialogoPersonalizado.setSummary("Mensaje de error");
} else {
    mDialogoPersonalizado.setLayoutResource(R.layout.preference_child);
    mDialogoPersonalizado.setSummary("********");
    mEditorDialogoPerso.putString("diagPerso", passw);
    mPasswordDialogoPerso = passw;
    mEditorDialogoPerso.commit();
}
{% endhighlight %}

Como se vio en el anterior artículo, `mDialogoPersonalizado` es de tipo `Preference`. Cuando se introduzca una contraseña inferior a 8 caracteres, se mostrará el mensaje como aparece en la imagen:

<img src="/images/2014/02/Cambiar-el-color-del-summary-en-una-Preferencia-Android.png" alt="Cambiar el color del summary en una Preferencia Android" width="419" height="97" class="aligncenter size-full wp-image-2245" />



 [1]: http://elbauldelprogramador.com/como-crear-un-dialogo-personalizado-en-las-preferencias-android/ "Cómo crear un diálogo personalizado en las preferencias Android"
 [2]: http://elbauldelprogramador.com/programacion-android-interfaz-grafica_23/ "Programación Android: Interfaz gráfica – Layouts"
 [3]: http://elbauldelprogramador.com/programacion-android-interfaz-grafica_18/ "Programación Android: Interfaz gráfica – Estilos y Temas"

{% include _toc.html %}

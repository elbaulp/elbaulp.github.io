---
id: 234
title: 'Programación Android: Interfaz gráfica &#8211; Layouts'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-interfaz-grafica-layouts/
permalink: /programacion-android-interfaz-grafica_23/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  - /programacion-android-interfaz-grafica_23/
  - /programacion-android-interfaz-grafica_23/
  - /programacion-android-interfaz-grafica_23/
categories:
  - android
  - opensource
tags:
  - android diseñar gui
  - como hacer interfaces graficas en android
  - curso android layouts
  - curso android pdf
  - interfaces de usuario android
  - interfaz grafica en android
  - layout android
  - layouts android
  - menu android
main-class: 'dev'
main-class: "android"
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Los layout nos permiten posicionar cada objeto gráfico en el lugar que queramos de la pantalla, es decir, nos permite diseñar el aspecto gráfico que va a tener nuestra pantalla. Los layouts son de tipo ***ViewGroup***, una subclase de ***View***

Existen varios tipos de Layouts para Android, vamos a ver los más comunes:


<!--ad-->

### FrameLayout

Este tipo de Layout es el más básico, coloca a sus objetos hijos en la parte superior izquierda de la pantalla.

```xml
< ?xml version="1.0" encoding="utf-8"?>
<framelayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent">

    <textview android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="@string/hello"/>

    <textview android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="@string/app_name"/>

</framelayout>

```

Como se puede apreciar en en resultado, si hay más de un hijo, los objetos se amontonan unos encima de otros.

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-YNiwbTTpG5Y/TgMwa0LJnoI/AAAAAAAAApg/PKXOsoXfMoU/s1600/frameLayout.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img alt="FrameLayout Android" title="FrameLayout Android" border="0" height="400" width="301" src="https://2.bp.blogspot.com/-YNiwbTTpG5Y/TgMwa0LJnoI/AAAAAAAAApg/PKXOsoXfMoU/s400/frameLayout.png" /></a>
</div>

### LinearLayout

Este tipo de layout coloca sus hijos unos detras de otros, también comenzando por la esquina superior izquierda de la pantalla. Podemos colocarlos alineados horizontalmente o verticalmente mediante su propiedad ***android:orientation=&#8221;horizontal | vertical&#8221;***

```xml
< ?xml version="1.0" encoding="utf-8"?>
<linearlayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="horizontal"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent">

    <textview android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/app_name"
        android:background="#0ff"/>

    <textview android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/hello"
        android:background="#ff0"/>

</linearlayout>

```

En este caso, he pueso un fondo de color a cada texto (con la propiedad ***android:background***) para diferenciarlo bien, y he usado la horientación horizontal, de haber usado la orientación vertical, los textos aparecerían uno debajo del otro:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/-tT2G6ADQahI/TgM14QuwAjI/AAAAAAAAApw/PqPNv1ryoTs/s1600/LinearLayout.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img alt="LinearLayout Android" title="LinearLayout Android" border="0" height="400" width="300" src="https://3.bp.blogspot.com/-tT2G6ADQahI/TgM14QuwAjI/AAAAAAAAApw/PqPNv1ryoTs/s400/LinearLayout.png" /></a>
</div>

### RelativeLayout

Este Layout permite que coloquemos los elementos en un lugar con respecto a la posición de otro, es decir, colocar un botón a la derecha de un texto, o centrarlo en la pantalla, o por ejemplo, colocar un texto encima de tal elemento y a la derecha de este otro.

Para conseguir esto, ***RelativeLayout*** proporciona propiedades como ***android:layout\_toRightOf o android:layout\_alignLeft***, que toman como valores los identificadores de los objetos, o valores booleanos.

```xml
< ?xml version="1.0" encoding="utf-8"?>
<relativelayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="horizontal"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent">

    <textview android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/app_name"
        android:background="#0ff"
        android:layout_centerInParent="true"
        android:id="@+id/text1"/>

    <textview android:id="@+id/text2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/hello"
        android:background="#ff0"
        android:layout_below="@id/text1"/>

</relativelayout>

```

Como vemos, hemos centrado el texto1 en la pantalla con ***android:layout_centerInParent=&#8221;true&#8221;*** y hemos puesto debajo del texto1 al texto2 con ***android:layout_below=&#8221;@id/text1&#8243;***

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://1.bp.blogspot.com/-pB2RUTDnOSg/TgOGYaZCVaI/AAAAAAAAAp4/r_qjr4tJoKc/s1600/RelativeLayout.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img title="relativeLayout Android" alt="relativeLayout Android" border="0" height="400" width="298" src="https://1.bp.blogspot.com/-pB2RUTDnOSg/TgOGYaZCVaI/AAAAAAAAAp4/r_qjr4tJoKc/s400/RelativeLayout.png" /></a>
</div>

Para saber más acerca de todos los tipos de layouts que hay podéis visitar <http://developer.android.com/guide/topics/ui/layout-objects.html>

* * *

#### Siguiente Tema: [Programación Android: Interfaz gráfica &#8211; Componentes gráficos y Eventos][1] {.referencia}





 [1]: /programacion-android-interfaz-grafica_25/


{% include _toc.html %}

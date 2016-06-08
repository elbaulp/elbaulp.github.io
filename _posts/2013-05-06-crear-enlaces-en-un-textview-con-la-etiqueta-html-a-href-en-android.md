---
id: 1546
title: 'Crear enlaces en un TextView con la etiqueta HTML <a href en Android'

layout: post
guid: https://elbauldelprogramador.com/?p=1546
permalink: /crear-enlaces-en-un-textview-con-la-etiqueta-html-a-href-en-android/
categories:
  - android
tags:
  - a href android xml
  - crear enlaces cadenas de texto android
  - etiqueta a href android
  - etiqueta a href string.xml
  - etiqueta a href TextView android
main-class: "dev"
main-class: "android"
---
Para una aplicación que estoy haciendo, me hacía falta ser capaz de mostrar un enlace al usuario de forma similar al que se crean en las páginas webs con la etiqueta *<a href=&#8221;&#8221;></a>*. 

La cadena de texto con el enlace en cuestión reside en el archivo de recursos **[string.xml][1]**. En un principio pensé que me bastaría usar la propiedad `android:autoLink="web"` en el [layout.xml][2] de la siguiente forma:  
  
<!--ad-->

  
***layout***:

```xml
<TextView
                <!-- .... -->
                android:autoLink="web"
                

<!-- .... --> />

```

***string***:

```xml
<string name="aboutAuthor">Developed by <a href="https://elbauldelprogramador.com">Alejandro Alcalde.</a></string>

```

Pero la propiedad `autoLink="web"`, funciona únicamente cuando el texto al que hace referencia contiene explícitamente la dirección, es decir, con esta cadena de texto sí funcionaría:

```xml
<string name="aboutAuthor">Developed by https://elbauldelprogramador.com</string>

```

Para conseguir hacer funcionar el primer ejemplo hay que hacer uso del método `setMovementMethod()` de la clase `TextView`:

```java
final TextView author = (TextView) view.findViewById(R.id.tv_about_athor);
author.setMovementMethod(LinkMovementMethod.getInstance());

```

Con el código anterior se consigue el comportamiento deseado:  
[<img src="/assets/img/2013/05/setMovementMethod-example-180x300.png" alt="enlaces en un textview android" width="180" height="300" class="aligncenter size-medium wp-image-1547" />][3]{.thumbnail}

Los dos primeros enlaces están creados con el método `setMovementMethod()`, los otros dos con `android:autoLink="web"`.



 [1]: /programacion-android-recursos-strings/
 [2]: /programacion-android-recursos-layout/
 [3]: /assets/img/2013/05/setMovementMethod-example.png

{% include _toc.html %}

---
title: 'Crear enlaces en un TextView con la etiqueta HTML <a href="href" en="en" android="Android"></a><a href="””"></a>*.

La cadena de texto con el enlace en cuestión reside en el archivo de recursos **[string.xml][1]**. En un principio pensé que me bastaría usar la propiedad `android:autoLink="web"` en el [layout.xml][2] de la siguiente forma:  

<!--ad-->


***layout***:

```xml
<textview><!-- .... -->
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
[<amp-img layout="responsive" src="/assets/img/2013/05/setMovementMethod-example-180x300.png" alt="enlaces en un textview android" width="180px" height="300px" />][3]{.thumbnail}

Los dos primeros enlaces están creados con el método `setMovementMethod()`, los otros dos con `android:autoLink="web"`.



 [1]: /programacion-android-recursos-strings/
 [2]: /programacion-android-recursos-layout/
 [3]: /assets/img/2013/05/setMovementMethod-example.png

{% include toc.html %}
</textview>
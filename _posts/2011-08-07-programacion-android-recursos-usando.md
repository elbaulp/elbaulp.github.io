---
title: 'Programación Android: Recursos &#8211; Usando recursos'

layout: post.amp
permalink: /programacion-android-recursos-usando/
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - recursos android
main-class: "android"
color: "#689F38"
---


A todos los recursos que colocamos en las subcarpetas de ./res/ se puede acceder a través de la clase R de nuestro proyecto.

Esta clase R la genera el comando aapt en una pasada anterior a la compilación  
(Eclipse, por defecto, la va generando continuamente conforme cambiamos los  
recursos). Contiene todos los identificadores de recursos para poder referenciarlos.

Al igual que la carpeta “res”, la clase R se organiza en subclases, así por ejemplo el icono que colocamos en ./res/drawable/icon tiene su correspondencia en  
R.drawable.icon (que es un identificador estático de tipo int y sirve para acceder  
al recurso).


<!--ad-->

Así pues los ID de recurso están compuestos de:

Clase R que contienen todos los recursos.

Subclase de recurso, cada grupo tiene la suya (drawable, string, style, layout&#8230;).

Nombre del recurso que, según el tipo, será: el nombre del fichero sin la extensión o el atributo xml “android:name” si es un valor sencillo (cadena, estilo, etc.).

Tenemos dos formas de acceder a los recursos definidos en la clase R:

En el código, accediendo a las propiedades de la clase R directamente  
(R.string.nombre).

En los ficheros XML, usando una notación especial: @grupo_recursos/  
nombre_recurso, es decir, el recurso anterior se accedería con @string/nombre.

Si lo que queremos es acceder a un recurso definido por el sistema antepondremos el prefijo android:

  * Desde el código: android.R.layout.simple\_list\_item_1.
  * En los ficheros XML: @android:layout/simple\_list\_item_1.

### Referenciando atributos de estilo

Cuando aplicamos estilos a nuestros layout puede interesarnos acceder a un  
atributo concreto de un estilo, para eso tenemos una sintaxis específica que  
podemos usar en nuestros XML:

***?[<nombre_paquete>:][<tipo_recurso>/]<nombre_recurso></nombre_recurso></tipo_recurso></nombre_paquete>***

Así por ejemplo si queremos colocar un texto pequeño usaremos:

***?android:attr.textAppearanceSmall***

Si queremos, también podemos utilizar nuestros propios atributos.

Primero lo definimos con un tag “attr”·dentro de ./res/values/attr.xml.

```xml
< ?xml version="1.0" encoding="utf-8"?>
<resources>
<attr name="cabecera" format="reference">
</attr></resources>


```

Ahora ya podemos usar esa propiedad en nuestros estilos:

Primero definimos un estilo de texto llamado “TituloRojo”, y luego lo aplicamos  
al atributo que hemos creado llamado “Cabecera”. Obsérvese que como es un  
atributo propio, no usamos el espacio de nombres “android:”.

Si luego quisiéramos acceder a este atributo al definir un layout podríamos usar  
la sintaxis mencionada:

**./res/layout/milayout**

<

pre lang=&#8221;xml&#8221;>  
< ?xml version=&#8221;1.0&#8243; encoding=&#8221;utf-8&#8243;?>  
<framelayout xmlns:android="http://schemas.android.com/apk/res/android" android:layout="android:layout">
<textview android:layout="android:layout">
</textview></framelayout>

**./res/values/style.xml**

```xml
< ?xml version="1.0" encoding="utf-8"?>
<resources>
</resources>


```

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Strings][1] 

 [1]: /programacion-android-recursos-strings/


{% include toc.html %}

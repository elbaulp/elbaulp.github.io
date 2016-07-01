---
title: 'Programación Android: Recursos &#8211; Arrays de strings'

layout: post
permalink: /programacion-android-recursos-arrays-de/
categories:
  - android
  - opensource
tags:
  - curso android pdf
main-class: "android"
color: "#689F38"
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" width="128px" height="128px" />

Se pueden definir arrays de strings como recursos en cualquier archivo bajo el subdirectorio ./res/values. Para definirlos, usaremos un nodo XML llamado *string-array*. Este nodo es un hijo de *resources*, al igual que el nodo *string*. A continuación, vamos a ver como crear un array de strings:


<!--ad-->

```xml
<resources>
<string>
<item>uno</item>
<item>dos</item>
<item>tres</item>
</string>
</resources>

```

Una vez definido el recurso, podemos usarlo en el código Java de la siguiente manera:

```java
//Accedemos al objeto 'Recursos' desde la Activity
Resources res = nombre-de-la-actividad.getResources();
String strings[] = res.getStringArray(R.array.test_array);

//Mostramos el array
for (String s: strings)
   Log.d("ejemplo", s);

```

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Plurales][1] {.referencia}





 [1]: /programacion-android-recursos-plurales/

{% include toc.html %}

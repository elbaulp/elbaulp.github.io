---
id: 254
title: 'Programación Android: Recursos &#8211; Arrays de strings'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-arrays-de-strings/
permalink: /programacion-android-recursos-arrays-de/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/09/programacion-android-recursos-arrays-de.html
  - /2011/09/programacion-android-recursos-arrays-de.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Se pueden definir arrays de strings como recursos en cualquier archivo bajo el subdirectorio ./res/values. Para definirlos, usaremos un nodo XML llamado *string-array*. Este nodo es un hijo de *resources*, al igual que el nodo *string*. A continuación, vamos a ver como crear un array de strings:

  
<!--more-->

{% highlight xml %}&lt;resources>
&lt;string -array name="test_array">
   &lt;item>uno&lt;/item>
   &lt;item>dos&lt;/item>
   &lt;item>tres&lt;/item>
&lt;/string>
&lt;/resources>
{% endhighlight %}

Una vez definido el recurso, podemos usarlo en el código Java de la siguiente manera:

{% highlight java %}//Accedemos al objeto 'Recursos' desde la Activity
Resources res = nombre-de-la-actividad.getResources();
String strings[] = res.getStringArray(R.array.test_array);

//Mostramos el array
for (String s: strings)
   Log.d("ejemplo", s);
{% endhighlight %}

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Plurales][1] {.referencia}





 [1]: /programacion-android-recursos-plurales/
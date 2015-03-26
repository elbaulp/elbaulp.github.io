---
id: 1542
title: Introducción al NDK de Android
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1542
permalink: /introduccion-al-ndk-de-android/
categories:
  - android
tags:
  - ejemplos ndk android
  - hola mundo ndk android
  - introducción ndk android
---
El NDK de Android es un conjunto de herramientas que permiten embeber código máquina nativo compilado en lenguajes C y/o C++, hoy veremos cómo crear un ejemplo en el NDK de Android.  
  
<!--more-->

### Conceptos básicos del NDK

La Máquina Virtual de Android (VM) permite que el código de la aplicación (escrito en Java) llame a métodos implementados en código nativo a través de JNI. En una *nutshell*, lo cual quiere decir que:

  * El código fuente de la aplicación declarará uno o más métodos con la palabra reservada **native** para indicar que dicho método está implementado en código nativo. Ej:
<pre lang="java">native byte[] loadFile(String filePath);
</pre>

  * Es necesario proporcionar una biblioteca compartida nativa que contenga la implentación de dichos métodos, que será empaquetada en el .apk de la aplicación. La biblioteca debe ser nombrada de acuerdo al estándar Unix *lib<nombre>.so*, y deberá contener un punto de entrada JNI estándar (veremos esto más adelante), por ejemplo: *libFileLoader.so*
  * La aplicación debe cargar explícitamente la biblioteca. Por ejemplo, para cargarla al iniciar la aplicación, simplemente añade la siguiente línea al código:
<pre lang="java">static {
    System.loadLibrary("FileLoader");
}
</pre>

No hay que scribir el prefijo “lib” ni el sufijo “.so”.</li> 

### Primer ejemplo en el NDK Android &#8211; Hola Mundo

En el *ndk* existe un directorio que contiene varios ejemplos, importamos a eclipse el *HelloJni*. Veamos la estructura del proyecto:

En el paquete *com.example.hellojni* sólo hay una clase llamada *HelloJni*, con el siguiente código:

<pre lang="java">public class HelloJni extends Activity
{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        TextView  tv = new TextView(this);
        tv.setText( stringFromJNI() );
        setContentView(tv);
    }

    public native String  stringFromJNI();

    public native String  unimplementedStringFromJNI();

    static {
        System.loadLibrary("hello-jni");
    }
}
</pre>

En el método *[onCreate()][1]* se crea un *TextView* que recogerá el texto a mostrar a través de la función nativa en C.

La función *stringFromJni()* es el método nativo que implementa la biblioteca *hello-jni*, la cual viene dentro de la aplicación en *libs/armeabi/libhello-jni.so*.

*unimplementedStringFromJni()* es una función no implementada por la biblioteca *hello-jni*. Su único propósito es mostrar que es posible declarar tantos métodos nativos como queramos en nuestro código *Java*, sus implementaciones sólo serán buscadas en las bibliotecas que estén cargadas en ese momento solo la primera vez que se las llame. Al llamar a éste método obtendremos una excepción del tipo *java.lang.UnsatisfiedLinkError*.

Por último, al final del código, como se comentó al principio del artículo se carga la biblioteca al inicio de la aplicación. Nótese que a pesar de que el fichero situado en *libs/armeabi/* se llama *libhello-jni.so*, al cargarlo desde Java se elimina el sufijo *.so* y el prefijo *lib*

La implementación del método *stringFromJNI()* es la siguiente:

<pre lang="c">#include &lt;string.h>
#include &lt;jni.h>

/* This is a trivial JNI example where we use a native method
 * to return a new VM String. See the corresponding Java source
 * file located at:
 *
 *   apps/samples/hello-jni/project/src/com/example/hellojni/HelloJni.java
 */
jstring
Java_com_example_hellojni_HelloJni_stringFromJNI( JNIEnv* env,
                                                  jobject thiz )
{
    return (*env)->NewStringUTF(env, "Hello from JNI !");
}
</pre>

Como se puede apreciar, es necesario llamar a la función con el nombre del paquete Java y la clase donde se encuentra la llamada a la función. Es decir, *Java\_com\_example\_hellojni\_HelloJni* corresponde con la ruta del proyecto *./src/com/example/hellojni/HelloJni*.

### Ejecutar el Hola Mundo del NDK de Android

Para compilar y ejecutar el programa, con el proyecto *Hello-Jni* de ejemplo importado en eclipse, nos situamos en el directorio del proyecto desde el terminal y ejecutamos el comando *ndk-build*:

<pre lang="bash">$ ndk-build 
Gdbserver      : [arm-linux-androideabi-4.6] libs/armeabi/gdbserver
Gdbsetup       : libs/armeabi/gdb.setup
Compile thumb  : hello-jni &lt;= hello-jni.c
SharedLibrary  : libhello-jni.so
Install        : libhello-jni.so => libs/armeabi/libhello-jni.so
</pre>

Con esto hemos compilado el código nativo de la aplicación.  
El siguiente paso es construir e instalar la aplicación como se hace normalmente en eclipse, o mediante línea de comandos:

<pre lang="bash">$ ant debug
$ adb install bin/HelloJni.apk
</pre>

El primer comando compila y genera el *.apk* y con el segundo lo instalamos en el emulador o dispositivo móvil.

Por último, la aplicación es tan simple como esto:

[<img src="http://elbauldelprogramador.com/content/uploads/2013/06/helloJni-NDK-de-android-180x300.png" alt="helloJni NDK de android" width="180" height="300" class="aligncenter size-medium wp-image-1657" />][2]{.thumbnail}

Eso es todo, espero que esta pequeña introducción haya ayudado a iniciarse con el NDK de android.

#### Referencias

*Documentación del NDK* **|** <a href="http://developer.android.com/tools/sdk/ndk/index.html" target="_blank">Visitar sitio</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Introducción al NDK de Android+http://elbauldelprogramador.com/introduccion-al-ndk-de-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/introduccion-al-ndk-de-android/&t=Introducción al NDK de Android+http://elbauldelprogramador.com/introduccion-al-ndk-de-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Introducción al NDK de Android+http://elbauldelprogramador.com/introduccion-al-ndk-de-android/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /opensource/programacion-android-hola-mundo/
 [2]: http://elbauldelprogramador.com/content/uploads/2013/06/helloJni-NDK-de-android.png
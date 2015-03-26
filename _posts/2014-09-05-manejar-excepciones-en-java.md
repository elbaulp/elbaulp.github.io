---
id: 2438
title: Manejar excepciones en Java
author: Colaboraciones
layout: post
guid: http://elbauldelprogramador.com/?p=2438
permalink: /manejar-excepciones-en-java/
categories:
  - Java
tags:
  - errores java
  - excepciones java
  - finally java
  - try catch java
---
> Éste artículo es una colaboración de [Jonathan Melgoza.][1] 

## Introducción

En este artículo veremos un poco sobre el manejo de excepciones en java, esto es esencial para toda programación básica en java, una excepción es un indicador que tenemos de que algo ha ido mal en nuestro código. Con lo cual podremos controlarlas y capturarlas para poder tratar con ellas e indicar lo que se tiene que hacer.

<!--more-->

### Instrucción Try &#8211; Catch

Cuando sabemos que un código podría lanzar un error, como por ejemplo una división entre cero, debemos encerrarla entre un bloque `try-catch`. Veamos un ejemplo:

{% highlight java %}>int a = 5 / 0;
{% endhighlight %}

esta linea nos lanzaría la siguiente excepción: `Exception in thread "main" java.lang.ArithmeticException: / by zero`

Si en cambio atrapamos esta excepción podremos controlarla:

{% highlight java %}>try{
    int a = 5 / 0;
}catch(ArithmeticException err){
    int a = 0;
}
{% endhighlight %}

### El Bloque Finally

`Finally` se utiliza cuando el programador solicita ciertos recursos al sistema que se deben liberar, y se coloca después del último bloque `catch`. Veamos un ejemplo en el que intentamos leer un archivo:

{% highlight java %}>FileReader lector = null;
try {
    lector = new FileReader("archivo.txt");
    int i=0;
    while(i != -1){
        i = lector.read();
        System.out.println((char) i );
    }
} catch (IOException e) {
    System.out.println("Error");
} finally {
    if(lector != null){
            lector.close();
    }
}
{% endhighlight %}

el código contenido en `finally` se ejecutará tras terminar el bloque `try`, haya habido o no excepción, lo que permite liberar los recursos reservados para abrir el archivo. (Más sobre finally en la [documentación de Oracle][2])

### La Cláusula Throws

Esta cláusula advierte de las excepciones que podría lanzar un método, van entre la declaración del método y su cuerpo (pueden ser varias), así:

{% highlight java %}>public static void metodo() throws ArithmeticException{
    try{
        int a = 5 / 0;
    }catch(ArithmeticException err){
        int a = 0;
    }
}
{% endhighlight %}

### La palabra clave throw

`throw` nos permite lanzar una excepción propia, esto lo veremos en el siguiente ejemplo en el que aprovechamos para englobar todo lo visto aquí:

{% highlight java %}>public static void main(String[] args) {
    int a;
    try{
        a = dividir(5,0);
    }catch(MalNumeroADividir err){
        System.out.println(err);
    }finally{
        a = 0;
    }
    System.out.println("Valor de a = "+a);
}

public static int dividir(int a, int b)throws MalNumeroADividir{
    if(b == 0){
        throw new MalNumeroADividir();
    }
    return a / b;
}

public static class MalNumeroADividir extends Exception {
    MalNumeroADividir() {
       super("No es posible dividir entre cero");
   }
}

{% endhighlight %}

Como vimos el manejo de las excepciones en java no es algo difícil de implementar.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Manejar excepciones en Java+http://elbauldelprogramador.com/manejar-excepciones-en-java/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/manejar-excepciones-en-java/&t=Manejar excepciones en Java+http://elbauldelprogramador.com/manejar-excepciones-en-java/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Manejar excepciones en Java+http://elbauldelprogramador.com/manejar-excepciones-en-java/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://jonathanmelgoza.com/blog/ "Blog del colaborador"
 [2]: http://docs.oracle.com/javase/tutorial/essential/exceptions/finally.html "Finally Oracle"
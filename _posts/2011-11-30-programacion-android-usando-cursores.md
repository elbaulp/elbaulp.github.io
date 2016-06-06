---
id: 303
title: 'Programación Android: Usando cursores'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-usando-cursores/
permalink: /programacion-android-usando-cursores/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551777}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":2,"stumble":0,"pinit":0,"count":2,"time":1333551777}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - Cursores Android
main-class: dev
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="/assets/img/2013/07/iconoAndroid.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" /></a>
</div>

Cosas a saber sobre un cursor Android:

  * Un cursor es una colección de filas.
  * Es necesario usar ***moveToFirst()*** antes de leer cualquier dato del cursor ya que éste comienza posicionado antes de la primera fila.
  * Es necesario conocer los nombres de las columnas.
  * También es necesario conocer los tipos de las columnas.
  * Todos los métodos de acceso a los campos se basan en números de columnas, por lo que se necesita convertir el nombre de la columna a un número.
  * El cursor es un cursor aleatorio, es decir, podemos movernos por él hacia delante, hacia atrás o saltar de una posición a otra.
  * Dado que el cursor es de tipo aleatorio, podemos solicitar el número de registros que contiene.

El cursor tiene unos métodos que nos permiten navegar por él. A continuación vemos como comprobar si el cursor está vacío y cómo navegar por él fila a fila en caso de no estarlo.

  
<!--ad-->

```java
if (cur.moveToFirst() == false){
   //el cursor está vacío
   return;
}

//El cursor ahora apunta a la primera fila
// Accedemos a las columnas
int nameColumnIndex = cur.getColumnIndex(People.NAME);
String name = cur.getString(nameColumnIndex);


//Veamos ahora como iterar sobre un cursor
while(cur.moveToNext()){
   //El curosr se ha movido correctamente
   //Accedemos a los campos
}

```

En el ejemplo de arriba se asume que el cursor está posicionado antes de la primera fila. Para posicionarlo en la primera fila usamos ***moteToFirst()***. Este método devuelve ***false*** si el cursor está vacío. Después usamos ***moveToNext()*** repetitivamente para avanzar en el cursor.

Para ayudarnos a saber donde se encuentra el cursor, Android proporciona los siguientes métodos:

```bash
isBeforeFirst()
isAfterLast()
isClosed()

```

Haciendo uso de estos métodos podemos recorrer el cursor con un *for* en lugar de con un *while:*

```java
// Obtenemos los índices de las columnas
int nameColumn = cur.getColumnIndex(People.NAME);
int phoneColumn = cur.getColumnIndex(People.NUMBER);

//Recorremos el cursor
for(cur.moveToFirst(); !cur.isAfterLast(); cur.moveToNext()){
   String name = cur.getString(nameColumn);
   String phoneNumber = cur.getString(phoneColumn);
}

```

Por último, para obtener el número de registros que hay en el cursor, podemos usar el método ***getCount().***

* * *

#### Siguiente Tema: [Usando la cláusula Where][1] {.referencia}





 [1]: /programacion-android-usando-la-clausula/

{% include _toc.html %}

---
title: 'Programación Android: Proveedores de Contenidos &#8211; Leer datos mediante URIs'

layout: post.amp
permalink: /programacion-android-proveedores-de_28/
categories:
  - android
  - opensource
tags:
  - content provider
  - curso android pdf
  - Proveedores de Contenidos Android
  - URI
main-class: "android"
color: "#689F38"
---
<div class="separator" >
<a href="/assets/img/2013/07/iconoAndroid.png"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  src="/assets/img/2013/07/iconoAndroid.png"  width="128px" height="128px" /></a>
</div>

Ya que las URIs definidas por un Proveedor de contenidos (CV) son únicas para ese proveedor, es muy importante que estas URIs estén bien documentadas. Los proveedores que Android proporciona hacen esto definiendo constantes que representan las cadenas de la URI.

Consideremos estas tres URIs definidas en el SDK de Android:

```bash
MediaStore.Images.Media.INTERNAL_CONTENT_URI
MediaStore.Images.Media.EXTERNAL_CONTENT_URI
Contacts.People.CONTENT_URI

```

Sus URIs equivalentes serán como las siguientes:

```bash
content://media/internal/images
content://media/external/images
content://contacts/people

```


<!--ad-->

El proveedor *MediaStore* define dos URIs y *Contacts* uno. Si te das cuenta, las constantes están definidas usando esquema jerárquico. Por ejemplo, la URI de los contactos se señala como *Contacts.People.CONTENT_URI.* Esto se debe a que las bases de datos de contactos pueden tener muchas tablas para representar la entidad de un contacto. *People* es una de las tablas o colecciones. Cada entidad primaria de una base de datos puede llevar su propia URI de contenido.

<p class="alert">
  En <b><i>Contacts.Pople.CONTENT_URI</i></b>, Contacts es un paquete de java y People es una clase dentro de ese paquete. Hay que saber que Contacts y Contacts.People están obsoletos desde Android 2.0 y que ahora poseen nuevas URIs equivalentes que veremos más adelante. Sin embargo, para propositos educativos podemos seguir usandolos aunque estén obsoletos.
</p>

Dadas estas URIs, el código para recuperar una única fila del proveedor de contactos sería:

```java
Uri uriBase = Contacts.People.CONTENT_URI;
Uri uriPersona = Uri.withAppendedPath(Contacts.People.CONTENT_URI, "21");

//Consultamos el registro
//managedQuery es un método de la clase Activity
Cursor c = managedQuery(uriPersona, null, null, null);

```

En este ejemplo, cogemos la uri base *Contacts.People.CONTENT_URI*, le añadimos un id de contacto y llamamos al método *managedQuery*.

En el método managedQuery podemos especificar el orden de los resultados, las columnas a seleccionar y una condición (en el ejemplo están a null.)

Vamos a ver ahora como crear un cursor que devuelva una lista de columnas de la tabla People del proveedor contatcs.

```java
// Array que especifica la proyección (columnas a seleccionar)
String[] projection = new String[] {
   People._ID,
   People.NAME,
   People.NUMBER,
};

//obtenemos la URI base
Uri mContactsUri = Contacts.People.CONTENT_URI;

Cursor managedCursor = managedQuery(mContactsUri,
                                    projection, // Qué columnas devolverá
                                    null,       // Cláusula where
                                    Contacts.People.NAME + " ASC"); //Clausula order by

```

* * *

#### Siguiente Tema: [Usando cursores][1] {.referencia}





 [1]: /programacion-android-usando-cursores/

{% include toc.html %}

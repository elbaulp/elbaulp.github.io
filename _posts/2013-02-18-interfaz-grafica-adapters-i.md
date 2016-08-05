---
title: 'Programación Android: Interfaz gráfica &#8211; Adapters I'
layout: post.amp
permalink: /programacion-android-interfaz-grafica_28/
categories:
  - android
  - opensource
tags:
  - adapter android
  - android diseñar gui
  - android listview con imagenes
  - android listview example
  - como hacer interfaces graficas en android
  - curso android pdf
  - interfaces de usuario android
  - interfaz grafica en android
  - layout android
  - menu android
  - simple adapter android ejemplo
main-class: "android"
color: "#689F38"
---
<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" width="128px" height="128px" />

Un objeto Adaptador actúa como puente entre un AdapterView y los datos de una Vista (View). El adaptador permite el acceso a los elementos de datos, éste también es responsable de crear una vista para cada elemento en la colección de datos.

Se puede decir, que los adaptadores son colecciones de datos, que asignamos a una vista para que ésta los muestre, por ejemplo, podemos crear un ArrayAdapter a partir de un array de string ya creado y con datos, y asignar este adaptador a un ListView, así, el ListView mostrará los datos del array.


<!--ad-->

Mediante el uso de ***Adapters*** definimos una forma común de acceder a colecciones de datos.

Para que quede más claro este concepto, vamos a verlo mediante un ejemplo:

Primero creamos el layout, que va a contener un ListView con un Id ya definido por android, y un TextView también con un id ya definido.

```xml
< ?xml version="1.0" encoding="utf-8"?>
<linearlayout xmlns:android="http://schemas.android.com/apk/res/android" android:orientation="vertical" android:layout_width="fill_parent" android:layout_height="fill_parent">
<listview android:layout_width="fill_parent" android:layout_height="fill_parent" android:id="@android:id/list">
<textview android:layout_width="fill_parent" android:layout_height="fill_parent" android:id="@android:id/empty">
</textview></listview></linearlayout>

```

Ahora, el código donde creamos el adaptador, y lo asociamos al ListView:

```java
package app.elbauldelprogramador.adapters;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;

public class AdaptadoresActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        //Array que asociaremos al adaptador
        String[] array = new String[] {
              "Elemento 1"
             ,"Elemento 2"
             ,"Elemento 3"
             ,"Elemento 4"
             ,"Elemento 5"
             ,"Elemento 6"
        };

        //Creación del adaptador, vamos a escoger el layout
        //simple_list_item_1, que los mostr
        ListAdapter adaptador = new ArrayAdapter<string>(
              this, android.R.layout.simple_list_item_1, array);

        //Asociamos el adaptador a la vista.
        ListView lv = (ListView) findViewById(android.R.id.list);
        lv.setAdapter(adaptador);
    }
}
</string>
```

Como vemos, al crear el arrayAdapter, tenemos que pasar tres parámetros, el contexto, un layout que se usará para dibujar cada item (en este caso ***simple\_list\_item_1***, que ya viene definido por android), más adelante veremos como crear los nuestros propios, y como tercer parámetro la colección de datos.

Aprovechando que en la anterior [entrada hablamos de los eventos][1], voy a explicar como fijar un evento onclick para cada elemento de la lista.

```java
//Evento que se disparará al pulsar en un elemento de la lista
lv.setOnItemClickListener(new OnItemClickListener() {

   @Override
   public void onItemClick(AdapterView< ?> arg0, View arg1, int arg2,
      long arg3) {

      ListAdapter la = (ListAdapter) arg0.getAdapter();

      Toast.makeText(
         arg1.getContext()
         ,la.getItem(arg2).toString()
         ,Toast.LENGTH_LONG)
         .show();

   };
});

```

Para realizar este tipo de cosas, android proporciona una clase llamada ListActivity, este tipo de clase necesita que exista una vista con el id ya definido por Android ***@android:id/list*** y otra con el id *****@android:id/empty* (Tal y como lo definimos en nuestro layout), así, si el adaptador que le asiganamos a la lista no tiene datos, se mostrará al usuario la vista empty, el código quedaría de la siguiente manera:

```java
package app.elbauldelprogramador.adapters;

import android.app.ListActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class AdaptadoresActivity extends ListActivity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        //Array que asociaremos al adaptador
        String[] array = new String[] {
              "Elemento 1"
             ,"Elemento 2"
             ,"Elemento 3"
             ,"Elemento 4"
             ,"Elemento 5"
             ,"Elemento 6"
        };

        //Creación del adaptador, vamos a escoger el layout
        //simple_list_item_1, que los mostr
        ListAdapter adaptador = new ArrayAdapter<string>(
              this, android.R.layout.simple_list_item_1, array);

        //Asociamos el adaptador a la vista.
        ListView lv = (ListView) findViewById(android.R.id.list);
        lv.setAdapter(adaptador);

    }
    @Override
    protected void onListItemClick(ListView l, View v, int position, long id) {
      super.onListItemClick(l, v, position, id);

      Toast.makeText(
            AdaptadoresActivity.this
            ,l.getItemAtPosition(position).toString()
            ,Toast.LENGTH_LONG)
            .show();
    }
}
</string>
```

El resultado de este código es el siguiente, para una adaptador con datos:

<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-p_QGLZLQNbY/TgojF5KyZKI/AAAAAAAAAqg/zUY-4oCbZhE/s1600/Adaptadores.png"  style="margin-left:1em; margin-right:1em"><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  alt="Adaptadores Android" title="Adaptadores Android" height="400" width="240" src="https://2.bp.blogspot.com/-p_QGLZLQNbY/TgojF5KyZKI/AAAAAAAAAqg/zUY-4oCbZhE/s400/Adaptadores.png" /></a>
</div>

Y para un adaptador sin datos:

<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-gB_egWAdpUc/TgojWE4FONI/AAAAAAAAAqo/fhfy9j6sQeE/s1600/listaVacia.png"  style="margin-left:1em; margin-right:1em"><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive" height="400" width="240" src="https://2.bp.blogspot.com/-gB_egWAdpUc/TgojWE4FONI/AAAAAAAAAqo/fhfy9j6sQeE/s400/listaVacia.png" /></a>
</div>

El ejemplo de esta entrada esta disponible para su descarga:

<a class="aligncenter download-button" href="https://elbauldelprogramador.com/interfaz-grafica-adapters-i/" rel="nofollow"> Download &ldquo;Interfaz gráfica – Adapters I&rdquo; <small>Adaptadores.zip &ndash; Downloaded 986 times &ndash; </small> </a>

* * *

#### Siguiente Tema: [Programación Android: Interfaz gráfica &#8211; Adapters II][2] {.referencia}

 [1]: /programacion-android-interfaz-grafica_25/
 [2]: /programacion-android-interfaz-grafica-2/


{% include toc.html %}

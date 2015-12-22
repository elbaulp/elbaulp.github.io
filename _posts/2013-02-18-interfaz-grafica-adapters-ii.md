---
id: 237
title: 'Programación Android: Interfaz gráfica &#8211; Adapters II'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-interfaz-grafica-adapters-ii/
permalink: /programacion-android-interfaz-grafica-2/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
  
categories:
  - android
  - opensource
tags:
  - adapter android
  - adapter getview android
  - android diseñar gui
  - como hacer interfaces graficas en android
  - curso android pdf
  - interfaces de usuario android
  - interfaz grafica en android
  - layout android
  - menu android
  - simple adapter android ejemplo
---
<img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

En [Programación Android: Interfaz gráfica &#8211; Adapters I][1], se vio como crear y usar adaptadores simples para nuestras aplicaciones. Ahora vamos a ver como crear los nuestros propios.


<!--ad-->

Para explicar el funcionamiento nos vamos a basar en un ejemplo que listará las distintas versiones de Ubuntu.

Lo primero que debemos hacer es crearnos una clase que almacenará los datos de cada una de las versiones:

{% highlight java %}package app.elbauldelprogramador.adapters2;

public class VersionesUbuntu {

   private String nombre;
   private String version;
   private int logotipo;

   public VersionesUbuntu(String nombre, String version, int logotipo) {
      this.nombre = nombre;
      this.version = version;
      this.logotipo = logotipo;
   }

   public void setNombre(String nombre) { this.nombre = nombre; }

   public String getNombre() { return nombre; }

   public void setVersion(String version) { this.version = version; }

   public String getVersion() { return version; }

   public void setLogotipo(int logotipo) { this.logotipo = logotipo; }

   public int getLogotipo() { return logotipo; }

}
{% endhighlight %}

A continuación vamos a crear el adaptador desde cero, siendo necesario extender de la clase BaseAdapter.

{% highlight java %}package app.elbauldelprogramador.adapters2;

import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class VersionesUbuntuAdapter extends BaseAdapter{

   private ArrayList<versionesubuntu> listadoVersiones;
   private LayoutInflater lInflater;

   public VersionesUbuntuAdapter(Context context, ArrayList</versionesubuntu><versionesubuntu> versiones) {
      this.lInflater = LayoutInflater.from(context);
      this.listadoVersiones = versiones;
   }

   @Override
   public int getCount() { return listadoVersiones.size(); }

   @Override
   public Object getItem(int arg0) { return listadoVersiones.get(arg0); }

   @Override
   public long getItemId(int arg0) { return arg0; }

   @Override
   public View getView(int arg0, View arg1, ViewGroup arg2) {
      ContenedorView contenedor = null;

      if (arg1 == null){
         arg1 = lInflater.inflate(R.layout.lista_versiones_ubuntu, null);

         contenedor = new ContenedorView();
         contenedor.nombreVersion = (TextView) arg1.findViewById(R.id.nomVersion);
         contenedor.numeroVersion = (TextView) arg1.findViewById(R.id.numVersion);
         contenedor.logoVersion = (ImageView) arg1.findViewById(R.id.logo);

         arg1.setTag(contenedor);
      } else
         contenedor = (ContenedorView) arg1.getTag();

      VersionesUbuntu versiones = (VersionesUbuntu) getItem(arg0);
      contenedor.nombreVersion.setText(versiones.getNombre());
      contenedor.numeroVersion.setText(versiones.getVersion());
      contenedor.logoVersion.setImageResource(versiones.getLogotipo());

      return arg1;
   }

   class ContenedorView{
      TextView nombreVersion;
      TextView numeroVersion;
      ImageView logoVersion;
   }
}
</versionesubuntu>{% endhighlight %}

Lo que hace esta clase es lo siguente, en su constructor, carga un objeto LayoutInflater, que infla los objetos XML del layout para que podamos usarlos, convirtiéndolos en un objeto java.

También tenemos tres métodos sencillos (***getCount, getItem, getItemId***), que se encargan de devolver el número de elementos de la colección, un elemento en concreto y el identificador de un elemento.

El método ***getView()*** se invoca cada vez que hay que dibujar la lista.

En este caso, para la lista, hemos usado un layout personalizado, que es el siguiente:

{% highlight xml %}< ?xml version="1.0" encoding="utf-8"?>
<relativelayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent">


    <imageview android:id="@+id/logo"
        android:src="@drawable/ocelot"
        android:layout_alignParentLeft="true"
        android:padding="5px"
        android:layout_width="128px"
        android:layout_height="128px"/>

    <textview android:id="@+id/nomVersion"
        android:layout_toRightOf="@id/logo"
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:paddingTop="15dip"
        android:text="VersionNom" />

    <textview android:id="@+id/numVersion"
        android:layout_below="@id/nomVersion"
        android:layout_toRightOf="@id/logo"
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="VersionNum" />

</relativelayout>
{% endhighlight %}

Por último, tan solo queda usar el adaptador que hemos creado en los pasos anteriores en nuesta Actividad principal, en este caso, una ListActivity:

{% highlight java %}package app.elbauldelprogramador.adapters2;

import java.util.ArrayList;

import android.app.ListActivity;
import android.os.Bundle;

public class Adaptadores2Activity extends ListActivity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        ArrayList<versionesubuntu> versiones =
           new ArrayList</versionesubuntu><versionesubuntu>();

        versiones.add(
              new VersionesUbuntu("Lucid Lynx", "10.4 LTS", R.drawable.lucid));

        versiones.add(
              new VersionesUbuntu("Maverick Meerkat", "10.10", R.drawable.u1010));

        versiones.add(
              new VersionesUbuntu("Natty Narwhal", "11.04", R.drawable.natty));

        versiones.add(
              new VersionesUbuntu("Oneiric Ocelot", "11.10", R.drawable.ocelot));

        VersionesUbuntuAdapter adaptador = new VersionesUbuntuAdapter(
              Adaptadores2Activity.this, versiones);
        setListAdapter(adaptador);
    }
}
</versionesubuntu>{% endhighlight %}

Ya solo resta ejecutarlo y ver el resultado:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/-A6gb57w_xX4/Tg4D4i8sSVI/AAAAAAAAAqw/hvsbzYlBpPQ/s1600/adaptadores2.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img title="Adaptadores en Android" alt="Adaptadores en Android" border="0" height="400" width="240" src="https://3.bp.blogspot.com/-A6gb57w_xX4/Tg4D4i8sSVI/AAAAAAAAAqw/hvsbzYlBpPQ/s400/adaptadores2.png" /></a>
</div>

Como siempre, se puede descargar este ejemplo:

<a class="aligncenter download-button" href="https://elbauldelprogramador.com/interfaz-grafica-adapters-ii/" rel="nofollow"> Download &ldquo;Interfaz gráfica – Adapters II&rdquo; <small>Adaptadores2.zip &ndash; Downloaded 1190 times &ndash; </small> </a>

* * *

#### Siguiente Tema: [Programación Android: Interfaz gráfica &#8211; Menús][2] {.referencia}

 [1]: /programacion-android-interfaz-grafica_28
 [2]: /programacion-android-interfaz-grafica_08/


{% include _toc.html %}

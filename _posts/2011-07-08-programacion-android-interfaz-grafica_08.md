---
title: 'Programación Android: Interfaz gráfica &#8211; Menús'

layout: post
permalink: /programacion-android-interfaz-grafica_08/
categories:
  - android
  - opensource
tags:
  - android diseñar gui
  - como hacer interfaces graficas en android
  - curso android pdf
  - interfaces de usuario android
  - interfaz grafica en android
  - layout android
  - menu android
main-class: "android"
color: #689F38
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Los menús en las aplicaciones son algo que encontramos frecuentemente, de hecho, casi todos los terminales Android tienen un botón específico para desplegarlos.

Se dispone de distintos tipo de menús:


<!--ad-->

  * ***Options Menu:*** El menú típico, que se despliega al pulsar la tecla menú, que se divide en dos grupos:

  * ***Icon menu:***Muestra un menú con iconos, 6 elementos como máximo.
  * ***Expanded Menu:*** Se usa cuando hay más de 6 elementos, mostrando un elemento con la palabra &#8216;Más&#8217;.

  * ***Context Menu:*** Menús contextuales desplegados al realizar una pulsación larga en una View.
  * ***Submenús:*** Menús desplegados al pulsar sobre un elemento de otro menú.
### Options Menu

Lo más simple y sencillo es definir los menús en XML, colocado en ./res/menu, para este ejemplo he definido el siguiente menu, que contiene dos elementos, un About y un Quit:

```xml
< ?xml version="1.0" encoding="utf-8"?>


<menu xmlns:android="http://schemas.android.com/apk/res/android">
  <item android:id="@+id/about"
          android:icon="@drawable/about"
          android:title="About App">


  <menu xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@+id/submenu"
                    android:title="Submenú de &quot;About App&quot;"/>

  </menu>
      </item>
      <item android:id="@+id/quit"
          android:title="Quit App"
          android:icon="@drawable/quit"/>

</menu>

```

Bien, voy a explicar un poco la estructura de este menú, Empezamos declarando el menú con la etiqueta ***  


<menu>
</menu>

</b></i>, que contendrá todos sus elementos bajo la etiqueta ***<item></item>***, en este caso, también tenemos un ***submenu***, que se declara igual que el menú principal.

Los atributos de cada elemento son su identificador, el icono a mostrar y el título.

Para poder usar este menú, necesitamos inflarlo (Convertir el fichero XML en un objeto java), para hacer esto, hay que llamar a ***MenuInflater.inflate()***, el código siguiente infla el fichero xml anterior en el método callback ***onCreateOptionsMenu().***

```java
@Override
   public boolean onCreateOptionsMenu(Menu menu) {
       MenuInflater inflater = getMenuInflater();
       inflater.inflate(R.menu.ejemplo_menu, menu);
       return true;
   }

```

Ahora, tenemos que responder a las acciones del usuario cuando pulse algún elemento de nuestro menú, para ello vamos a sobreescribir el método ***onOptionsItemSelected()***

```java
@Override
   public boolean onOptionsItemSelected(MenuItem item) {
      switch (item.getItemId()) {
      case R.id.about:
         Toast.makeText(
               MenusActivity.this
              ,"Ejemplo Menús App"
              ,Toast.LENGTH_LONG)
              .show();
         return true;

      case R.id.quit:
         finish();
         return true;

      default:
         return super.onOptionsItemSelected(item);
      }
   }

```

### Context Menu

Los menús contextuales son similares a los menús mostrados al hacer click con el botón derecho de un ratón en un PC, para crearlos, debemos sobreescribir el método ***onCreateContextMenu()***, donde inflaremos el archivo xml.

```java
@Override
   public void onCreateContextMenu(ContextMenu menu, View v,
         ContextMenuInfo menuInfo) {
      super.onCreateContextMenu(menu, v, menuInfo);
      MenuInflater inflater = getMenuInflater();
      inflater.inflate(R.menu.ejemplo_menu, menu);
   }

```

Al igual que en los options menu, tenemos que responder a las acciones del usuario:

```java
@Override
   public boolean onContextItemSelected(MenuItem item) {
      switch (item.getItemId()) {
      case R.id.about:
         Toast.makeText(
               MenusActivity.this
              ,"Ejemplo Menús App"
              ,Toast.LENGTH_LONG)
              .show();
         return true;

      case R.id.quit:
         finish();
         return true;

      default:
         return super.onOptionsItemSelected(item);
      }
   }

```

Pero este menú contextual no se va a mostrar, ya que tenemos que asociarlo para que se lanze al realizar una pulsación prolongada sobre una view, en este caso un botón:

```java
final Button boton = (Button) findViewById(R.id.button1);
registerForContextMenu(boton);

```

Aquí dejo algunas capturas de pantalla de la aplicación:

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://3.bp.blogspot.com/-JIhItNsspfQ/ThdvxHzhiLI/AAAAAAAAArI/n5vFz4sOjvA/s1600/optionmenu.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img alt="Option menu Android" title="Option Menu android" border="0" height="400" width="240" src="https://3.bp.blogspot.com/-JIhItNsspfQ/ThdvxHzhiLI/AAAAAAAAArI/n5vFz4sOjvA/s400/optionmenu.png" /></a>
</div>

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://1.bp.blogspot.com/-bBsrepZGNdM/ThdvxuQJ0XI/AAAAAAAAArQ/vxr-eRx3mJM/s1600/optionmenu-about.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="400" width="240" alt="Option menu Android" title="Option menu Android"src="https://1.bp.blogspot.com/-bBsrepZGNdM/ThdvxuQJ0XI/AAAAAAAAArQ/vxr-eRx3mJM/s400/optionmenu-about.png" /></a>
</div>

<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-wiia8Yo7Ass/Thdvx_KduPI/AAAAAAAAArY/wVFBRmQeX68/s1600/contextMenu.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" title="Context menu Android" alt="Context menu Android" height="400" width="240" src="https://2.bp.blogspot.com/-wiia8Yo7Ass/Thdvx_KduPI/AAAAAAAAArY/wVFBRmQeX68/s400/contextMenu.png" /></a>
</div>

Podéis encontrar más información sobre Menús en la [página oficial de Android][1]

Y, como no, descargar este proyecto: [Menús en android][2]

Espero que os sirva de ayuda.

* * *

#### Siguiente Tema: [Programación Android: Interfaz gráfica &#8211; Diálogos y notificaciones][3] {.referencia}

 [1]: http://developer.android.com/guide/topics/ui/menus.html
 [2]: http://devgui-android-es.netii.net/descargar.php?archivo=menus.zip&sub=android
 [3]: /programacion-android-interfaz-grafica_11/


{% include _toc.html %}

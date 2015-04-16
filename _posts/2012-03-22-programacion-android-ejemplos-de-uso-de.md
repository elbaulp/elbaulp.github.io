---
id: 359
title: 'Programación Android &#8211; Ejemplo de uso de ACTION_PICK'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-ejemplo-de-uso-de-action_pick/
permalink: /programacion-android-ejemplos-de-uso-de/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
if_slider_image:
  - 
  - 
share_data:
  - '[]'
  - '[]'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551680}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551680}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - action_pick activity ejemplo
  - action_pick activity example
  - android listview example
  - como filtrar un action_pick
  - curso android pdf
  - startactivityforresult android example
---
La idea de ACTION_PICK es lanzar una actividad que muestre una liste de objetos a seleccionar para que el usuario elija uno de ellos. Una vez elegido, la actividad devuelve la URI del elemento elegido. Así se permite reusar la interfaz gráfica.

Se debe indicar usando MIME types la colección de datos que vamos a usar, el cual apuntará a un cursor parecido a este:

{% highlight bash %}vnd.android.cursor.dir/vnd.favsites.site{% endhighlight %}

  
<!--more-->

LA actividad es la encargada de recuperar los datos desde el [CV][1] basandose en la URI.

Para este tipo de [acción][2]**(ACTION_PICK)**, no podemos usar **startActivity()**, ya que no devuelve resultado alguno debido a que abre la nueva actividad en un hilo separado. Es decir, **startActivity()** es una llamada asíncrona que no usa callbacks para indicar qué ha pasado en la actividad invocada.

Por lo tanto debemos usar **startActivityForResult()**, que sí que tiene callback. Este método acepta dos parámetros, el primero es el intent que queremos lanzar, y el segundo es un requestCode. Cuando la actividad que hemos lanzado finalize, se llamará en la actividad desde la que se lanzó el intent a **onActivityResult()** con el requestCode que le proporcionamos. La cabecera de este método de callback es la siguiente:

{% highlight java %}protected void onActivityResult (int requestCode, int resultCode, Intent data)
{% endhighlight %}

Donde el primer argumento es el código que le hemos pasado a **startActivityForResult()**, el segundo argumento (resultcode), puede ser *RESULT\_OK, RESULT\_CANCELED* o un código propio. Si decidimos usar un código propio, debe empezar en *RESULT\_FIRST\_USER*. El tercer parámetro contiene cualquier dato adicional que la actividad invocada devuelva. Para *ACTION_PICK* tendremos una URI apuntando a un elemento.

Para este ejemplo de uso de ACTION_PICK, es necesario tener instalada la aplicación **NotePad**, que está disponible para instalar en los ejemplos que vienen al instalar el SDK:

{% highlight java %}public static void invokePick(Activity activity)
{
   Intent pickIntent = new Intent(Intent.ACTION_PICK);
   int requestCode = 1;
   pickIntent.setData(Uri.parse(
      "content://com.google.provider.NotePad/notes"));
   activity.startActivityForResult(pickIntent, requestCode);
}

protected void onActivityResult(int requestCode
   ,int resultCode
   ,Intent outputIntent)
{ 
   //Llamamos a super para informar a la clase padre que la llamada a la actividad a finalizado
   super.onActivityResult(requestCode, resultCode, outputIntent);
   IntentsUtils.parseResult(this, requestCode, resultCode, outputIntent);
}

public static void parseResult(MainActivity activity
 , int requestCode
 , int resultCode
 , Intent outputIntent)
{
   if (requestCode != 1){
      Log.d("Test", "cualquier otra cosa ha llamado a este método, no nosotros");
      return;
   }
   if (resultCode != Activity.RESULT_OK){
      Log.d("test", "ResultCode no es OK: " + resultCode);
      return;
   }
   
   Log.d("Test", "Resulcode es OK:" + resultCode);
   Uri selectedUri = outputIntent.getData(); 
   Log.d("test", "La uri de salida:" + selectedUri.toString());
   
   //Mostramos la nota
   outputIntent.setAction(Intent.ACTION_VIEW);
   startActivity(outputIntent);
}
{% endhighlight %}

Las constantes **RESTULT\_OK, RESULT\_CANCEL Y RESULT\_FIRST\_USER** están definidas en la clase de la Actividad y sus respectivos valores son:

{% highlight java %}RESTULT_OK         = -1; 
RESULT_CANCEL      =  0;  
RESULT_FIRST_USER  =  1;
{% endhighlight %}

Por otro lado, en la aplicación **notePad**, debe haber un código devuelva un valor en el caso de que se haya llamado a la actividad desde un intent con ACTION_PICK como acción:

{% highlight java %}@Override
protected void onListItemClick(ListView l, View v, int position, long id){
   Uri uri = ContentUris.withAppendedId(getIntent().getData(), id);

   String action = getIntent().getAction();
   if(Intent.ACTION_PICK.equals(action) || Intent.ACTION_GET_CONTENT.equals(action))
      //devolvemos la nota seleccionada
      setResult(RESULT_OK, new Intent().setData(uri));
   else
      //Lanzamos una actividad para ver, editar la nota
      startActivity(new Intent(Intent.ACTION_EDIT, uri));
}
{% endhighlight %}



 [1]: /programacion-android-implementando-un
 [2]: /programacion-android-como-se-resuelven

{% include _toc.html %}

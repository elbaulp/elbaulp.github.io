---
id: 344
title: 'Programación Android: Intents &#8211; Categorías'

layout: post
guid: http://elbauldelprogramador.org/programacion-android-intents-categorias/
permalink: /programacion-android-intents-categorias/
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
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551702}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551702}'
share_count:
  - 0
  - 0
categories:
  - android
  - opensource
tags:
  - android ejemplo intent filter
  - curso android pdf
  - ejemplo intentfilter implicito
---
<div class="separator" style="clear: both; text-align: center;">
  <img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />
</div>

Las actividades se pueden clasificar en categorías para así poder buscarlas basándonos en el nombre de dicha categoría. Por ejemplo, mientras el sistema se está iniciando, busca en las actividades las que estén bajo la categoría *CATEGORY_LAUNCHER*.

La convención usada para nombrar a las categorías es (para el caso de CATEGORY_LAUNCHER):

{% highlight bash %}android.intent.category.LAUNCHER{% endhighlight %}

La forma de declarar las categorías en el AndroidManifest es la siguiente:

  
<!--ad-->

{% highlight xml %}<activity android:name=".PrincipalActivity" android:label="@string/app_name">
   <intent -filter>
      <action android:name="android.intent.action.MAIN" />
      <category android:name="android.intent.category.LAUNCHER" />
   </intent>
</activity>
{% endhighlight %}

Vamos a ver algunas categorías predefinidas, podéis encontrar la lista de todas ellas en <a target="_blank" href="http://developer.android.com/reference/android/content/Intent.html#CATEGORY_ALTERNATIVE">developer.android.com/reference/android/content/Intent.html#CATEGORY_ALTERNATIVE</a>:

  * ***CATEGORY_DEFAULT:*** Si declaramos una actividad bajo la categoría DEFAULT, podrá ser invocada mediante [intents implícitos][1], de lo contrario, habrá que llamarla con intents explícitos.
  * ***CATEGORY_BROWSABLE:*** Si la actividad es de este tipo, podrá ser invocada con seguridad por el navegador para mostrar los datos referenciados por un link, como una imagen o un email.
  * ***CATEGORY_GADGET:*** La actividad se puede embeber dentro de otra actividad que pueda albergar gadgets.
  * ***CATEGORY_HOME:*** Suele existir solo una actividad de este tipo, que es la pantalla principal, esta actividad se muestra al iniciar el teléfono o pulsar el botón home. Si existe más de una se le pregunta al usuario cual elegir.

Cuando usamos un intent para iniciar una actividad podemos especificar qué tipo de actividad queremos especificando la categoría. Otra opción es buscar las actividades que coincidan con una determinada categoría, por ejemplo:

{% highlight java %}Intent i = new Intent(Intent.ACTION_MAIN, null);
i.addCategory(Intent.CATEGORY_LAUNCHER);
PackageManager pm = getPackageManager();
List<resolveinfo> list = pm.queryIntentActivities(i, 0);
</resolveinfo>{% endhighlight %}

PackageManager permite encontrar actividades que coincidan con un intent sin llegar a invocarlas. Una vez ejecutado lo de arriba, podemos iterar sobre la lista e invocar a la actividad que coincida con el nombre que deseemos:

{% highlight java %}for(ResolveInfo ri: list){
   Log.d("Info", ri.toString());
   String pkgName = ri.activityInfo.packageName;
   String className = ri.activityInfo.name;
   if(className.equals("nombre.paquete.denuestra.actividad.nombreActividad")){
      Intent i = new Intent();
      i.setClassName(pkgName, className);
      activity.startActivity(i);
   }
}
{% endhighlight %}

Es posible lanzar una actividad basándonos en el nombre de la categoría:

{% highlight java %}Intent i = new Intent(Intent.ACTION_MAIN, null);
i.addCategory(Intent.CATEGORY_LAUNCHER);
activity.startActivity(i);
{% endhighlight %}

Como mencioné anteriormente, en el caso de que exista más de una actividad que satisfaga las condiciones que impone el intent, se mostrará un diálogo al usuario para que elija cual lanzar.

Si quisiéramos invocar un intent para volver a la pantalla principal, basta con cambiar la categoría del código de arriba de *Intent.CATEGORY_LAUNCHER* a *Intent.CATEGORY_HOME*

* * *

#### Siguiente Tema: [Cómo se resuelven los Intents][2] {.referencia}





 [1]: /programacion-android-intents-conceptos
 [2]: /programacion-android-como-se-resuelven/

{% include _toc.html %}

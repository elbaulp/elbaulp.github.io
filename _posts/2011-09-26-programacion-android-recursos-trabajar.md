---
id: 256
title: 'Programación Android: Recursos &#8211; Trabajar con recursos XML arbitrarios'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-trabajar-con-recursos-xml-arbitrarios/
permalink: /programacion-android-recursos-trabajar/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/09/programacion-android-recursos-trabajar.html
  - /2011/09/programacion-android-recursos-trabajar.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - recursos xml
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Además de los recursos estructurados [que hemos ido viendo][1], Android permite usar archivos XML arbitrarios como recursos. Esto proporciona una forma rápida de referenciar los archivos basandose en su Id de recurso así como permitirnos localizar estos archivos de una manera sencilla. Como última ventaja, nos permite compilar y almacenar estos archivos en el dispositivo eficientemente.

Los ficheros XML que se lean de esta manera, tiene que almacenarse bajo el directorio ./res/xml. A continuación vamos a ver un ejemplo:

  
<!--more-->

<pre lang="xml">&lt;rootelem1>
   &lt;subelem1>
      Hello World from an xml sub element
   &lt;/subelem1>
&lt;/rootelem1>
</pre>

Como hace con cualquier otro fichero XML de recursos, el AAPT compila este fichero antes de colocarlo en el paquete de la aplicación. Ahora necesitamos usar una instancia de *XmlPullParser* para poder parsear el archivo. Para obtener la instancia de *XmlPullParser* usando el siguiente código desde cualquier contexto (incluyendo una activity):

<pre lang="java">Resources res = activity.getResources();
XmlResourceParser xpp = res.getXml(R.xml.test);
</pre>

El *XmlResourceParser* devuelto es una instancia de *XmlPullParser*, y también implementa java.util.AttributeSet. En el siguiente fragmento de código se muestra como leer el fichero:

<pre lang="java">private String getEventsFromAnXMLFile(Context activity)
 throws XmlPullParserException, IOException
 {
    StringBuffer sb = new StringBuffer();
    Resources res = activity.getResources();
    XmlResourceParser xpp = res.getXml(R.xml.test);
    
    xpp.next();
    int eventType = xpp.getEventType();
     while (eventType != XmlPullParser.END_DOCUMENT) 
     {
         if(eventType == XmlPullParser.START_DOCUMENT) 
         {
            sb.append("******Start document");
         } 
         else if(eventType == XmlPullParser.START_TAG) 
         {
            sb.append("nStart tag "+xpp.getName());
         } 
         else if(eventType == XmlPullParser.END_TAG) 
         {
            sb.append("nEnd tag "+xpp.getName());
         } 
         else if(eventType == XmlPullParser.TEXT) 
         {
            sb.append("nText "+xpp.getText());
         }
         eventType = xpp.next();
     }//eof-while
     sb.append("n******End document");
     return sb.toString();
 }//eof-function
</pre>

Lo que hacemos en el código de arriba es obtener el XmlPullParser, usarlo para navegar a través de los elementos del archivo y usar métodos adicionales de XmlPullParser para acceder a detalles de los elementos XML. Para ejecutar este código, se debe crear un archivo XML como el mostrado anteriormente y llamar al método *getEventsFromAnXMLFile* desde cualquier menú o botón. Devolverá un string, el cual se podrá usar para mostrarlo por el Log usando el método de debug Log.d

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Trabajar con recursos RAW][2] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Trabajar con recursos XML arbitrarios+http://elbauldelprogramador.com/programacion-android-recursos-trabajar/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-trabajar/&t=Programación Android: Recursos &#8211; Trabajar con recursos XML arbitrarios+http://elbauldelprogramador.com/programacion-android-recursos-trabajar/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Trabajar con recursos XML arbitrarios+http://elbauldelprogramador.com/programacion-android-recursos-trabajar/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /p/guia-de-desarrollo-android.html
 [2]: /programacion-android-recursos-trabajar-2/
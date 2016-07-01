---
title: 'Programación Android: Recursos &#8211; Trabajar con recursos XML arbitrarios'

layout: post
permalink: /programacion-android-recursos-trabajar/
categories:
  - android
  - opensource
tags:
  - curso android pdf
  - recursos xml
main-class: "android"
color: "#689F38"
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" width="128px" height="128px" />

Además de los recursos estructurados [que hemos ido viendo][1], Android permite usar archivos XML arbitrarios como recursos. Esto proporciona una forma rápida de referenciar los archivos basandose en su Id de recurso así como permitirnos localizar estos archivos de una manera sencilla. Como última ventaja, nos permite compilar y almacenar estos archivos en el dispositivo eficientemente.

Los ficheros XML que se lean de esta manera, tiene que almacenarse bajo el directorio ./res/xml. A continuación vamos a ver un ejemplo:


<!--ad-->

```xml
<rootelem1>
<subelem1>
      Hello World from an xml sub element
   </subelem1>
</rootelem1>

```

Como hace con cualquier otro fichero XML de recursos, el AAPT compila este fichero antes de colocarlo en el paquete de la aplicación. Ahora necesitamos usar una instancia de *XmlPullParser* para poder parsear el archivo. Para obtener la instancia de *XmlPullParser* usando el siguiente código desde cualquier contexto (incluyendo una activity):

```java
Resources res = activity.getResources();
XmlResourceParser xpp = res.getXml(R.xml.test);

```

El *XmlResourceParser* devuelto es una instancia de *XmlPullParser*, y también implementa java.util.AttributeSet. En el siguiente fragmento de código se muestra como leer el fichero:

```java
private String getEventsFromAnXMLFile(Context activity)
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

```

Lo que hacemos en el código de arriba es obtener el XmlPullParser, usarlo para navegar a través de los elementos del archivo y usar métodos adicionales de XmlPullParser para acceder a detalles de los elementos XML. Para ejecutar este código, se debe crear un archivo XML como el mostrado anteriormente y llamar al método *getEventsFromAnXMLFile* desde cualquier menú o botón. Devolverá un string, el cual se podrá usar para mostrarlo por el Log usando el método de debug Log.d

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Trabajar con recursos RAW][2] {.referencia}





 [1]: /guia-de-desarrollo-android
 [2]: /programacion-android-recursos-trabajar-2/

{% include toc.html %}

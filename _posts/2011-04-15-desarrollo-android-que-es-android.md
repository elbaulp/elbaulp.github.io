---
id: 172
title: 'Desarrollo android &#8211; ¿Qué es Android? &#8211; Traducción de developer.android.com'

layout: post
guid: http://elbauldelprogramador.org/desarrollo-android-que-es-android-traduccion-de-developer-android-com/
permalink: /desarrollo-android-que-es-android/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/04/desarrollo-android-que-es-android.html
  - /2011/04/desarrollo-android-que-es-android.html
  - /2011/04/desarrollo-android-que-es-android.html
categories:
  - android
  - aplicaciones
  - opensource
tags:
  - curso android pdf
---
<img border="0" src="/images/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

<div id="jd-header" class="guide-header">
  <h1>
    ¿Qué es Android?
  </h1>
</div>

<div id="jd-content">
  <div class="jd-descr">
    <p>
      Android es un conjunto de software para dispositivos móviles que incluye Sistema Operatívo, <a href="http://es.wikipedia.org/wiki/Middleware">middleware</a> y las aplicaciones principales. El <a href="http://developer.android.com/sdk/index.html">SDK de Android</a><br /> proporciona las herramientas y APIs necesarias para comenzar a desarrollar aplicaciones para la plataforma Android usando el lenguaje<br /> de programación Java.
    </p>
    
    <p>
      <br /><!--more-->
    </p>
    
    <h2>
      Características
    </h2>
    
    <ul>
      <li>
        <strong>Un Framework</strong> que permite la reutilización y sustitición<br /> de componentes
      </li>
      <li>
        <strong>Máquina virtual de Dalvik</strong> optimizada para dispositivos<br /> móviles
      </li>
      <li>
        <strong>Navegador integrado</strong> basado en el motor de código libre <a href="http://webkit.org/">WebKit</a>
      </li>
      <li>
        <strong>Gráficos optimizados</strong> proporcionados por una colección de librerías gráficas 2D personalizadas; Gráficos<br /> 3D basados en la especificación OpenGL ES 1.0 (aceleración hardware opcional)
      </li>
      <li>
        <strong>SQLite</strong> para almacenamiento de datos estructurados
      </li>
      <li>
        <strong>Soporte multimedia</strong> para audio, vídeo, y formatos de imágenes (MPEG4, H.264, MP3, AAC, AMR, JPG, PNG,<br /> GIF)
      </li>
      <li>
        <strong>Telefonía GSM</strong> (dependiente del hardware)
      </li>
      <li>
        <strong>Bluetooth, EDGE, 3G, y WiFi</strong> (dependiente del hardware)
      </li>
      <li>
        <strong>Cámara, GPS, compass y acelerómetro</strong> (dependiente del hardware)
      </li>
      <li>
        <strong>Un rico entorno de desarrollo</strong> incluyendo un emulador de dispositivos,<br /> herramientas para depuración, perfiles de remdimiento y memória y plugin para el IDE Ecplipse
      </li>
    </ul>
    
    <h2>
      Arquitectura Android
    </h2>
    
    <p>
      El siguiente diagrama muestra los principales componentes del sistema operatívo Android.<br /> Cada sección se describe con más detalle abajo.
    </p>
    
    <p>
      <img src="http://bit.ly/ebtxQx" alt="Android System Architecture" width="713" height="512" />
    </p>
    
    <h2>
      Aplicaciones
    </h2>
    
    <p>
      Android viene por defecto con un conjunto de aplicaciones básicas<br /> como un cliente de correo electrónico, programa de SMS, calendario, mapas,<br /> navegador, contactos etc. Todas las aplicaciones están escritas en java.
    </p>
    
    <p>
      <a name="application_framework" id="application_framework"></a>
    </p>
    
    <h2>
      Framework
    </h2>
    
    <p>
      Al proporcionar una plataforma de desarrollo libre,<br /> Android ofrece a los desarrolladores la posibilidad de construir<br /> aplicaciones muy solidas e innovadoras. Los desarrolladores tienen la<br /> libertad de aprovechar el hardware del dispositivo, acceder a la información<br /> de localización, ejecutar servícios en segundo plano, fijar alarmas, añadir<br /> notificaciones a la barra de estado, y mucho, mucho más.
    </p>
    
    <p>
      Los desrrolladores tienen pleno acceso a las mismas APIs usadas por las apliaciones principales.<br /> La arquitectura de la aplicación está diseñada para simplificar la reutilización de los componentes;<br /> cualquier aplicación puede publicar sus capacidades y cualquier otra aplicación puede<br /> hacer uso de esas capacidades (sujeto a las restricciones de seguridad del framework).<br /> Este mismo mecanismo permite que los componentes sean reemplazados por los usuarios.
    </p>
    
    <p>
      Esencialmente todas las aplicaciones son un conjunto de servicios y sistemas, incluyendo:
    </p>
    
    <ul>
      <li>
        Un rico y extensible conjunto de<a href="/resources/tutorials/views/index.html"><i>Vistas</i></a><br /> que se usan para construir una aplicación, incluyendo listas, grids, cajas de texto,<br /> botones e incluso un navegador web embebido.
      </li>
      <li>
        <a href="/guide/topics/providers/content-providers.html">Proveedores<br /> de contenido</a> que permiten a las aplicaciones el acceso a otras aplicaciones<br /> (como los Contactos), o para compartir sus propios datos
      </li>
      <li>
        Un <a href="/guide/topics/resources/resources-i18n.html">Gestor de Recursos<br /> </a>, que facilita el acceso a recursos que no son código, como cadenas de<br /> traducción, gráficos y archivos de diseño(layout)
      </li>
      <li>
        Un <code><a href="/reference/android/app/NotificationManager.html">Gestor de notificaciones</a></code> que<br /> permite a las aplicaciones mostrar alertas personalizadas en la barra de estado
      </li>
      <li>
        Un <code><a href="/reference/android/app/Activity.html">Gestor de antividades</a></code> que gestiona<br /> el ciclo de vida de las aplicaciones y proporciona una navegación backstack común
      </li>
    </ul>
    
    <p>
      Para obtener más detalles y un tutorial sobre las aplicaciones, vea el<a href="/resources/tutorials/notepad/index.html">Notepad Tutorial</a>.
    </p>
    
    <h2>
      Librerías
    </h2>
    
    <p>
      Android incluye un conjunto de librerías C/C++ usadas por varios componentes<br /> del sistema Android. Estas capaciddes están expuestas para los desarrolladores a<br /> través del framework android. Abajo se listan algunas de las librerías principales:
    </p>
    
    <ul>
      <li>
        <strong>System C library</strong> &#8211; una implementación de la librería<br /> estandar del systema de C (libc) derivada de BSD
      </li>
      <li>
        <strong>Librerías multimedia</strong> &#8211; Basado en OpenCORE<br /> PacketVideo; estas librerías soportan reproducción y grabación en formatos de áudio y vídeo,<br /> así como archivos de imágenes estáticas, incluyendo MPEG4, H.264, MP3, AAC, AMR, JPG Y PNG
      </li>
      <li>
        <strong>Gestor de superfícies</strong> &#8211; gestiona el acceso a la pantalla y compone<br /> sin problemas gráficos en 2D y 3D de múltiples aplicaciones.
      </li>
      <li>
        <strong>LibWebCore</strong> &#8211; Un motor web moderno
      </li>
      <li>
        <strong>SGL</strong> &#8211; El motor base de gráficos 2D
      </li>
      <li>
        <strong>3D libraries</strong> &#8211; Una implementación basada<br /> en el API OpenGL ES 1.0; la librería usa la aceleración hardware 3D (Donde esté disponible)
      </li>
      <li>
        <strong>FreeType</strong> &#8211; Renderización de bitmap y fuentes vectoriales
      </li>
      <li>
        <strong>SQLite</strong> &#8211; Un potente y ligero motor de base de datos relacional disponible<br /> para todas las aplicaciones
      </li>
    </ul>
    
    <h2>
      Android Runtime
    </h2>
    
    <p>
      Android incluye un conjunto de librerías principales que proporcionan la mayor parte<br /> de la funcionalidad disponible en la librerías de Java.
    </p>
    
    <p>
      Cada aplicación android se ejecuta en su propio proceso, que es una instancia<br /> propia de la máquina virtual de Dalvik. Dalvik ha sido escrito para que un<br /> dispositivo pueda ejecutar múltiples MVs eficientemente. La máquina virtual de<br /> Dalvik ejecuta archivos en formato .dex(que son sus ejecutables). Este formato<br /> está optimizado para consumir el mínimo de memória. La MV está basada en registros,<br /> y ejecuta clases compiladas en java que posteriormente se transforman al formato<br /> .dex por la herramienta "dx"
    </p>
    
    <p>
      La MV de Dalvik se basa en el kernel de Linux para obtener su funcionalidad, como<br /> hilos(Threading) y administración de memória a bajo nivel.
    </p>
    
    <h2>
      El kernel Linux
    </h2>
    
    <p>
      Android se basa en la versión 2.6 de linux para el sistema de servícios esenciales<br /> como seguridad, gestión de memoria, gestión de procesos, pila de red y el conductor de modelos.<br /> El kernel también actua como una capa de abstracción entre el hardware y el resto del software.
    </p></p>
  </div>
  
  <p>
    <a href="#top" style="float:right">&uarr; Go to top</a>
  </p>
</div>

* * *

#### Siguiente: [Fundamentos aplicaciones Android &#8211; (Parte I)][1] {.referencia}



 [1]: http://elbauldelprogramador.com/fundamentos-aplicaciones-android-parte/
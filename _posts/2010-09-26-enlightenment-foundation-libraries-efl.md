---
id: 11
title: Enlightenment Foundation Libraries (EFL)
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/enlightenment-foundation-libraries-efl/
permalink: /enlightenment-foundation-libraries-efl/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - haitikehttp://www.blogger.com/profile/14278354471841809541noreply@blogger.com
  - haitikehttp://www.blogger.com/profile/14278354471841809541noreply@blogger.com
  - haitikehttp://www.blogger.com/profile/14278354471841809541noreply@blogger.com
blogger_permalink:
  - /2010/09/enlightenment-foundation-libraries-efl.html
  - /2010/09/enlightenment-foundation-libraries-efl.html
  - /2010/09/enlightenment-foundation-libraries-efl.html
categories:
  - linux
---
Esta es mi primera entrada así que intentad ser amable conmigo.

Aprovechando <a href="http://www.enlightenment.org/p.php?p=news/show&l=en&news_id=23" target="_blank">que salió la versión Alfa</a> de las EFL decidido hablaros de estas librerias  
<span class="fullpost"></p> 

<p>
  Para ello hay que empezar hablando de <a href="http://es.wikipedia.org/wiki/Enlightenment" target="_blank">Enlightenment</a>. Enlightenment es un gestor de ventanas y también un escritorio de unix que empezó a desarrollarse en el 97, en la época de los inicios de muchos escritorios como KDE y Gnome. Era un escritorio bastante simple y ligero y de aspecto arcaico que usaba las librerías básicas de las X. Su última versión fue conocida como e16.
</p>

<p>
  Hace unos años los desarrolladores decidieron reescribir desde cero el escritorio y empezar una nueva versión conocida como e17. Y ya que decidieron empezar desde cero tuvieron una genial idea, crear sus propias librerías gráficas llamadas EFL.
</p>

<p>
  ¿Que tiene de interesante estas librerías? En caso de que llegar a ser estables y maduras proveen unas librerías potentes y modernas para aquellos programadores que quieren programar sin presuponer que estes en gnome y kde. Durante años para estas tareas se usaba las X (de aspecto arcaico) o WX (que dibuja con el motor de gtk). Estas librerías son realmente una versión mejorada de las X clásicas con aceleración gráfica, widgets varios, mejor programada y con más efectos y funciones.
</p>

<p>
  Aún se usa en pocos programas (e17, amsn2, xmms2, etc.) debido a encontrarse en estado alfa. Pero hay quien ha sugerido en alguna lista de correo que en el futuro si se desarrollan bien podrían hacerse una versión de firefox usándolas lo que solucionaría el gran consumo de memoria de firefox en linux (usa gtk), navegador que sin duda es menos eficiente en linux que en windows actualmente.
</p>

<div>
  <a onblur="try {parent.deselectBloggerImageGracefully();} catch(e) {}" href="http://download.enlightenment.org/att/wiki/Elementary/elm-app-02.2.png" target="_blank"><img style="margin: 0pt 10px 10px 0pt; float: left; cursor: pointer; width: 266px; height: 499px;" src="http://download.enlightenment.org/att/wiki/Elementary/elm-app-02.2.png" alt="" border="0" /></a>
</div>

<p>
  Las EFL constan de los siguientes módulos/librerías principales:<br /> &#8211; <span style="font-weight: bold;">Evas</span>: Es la librería encargada de crear areas y ventanas. Esta librería usará aceleración gráfica 3D siempre que sea posible, pero igualmente correrá rápidamente en máquinas con gráficas de bajo nivel o antiguas.<br /> &#8211; <span style="font-weight: bold;">Edje</span>: Esta librería separa la interfaz de la aplicación. Permite de forma sencilla aplicar skins a las aplicaciones, permitiendo cambiar la <a href="http://es.wikipedia.org/wiki/GUI" title="GUI" class="mw-redirect" target="_blank">GUI</a> del programa sin tener que cambiar la aplicación en sí.<br /> &#8211; <span style="font-weight: bold;">Ecore</span>: Es una librería abstracta de eventos. Es muy modular así que las aplicaciones solo tienen que llamar a las partes mínimas que sean necesarias. A parte de eventos gráficos también recolecta eventos de redes/internet.<br /> &#8211; <span style="font-weight: bold;">Embryo</span>: Esta librería implementa un lenguage de programación propio para realizar scripts que puedan ser usados en otras partes de la EFL. El lenguage tiene una sintasis muy parecida a C.<br /> <span style="font-weight: bold;">EET</span>: Es la librería encargada de cargar y guardar datos en los programas tanto desde el disco duro como desde internet. Está designado para ser rápido, y posee su propio tipo de archivo (de extensión EET) .<br /> &#8211; <span style="font-weight: bold;">Eina</span>: Es la librería básica de los tipos/clases usados por la ESL como los rectangulos, <a href="http://es.wikipedia.org/wiki/Tabla_hash" target="_blank">hashes</a>, etc. Es pequeña y se puede usar aislada.
</p>

<p>
  EFL usa otras librerías secundarias o de ayuda como imlib2 (para imágenes), EDB (base de datos simple), exml (escritor/parser de lenguage xml), epeg (para imágenes JPEG), Epsilon (para crear thumbnails), Engrave, Esmart, Emotion (para videos), Elementary y EWL(Widgets Varios).
</p>

<p>
  Como podeis ver a pesar de estar en un estado Alfa de desarrollo y tener aún mucho tiempo para ser estable, la idea de una gui estructurada en múltiples módulos va en buen camino.
</p>

<div>
  <div>
  </div>
  
  <p>
  </p>
  
  <div>
  </div>
  
  <p>
    </div> 
    
    <p>
      Recomiendo para probar las librerías en acción (en este caso con e17) con el siguiente live-cd:<a href="http://www.elivecd.org/Download/Stable#download" target="_blank"> http://www.elivecd.org/Download/Stable#download</a>
    </p>
    
    <p>
      Imágenes extra:<br /> <a href="http://trac.enlightenment.org/e/wiki/Elementary" target="_blank">http://trac.enlightenment.org/e/wiki/Elementary</a>
    </p>
    
    <p>
      Página web de Enlightenment y las EFL (en inglés): <a href="http://www.enlightenment.org/" target="_blank">http://www.enlightenment.org/</a><br /> </span>
    </p>
    
    <div class="sharedaddy">
      <div class="sd-content">
        <ul>
          <li>
            <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Enlightenment Foundation Libraries (EFL)+http://elbauldelprogramador.com/enlightenment-foundation-libraries-efl/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/enlightenment-foundation-libraries-efl/&t=Enlightenment Foundation Libraries (EFL)+http://elbauldelprogramador.com/enlightenment-foundation-libraries-efl/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Enlightenment Foundation Libraries (EFL)+http://elbauldelprogramador.com/enlightenment-foundation-libraries-efl/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
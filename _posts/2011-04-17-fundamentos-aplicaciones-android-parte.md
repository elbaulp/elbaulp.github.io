---
title: 'Fundamentos aplicaciones Android &#8211; (Parte I)'
layout: post
permalink: /fundamentos-aplicaciones-android-parte/
categories:
  - android
  - aplicaciones
  - opensource
tags:
  - curso android pdf
main-class: "android"
color: #689F38
---
<img border="0" src="/assets/img/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

<div class="g-unit" id="doc-content">
  <a name="top"></a> </p>

  <div id="jd-header" class="guide-header">
    <span class="crumb"><br /> &nbsp;</p>

    <p>
      </span> </div>

      <div id="jd-content">
        <div class="jd-descr">
          <div id="qv-wrapper">
            <div id="qv">
              <h2>
                Vista rápida
              </h2>

              <ul>
                <li>
                  Las aplicaciones android están compuestas por uno o más componentes de aplicación (<br /> Actividades, servícios, proveedores de contenido y emisores de notificaciones)
                </li>
                <li>
                  Cada componente realiza una función diferente en el comportamiento de la aplicación general<br /> y cada uno se puede activar individualmente (incluso por otras aplicaciones)
                </li>
                <li>
                  El archivo manifiesto, debe declarar todos los componentes de la aplicación y debe declarar<br /> también todos los requisitos de la aplicación, como la versión mínima de Android requerida y cualquier<br /> configuración hardware requerida
                </li>
                <li>
                  Los recursos no-código de la aplicación (imágenes, archivos de diseño (layout) etc.) deben<br /> incluir alternativas para las distintas configuraciones de los dispositivos (tales como cadenas de<br /> texto distintas para cada idioma y diseños diferentes para los distintos tamaños de las pantallas.)
                </li>
              </ul>

              <p>
                <br /><!--ad--></div> </div>

                <h1>
                  Fundamentos de las aplicaciones
                </h1>

                <p>
                  Las aplicaciones Android están escritas en el lenguaje de programación Java. El SDK de android<br /> compila todo el código con todos los datos y archivos de recursos en un <i>paquete Android</i>, un<br /> archivo de extensión <code>.apk</code>. Todo el código dentro de un archivo <code>.apk</code> se<br /> considera una aplicación y es lo que usan los dispositívos para instalar dicha aplicación
                </p>

                <p>
                  Una vez instalada en el dispositivo, cada aplicación corre bajo su própia área de seguridad:
                </p>

                <ul>
                  <li>
                    El sistema operativo Android es un sistema Linux multi-usuario en el cual cada aplicación<br /> se considera un usuario diferente.
                  </li>
                  <li>
                    Por defecto, el sistama asigna a cada aplicación un único ID de usuario Linux (El Id lo usa<br /> solo el sistema y la aplicación no lo conoce). El sistema asigna permisos para todos los archivos de<br /> la aplicación para que sólo el ID de usuario asignado a esa aplicación tenga acceso a ellos.
                  </li>
                  <li>
                    Cada proceso tiene su propia máquina Virtual (MV), por lo que el código de una aplicación<br /> se ejecuta de forma aislada de otras aplicaciones.
                  </li>
                  <li>
                    Por defecto, cada aplicación se ejecuta en su propio proceso Linux. Android inicia el proceso<br /> cuando cualquiera de los componentes de la aplicación necesite ser ejecutado, a continuación finaliza el proceso<br /> cuando ya no sea necesario que siga en ejecución o cuando el sistema necesite recuperar la memoria para otras<br /> aplicaciones.
                  </li>
                </ul>

                <p>
                  De este modo, el sistema Android implementa el <em>principio del mínimo privilegio</em>. Que significa;<br /> cada aplicación, por defecto, tiene acceso solo a los componentes que necesite para ejecutarse, a ninguno más.<br /> Esto crea un entorno muy seguro en el cual una aplicación no puede acceder a partes del sistema a las que no se<br /> le haya dado permiso.
                </p>

                <p>
                  Sin embargo, existen formas de que una aplicación comparta datos con otra y que pueda tener<br /> acceso a servicios del sistema.
                </p>

                <ul>
                  <li>
                    Es posible que dos aplicaciones compartan el mismo ID de usuario Linux, en tal caso<br /> podrán acceder a los archivos de la otra aplicación. Para conservar los recursos del sistema, las<br /> aplicaciones con el mismo ID pueden ejecutarse en el mismo proceso y compartir la misma MV (También<br /> deben estar firmadas con el mismo certificado).
                  </li>
                  <li>
                    Una aplicación puede solicitar permisos para acceder a datos del dispositivo como<br /> los contactos, SMS, la tarjeta SD, cámara, bluetooth y más. Los permisos de la aplicación<br /> se conceden en el instalación de la misma, y los otorga el usuario.
                  </li>
                </ul></div> </div> </div>

                <hr />

                <h4 class="referencia">
                  Siguiente: <a href="https://elbauldelprogramador.com/fundamentos-aplicaciones-android-parte_18/">Fundamentos aplicaciones Android &#8211; (Parte II) &#8211; Componentes</a>
                </h4>



{% include _toc.html %}

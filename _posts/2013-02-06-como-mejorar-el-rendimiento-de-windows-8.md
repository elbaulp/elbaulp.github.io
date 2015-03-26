---
id: 1322
title: Cómo mejorar el rendimiento de Windows 8
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1322
permalink: /como-mejorar-el-rendimiento-de-windows-8/
categories:
  - How To
tags:
  - acelerar computadora windows 8
  - acelerar win 8
  - acelerar windows 8
  - agilizar windows 8
  - configurar prefetch windows 8
  - mal rendimiento en windows 8
  - mejorar rendimiento pc
  - mejorar rendimiento windows 8
  - optimizacion de windows 8
  - optimizar win8
  - optimizar windows 8
  - problemas con w8
  - problemas windows 8
  - temporales en w8
  - trucos optimizar windows 8
  - windows 8 lento
  - windows 8 se bloquea
  - windows 8 se traba
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/02/Windows8problem.jpg" alt="Windows8problem" width="640" height="360" class="thumbnail aligncenter size-full wp-image-1331" />  
Aunque llevo años sin usar Windows, hace poco una amiga me comentó que había comprado un portatil con Windows 8 e iba fatal, cada dos por tres se colgaba y ni siquiera se apabaga.

Tras un poco de investigación por la red, comprobé que no era la única, Windows 8 está dando muchos problemas a los usuarios.

Una vez con el portatil en mi posesión confirmé el mal rendimiento que tenía. Se quedaba bloqueado hasta tal punto que era necesario apagarlo directamente cortando el suministro de corriente.

Tras aplicarle una serie de cambios, he conseguido que vaya fluido y sin ningún problema. Si tienes problemas similares con tu windows 8, puedes probar a realizar lo siguientes cambios:  
  
<!--more-->

#### Windows 8 no se apaga

Este problema es consecuencia de una nueva característica introducida por Microsoft, que pretende acelerar el proceso de arranque del sistema, sin embargo provoca muchos problemas en la mayoría de PCs. Basta con desactivar esta opción y el ordenador se apagará correctamente. Procedemos con los siguientes pasos:

  1. En la pantalla de inicio, teclea **power**, seleciona **Configuración » Cambiar las acciones de los botones de inicio/apagado**.  
    <img src="http://elbauldelprogramador.com/content/uploads/2013/02/Change_Power_Settings_Windows_8.png" alt="Change_Power_Settings_Windows_8" width="591" height="250" class="thumbnail aligncenter size-full wp-image-1323" />
  2. Se abrirá una ventana con varias opciones, haz click en **Cambiar la configuración actualmente no disponible** en caso de que las opciones bajo **Configuración de apagado estén deshabilitadas**.
  3. Desactiva la opción **Activar inicio rápido**. 
    <img src="http://elbauldelprogramador.com/content/uploads/2013/02/Disable_Hybrid_Shutdown_Fast_Startup_Windows_8.png" alt="Disable_Hybrid_Shutdown_Fast_Startup_Windows_8" width="540" height="307" class="thumbnail aligncenter size-full wp-image-1324" /> </li> 
    
      * Haz click en guardar cambios.</ol> 
    
    Reinicia el equipo y el problema debería haber desaparecido. En caso contrario, abre un terminal pulsando **Win+X** y selecciona **Símbolo del sistema (Administrador)**. Introduce lo siguiente:
    
    {% highlight bash %}>bcdedit /set disabledynamictick yes
{% endhighlight %}
    
    #### Desactivar programas de inicio innecesarios
    
      1. Abre el administrador de tareas con **Win+X** » **Administrador de tareas**.  
        <img src="http://elbauldelprogramador.com/content/uploads/2013/02/open-task-manager.jpg" alt="open-task-manager" width="446" height="395" class="thumbnail aligncenter size-full wp-image-1325" />
      2. Ve a inicio y desactiva todos los programas que no quieras que se ejecuten al inicio del sistema.
    
    #### Limpiar el buffer de memoria y archivos temporales innecesarios
    
      1. Pulsa las teclas **Windows + R**, escribe “**%temp%**” y pulsa enter.  
        <img src="http://elbauldelprogramador.com/content/uploads/2013/02/run-temppercent.jpg" alt="run-temppercent" width="408" height="210" class="thumbnail aligncenter size-full wp-image-1326" /> 
      2. Selecciona todos los archivos y bórralos.
      3. De forma similar, repite el paso 1, pero esta vez escribe “**temp**” y borra todos los archivos.
      4. Por último, vuelve a repetir el paso uno, escribiendo “**prefetch**” y borra todos los archívos.
    
    #### Disminuir los servicios en ejecución
    
      1. Pulsa **Windows + R**, teclea “**msconfig**” y pulsa enter.
      2. Oculta los servicios de Microsoft y deshabilita los que creas convenientes.  
        <img src="http://elbauldelprogramador.com/content/uploads/2013/02/stop-services.jpg" alt="stop-services" width="560" height="373" class="thumbnail aligncenter size-full wp-image-1327" /> 
    
    #### Modifica el registro del sistema
    
      1. Pulsa **Windows + R**, teclea “**regedit**” y pulsa enter.
      2. Dirígiete hacia ***HKEY\_CURRENT\_USER\Control Panel\Mouse***. Haz doble click en **MouseHoverTime** y cambia el valor a 100.  
        <img src="http://elbauldelprogramador.com/content/uploads/2013/02/edit-mousehovertime.jpg" alt="edit-mousehovertime" width="339" height="58" class="thumbnail aligncenter size-full wp-image-1329" />  
        <img src="http://elbauldelprogramador.com/content/uploads/2013/02/edit-value.jpg" alt="edit-value" width="388" height="171" class="thumbnail aligncenter size-full wp-image-1328" /></li> 
    
      3. Dirígete ahora a ***HKEY\_LOCAL\_MACHINE\SYSTEM\Current Control Set\Control***. Doble click en **WaitToKillServiceTimeout** y cambia el valor a 1000.  
        <img src="http://elbauldelprogramador.com/content/uploads/2013/02/edit-value-wait.jpg" alt="edit-value-wait" width="389" height="172" class="thumbnail aligncenter size-full wp-image-1330" /> 
    
    Estos cambios deberías ser suficientes para notar una mejoría en el rendimiento del sistema. Puedes encontrar más información en las referencias,.
    
    #### Referencias
    
    *How to speed up Windows 8 PC?* **|** <a href="http://mywindows8.org/speed-up-windows-8/" target="_blank">Visitar sitio</a>  
    *Fix Windows 8 Restart and Shutdown Problems by Disabling “Hybrid Shutdown” Feature* **|** <a href="http://www.askvg.com/fix-windows-8-restart-and-shutdown-problems-by-disabling-hybrid-shutdown-feature/" target="_blank">Visitar sitio</a>  
    *Imagen: kotaku* **|** <a href="http://kotaku.com/5897763/three-killer-problems-that-threaten-windows-8" target="_blank">Visitar sitio</a>
    
    <div class="sharedaddy">
      <div class="sd-content">
        <ul>
          <li>
            <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo mejorar el rendimiento de Windows 8+http://elbauldelprogramador.com/como-mejorar-el-rendimiento-de-windows-8/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-mejorar-el-rendimiento-de-windows-8/&t=Cómo mejorar el rendimiento de Windows 8+http://elbauldelprogramador.com/como-mejorar-el-rendimiento-de-windows-8/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
          </li>
          <li>
            <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo mejorar el rendimiento de Windows 8+http://elbauldelprogramador.com/como-mejorar-el-rendimiento-de-windows-8/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
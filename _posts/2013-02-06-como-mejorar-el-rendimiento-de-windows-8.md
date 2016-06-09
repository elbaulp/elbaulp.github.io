---
id: 1322
title: Cómo mejorar el rendimiento de Windows 8

layout: post
guid: https://elbauldelprogramador.com/?p=1322
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
main-class: "articulos"
---
<img src="/assets/img/2013/02/Windows8problem.jpg" alt="Windows8problem"   />  
Aunque llevo años sin usar Windows, hace poco una amiga me comentó que había comprado un portatil con Windows 8 e iba fatal, cada dos por tres se colgaba y ni siquiera se apabaga.

Tras un poco de investigación por la red, comprobé que no era la única, Windows 8 está dando muchos problemas a los usuarios.

Una vez con el portatil en mi posesión confirmé el mal rendimiento que tenía. Se quedaba bloqueado hasta tal punto que era necesario apagarlo directamente cortando el suministro de corriente.

Tras aplicarle una serie de cambios, he conseguido que vaya fluido y sin ningún problema. Si tienes problemas similares con tu windows 8, puedes probar a realizar lo siguientes cambios:  

<!--ad-->

#### Windows 8 no se apaga

Este problema es consecuencia de una nueva característica introducida por Microsoft, que pretende acelerar el proceso de arranque del sistema, sin embargo provoca muchos problemas en la mayoría de PCs. Basta con desactivar esta opción y el ordenador se apagará correctamente. Procedemos con los siguientes pasos:

  1. En la pantalla de inicio, teclea **power**, seleciona **Configuración » Cambiar las acciones de los botones de inicio/apagado**.  
    <img src="/assets/img/2013/02/Change_Power_Settings_Windows_8.png" alt="Change_Power_Settings_Windows_8"   />
  2. Se abrirá una ventana con varias opciones, haz click en **Cambiar la configuración actualmente no disponible** en caso de que las opciones bajo **Configuración de apagado estén deshabilitadas**.
  3. Desactiva la opción **Activar inicio rápido**.
    <img src="/assets/img/2013/02/Disable_Hybrid_Shutdown_Fast_Startup_Windows_8.png" alt="Disable_Hybrid_Shutdown_Fast_Startup_Windows_8"   /> </li>

      * Haz click en guardar cambios.</ol>

    Reinicia el equipo y el problema debería haber desaparecido. En caso contrario, abre un terminal pulsando **Win+X** y selecciona **Símbolo del sistema (Administrador)**. Introduce lo siguiente:

    ```bash
bcdedit /set disabledynamictick yes

```

    #### Desactivar programas de inicio innecesarios

      1. Abre el administrador de tareas con **Win+X** » **Administrador de tareas**.  
        <img src="/assets/img/2013/02/open-task-manager.jpg" alt="open-task-manager"   />
      2. Ve a inicio y desactiva todos los programas que no quieras que se ejecuten al inicio del sistema.

    #### Limpiar el buffer de memoria y archivos temporales innecesarios

      1. Pulsa las teclas **Windows + R**, escribe “**%temp%**” y pulsa enter.  
        <img src="/assets/img/2013/02/run-temppercent.jpg" alt="run-temppercent"   />
      2. Selecciona todos los archivos y bórralos.
      3. De forma similar, repite el paso 1, pero esta vez escribe “**temp**” y borra todos los archivos.
      4. Por último, vuelve a repetir el paso uno, escribiendo “**prefetch**” y borra todos los archívos.

    #### Disminuir los servicios en ejecución

      1. Pulsa **Windows + R**, teclea “**msconfig**” y pulsa enter.
      2. Oculta los servicios de Microsoft y deshabilita los que creas convenientes.  
        <img src="/assets/img/2013/02/stop-services.jpg" alt="stop-services"   />

    #### Modifica el registro del sistema

      1. Pulsa **Windows + R**, teclea “**regedit**” y pulsa enter.
      2. Dirígiete hacia ***HKEY\_CURRENT\_USER\Control Panel\Mouse***. Haz doble click en **MouseHoverTime** y cambia el valor a 100.  
        <img src="/assets/img/2013/02/edit-mousehovertime.jpg" alt="edit-mousehovertime"   />  
        <img src="/assets/img/2013/02/edit-value.jpg" alt="edit-value"   /></li>

      3. Dirígete ahora a ***HKEY\_LOCAL\_MACHINE\SYSTEM\Current Control Set\Control***. Doble click en **WaitToKillServiceTimeout** y cambia el valor a 1000.  
        <img src="/assets/img/2013/02/edit-value-wait.jpg" alt="edit-value-wait"   />

    Estos cambios deberías ser suficientes para notar una mejoría en el rendimiento del sistema. Puedes encontrar más información en las referencias,.

    #### Referencias

    *How to speed up Windows 8 PC?* »» <a href="http://mywindows8.org/speed-up-windows-8/" target="_blank">Visitar sitio</a>  
    *Fix Windows 8 Restart and Shutdown Problems by Disabling “Hybrid Shutdown” Feature* »» <a href="http://www.askvg.com/fix-windows-8-restart-and-shutdown-problems-by-disabling-hybrid-shutdown-feature/" target="_blank">Visitar sitio</a>  
    *Imagen: kotaku* »» <a href="http://kotaku.com/5897763/three-killer-problems-that-threaten-windows-8" target="_blank">Visitar sitio</a>



{% include _toc.html %}

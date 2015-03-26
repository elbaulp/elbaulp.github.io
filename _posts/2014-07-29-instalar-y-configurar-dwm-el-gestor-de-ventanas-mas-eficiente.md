---
id: 2403
title: Instalar y configurar DWM, el gestor de ventanas más eficiente

layout: post
guid: http://elbauldelprogramador.com/?p=2403
permalink: /instalar-y-configurar-dwm-el-gestor-de-ventanas-mas-eficiente/
categories:
  - aplicaciones
  - C
  - linux
tags:
  - dwm
  - dynamic window manager
  - En este artículo veremos cómo instalar y configurar DWM
  - que es dwm
  - statuscolor dwm 6.1
  - tiling desktop
---
Hace tiempo que hablé de [Xmonad][1], y hasta hace poco ha sido mi gestor de ventanas, durante varios años. Pero semanas atrás descubrí el proyecto original en el que se basaba xmonad, DWM. Xmonad es un clon de DWM escrito en <a href="http://www.haskell.org/haskellwiki/Haskell" title="Web de Haskell" target="_blank">Haskell</a>, lo cual lo hace un poco más pesado y lento debido a las dependencias que tiene y la necesidad de instalar su compilador. Tras probar DWM, no puedo estar más contento con el resultado, está escrito en C, y todas las modificaciones en la configuración se hacen sobre el propio código, lo cual lo hace muy eficiente y rápido. En este artículo veremos cómo instalar y configurar DWM.

<!--more-->

## Qué es DWM

DWM es un gestor de ventanas dinámico que permite organizar las ventanas de varias formas (*tiled, monocle y floating*). Cada ventana se asigna a una etiqueta, esto podría considerarse como escritorios en otros gestores de ventanas. Por defecto hay 9 etiquetas.

## Cómo instalar DWM

La mejor forma es clonar el repositorio [git][2]:

{% highlight bash %}$ git clone http://git.suckless.org/dwm
{% endhighlight %}

Una vez clonado y dentro del directorio, compilamos e instalamos:

{% highlight bash %}$ sudo make clean install
{% endhighlight %}

Ya está listo para usar, pero hay que hacer una última cosa para poder ejecutarlo tras introducir nuestro usuario y contraseña del ordenador. Si usas Ubuntu o Debian, probablemente **lightdm** sea el gestor de login. De ser así, añadiremos una entrada a la lista de sesiones de **lightdm** para poder acceder a DWM. Para ello creamos el fichero *dwm-personalized.desktop* y lo copiamos a `/usr/share/xsessions/`

{% highlight bash %}[Desktop Entry]
Encoding=UTF-8
Name=Dwm-personalized
Comment=Dynamic window manager
Exec=dwm-personalized
Icon=dwm.png
Type=XSession
{% endhighlight %}

En éste archivo estamos definiendo la información necesaria para que **lightdm** sea capaz de ejecutar DWM cuando entremos en el pc. `Exec=dwm-personalized` indica qué script debe ejecutarse, pero aún no lo hemos creado. Éste archivo debe contener todos los programas que queramos iniciar y, en la última línea, se debe ejecutar DWM. Mi script es así:

{% highlight bash %}#!/bin/bash

# setting keuboard layout /usr/share/X11/xkb/rules/base.lst
setxkbmap us intl

xset +fp /usr/share/fonts/local
xset fp rehash

nm-applet &
insync start &
transmission-gtk &
.dropbox-dist/dropboxd &
parcellite &
xfce4-volumed &

#Set status bar & start DWM
dwmstatus &

exec dwm
{% endhighlight %}

Creado el script, hay que darle permisos de ejecución y copiarlo a `/usr/bin`

{% highlight bash %}$ chmo +x dwm-personalized
$ sudo cp dwm-personalized /usr/bin
{% endhighlight %}

## Primera ejecución

Ejecutados los pasos anteriores, ahora basta con salir de la sesión actual y entrar con DWM. Algunas cosas que probablemente sean adecuadas cambiar antes de ejecutar dwm es qué terminal usar. Para ello hay que modificar la variable `termcmd` en `config.def.h`, que por defecto es:

{% highlight c %}static const char *termcmd[]  = { "st", NULL };
{% endhighlight %}

Por el terminal preferido de cada uno, el mio por ejemplo es **Terminator**:

{% highlight c %}static const char *termcmd[]  = { "terminator", NULL };
{% endhighlight %}

Recompilamos y listo.

### Instalar Dmenu

Un programa muy útil es dmenu, permite lanzar cualquier programa abriendo una ventanita en la que podemos escribir el nombre del programa a ejecutar:

<img src="/images/2014/07/dmenu.png" alt="Dmenu" width="478" height="13" class="alignleft size-full wp-image-2405" />

Para instalarlo:

{% highlight bash %}$ sudo apt-get install suckless-tools
{% endhighlight %}

Debemos modificar una línea en `config.def.h` ya que parece ser que la versión que instala Ubuntu no concuerda con la que supone dwm y hay un parámetro que no existe. Para ello eliminamos `, "-m", dmenumon` de ésta línea:

{% highlight c %}static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
{% endhighlight %}

Quedando así:

{% highlight c %}static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
{% endhighlight %}

## Probando DWM

Ahora que está todo al entrar podremos ejecutar un terminal pulsando ALT+Shift+Enter, ejecutar **dmenu** pulsando ALT+p etc. Los atajos de teclado se definen en el array `static Key keys[]`.

## Cambiar la tecla ALT por la de Windows

Para los usuarios de Linux, la tecla de Windows no se usa prácticamente para nada, lo cual viene muy bien para este tipo de programas, y así de paso evitamos interferir con cualquier otro atajo que haya definido otro programa. Para cambiar el modificador ALT por la tecla de Windows basta con cambiar 

{% highlight c %}#define MODKEY Mod1Mask
{% endhighlight %}

por 

{% highlight c %}#define MODKEY Mod4Mask
{% endhighlight %}

en el fichero `config.def.h`

## Aplicar parches

Existen multitud de modificaciones hechas por los usuarios de DWM para añadirle funcionalidad. Pueden encontrarse en <a href="https://github.com/jceb/dwm-clean-patches" title="Clean patches" target="_blank">este repositorio</a> de [github][3].

## Comentarios finales

Espero que esta pequeña introducción haya servido al lector. Desde que entré en el mundo de éste tipo de gestores de ventanas no he querido volver a ver a los gestores clásicos. Una vez te acostumbras a usar el teclado, la velocidad al trabajar en el pc aumenta considerablemente.

Aquí dejo una captura de pantalla de mi escritorio actual. En unos días explicaré cómo desarrollé la posibilidad de colorear la barra de estado (Ya está disponible [aquí][4]), ya que por defecto la versión 6.1 de DWM no lo permite.

[<img src="/images/2014/07/Instalar-y-configurar-DWM-el-gestor-de-ventanas-más-eficiente1.png" alt="Instalar y configurar DWM, el gestor de ventanas más eficiente" width="1280" height="768" class="aligncenter size-full wp-image-2407" />][5]

#### Referencias

*Web Oficial de DWM* **|** <a href="" target="_blank">dwm.suckless.org</a> 



 [1]: http://elbauldelprogramador.com/configurar-xmonad-con-trayer-y-fondo-de-pantalla-aleatorio/ "Configurar xmonad con trayer y fondo de pantalla aleatorio"
 [2]: http://elbauldelprogramador.com/mini-tutorial-y-chuleta-de-comandos-git/ "Git: Mini Tutorial y chuleta de comandos"
 [3]: http://elbauldelprogramador.com/la-generacion-github-por-que-ahora-todos-estamos-en-el-opensource/ "La generación GitHub: Por qué ahora todos estamos en el opensource"
 [4]: http://elbauldelprogramador.com/statuscolor-dwm-6-1/ "Colorear la barra de estado con Simple StatusColor en DWM 6.1"
 [5]: /images/2014/07/Instalar-y-configurar-DWM-el-gestor-de-ventanas-más-eficiente1.png
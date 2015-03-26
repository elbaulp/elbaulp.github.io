---
id: 2234
title: Cómo compilar todos los archivos CPP de una vez usando MakeFile
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2234
permalink: /como-compilar-todos-los-archivos-cpp-de-una-vez-usando-makefile/
categories:
  - C
  - How To
tags:
  - compilar ficheros cpp makefile
  - crear makefile
  - tutorial makefile
---
Los makefile sirven para automatizar el proceso de compilación de un proyecto estableciendo unas reglas que dictan cómo y en qué orden han de crearse los ficheros objetos, librerías y binarios.

La creación de un fichero MakeFile puede llegar a ser compleja conforme va incrementando el tamaño del proyecto. En este artículo vamos a ver cómo se pueden compilar con una sola regla todos los archivos cpp del proyecto.

<!--more-->

Se irá mostrando línea a línea el fichero MakeFile para ir explicándolo y luego se mostrará todo:

<pre lang="make">BIN       = bin
SRC 	  = src
OBJ 	  = obj
CXX 	  = g++
CPPFLAGS  = -Wall -g -ansi
</pre>

Con esto se establecen los nombres de los directorios correspondientes en la carpeta del proyecto. Nota: los directorios deben estar creados previamente.

<pre lang="make">SOURCES = $(wildcard $(SRC)/*.cpp)
OBJS = $(addprefix $(OBJ)/, $(notdir $(SOURCES:.cpp=.o)))
</pre>

Con esto almacenamos en la variable `SOURCES` todos los ficheros cpp que residan en el directorio *src*. En la variable `OBJS` se hacen varias cosas, `$(SOURCES:.cpp=.o)` reemplaza la extensión de los ficheros `.cpp` por `.o`, `$(notdir $(SOURCES:.cpp=.o))` elimina cualquier ruta que existiera para dejar únicamente el nombre del fichero, por ejemplo */src/fichero.cpp* pasaría a ser *fichero.cpp*. Con `$(addprefix $(OBJ)/` añadimos el prefijo indicado, en este caso *obj* al nombre del fichero, siguiendo con el ejemplo anterior, de *fichero.o* obtendríamos *obj/fichero.o*. 

<pre lang="make">target = programa
all: $(BIN)/$(target)

$(BIN)/$(target): $(OBJS)
	@echo Creando $@... con $^
	$(CXX) $(CPPFLAGS) $(OBJS) -o $@
</pre>

Ésta regla define cómo compilar el programa final, para generar dicho programa dependemos de los ficheros objeto guardados en la variable `$(OBJS)`, *$@* contiene el nombre del destino (target), en este caso *bin/programa*.

<pre lang="make">$(OBJ)/%.o: %.cpp
	@echo Creando $@... con $^
	$(CXX) $(CPPFLAGS) -c $&lt; -o $@
</pre>

Con esta regla se crean los ficheros objeto necesarios para la regla anterior. La regla crea objetos a partir de sus correspondientes cpps, de ahí `%.o : %.cpp`.

El makefile completo es el siguiente:

<pre lang="make">BIN       = bin
SRC 	  = src
OBJ 	  = obj
CXX 	  = g++
CPPFLAGS  = -Wall -g -ansi
CFLAGS    = -Wall -O3 -c
SOURCES = $(wildcard *.cpp)
OBJS = $(addprefix $(OBJ)/, $(notdir $(SOURCES:.cpp=.o)))

target = programa

all: $(BIN)/$(target)

$(BIN)/$(target): $(OBJS)
	@echo Creando $@... con $^
	$(CXX) $(CPPFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: %.cpp
	@echo Creando $@... con $^
	$(CXX) $(CPPFLAGS) -c $&lt; -o $@

# ************ Limpieza ************
.PHONY: clean
clean :
	@echo Limpiando archivos intermedios...
	rm $(OBJ)/*
	rm $(SRC)/*.*~
</pre>

La parte de limpieza simplemente elimina los ficheros generados automáticamente en el proceso de compilación.

#### Referencias

*Compile all CPP files using makefile under MinGW* **|** <a href="http://stackoverflow.com/a/13109884/1612432" target="_blank">stackoverflow.com</a>  
*Manual GNU Make* **|** <a href="https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html" target="_blank">gnu.org</a>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo compilar todos los archivos CPP de una vez usando MakeFile+http://elbauldelprogramador.com/como-compilar-todos-los-archivos-cpp-de-una-vez-usando-makefile/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-compilar-todos-los-archivos-cpp-de-una-vez-usando-makefile/&t=Cómo compilar todos los archivos CPP de una vez usando MakeFile+http://elbauldelprogramador.com/como-compilar-todos-los-archivos-cpp-de-una-vez-usando-makefile/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo compilar todos los archivos CPP de una vez usando MakeFile+http://elbauldelprogramador.com/como-compilar-todos-los-archivos-cpp-de-una-vez-usando-makefile/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
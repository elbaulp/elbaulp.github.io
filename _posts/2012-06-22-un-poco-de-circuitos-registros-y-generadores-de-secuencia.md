---
title: Un poco de circuitos, regístros y generadores de secuencia

layout: post
permalink: /un-poco-de-circuitos-registros-y-generadores-de-secuencia/
if_slider_image:
  -
  -
categories:
  - Informatica
tags:
  - biestables
  - circuitos lógicos
  - logic works
  - registros
format: video
main-class: "articulos"
---
Repasando hoy para un examen que tengo próximamente de TOC (Tecnología y Organización de Computadores) se me ha ocurrido grabar algunos de los ejercícios que estaba haciendo por si le son de interés a alguien.

El primero de ellos es un regístro que almacena 4 bits mediante biestables. El funcionamiento es el siguiente:

Dependiendo del valor de las entradas Y1 e Y0 que aparecen en la izquierda, se realizan estas operaciones:

<p style="padding-left: 30px;">
  00: Rotación de los valores hacia la derecha.
</p>

<p style="padding-left: 30px;">
  01: Carga los valores que aparecen arriba síncronamente y en paralelo.
</p>

<p style="padding-left: 30px;">
  10: Rotación de los valores hacia la izquierda.
</p>

<p style="padding-left: 30px;">
  11: No hace nada, mantiene los valores tal y como están.
</p>

Antes de nada decir que es el primer vídeo que edito y no ha salido demasiado bien, pido disculpas.

<span class='embed-youtube' style='text-align:center; display: block;'></span>

El otro es un generador que secuencia cíclicamente la salida 3, 6, 7.

<span class='embed-youtube' style='text-align:center; display: block;'></span>



{% include _toc.html %}

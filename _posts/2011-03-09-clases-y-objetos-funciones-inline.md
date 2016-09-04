---
title: 'Clases y Objetos &#8211; Funciones inline'
layout: post.amp
modified: 2016-09-04T12:00
permalink: /clases-y-objetos-funciones-inline/
categories:
  - C
main-class: "dev"
color: "#E64A19"
---

Podemos declarar y definir funciones dentro de la clase, para no tener que definirla a parte en su respectivo archivo .cpp: a estas funciones se las denomina inline.

<!--ad-->

```cpp
class Punto.{
  //...
public:
  //...
  int gety () {return y;}
};
```

Para que una función definida fuera de la clase sea inline es necesario especificarlo con esta palabra reservada. Las funciones inline hacen una sustitución del código, igual que las macros #define en C, pero con la ventaja de la depuración y la comprobación de los tipos de datos. Corno regla general, se definirá una función dentro de la clase, si consta de un pequeño número de sentencias.


## Siguiente tema: [Clases y Objetos &#8211; Punteros a objetos][1]

 [1]: /clases-y-objetos-punteros-objetos/

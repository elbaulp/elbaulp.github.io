---
id: 2376
title: Pasar parámetros variables en C/C++

layout: post
guid: https://elbauldelprogramador.com/?p=2376
permalink: /parametros-variables-en-cc/
categories:
  - C
tags:
  - parametros indefinidos
  - parámetros variables en C/c++
  - pasar paramestros
image:
  thumb: 2013/11/cpp.png
modified: 2015-12-24T17:44
excerpt: |
  <figure>
    <a href="/images/2013/11/cpp.png"><img src="/images/2013/11/cpp.png" title="Pasar parámetros variables en C/C++" alt="Pasar parámetros variables en C/C++" /></a>
  </figure>

  En ocasiones, es necesario tener una función a la que podamos pasar un número de parámetros variables. En el artículo de hoy veremos cómo hacerlo en C/C++.
---

<figure>
  <a href="/images/2013/11/cpp.png"><img src="/images/2013/11/cpp.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
</figure>

En ocasiones, es necesario tener una función a la que podamos pasar un número de parámetros variables. En el artículo de hoy veremos cómo hacerlo en C/C++.

<!--ad-->

Para ello, usaremos la macro `va_start`, encargada de inicializar una lista de argumentos variables. Su prototipo es:

```cpp
void va_start (va_list ap, paramN);

```

Inicializa `ap` para recuperar argumentos adicionales después del parámetro `paramN`. Una función que invoque a `va_start` debe invocar también a `va_end` antes de finalizar. Pasemos a dar una descripción más detallada de los parámetros:

`ap`
:   Objeto sin inicializar del tipo `va_list`. Después de la llamada, almacena la información necesaria para recuperar argumentos adicionales usando `va_arg`. Si `ap` ya ha sido pasado como primer argumento a una llamada previa a `va_start` o `va_copy`, debe ser pasado a `va_end` antes de llamar a la función.

`paramN`
:   Nombre del último parámetro con nombre en la definición de la función. Los argumentos extraídos por las llamadas posteriores a `va_arg` son aquellos tras `paramN`.

## Primer ejemplo de parámetros variables

```cpp
/* va_start example */
#include <stdio.h>      /* printf */
#include <stdarg.h>     /* va_list, va_start, va_arg, va_end */

void PrintFloats (int n, ...)
{
  int i;
  double val;
  printf ("Printing floats:");
  va_list vl;
  va_start(vl,n);
  for (i=0;i<n;i++)
  {
    val=va_arg(vl,double);
    printf (" [%.2f]",val);
  }
  va_end(vl);
  printf ("\n");
}

int main ()
{
  PrintFloats (3,3.14159,2.71828,1.41421);
  return 0;
}

```

La función `PrintFloats` tiene como parámetro el número de argumentos adicionales (`n`), que son leídos y mostrados secuencialmente.

## Segundo ejemplo

Éste ejemplo está sacado de la función que usa [DWM Status][1] para imprimir el estado (`smprintf`):

```c
char *
smprintf(char *fmt, ...) {
  va_list fmtargs;
  char *ret;
  int len;

  va_start(fmtargs, fmt);
  len = vsnprintf(NULL, 0, fmt, fmtargs);
  va_end(fmtargs);

  ret = malloc(++len);
  if (ret == NULL) {
    perror("malloc");
    exit(1);
  }

  va_start(fmtargs, fmt);
  vsnprintf(ret, len, fmt, fmtargs);
  va_end(fmtargs);

  return ret;
}

```

La función toma como primer parámetro una cadena de texto a ser formateada, al estilo de `printf`. Los argumentos adicionales son los valores correspondientes a cada cadena de formateo. Por ejemplo:

```cpp
smprintf("%dK", rx_rate);

```

Al igual que en el ejemplo anterior, en `fmtargs` se recibirán los parámetros adicionales. Con `vsnprintf` se calcula el tamaño de la cadena de texto formateada, es decir, con los valores substituidos. Finalmente, se vuelve a inicializar la lista de argumentos variables, para luego llamar de nuevo a `vsnprintf`, pero ésta vez almacenando el resultado de la cadena formateada en `ret`.

## Tercer ejemplo

Éste ejemplo es de una práctica de Inteligencia Artificial de la facultad en la que teníamos que implementar la poda **Alpha-beta** en el 4 en raya:

```cpp
int checkLine(int jug, int n, ...) {

  va_list vl;
  va_start(vl, n);
  int vals[n];

  for (int i = 0; i < n; i++) {
    vals[i] = va_arg(vl, int);
  }

  int score = 0;
  // Calcular puntuación de la jugada.
  return score;
}

```

```cpp
/**
  * Valorar cada jugada
 **/
double Valoracion(const Environment &state, int jugador) {
  int score = 0;

// Eval horizontal
  for (int i = 0; i < 7; ++i) {
    score += checkLine(jugador, 7, state.See_Casilla(0, i),
                       state.See_Casilla(1, i), state.See_Casilla(2, i),
                       state.See_Casilla(3, i), state.See_Casilla(4, i),
                       state.See_Casilla(5, i), state.See_Casilla(6, i));
  }
// Eval vertical
  for (int i = 0; i < 7; i++) {
    score += checkLine(jugador, 7, state.See_Casilla(i, 0),
                       state.See_Casilla(i, 1), state.See_Casilla(i, 2),
                       state.See_Casilla(i, 3), state.See_Casilla(i, 4),
                       state.See_Casilla(i, 5), state.See_Casilla(i, 6));
  }

  //Eval Diagonal
  score += checkLine(jugador, 4, state.See_Casilla(0, 3),
                     state.See_Casilla(1, 4), state.See_Casilla(2, 5),
                     state.See_Casilla(3, 6));
  score += checkLine(jugador, 5, state.See_Casilla(0, 2),
                     state.See_Casilla(1, 3), state.See_Casilla(2, 4),
                     state.See_Casilla(3, 5), state.See_Casilla(4, 6));
  score += checkLine(jugador, 6, state.See_Casilla(0, 1),
                     state.See_Casilla(1, 2), state.See_Casilla(2, 3),
                     state.See_Casilla(3, 4), state.See_Casilla(4, 5),
                     state.See_Casilla(5, 6));
  score += checkLine(jugador, 7, state.See_Casilla(0, 0),
                     state.See_Casilla(1, 1), state.See_Casilla(2, 2),
                     state.See_Casilla(3, 3), state.See_Casilla(4, 4),
                     state.See_Casilla(5, 5), state.See_Casilla(6, 6));
  score += checkLine(jugador, 6, state.See_Casilla(1, 0),
                     state.See_Casilla(2, 1), state.See_Casilla(3, 2),
                     state.See_Casilla(4, 3), state.See_Casilla(5, 4),
                     state.See_Casilla(6, 5));
  score += checkLine(jugador, 5, state.See_Casilla(2, 0),
                     state.See_Casilla(3, 1), state.See_Casilla(4, 2),
                     state.See_Casilla(5, 3), state.See_Casilla(6, 4));
  score += checkLine(jugador, 4, state.See_Casilla(3, 0),
                     state.See_Casilla(4, 1), state.See_Casilla(5, 2),
                     state.See_Casilla(6, 3));

  //Eval Diagonal 2
  score += checkLine(jugador, 4, state.See_Casilla(3, 0),
                     state.See_Casilla(2, 1), state.See_Casilla(1, 2),
                     state.See_Casilla(0, 3));
  score += checkLine(jugador, 5, state.See_Casilla(4, 0),
                     state.See_Casilla(3, 1), state.See_Casilla(2, 2),
                     state.See_Casilla(1, 3), state.See_Casilla(0, 4));
  score += checkLine(jugador, 6, state.See_Casilla(5, 0),
                     state.See_Casilla(4, 1), state.See_Casilla(3, 2),
                     state.See_Casilla(2, 3), state.See_Casilla(1, 4),
                     state.See_Casilla(0, 5));
  score += checkLine(jugador, 7, state.See_Casilla(6, 0),
                     state.See_Casilla(5, 1), state.See_Casilla(4, 2),
                     state.See_Casilla(3, 3), state.See_Casilla(2, 4),
                     state.See_Casilla(1, 5), state.See_Casilla(0, 6));
  score += checkLine(jugador, 6, state.See_Casilla(6, 1),
                     state.See_Casilla(5, 2), state.See_Casilla(4, 3),
                     state.See_Casilla(3, 4), state.See_Casilla(2, 5),
                     state.See_Casilla(1, 6));
  score += checkLine(jugador, 5, state.See_Casilla(6, 2),
                     state.See_Casilla(5, 3), state.See_Casilla(4, 4),
                     state.See_Casilla(3, 5), state.See_Casilla(2, 6));
  score += checkLine(jugador, 4, state.See_Casilla(6, 3),
                     state.See_Casilla(5, 4), state.See_Casilla(4, 5),
                     state.See_Casilla(3, 6));

//  cout << "score " << score << endl;

  return score;
}

```

En éste caso, queremos llamar a `checkLine` con un número indeterminado de parámetros. Como se puede apreciar en la función `Valoracion`, la cual llama a `checkLine` con el jugador actual, el número de casillas a comprobar y, a continuación, las casillas a comprobar.

Espero que estos tres ejemplos sencillos hayan servido para comprender el funcionamiento del uso de parámetros variables en C/C++.

#### Referencias

*Documentación va_start* »» <a href="http://www.cplusplus.com/reference/cstdarg/va_start/" target="_blank">cplusplus.com</a>



 [1]: https://elbauldelprogramador.com/statuscolor-dwm-6-1/ "Dwm Status"

{% include _toc.html %}

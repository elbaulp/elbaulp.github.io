---
layout: post
title: Un Conversor De Markdown a LaTeX Casero en Lex
date: 2016-05-09T13:20:10+02:00
modified:
categories:
description: "Hace tiempo, para la asignatura “Modelos de Computación” desarrollé un conversor de MarkDown a LaTeX usando flex. Básicamente con flex se van reconociendo partes del documento MarkDown mediante expresiones regulares y se traduce a su comando homólogo en LaTeX."
tags: [MarkDown, conversor latex markdown, lex, tutorial lex]
main-class: 'dev'
---

Hace tiempo, para la asignatura “Modelos de Computación” desarrollé un conversor de __MarkDown__  a __LaTeX__ usando __flex__, muy sencillo, pensado para facilitarme un poco la vida a la hora de escribir en el blog y pasar a LaTeX. Básicamente con __flex__ se van reconociendo partes del documento __MarkDown__ mediante expresiones regulares y se traduce a su comando homólogo en __LaTeX__.

Por supuesto, más tarde descubrí __pandoc__, y es el programa que uso para todo tipo de conversiones entre formatos :-).

<!--ad-->

## Compilación

Para compilar el fichero simplemente es necesario el siguiente comando:

```bash
lex markdown2Latex.l && gcc -Wall lex.yy.c -o markdown2Latex -ll
```

## Uso

y para ejecutarlo basta con

```bash
./markdown2Latex fichero.md
```

## Código

El código está bastante bien comentado, podéis ir leyendo y comprendiendo el funcionamiento.

<script src="https://gist.github.com/algui91/c285d73fc0fb113d3ea83dae29fd45a3.js"></script>

#### Referencias

Repositorio en GitHub \| [Markdown2LatexConversor](https://github.com/algui91/Markdown2LatexConversor "Markdown2LatexConversor")

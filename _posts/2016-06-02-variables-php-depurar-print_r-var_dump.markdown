---
layout: post
title: Cómo Mostrar Información De Variables PHP Depurando
modified:
categories:
description: "Desarrollando una página en PHP para una asignatura de la facultad estuve buscando formas de ver el contenido de las Variables en una página php. En concreto quería mostrar todas las variables definidas, pero podríamos mostrar cualquier variable. El comando en cuestión es"
tags: [depurar en php, mostrar variables depurando php, mostrar variables legibles en php, mostrar variables legibles para humanos php depurar, var_dump en php, print_r php no bonito]
date: 2016-06-02T16:52:24+02:00
image: como-mostrar-variables-php-depurar-print_r-var_dump.png
main-class: 'dev'
categories:
---

<figure>
  <a href="/assets/img/como-mostrar-variables-php-depurar-print_r-var_dump.png"><img src="/assets/img/como-mostrar-variables-php-depurar-print_r-var_dump.png" title="{{ page.title }}" alt="{{ page.title }}" /></a>
</figure>

> El siguiente artículo es una traducción de una pregunta en **StackOverflow** del usuario Plummer, que preguntaba <a href="http://stackoverflow.com/questions/19816438/make-var-dump-look-pretty" target="_blank" title="Make var_dump look pretty">Make var_dump look pretty</a>. La respuesta es del usuario AbraCadaver

Desarrollando una página en [PHP](/como-crear-shortcodes-en-wordpress/ "Crear Shortcodes en Wordpress") para una asignatura de la facultad estuve buscando formas de ver el contenido de las Variables en una página php. En concreto quería mostrar todas las variables definidas, pero podríamos mostrar cualquier variable. El comando en cuestión es:

```php
highlight_string("<?php\n\$data =\n" . var_export(get_defined_vars(), true) . ";\n?>");
```

<!--ad-->

Podemos crear una función para reutilizar este comando con la variable que queramos, por ejemplo:

```php
function pretty_print($var)
{
    highlight_string("<?php\n\$debug =\n" . var_export($var, true) . ";\n?>");
}
```

El resultado es algo así:

```php
pretty_print($_SESSION);
// Salida
<?php
$debug =
array (
  'logged_user' => 'a',
  'logged_user_id' => '1',
  'is_admin' => true,
);
?>
```

Espero que os sea de utilidad

#### Fuente

Make var_dump look pretty \| <a href="http://stackoverflow.com/a/19816742/1612432" title="Make var_dump look pretty" target="_blank">stackoverlow.com</a>

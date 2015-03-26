---
id: 110
title: 'PL/SQL &#8211; Estructuras básicas de control'

layout: post
guid: http://elbauldelprogramador.org/plsql-estructuras-basicas-de-control/
permalink: /plsql-estructuras-basicas-de-control/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/01/plsql-estructuras-basicas-de-control.html
  - /2011/01/plsql-estructuras-basicas-de-control.html
  - /2011/01/plsql-estructuras-basicas-de-control.html
categories:
  - BaseDeDatos
tags:
  - comandos basicos sql
  - sentencias sql while
---
<div class="icosql">
</div>

Como PL/SQL es un lenguaje 3GL, cuenta con las estructuras típicas de control de flujo: bifurcaciones condicionales y bucles:

## Bifurcaciones condicionales:

&nbsp;

### IF

La sintaxis básica es:

{% highlight sql %}IF condición THEN
  Bloque de instrucciones;
[ELSIF condición THEN
  Bloque de instrucciones;]
...
[ELSE
  Bloque de instrucciones;]
END IF;{% endhighlight %}

  
<!--more-->

  
Como en cualquier lenguaje de programación, &#8220;condición&#8221; es cualquier expresión que de cómo resultado un valor booleano. Hay que saber que las estructuras IF se pueden anidar unas dentro de otras.

#### IF &#8211; THEN

Se evalúa la condición y si resulta **verdadera**, se ejecutan uno o más líneas de código de programa. En el caso de que la condición resulte **falsa o nula**, NO se realiza NINGUNA acción.

{% highlight sql %}IF fecha_nac < '1-01-1970' THEN   <span class="comentario">--No termina con un ;</span>
  Salario := salario *1.15;       <span class="comentario">--aumento de salario en un 15%</span>
END IF;{% endhighlight %}

Se pueden anidar varias instrucciones:

{% highlight sql %}IF fecha_nac < ‘1-01-1970’ THEN
  IF apellido =‘Martínez’ THEN
    salario:= salario *1.15;
  END IF;
END IF;{% endhighlight %}

#### IF &#8211; THEN &#8211; ELSE

Se evalúa la condición y si resulta **verdadera**, se ejecutan uno o más líneas de código de programa. En el caso de que la condición resulte **falsa**, se ejecutan las instrucciones que siguen a la instrucción ELSE. Sólo se permite una instrucción ELSE en cada instrucción IF.

{% highlight sql %}IF fecha_nac <’1-01-1970’ THEN
  salario:= salario *1.15;
ELSE
  salario:= salario* 1.05;
END IF;{% endhighlight %}

#### IF &#8211; THEN &#8211; ELSIF

Se evalúa la condición y si resulta **verdadera**, se ejecutan uno o más líneas de código de programa. En el caso de que la condición resulte ser **falsa**, se evalúa la condición especificada en el ELSIF.

{% highlight sql %}IF condicion THEN
  instrucciones;
ELSE
  IF condicion2 THEN
    instrucciones;
  ELSE
    IF condicion3 THEN
      instrucciones;
    END IF;
  END IF;
END IF;{% endhighlight %}

{% highlight sql %}IF apellido =„Pérez‟ THEN
  salario:= salario *1.10;     <span class="comentario">--aumento de salario en un 10%</span>
ELSIF apellido =‘Martínez’ THEN
  salario:= salario *1.15;     <span class="comentario">--aumento de salario en un 15%</span>
ELSIF apellido=‘Alvarez’ THEN
  salario:= salario *1.20;     <span class="comentario">--aumento de salario en un 20%</span>
ELSE
  salario:= salario* 1.05;     <span class="comentario">--aumento de salario en un 5%</span>
END IF;                        <span class="comentario">--Sólo se necesita un único END IF</span>{% endhighlight %}

#### CASE

La instrucción CASE puede evaluar múltiples expresiones y devolver para cada una de ellas un valor/bloque de instrucciones. El resultado de cada WHEN puede ser un valor o una sentencia, en el primer caso el resultado de una sentencia CASE se puede guardar en una variable.

Su sintaxis:

{% highlight sql %}CASE variable
  WHEN expresión1 THEN valor1/bloque de instrucciones
  WHEN expresión2 THEN valor2/bloque de instrucciones
  WHEN expresión3 THEN valor3/bloque de instrucciones
  WHEN expresión4 THEN valor4/bloque de instrucciones
  ELSE valor5/bloque de instrucciones
END{% endhighlight %}

Ejemplos:

{% highlight sql %}CREATE TABLE C2(
  Nombre  VARCHAR2(20 ),
  EC      VARCHAR2(1)
);

COMMIT;
INSERT INTO C2 ( NOMBRE, EC ) VALUES ('Juan ', 'S');
INSERT INTO C2 ( NOMBRE, EC ) VALUES ('Maria', 'C');
INSERT INTO C2 ( NOMBRE, EC ) VALUES ('Ana', 'D');
INSERT INTO C2 ( NOMBRE, EC ) VALUES ('Luis', 'S');
INSERT INTO C2 ( NOMBRE, EC ) VALUES ('Pepe', NULL);
COMMIT;

SELECT Nombre, CASE EC
                    WHEN 'C' THEN 'Casado/a'
                    WHEN 'S' THEN 'Soltero/a'
                    WHEN 'D' THEN 'Divorciado/a'
                    ELSE 'Otros'
               END
               AS "Estado Civil"
FROM C2;{% endhighlight %}

Otra sintaxis es:

{% highlight sql %}CASE
  WHEN condición1 THEN expresión1/bloque de instrucciones
  WHEN condición2 THEN expresión2/bloque de instrucciones
  WHEN condición3 THEN expresión3/bloque de instrucciones
  WHEN condición4 THEN expresión4/bloque de instrucciones
  ELSE expresión5/bloque de instrucciones
END{% endhighlight %}

En esta sintaxis después del CASE no aparece ninguna variable y cada WHEN tiene su propia condición a evaluar.

#### BUCLES

{% highlight sql %}LOOP
  sentencias;
END LOOP;{% endhighlight %}

Las sentencias de dentro del bucle se ejecutarán durante un número indefinido de vueltas, hasta que aparezca la instrucción EXIT; que finalizará el bucle. Este tipo de bucle se denomina bucle  
incondicional.

{% highlight sql %}LOOP
  Sentencias
  IF (expresion) THEN
    Sentencias
    EXIT;
  END IF;
END LOOP;{% endhighlight %}

Otra opción es incluir la estructura EXIT WHEN condición, se terminará el bucle cuando la condición se cumpla:

{% highlight sql %}LOOP
  Sentencias
  EXIT WHEN condición;
  Sentencias
END LOOP;{% endhighlight %}

Ejemplo:

{% highlight sql %}DECLARE <span class="comentario">-- Declaración y asignación de variables</span>
  total NUMBER(9) := 0;
  counter NUMBER(6) := 0;
BEGIN
  LOOP
    counter := counter + 1; <span class="comentario">-- Incrementamos la variable contador</span>
    total := total + counter * counter; 
    <span class="comentario">-- Salimos del bucle cuando la condición de cumpla</span>
    EXIT WHEN total &gt; 25000;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Counter: ' || TO_CHAR(counter) || ' Total: ' || TO_CHAR(total));
END;{% endhighlight %}

Un tipo de bucle más común son los bucles condicionales:

{% highlight sql %}WHILE condicion LOOP
  Sentencias
END LOOP;{% endhighlight %}

Ejemplo:

{% highlight sql %}DECLARE
  i       NUMBER := 1;
  i_cubed NUMBER;
BEGIN
  WHILE i <= 10 LOOP
    i_cubed := i**3;
    DBMS_OUTPUT.PUT_LINE('Number: ' || TO_CHAR(i) || ' Cube: ' || TO_CHAR(i_cubed));
    i := i + 1;
  END LOOP;
END;{% endhighlight %}

En los bucles WHILE también se pueden utilizar las órdenes EXIT o EXIT WHEN para salirnos sin esperar a que la condición devuelva un valor falso.

Y por último el bucle FOR:

{% highlight sql %}FOR contador IN [REVERSE] limite_inferior..limite_superior LOOP
  sentencias
END LOOP;{% endhighlight %}

Contador deberá ser una variable de tipo numérico que sea capaz de contener los valores comprendidos entre limite\_inferior y limite\_superior, los cuales deberán ser expresiones numéricas, ya sean constantes (1,10&#8230;) o funciones (ROUND(max,0), ASCII(‘A’)&#8230;) .

Si la variable contador no está definida, PL/SQL definirá una variable de tipo INTEGER al iniciar el bucle, y la liberará al finalizar el bucle.

{% highlight sql %}SET SERVEROUTPUT ON;
BEGIN
  FOR loop_counter IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Number: ' || TO_CHAR(loop_counter) || ' Square: ' || TO_CHAR(loop_counter**2));
    END LOOP;
END;{% endhighlight %}

En el caso de especificar REVERSE el bucle se recorre en sentido inverso.

* * *

#### Siguiente tema: [PL/SQL &#8211; Excepciones][1] {.referencia}



 [1]: http://elbauldelprogramador.com/plsql-excepciones/

{% include _toc.html %}

---
id: 62
title: Componentes del lenguaje SQL

layout: post
guid: http://elbauldelprogramador.org/componentes-del-lenguaje-sql/
permalink: /componentes-del-lenguaje-sql-sql/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  


categories:
  - BaseDeDatos
main-class: dev
---
<div class="icosql">
</div>

### Tipos de Datos

SQL admite una variada gama de tipos de datos para la información almacenada en las tablas, los tipos de datos pueden ser numéricos, alfanuméricos, de fecha o booleanos. Segun el gestor de base de datos que usemos, los tipos de datos varían. En la actualidad casi todos los gestores soportan un nuevo tipo de dato. BLOB, usado para almacenar archivos, imagenes etc.


<!--ad-->

En la siguiente tabla se muestran los tipos de datos.

<table class="tabla">
  <tr align="center">
    <th>
      Numérico
    </th>

    <th>
      Alfanumérico
    </th>

    <th>
      Fecha
    </th>

    <th>
      Lógico
    </th>

    <th>
      BLOB
    </th>
  </tr>

  <tr>
    <td>
      Integer
    </td>

    <td>
      char(n)
    </td>

    <td>
      Date
    </td>

    <td>
      Bit
    </td>

    <td>
      Image
    </td>
  </tr>

  <tr>
    <td>
      Numeric(n,m)
    </td>

    <td>
      varchar(n,m)
    </td>

    <td>
      DateTime
    </td>

    <td>
    </td>

    <td>
      Text
    </td>
  </tr>

  <tr>
    <td>
      Decimal
    </td>

    <td>
    </td>

    <td>
    </td>

    <td>
    </td>

    <td>
    </td>
  </tr>

  <tr>
    <td>
      Float
    </td>

    <td>
    </td>

    <td>
    </td>

    <td>
    </td>

    <td>
    </td>
  </tr>
</table>

Más detalladamente tenemos:

<table class="tabla">
  <tr>
    <th colspan="3" align="center">
      Tipos de datos numéricos
    </th>
  </tr>

  <tr>
    <th>
      Tipo
    </th>

    <th>
      Definición
    </th>

    <th>
      Bytes
    </th>
  </tr>

  <tr>
    <td>
      Integer
    </td>

    <td>
      Valores enteros con signo.
    </td>

    <td>
      4
    </td>
  </tr>

  <tr>
    <td>
      Numeric(n,m)
    </td>

    <td>
      Números reales de hasta 18 dígitos (con decimales), donde n representa el total de dígitos admitidos (normalmente denominado precisión) y m el número de posiciones decimales (escala).
    </td>

    <td>
      5-17
    </td>
  </tr>

  <tr>
    <td>
      Decimal(n,m)
    </td>

    <td>
      Igual que el tipo numeric.
    </td>

    <td>
      5-17
    </td>
  </tr>

  <tr>
    <td>
      Float
    </td>

    <td>
      Número de coma flotante, este tipo de datos se suele utilizar para los valores en notación cientifica.
    </td>

    <td>
      4-8
    </td>
  </tr>

  <tr>
    <th colspan="3" align="center">
      Tipos de Datos alfanuméricos
    </th>
  </tr>

  <tr>
    <td>
      char(n)
    </td>

    <td>
      Almacena de 1 a 255 caracteres alfanuméricos. Este valor viene dado por n, y es el tamaño utilizado en disco para almacenar dato. Es decir si defino un campo como char(255), el tamaño real del campo será de 255, aunque el valor solo contenga 100.
    </td>

    <td>
      0-255
    </td>
  </tr>

  <tr>
    <td>
      varchar(n)
    </td>

    <td>
      Igual que el tipo char, con la salvedad que varchar almacena únicamente los bytes que contenga el valor del campo.
    </td>

    <td>
      0-255
    </td>
  </tr>

  <tr>
    <th colspan="3" align="center">
      Tipos de datos fecha
    </th>
  </tr>

  <tr>
    <td>
      Date
    </td>

    <td>
      Almacena fechas, con dias, mes y año.
    </td>

    <td>
      8
    </td>
  </tr>

  <tr>
    <td>
      Datetime
    </td>

    <td>
      Almacena la fecha y la hora.
    </td>

    <td>
      4
    </td>
  </tr>

  <tr>
    <th colspan="3" align="center">
      Tipos de datos lógicos
    </th>
  </tr>

  <tr>
    <td>
      Bit
    </td>

    <td>
      Almacena 0 o no cero, según la base de datos serán 1 o -1. 0 es falso y 1 verdadero.
    </td>

    <td>
      1 bit
    </td>
  </tr>

  <tr>
    <th colspan="3" align="center">
      Tipos de datos BLOB
    </th>
  </tr>

  <tr>
    <td>
      image
    </td>

    <td>
      Almacena imágenes en formato binario, hasta 2Gb
    </td>

    <td>
      0-2Gb
    </td>
  </tr>

  <tr>
    <td>
      Text
    </td>

    <td>
      Almacena texto en formato binario, hasta 2Gb
    </td>

    <td>
      0-2Gb
    </td>
  </tr>
</table>

Nota: El tama&ntilde;o del campo varía en función de cada base de datos, 255 es el valor estándar. Realmente el tama&ntilde;o viene delimitado por el tama&ntilde;o de las páginas de datos, para SQL server el límite está en 8000 bytes (8000 carácteres), siempre que el tama&ntilde;o de página sea de 8Kb

### Tipos de datos en ORACLE

<ul style="list-style:none;">
  <li>
    <strong>NUMBER</strong>(Numérico): Almacena números enteros o de punto flotante, virtualmente de cualquier longitud, aunque se puede especificar la precisión y la escala. ```bash
<span style="color:#a70d0d">-- NUMBER [(precisión, escala)]</span>
saldo <b>NUMBER(16,2);</b>
<span style="color:#a70d0d">/*Indica que puede almacenar un valor numérico de 16 dígitos, 2 de ellas decimales. Es decir, 14 enteros y dos decimales o 16 enteros */</span>

```

    <p>
      La precisión indica el número de dígitos (contanto los decimales) que contendrá el número como máximo. La escala indica el máximo de dígitos decimales. Si declaramos un NUMBER(10,5), podrá contener como máximo cualquier número siempre y cuando el número de dígitos enteros más el número de dígitos decimales no supere 10 (y no 15).
    </p>

    <p>
      Se puede especificar una escala negativa para redondear el número a las posiciones indicadas en la escala. Por ejemplo, NUMBER(5,-2) redondea a las centenas, por lo que si introducimos 1355, se almacenará 1400.
    </p>
  </li>

  <li>
    <strong>VARCHAR2</strong> (Carácter de longitud variable): Almacena datos de tipo carácter empleando sólo la cantidad necesaria aún cuando la longitud máxima sea mayor. ```bash
<span style="color:#a70d0d">‐‐ VARCHAR2 (longitud_maxima)</span>
nombre <b>VARCHAR2(20);</b>
<span style="color:#a70d0d">/* Indica que puede almacenar valores alfanuméricos de hasta 20 posiciones */ </span>
<span style="color:#a70d0d">/* Cuando la longitud de los datos sea menor de 20 no se rellena con blancos */</span>

```
  </li>

  <li>
    <strong>CHAR</strong> (Caracter): Almacena datos de tipo carácter con una longitud máxima de 32767 y cuyo valor de longitud por defecto es 1. ```bash
<span style="color:#a70d0d">‐‐ CHAR [(longitud_maxima)] </span>
nombre <b>CHAR(20); </b>
<span style="color:#a70d0d">/* Indica que puede almacenar valores alfanuméricos de 20 posiciones*/</span>

```
  </li>

  <li>
    <strong>BOOLEAN</strong> (lógico): Se emplea para almacenar valores TRUE o FALSE. ```bash
hay_error <b>BOOLEAN;</b>

```
  </li>

  <li>
    <strong>DATE</strong> (Fecha): Internamente se almacenan como números, se pueden realizar operaciones aritméticas con ellas. En oracle se almacenan con el formato: Siglo / año / mes / día / hora / minuto / segundo. Pero su formato por defecto es &#8216;SS-MM-YYYY&#8217;.
  </li>
  <li>
    <strong>

    <p>
      Tipos de datos binarios
    </p>

    <p>
      </strong> Almacenan información tal y como se encuentra en el disco duro o memoria. Se usan para almacenar grandes cantidades de datos (4Gb max.), cualquier tipo de fichero (ejecutables, sonidos, fotos ect) o para transportar datos de una base de datos a otra. En oracle hay dos tipos, CLOB y NLOB. </li>

      <li>
        <strong>

        <p>
          Atributos de Tipo
        </p>

        <p>
          </strong> Un atributo de tipo en PL/SQL permiter obtener información de un objeto de la base de datos. %TYPE permite conocer el tipo de una variable, constante o campo. %ROWTYPE obtiene los tipos de todos los campos de una tabla, vista o cursor.

          ```bash
<b>DECLARE</b>
<span style="color:#a70d0d">‐‐ declare record variable that represents a row fetched from the employees table </span>
  emp_rec employees%ROWTYPE; <span style="color:#a70d0d">‐‐ declare variable with %ROWTYPE attribute </span>
<b>BEGIN</b>
  SELECT * INTO emp_rec FROM EMPLOYEES WHERE employee_id = 120; ‐‐ retrieve record
  DBMS_OUTPUT.PUT_LINE('Employee name: ' || emp_rec.first_name || ' ' || emp_rec.last_name);
<b>END; </b>

```</li>

          <li>
            <strong>

            <p>
              Registros
            </p>

            <p>
              </strong>

              <p>
                Un registro es una estructura de datos en PL/SQL, almacenados en campos, cada uno de los cuales tiene su propio nombre y tipo y que se tratan como una sola unidad lógica. Los campos de un registro pueden ser inicializados y pueden ser definidos como NOT NULL. Aquellos campos que no sean inicializados explícitamente, se inicializarán a NULL.
              </p>

              <p>
                La sintaxis general es la siguiente:
              </p>

              ```bash
<b>TYPE</b> <nombre> <b>IS RECORD</b>
(
  campo <tipo_datos> [NULL | NOT NULL]
  [,<tipo_datos>...]
);

```

              <p>
                Los registros son un tipo de datos, se pueden declarar variables de dicho tipo de datos. (Son como los struct en C++)

                ```bash
<b>DECLARE </b>
  <b>TYPE</b> PAIS <b>IS RECORD</b>
  (
    CO_PAIS <b>NUMBER</b>,
    DESCRIPCION <b>VARCHAR2(50)</b>,
    CONTINENTE <b>VARCHAR2(20)</b>
  );

<span style="color:#a70d0d">/* Declara una variable miPAIS de tipo PAIS. Esto significa que la variable miPAIS tendrá los campos ID, DESCRIPCION y CONTINENTE. */</span>
  miPAIS PAIS;
<b>BEGIN </b>
  <span style="color:#a70d0d">/* Asignamos valores a los campos de la variable.*/ </span>
  miPAIS.CO_PAIS := 27;
  miPAIS.DESCRIPCION := 'ITALIA';
  miPAIS.CONTINENTE := 'EUROPA';
<b>END; </b>

```

                <p>
                  Los registros pueden estar anidados. Es decir, un campo de un registro puede ser de un tipo de dato de otro registro. Pueden asignarse todos los campos de un registro utilizando una sentencia SELECT.

                  ```bash
SELECT CO_PAIS, DESCRIPCION, CONTINENTE INTO miPAIS FROM PAISES WHERE CO_PAIS = 27;

```</li>

                  <li>
                    <strong>

                    <p>
                      Colecciones o Tablas de PL/SQL
                    </p>

                    <p>
                      </strong>

                      <p>
                        Permite almacenar varios valores del mismo tipo de datos.
                      </p>

                      <p>
                        Una tabla PL/SQL:

                        <ol>
                          <li>
                            Es similar a un array
                          </li>
                          <li>
                            Tiene dos componentes: Un índice de tipo BINARY_INTEGER que permite acceder a los elementos en la tabla PL/SQL y una columna de escalares o registros que contiene los valores de la tabla PL/SQL
                          </li>
                          <li>
                            Puede incrementar su tamaño dinámicamente.
                          </li>
                        </ol>

                        <p>
                        </p>

                        <p>
                          La sintaxis general es la siguiente:
                        </p>

                        ```bash
<b>TYPE</b> <nombre_tipo_tabla> <b>IS TABLE OF</b>
<tipo_datos> [NOT NULL]
<b>INDEX BY BINARY_INTEGER</b>;

```

                        <p>
                          Una vez definido el tipo, podemos declarar variables y asignarles valores.
                        </p>

                        ```bash
<b>DECLARE</b>
  /* Definimos el tipo PAISES como tabla PL/SQL */
  <b>TYPE</b> PAISES <b>IS TABLE OF</b> NUMBER <b>INDEX BY BINARY_INTEGER</b>;
  /* Declaramos una variable del tipo PAISES */
  tPAISES PAISES;
<b>BEGIN</b>
  tPAISES(1) := 1;
  tPAISES(2) := 2;
  tPAISES(3) := 3;
<b>END;</b>

```</li> </ul>

                        <h3>
                          Funciones para el manejo de tablas PL/SQL
                        </h3>

                        <p>
                          Cuando trabajamos con tablas de PL/SQL podemos utilizar las siguientes funciones:
                        </p>

                        <ol style="list-style:none;">
                          <li>
                            a. FIRST. Devuelve el menor índice de la tabla. NULL si está vacía.
                          </li>
                          <li>
                            b. LAST. Devuelve el mayor índice de la tabla. NULL si está vacía.
                          </li>
                          <li>
                            c. EXISTS(i). Utilizada para saber si en un cierto índice hay almacenado un valor. Devolverá TRUE si en el índice i hay un valor.
                          </li>
                          <li>
                            d. COUNT. Devuelve el número de elementos de la tabla PL/SQL.
                          </li>
                          <li>
                            e. PRIOR (n). Devuelve el número del índice anterior a n en la tabla.
                          </li>
                          <li>
                            f. NEXT (n). Devuelve el número del índice posterior a n en la tabla.
                          </li>
                          <li>
                            g. TRIM. Borra un elemento del final de la tabla PL/SQL.
                          </li>
                          <li>
                            h. TRIM(n) borra n elementos del final de la tabla PL/SQL.
                          </li>
                          <li>
                            i. DELETE. Borra todos los elementos de la tabla PL/SQL.
                          </li>
                          <li>
                            j. DELETE(n) borra el correspondiente al índice n.
                          </li>
                          <li>
                            k. DELETE(m,n) borra los elementos entre m y n.
                          </li>
                        </ol>

                        ```bash
<b>DECLARE</b>
<b>TYPE</b> ARR_CIUDADES <b>IS TABLE OF VARCHAR2(50) INDEX BY BINARY_INTEGER</b>;
misCiudades ARR_CIUDADES;
<b>BEGIN </b>
misCiudades(1) := 'MADRID';
misCiudades(2) := 'BILBAO';
misCiudades(3) := 'MALAGA';
<b>FOR</b> i <b>IN</b> misCiudades.<b>FIRST</b>..misCiudades.<b>LAST LOOP</b>
dbms_output.put_line(misCiudades(i));
<b>END LOOP</b>;
<b>END</b>;

```

                        <h3>
                          ROWID
                        </h3>

                        <p>
                          Representa una dirección de la base de datos, ocupada por una única fila. El ROWID de una fila es un identificador único para una fila dentro de una base de datos. No hay dos filas con el mismo ROWID. Este tipo de dato sirve para guardar punteros a filas concretas.
                        </p>

                        <h3>
                          Operadores
                        </h3>

                        <p>
                          Los operadores se pueden definir como combinaciones de caracteres que se utilizan tanto para realizar asignaciones como comparaciones entre datos. Se dividen en aritméticos, relacionales, lógicos y de concatenación y suelen ser los mismos para todos los SGBD.
                        </p>

                        <table class="tabla">
                          <tr>
                            <th colspan="3">
                              Operadores SQL
                            </th>
                          </tr>

                          <tr>
                            <td rowspan="5">
                              Aritmeticos
                            </td>

                            <td>
                              +
                            </td>

                            <td>
                              Suma
                            </td>
                          </tr>

                          <tr>
                            <td>
                              -
                            </td>

                            <td>
                              Resta
                            </td>
                          </tr>

                          <tr>
                            <td>
                              *
                            </td>

                            <td>
                              Producto
                            </td>
                          </tr>

                          <tr>
                            <td>
                              /
                            </td>

                            <td>
                              División
                            </td>
                          </tr>

                          <tr>
                            <td>
                              ** ^
                            </td>

                            <td>
                              Exponenciación
                            </td>
                          </tr>

                          <tr>
                            <td rowspan="7">
                              Relacionales
                            </td>

                            <td>
                              <
                            </td>

                            <td>
                              Menor que
                            </td>
                          </tr>

                          <tr>
                            <td>
                              <=
                            </td>

                            <td>
                              Menor o igual que
                            </td>
                          </tr>

                          <tr>
                            <td>
                              >
                            </td>

                            <td>
                              Mayor que
                            </td>
                          </tr>

                          <tr>
                            <td>
                              >=
                            </td>

                            <td>
                              Mayor o igual que
                            </td>
                          </tr>

                          <tr>
                            <td>
                              <> !=
                            </td>

                            <td>
                              Distinto
                            </td>
                          </tr>

                          <tr>
                            <td>
                              !<
                            </td>

                            <td>
                              No menor que
                            </td>
                          </tr>

                          <tr>
                            <td>
                              !>
                            </td>

                            <td>
                              No mayor que
                            </td>
                          </tr>

                          <tr>
                            <td rowspan="3">
                              Lógicos
                            </td>

                            <td>
                              AND
                            </td>

                            <td rowspan="3">
                              Los operadores lógicos permiten comparar expresiones lógicas devolviendo siempre un valor verdadero o falso. Los operadores lógicos se evalúan de izquierda a derecha.
                            </td>
                          </tr>

                          <tr>
                            <td>
                              OR
                            </td>
                          </tr>

                          <tr>
                            <td>
                              NOT
                            </td>
                          </tr>

                          <tr>
                            <td>
                              Concatenación
                            </td>

                            <td>
                              +, ||
                            </td>

                            <td>
                              Se emplea para unir datos de tipo alfanumérico. + se emplea en Microsoft SQLSERVER y || en ORACLE.
                            </td>
                          </tr>
                        </table>

                        <p>
                          </br /><br />

                          <h3>
                            Operadores en ORACLE
                          </h3>

                          <p>
                            Los más comunes son:
                          </p>

                          <h3>
                            Palabras clave
                          </h3>

                          <p>
                            SQL dispone de muy pocas órdenes, pero de múltiples palabras clave, lo que le convierten en un lenguaje sencillo pero tremendamente potente para llevar a cabo su función.
                          </p>

                          <table class="tabla" width="700">
                            <tr>
                              <td>
                                ALL
                              </td>

                              <td>
                                AND
                              </td>

                              <td>
                                ANY
                              </td>

                              <td>
                                ASC
                              </td>
                            </tr>

                            <tr>
                              <td>
                                AVG
                              </td>

                              <td>
                                BEGIN
                              </td>

                              <td>
                                BY
                              </td>

                              <td>
                                CHAR
                              </td>
                            </tr>

                            <tr>
                              <td>
                                CHECK
                              </td>

                              <td>
                                CLOSE
                              </td>

                              <td>
                                COUNT
                              </td>

                              <td>
                                COMMIT
                              </td>
                            </tr>

                            <tr>
                              <td>
                                CREATE
                              </td>

                              <td>
                                CURSOR
                              </td>

                              <td>
                                DECIMAL
                              </td>

                              <td>
                                DECLARE
                              </td>
                            </tr>

                            <tr>
                              <td>
                                DELETE
                              </td>

                              <td>
                                DESC
                              </td>

                              <td>
                                DISTINCT
                              </td>

                              <td>
                                DEFAULT
                              </td>
                            </tr>

                            <tr>
                              <td>
                                EXISTS
                              </td>

                              <td>
                                FETCH
                              </td>

                              <td>
                                FLOAT
                              </td>

                              <td>
                                FOR
                              </td>
                            </tr>

                            <tr>
                              <td>
                                FROM
                              </td>

                              <td>
                                GRANT
                              </td>

                              <td>
                                GROUP
                              </td>

                              <td>
                                HAVING
                              </td>
                            </tr>

                            <tr>
                              <td>
                                IN
                              </td>

                              <td>
                                INDEX
                              </td>

                              <td>
                                INSERT
                              </td>

                              <td>
                                INTEGER
                              </td>
                            </tr>

                            <tr>
                              <td>
                                INTO
                              </td>

                              <td>
                                LIKE
                              </td>

                              <td>
                                MAX
                              </td>

                              <td>
                                MIN
                              </td>
                            </tr>

                            <tr>
                              <td>
                                NOT
                              </td>

                              <td>
                                NUMERIC
                              </td>

                              <td>
                                ON
                              </td>

                              <td>
                                OPEN
                              </td>
                            </tr>

                            <tr>
                              <td>
                                OR
                              </td>

                              <td>
                                ORDER
                              </td>

                              <td>
                                REVOKE
                              </td>

                              <td>
                                ROLLBACK
                              </td>
                            </tr>

                            <tr>
                              <td>
                                SELECT
                              </td>

                              <td>
                                SET
                              </td>

                              <td>
                                SUM
                              </td>

                              <td>
                                TABLE
                              </td>
                            </tr>

                            <tr>
                              <td>
                                UNION
                              </td>

                              <td>
                                UNIQUE
                              </td>

                              <td>
                                UPDATE
                              </td>

                              <td>
                                USER
                              </td>
                            </tr>

                            <tr>
                              <td>
                                VALUES
                              </td>

                              <td>
                                VIEW
                              </td>

                              <td>
                                WHERE
                              </td>

                              <td>
                                WITH
                              </td>
                            </tr>
                          </table>

                          <p>
                          </p>

                          <h3>
                            Funciones Agregadas
                          </h3>

                          <p>
                            Proporcionan a SQL utilidades de cálculo sobre los datos de las tablas. Estas funciones se incorporan en las consultas SELECT y retornan un único valor al operar sobre un grupo de registros.
                          </p>

                          <table class="tabla">
                            <tr>
                              <td>
                                MAX()
                              </td>

                              <td>
                                Devuelve el valor máximo
                              </td>
                            </tr>

                            <tr>
                              <td>
                                MIN()
                              </td>

                              <td>
                                Devuelve el valor mínimo
                              </td>
                            </tr>

                            <tr>
                              <td>
                                SUM()
                              </td>

                              <td>
                                Devuelve el valor de la suma de los valores del campo
                              </td>
                            </tr>

                            <tr>
                              <td>
                                COUNT()
                              </td>

                              <td>
                                Devuelve el número de filas que cumplen la condición
                              </td>
                            </tr>

                            <tr>
                              <td>
                                AVG()
                              </td>

                              <td>
                                Devuelve el promedio de los valores del campo
                              </td>
                            </tr>
                          </table>

                          <p>
                          </p>

                          <h3>
                            Predicados
                          </h3>

                          <p>
                            Condiciones que se indican en clausula WHERE de una consulta SQL. La siguiente tabla ilustra los predicados de SQL.
                          </p>

                          <table class="tabla">
                            <tr>
                              <td>
                                BETWEEN&#8230;AND
                              </td>

                              <td>
                                Comprueba que el valor esta dentro de un intervalo
                              </td>
                            </tr>

                            <tr>
                              <td>
                                LIKE
                              </td>

                              <td>
                                Compara un campo con una cadena alfanumérica. LIKE admite el uso de caracteres comodines
                              </td>
                            </tr>

                            <tr>
                              <td>
                                ALL
                              </td>

                              <td>
                                Señala a todos los elementos de la selección de la consulta
                              </td>
                            </tr>

                            <tr>
                              <td>
                                ANY
                              </td>

                              <td>
                                Indica que la condición se cumplirá si la comparación es cierta para al menos un elemento del conjunto.
                              </td>
                            </tr>

                            <tr>
                              <td>
                                EXISTS
                              </td>

                              <td>
                                Devuelve un valor verdadero si el resultado de una subconsulta devuelve resultados.
                              </td>
                            </tr>

                            <tr>
                              <td>
                                IN
                              </td>

                              <td>
                                Comprueba si un campo se encuentra dentro de un determinado rango. El rango puede ser una sentencia SELECT.
                              </td>
                            </tr>
                          </table>

                          <p>
                            Bibliografia: www.devjoker.com
                          </p>

                          <h4 class="referencia">
                            Siguiente tema: <a href="https://elbauldelprogramador.com/lenguaje-definicion-de-datosddl-create/">Lenguaje Definición de Datos(DDL) &#8211; CREATE.</a>
                          </h4>



{% include _toc.html %}

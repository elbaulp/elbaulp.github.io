---
title: Introduccion a base de datos
layout: post.amp
permalink: /introduccion-base-de-datos/
categories:
  - BaseDeDatos
tags:
  - abstraccion de datos pl/sql
  - apuntes bases de datos
  - guia de sql basico
main-class: "BaseDeDatos"
color: "#009688"
---
<div class="icosql">
</div>

## Introducci&oacute;n a bases de datos

<p class="nota">
<strong>Nota:</strong>Todo lo que voy a escribir a continuaci&oacute;n sobre base de datos, lo he sacado de los apuntes de mi profesor de Bases de Datos.<br /> Lo subo a modo de manual para todos.
</p>



### Elementos relacionados con un sistema de base de datos:



<p >
<strong>Datos.-</strong> En una BD existen dos tipos de datos: <strong><em>el diccionario de datos (DD)</em></strong> que son los datos de uso interno del software que gestiona la base de datos, como son el tamaño de los campos, el tipo, los usuarios&#8230; Y por otra parte est&aacute;n <strong><em>los datos que el cliente necesita almacenar.</em></strong> La informaci&oacute;n de los datos debe estar integrada, es decir, como si se tratara de un &uacute;nico fichero. Adem&aacute;s, los datos deben ser compartidos, es decir, muchos usuarios pueden acceder a la misma informaci&oacute;n, eso s&iacute;, con acceso controlado.
</p>
<!--ad-->
<p >
<strong>Hardware.-</strong> Toda la informaci&oacute;n a la que hace referencia en el punto anterior debe tener una capacidad adaptada a los requerimientos de la base de datos.
</p>
<p >
<strong>Software.-</strong> El software de una base de datos se conoce como <strong><em>Sistema de Gesti&oacute;n de Base de Datos (SGBD).</em></strong> Este permite una total transparencia al usuario, que interact&uacute;a con los datos y el software pero no sabe realmente como est&aacute;n almacenados, facilit&aacute;ndole as&iacute; su uso.
</p>
<p >
  El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> debe permitir:
</p>
<ul >
<li>
    Crear y reestructurar la informaci&oacute;n.
  </li>
<li>
    Almacenar, actualizar y recuperar los datos.
  </li>
<li>
    Verificar que cualquier modificaci&oacute;n de los datos mantiene la integridad (desde un punto de vista racional) de los mismos.
  </li>
<li>
    Acceso seguro a los datos verificando qui&eacute;n pide los datos y qu&eacute; permisos tiene.
  </li>
<li>
    Gestionar el acceso concurrente de varios usuarios o aplicaciones.
  </li>
<li>
    Transparencia respecto al usuario, es decir, el usuario puede interactuar con los datos y el software, pero realmente &eacute;ste no sabe como est&aacute;n almacenados
  </li>
</ul>
<p >
<strong>Usuarios.-</strong> Entre los usuarios de una base de datos podemos distinguir:
</p>

  * **Finales:** son aquellos que interact&uacute;an con los datos normales del sistema de informaci&oacute;n. Un usuario final no modifica la estructura de la base de datos. Puede tener permiso para insertar, modificar o eliminar datos, siendo la operaci&oacute;n cl&aacute;sica la consulta. Este usuario no podr&aacute; modificar la estructura de una tabla. Pueden ser usuarios sin conocimientos inform&aacute;ticos, tan solo manejan un programa, tambi&eacute;n pueden saber SQL y hacer una consulta a trav&eacute;s de un interprete de SQL.
  * **Programador de aplicaci&oacute;n:** es un usuario con conocimientos inform&aacute;ticos con la responsabilidad de escribir c&oacute;digo para la aplicaci&oacute;n de gesti&oacute;n. Habitualmente tiene la posibilidad de crear subesquemas en la base de datos y por tanto se le permite modificar y estructurar la base de datos. Tiene permiso para crear c&oacute;digo.
  * **Administrador (DBA):** Es el usuario con permisos m&aacute;s alto de la base de datos y tiene la responsabilidad de mantener el funcionamiento de la base de datos, definir todos los par&aacute;metros de inicializaci&oacute;n y almacenamiento. Crea usuarios y les otorga los permisos pertinentes. Tiene que definir la forma de recuperar la base de datos y todas las pol&iacute;ticas de seguridad.



### Niveles de abstracci&oacute;n de la informaci&oacute;n.



<p >
  Uno de los objetivos de un sistema de bases de datos es proporcionar a los usuarios una visi&oacute;n abstracta de la informaci&oacute;n, ocultando ciertos detalles acerca de c&oacute;mo se almacenan los datos, pero permitiendo una recuperaci&oacute;n eficaz de la informaci&oacute;n.
</p>
<p >
  Una de las <strong>arquitecturas m&aacute;s estandarizada</strong> es la especificada por la normativa <acronym title="Standard Planning and Requirements Committee of the American National Standards Institute – Comit&eacute; de Planificaci&oacute;n y Requerimientos de est&aacute;ndares del Instituto Nacional de Est&aacute;ndares de Estados Unidos, divisi&oacute;n X3">ANSI/X3/SPARC</acronym>. Seg&uacute;n esta norma la arquitectura de una base de datos debe tener tres niveles de abstracci&oacute;n: <strong>externo, conceptual e interno.</strong>
</p>

  * **F&iacute;sico o Interno:** Es el nivel que define el formato de almacenamiento f&iacute;sico de los datos. Esta visi&oacute;n contempla: la organizaci&oacute;n de los ficheros, modos de acceso, &iacute;ndices y punteros, bloqueo de registros. El nivel interno se describe por medio de un **esquema interno** o vista interna.
  * **Conceptual:** Es una visi&oacute;n total de los datos de la BD, de c&oacute;mo est&aacute; organizada toda la base de datos, tal y como la crea el analista conceptualmente (representaci&oacute;n de las tablas&#8230;). Es la visi&oacute;n del administrador de la BD, que es el &uacute;nico usuario que trabaja a este nivel; el resto de usuarios trabajan a nivel externo utilizando subconjuntos de la estructura conceptual.
  * **Externo:** es el nivel m&aacute;s alto de abstracci&oacute;n, es decir el m&aacute;s cercano al usuario, y proporciona una visi&oacute;n parcial de los datos. Es la visi&oacute;n que tiene un usuario o aplicaci&oacute;n de la base de datos. Cada usuario tiene una vista externa diferente de la base de datos. Para cada tipo de usuario hay que especificar un esquema externo, **subesquema** o vista externa, que describe un subconjunto de la BD.

<p >
  El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> debe poder garantizar la transferencia de los datos desde el nivel interno al nivel externo, a este proceso se llama transformaci&oacute;n de datos o mapeo (data mapping). Para ello existen dos niveles de correspondencia:
</p>

  * **Correspondencia conceptual/interna:** Permite el paso de la vista conceptual a la vista interna, y viceversa. Especifica c&oacute;mo se representan los registros y campos conceptuales en el nivel interno. Si se modifica la estructura interna de la base de datos, la correspondencia conceptual/interna deber&aacute; modificarse, para que no var&iacute;e el esquema conceptual. De este modo se conserva la independencia de los datos.
  * **Correspondencia externa/conceptual:** Permite el paso de una vista externa espec&iacute;fica a la vista conceptual, y viceversa.

<p >
  Los subesquemas, el esquema conceptual, el esquema interno y las correspondencias conceptual/interna y externa/conceptual, las describe el <strong>administrador de la base de datos</strong> y quedan almacenados dentro del <strong>diccionario</strong> de la BD para futuras consultas del <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr>. Cuando un usuario desea acceder a la base de datos, el <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> examina el diccionario de datos para comprobar si la solicitud puede ser realizada y el modo de realizar las transformaciones pertinentes de los datos.
</p>
<p >
  Todo ello permitir&aacute; una mayor independencia de los datos:
</p>

  * **Independencia a Nivel F&iacute;sico:** es la capacidad de modificar la estructura f&iacute;sica de la base de datos sin modificar los programas. Por ejemplo: se cambia el disco duro pero los programas siguen igual.
  * **Independencia l&oacute;gica:** es la capacidad de modificar el esquema l&oacute;gico sin tener que modificar los programas. El SGBD puede controlar las dependencias entre las modificaciones de objetos bajo su control.
  * **Independencia de los dispositivos:** se consigue cuando la ejecuci&oacute;n de los programas es independiente del sistema de almacenamiento.

<div class="separator" >
<a target="_blank" href="https://3.bp.blogspot.com/_IlK2pNFFgGM/TMsDbV2ZnZI/AAAAAAAAADs/xVmeBhnwGno/s1600/figura1.1.jpg"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  alt="sistema gestor de base de datos - sgbd" title="sistema gestor de base de datos - sgbd" height="300" src="https://3.bp.blogspot.com/_IlK2pNFFgGM/TMsDbV2ZnZI/AAAAAAAAADs/xVmeBhnwGno/s320/figura1.1.jpg" width="320" /></a>
</div>
<p >
  En el siguiente ejemplo de una base de datos se puede observar que se han obtenido dos subesquemas (esquemas externos) a partir del &uacute;nico esquema conceptual formado por las entidades: VENDEDORES, VENTAS y ARTICULOS. La estructura de cada subesquema obedece a las necesidades concretas del tipo de usuario que lo va a utilizar. Por ejemplo:
</p>
<ol type="a" >
<li>
    Uno de los subesquemas ser&aacute; utilizado por un programa que totalizar&aacute; ventas por departamento, por lo tanto la visi&oacute;n que le interesa tener de la base de datos es una relaci&oacute;n de ventas ordenadas por departamentos.
  </li>
<li>
    El otro subesquema lo utilizar&aacute; un programa que listar&aacute; una relaci&oacute;n de empleados por departamento, por lo que s&oacute;lo necesita conocer los nombres de todos los empleados y el departamento al que pertenecen.
  </li>
</ol>
<div >
<span >SUBESQUEMAS</span>
</div>
<p >
  Esquema externo o subesquema para el programa &#8220;Ventas por departamento&#8221;
</p>
<table   cellspacing="0">
<caption>VENTAS_POR_DEPARTAMENTO</caption> <tr>
<td>
      DEPARTAMENTO
    </td>
<td>
      CONCEPTO
    </td>
<td>
      IMPORTE
    </td>
</tr>
</table>
<p >
  Esquema externo o subesquema para el programa &#8220;Relaci&oacute;n de empleados por departamento&#8221;
</p>
<table   cellspacing="0">
<caption>VENDEDORES</caption> <tr>
<td>
      DEPARTAMENTO
    </td>
<td>
      NOMBRE
    </td>
</tr>
</table>
<div >
<span >ESQUEMA CONCEPTUAL</span>
</div>
<p >
  Esquema conceptual de toda la base de datos, formado por los siguientes registros conceptuales:
</p>
<div class="separator" >
<a target="_blank" href="https://4.bp.blogspot.com/_IlK2pNFFgGM/TMtBOVu7K0I/AAAAAAAAADw/KH1tI0GGlFU/s1600/tabla1.jpg"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="66" src="https://4.bp.blogspot.com/_IlK2pNFFgGM/TMtBOVu7K0I/AAAAAAAAADw/KH1tI0GGlFU/s320/tabla1.jpg" width="320" /></a>
</div>
<div >
<span >ESQUEMA INTERNO</span>
</div>
<p >
  Esquema interno de toda la base de datos:
</p>
<table   cellspacing="0">
<caption>VENDEDORES</caption> <tr>
<td>
      COD_VEND string(3)
    </td>
<td>
      NOMBRE string(30)
    </td>
<td>
      DEPART string(4)
    </td>
<td>
      &#8230;
    </td>
</tr>
</table>
<table   cellspacing="0">
<caption>VENTAS</caption> <tr>
<td>
      COD_VEND string(3)
    </td>
<td>
      COD_ART string(4)
    </td>
<td>
      CANTIDAD long
    </td>
<td>
      FECHA date
    </td>
</tr>
</table>
<table   cellspacing="0">
<caption>ARTICULOS</caption> <tr>
<td>
      COD_ART string(4)
    </td>
<td>
      CONCEPTO string(40)
    </td>
<td>
      PVP float
    </td>
<td>
      &#8230;
    </td>
</tr>
</table>
<p >
  Adem&aacute;s se incluir&iacute;a el tipo de organizaci&oacute;n, la secuencia f&iacute;sica de los registros, modos de acceso, etc.
</p>
<p >
  A continuaci&oacute;n podemos observar algunas ocurrencias de los registros externos y conceptuales.
</p>
<div >
<span >VISTAS EXTERNAS</span>
</div>
<table  cellspacing="0">
<caption>VENTAS_POR_DEPARTAMENTO </caption> <tr>
<td bgcolor="#666666">
      DEPARTAMENTO
    </td>
<td bgcolor="#666666">
      CONCEPTO
    </td>
<td bgcolor="#666666">
      IMPORTE
    </td>
</tr>
<tr>
<td>
      Autom&oacute;vil
    </td>
<td>
      Antirrobo
    </td>
<td>
      3.450
    </td>
</tr>
<tr>
<td>
      Autom&oacute;vil
    </td>
<td>
      Parasol
    </td>
<td>
      300
    </td>
</tr>
<tr>
<td>
      Hogar
    </td>
<td>
      Juego toallas
    </td>
<td>
      6.500
    </td>
</tr>
<tr>
<td>
      Hogar
    </td>
<td>
      S&aacute;banas estampadas
    </td>
<td>
      4.500
    </td>
</tr>
</table>
<table cellspacing="0" >
<caption>EMPLEADOS_POR_DEPARTAMENTO </caption> <tr>
<td bgcolor="#666666">
      DEPARTAMENTO
    </td>
<td bgcolor="#666666">
      NOMBRE
    </td>
</tr>
<tr>
<td>
      Autom&oacute;vil
    </td>
<td>
      Jos&eacute; L&oacute;pez Garc&iacute;a
    </td>
</tr>
<tr>
<td>
      Hogar
    </td>
<td>
      Ana Ruiz Ram&iacute;rez
    </td>
</tr>
<tr>
<td>
      Hogar
    </td>
<td>
      Julia P&eacute;rez Ramos
    </td>
</tr>
</table>
<div >
<span >VISTA CONCEPTUAL</span>
</div>
<table  cellspacing="0">
<caption>VENDEDORES</caption> <tr>
<td bgcolor="#666666">
      COD_VEND
    </td>
<td bgcolor="#666666">
      NOMBRE
    </td>
<td bgcolor="#666666">
      DEPARTAMENTO
    </td>
<td bgcolor="#666666">
      &#8230;
    </td>
</tr>
<tr>
<td>
      001
    </td>
<td>
      Jos&eacute; L&oacute;pez Garc&iacute;a
    </td>
<td>
      Autom&oacute;vil
    </td>
<td>
</td>
</tr>
<tr>
<td>
      002
    </td>
<td>
      Ana Ruiz Ram&iacute;rez
    </td>
<td>
      Hogar
    </td>
<td>
</td>
</tr>
<tr>
<td>
      003
    </td>
<td>
      Julia P&eacute;rez Ramos
    </td>
<td>
      Hogar
    </td>
<td>
</td>
</tr>
</table>
<table cellspacing="0" >
<caption>VENTAS</caption> <tr>
<td bgcolor="#666666">
      COD_VEND
    </td>
<td bgcolor="#666666">
      COD_ART
    </td>
<td bgcolor="#666666">
      CANTIDAD
    </td>
<td bgcolor="#666666">
      FECHA
    </td>
<td bgcolor="#666666">
      &#8230;
    </td>
</tr>
<tr>
<td>
      002
    </td>
<td>
      H22
    </td>
<td>
      1
    </td>
<td>
      01-10-98
    </td>
<td>
</td>
</tr>
<tr>
<td>
      001
    </td>
<td>
      A11
    </td>
<td>
      1
    </td>
<td>
      02-10-98
    </td>
<td>
</td>
</tr>
<tr>
<td>
      003
    </td>
<td>
      H15
    </td>
<td>
      1
    </td>
<td>
      18-10-98
    </td>
<td>
</td>
</tr>
<tr>
<td>
      001
    </td>
<td>
      A22
    </td>
<td>
      1
    </td>
<td>
      20-10-98
    </td>
<td>
</td>
</tr>
</table>



### Funcionamiento de un SGBD



<p >
  Para describir el funcionamiento de un SGBD supondremos el caso de un programa de aplicaci&oacute;n, que lee un registro de una base de datos, para ello realiza una solicitud al <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr>, esencialmente la secuencia, mostrada en el esquema de la figura 1.2, es la siguiente:
</p>
<div class="separator" >
<a target="_blank" href="https://4.bp.blogspot.com/_IlK2pNFFgGM/TMwEXF5RGLI/AAAAAAAAAD0/VfTA_V3C7x0/s1600/figura1.2.jpg"  ><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive" title="Funcionamiento de un SGBD"  height="255" src="https://4.bp.blogspot.com/_IlK2pNFFgGM/TMwEXF5RGLI/AAAAAAAAAD0/VfTA_V3C7x0/s320/figura1.2.jpg" width="320" /></a>
</div>
<ol type="1" >
<li>
    El programa de aplicaci&oacute;n A pide al <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> que lea un registro. Se proporciona la<br /> clave de acceso. El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> eval&uacute;a la capacidad del usuario para realizar la operaci&oacute;n solicitada.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> obtiene el subesquema que utiliza el programa de aplicaci&oacute;n A. Si no encuentra los datos solicitados, rechaza la solicitud.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> obtiene el esquema y determina qu&eacute; tipo de datos l&oacute;gicos necesita.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> examina el esquema interno y determina qu&eacute; registro f&iacute;sico debe leer.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> ordena al S.O. que lea el registro pedido.
  </li>
<li>
    El S.O. interacciona con el dispositivo f&iacute;sico en el que se encuentran los datos.
  </li>
<li>
    Los datos pedidos se env&iacute;an desde el dispositivo f&iacute;sico al buffer del sistema.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> analiza el esquema, el subesquema y las correspondencias<br /> externa/conceptual para realizar las transformaciones necesarias de los datos.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> transfiere los datos al &aacute;rea de trabajo del programa de aplicaci&oacute;n A.
  </li>
<li>
    El <abbr title="Sistema Gestor de Base de Datos">SGBD</abbr> informa al programa del &eacute;xito o fracaso de la operaci&oacute;n de E/S, incluyendo<br /> cualquier indicaci&oacute;n de error.
  </li>
<li>
    El programa puede ahora trabajar con los datos pedidos.
  </li>
</ol>



### Lenguajes de un SGBD



<p >
  Para comunicarnos con la base de datos necesitamos un lenguaje, este lenguaje nos<br /> permitir&aacute; realizar varios procedimientos:
</p>

  * **DDL:** este lenguaje es el que se utiliza para definir el esquema de la base de datos. La ejecuci&oacute;n de sentencias de un DDL genera informaci&oacute;n de control de uso interno de la base datos, es decir genera la informaci&oacute;n en el diccionario de datos.
  * **DML:** las instrucciones del DML producen modificaciones sobre los datos en s&iacute;, pero no sobre las estructura de las tablas. Las sentencias de este lenguaje generan instrucciones de manejo de los datos.
  * **DCL** son todas las sentencias que definen restricciones de control de acceso a los datos. Generan informaci&oacute;n en el diccionario de datos.



### Tipos de Bases de Datos



<p >
  Seg&uacute;n la estructura l&oacute;gica, a nivel conceptual o a nivel externo, los SGBD se clasifican en:
</p>

  * **Jer&aacute;rquico:** es el primero que se utiliz&oacute;, tiene una estructura arborescente, donde los nodos de nivel corresponden a los campos y cada rama a un registro. Para acceder a un campo que se encuentra en un determinado nivel, es preciso localizarlo partiendo del nivel superior y descendiendo por las ramas hasta llegar al mismo. Esta forma de organizaci&oacute;n puede hacer lenta la obtenci&oacute;n de determinadas informaciones, aunque existen estructuras arborescentes m&aacute;s sofisticadas que incluyen &iacute;ndices y que permiten acelerar el resultado de las consultas.
  * **En red o plex:** en el que se utilizan grafos cuya diferencia con la estructura en &aacute;rbol donde existe m&aacute;s de una conexi&oacute;n entre los nodos de los diversos niveles, de forma que puedan recorrerse por distintos caminos sin necesidad de acudir cada vez a la raiz, y con ello la b&uacute;squeda es m&aacute;s flexible. Si se crean conexiones entre nodos de igual nivel, tambi&eacute;n se agiliza el acceso a campos de determinado nivel. El inconveniente esencial de esta estructura es que aumento de espacio que necesita, y que una vez m&aacute;s el  
    programador tiene que recorrer la base de datos registro a registro, especificando esta vez la direcci&oacute;n y la relaci&oacute;n a recorrer.
  * **Relacional:** pr&aacute;cticamente es el m&aacute;s extendido en la actualidad, ser&aacute; el que seguiremos en este m&oacute;dulo, y al que dedicaremos un tema posteriormente.

#### Siguiente tema: [Diseño de Bases de Datos ( I ) &#8211; Conceptos del Modelo Relacional][1] 



 [1]: https://elbauldelprogramador.com/diseno-de-bases-de-datos-i-conceptos/

{% include toc.html %}

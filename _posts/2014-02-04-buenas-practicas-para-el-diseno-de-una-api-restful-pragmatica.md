---
id: 2082
title: Buenas prácticas para el Diseño de una API RESTful Pragmática
author: Luzcila
layout: post
guid: http://elbauldelprogramador.com/?p=2082
permalink: /buenas-practicas-para-el-diseno-de-una-api-restful-pragmatica/
categories:
  - Artículos
tags:
  - api restfull
  - apis
  - buenas practicas apis
---
> Esta es una traducción lo más literal posible del artículo original, ya que quería preservar la opinión personal del autor así como también el destacable trabajo de investigación y análisis que realizó.

<span style="line-height: 1.5em;">Tu modelo de datos ha empezado a estabilizarse y es el momento de crear una API pública para tu aplicación web. Te das cuenta de que es difícil hacer cambios significativos a tu API una vez que fue liberada, quieres lo mejor y lo antes posible. Ahora, en internet no escasean opiniones sobre diseño de APIs. Pero, debido a que no hay un standard adoptado popularmente que funcione en todos los casos, te quedas con un manojo de opciones: ¿Qué formatos deberías aceptar? ¿Cómo deberías autenticar? ¿Debería tu API ser versionada?</span>

Diseñando una API para <a href="http://www.supportfu.com/" target="_blank">SupportFu</a> (una alternativa para <a href="http://www.supportfu.com/zendesk-alternative" target="_blank">Zendesk</a>), intenté encontrar respuestas pragmáticas a estas preguntas. Mi objetivo para la <a href="http://dev.supportfu.com/api/v1" target="_blank">API de SupportFu</a> es que sea fácil de usar, facil de adoptar y lo suficientemente flexible para implementarla en nuestras propias interfaces de usuario.

<!--more-->

## TL,DR

<div>
  <ol>
    <li>
      Usa SSL en todos lados, sin excepciones
    </li>
    <li>
      Una API es tan buena como lo es su documentación &#8211; por lo tanto realiza una buena documentación
    </li>
    <li>
      Versiona a través de la URL, no de los encabezados
    </li>
    <li>
      Usa parámetros de consulta para filtros avanzados, ordenamiento y búsqueda
    </li>
    <li>
      Provee una forma de limitar cuáles campos son devueltos desde la API
    </li>
    <li>
      Devuelve algo útil de las peticiones POST, PATCH & PUT
    </li>
    <li>
      HATEOAS todavía no es muy práctico
    </li>
    <li>
      Usa JSON donde sea posible, XML sólo si tienes la obligación
    </li>
    <li>
      Deberías usar camelCase con JSON, pero snake_case es un 20% más fácil de leer
    </li>
    <li>
      Usa Pretty Print por defecto y asegura que gzip esté soportado
    </li>
    <li>
      No uses respuestas encapsuladas por defecto
    </li>
    <li>
      Considera usar JSON para cuerpos de peticiones POST, PUT y PATCH
    </li>
    <li>
      Pagina usando encabezados Link
    </li>
    <li>
      Provee una forma de cargar automáticamente representaciones de datos relacionados al recurso solicitado
    </li>
    <li>
      Provee una forma de sobreescribir el método HTTP
    </li>
    <li>
      Provee encabezados de respuesta útiles para controles de tráfico (rate limiting)
    </li>
    <li>
      Usa autenticación basada en tokens, transportado en OAuth2 donde se necesite delegación
    </li>
    <li>
      Incluir encabezados de respuesta que faciliten el caché
    </li>
    <li>
      Define un error de carga útil (payload) que sea consumible
    </li>
    <li>
      Utilizar efectivamente los códigos de error HTTP
    </li>
  </ol>
</div>

<div>
</div>

<div>
  <div>
    <a name="1"></a></p> 
    
    <h2>
      1. Requisitos fundamentales para la API
    </h2>
  </div>
  
  <div>
    Muchas de las opiniones sobre diseño de API que aparecen en la web son discusiones académicas en torno a interpretaciones subjetivas de las normas difusas en lugar de lo que tiene sentido en el mundo real. Mi objetivo con este artículo es describir las mejores prácticas para una API pragmática diseñada para aplicaciones web de hoy en día. No hago ningún intento de satisfacer un standard si no parece viable. Para ayudar a guiar el proceso de toma de decisiones, he escrito algunos de los requisitos que la API debe cubrir:
  </div>
  
  <div>
    <ul>
      <li>
        Debería utilizar estándares web donde tengan sentido
      </li>
      <li>
        Debería ser amigable para el desarrollador y ser explorable mediante una barra de direcciones del navegador
      </li>
      <li>
        Debería ser sencilla, intuitiva y consistente para que la adopción no sólo sea fácil, sino también agradable
      </li>
      <li>
        Debería proporcionar suficiente flexibilidad para potenciar mayoritariamente la UI <a href="http://www.supportfu.com/" target="_blank">SupportFu</a>
      </li>
      <li>
        Debería ser eficiente, manteniendo el equilibrio con los demás requisitos
      </li>
    </ul>
  </div>
  
  <div>
    Una API es una interfaz de usuario (UI) para un desarrollador &#8211; al igual que cualquier UI, es importante asegurar que la experiencia del usuario esté pensada cuidadosamente!
  </div>
</div>

<div>
</div>

<div>
  <a name="2"></a></p> 
  
  <h2>
    2. Usa acciones y URLs RESTful
  </h2>
  
  <div>
    Si hay una cosa que ha ganado amplia adopción, son los principios REST. Estos fueron presentados por primera vez por <a href="http://roy.gbiv.com/" target="_blank">Roy Felding </a>en el <a href="http://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm" target="_blank">Capítulo 5</a> de su disertación sobre<a href="http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm" target="_blank"> arquitecturas de software ubicadas en redes de trabajo</a>.
  </div>
  
  <div>
    Los fundamentales principios de <a href="https://en.wikipedia.org/wiki/Representational_state_transfer" target="_blank">REST </a>se basan en separar tu API en recursos lógicos. Estos recursos son manipulados usando peticiones HTTP donde el método (GET, POST, PUT, PATCH, DELETE) tienen un significado específico.
  </div>
  
  <div>
    <strong>¿Pero qué puede hacer un recurso?</strong> Bueno, estos deberían ser <a href="https://blog.apigee.com/detail/restful_api_design_nouns_are_good_verbs_are_bad" target="_blank">sustantivos (¡no verbos!)</a> que tengan sentido desde una perspectiva del consumidor de la API. Aunque tus modelos internos pueden mapear cuidadosamente con los recursos, no es necesario que sea un mapeo uno-a-uno. La clave es no filtrarse ningún detalle irrelevante de implementación. Por ejemplo, algunos de los sustantivos de SupportFu podrían ser <em>ticket</em>, <em>usuario</em> y <em>grupo</em>.
  </div>
  
  <div>
    Una vez que tienes tus recursos definidos, necesitas identificar qué acciones aplican a ellos y cómo deberían relacionarse con tu API. Los principios REST proveen estrategias para manejar acciones <a href="http://en.wikipedia.org/wiki/Create,_read,_update_and_delete" target="_blank">CRUD </a>usando métodos HTTP relacionados de la siguiente forma:
  </div>
  
  <ul>
    <li>
      <em>GET /tickets</em>- Devuelve una lista de tickets
    </li>
    <li>
      <em>GET /tickets/12</em>- Devuelve un ticket específico
    </li>
    <li>
      <em>POST /tickets</em>- Crea un nuevo ticket
    </li>
    <li>
      <em>PUT /tickets/12</em>- Actualiza el ticket #12
    </li>
    <li>
      <em>PATCH /tickets/12</em>- Actualiza parcialmente el ticket #12
    </li>
    <li>
      <em>DELETE /tickets/12</em>- Elimina el ticket #12
    </li>
  </ul>
  
  <div>
    La grandeza de REST es que estas impulsando métodos HTTP existentes a implementar funcionalidades importantes en sólo un simple endpoint <em>/tickets</em>. No hay convención de nombres de métodos para seguir y la estructura URL es limpia y clara.
  </div>
  
  <div>
    <strong>¿El nombre del Endpoint debería ser singular o plural? </strong>La regla mantenlo-simple (keep-it-simple) aplica aquí. Si bien tu gramática interna te dirá que está mal describir una instancia única de un recurso utilizando el plural, la respuesta pragmática es mantener el formato de la URL consistente y siempre usar plural. No tener que lidiar con plurales irregulares (person/people, goose/geese) hace más simple la vida del consumidor de la API y es más sencillo para el proveedor de la API implementarla (como los más modernos frameworks manejarán nativamente<em> /tickets</em> y<em> /tickets/12</em> bajo un controlador comun).
  </div>
  
  <div>
    <strong style="line-height: 1.5em;">¿Pero cómo lidiar con las relaciones?</strong><span style="line-height: 1.5em;"> </span><span style="line-height: 1.5em;">Si una relación puede existir con un sólo recurso, los principios REST proveen una guía útil. Veamos esto con un ejemplo. Un ticket en <a href="http://www.supportfu.com/" target="_blank">SupportFu</a> consiste en un número de mensajes. Estos mensajes pueden ser lógicamente mapeados al endpoint /tickets de la siguiente forma:</span>
  </div>
  
  <div>
    <ul>
      <li>
        <em>GET /tickets/12/messages </em>- Devuelve una lista de mensajes para el ticket #12
      </li>
      <li>
        <em>GET /tickets/12/messages/5 </em>- <wbr />Devuelve el mensaje #5 para el ticket #12
      </li>
      <li>
        <em>POST /tickets/12/messages </em>- Crea un nuevo mensaje en el ticket #12
      </li>
      <li>
        <em>PUT /tickets/12/messages/5</em> &#8211; Actualiza el mensaje #5 para el ticket #12
      </li>
      <li>
        <em>PATCH /tickets/12/messages/5 -</em> Actualiza parcialmente el mensaje #5 para el ticket #12
      </li>
      <li>
        <em>DELETE /tickets/12/messages/5 </em>- Borra el mensaje #5 para el ticket #12
      </li>
    </ul>
    
    <p>
      Alternativamente, si una relación puede existir independientemente del recurso, tiene sentido incluir sólo un identificador en la representación de la salida del recurso. El consumidor de la API debería entonces tener que acertar al endpoint de la relación. Sin embargo, si la relación es comunmente requerida junto con el recurso, la API podría ofrecer funcionalidad para automáticamente incluir la representación de la relación y evitar el segundo impacto en la API.<br /> <strong>¿Qué ocurre con las acciones que no corresponden a las operaciones CRUD?</strong><br /> Aquí es donde las cosas pueden confundirse. Hay un número de enfoques:
    </p>
    
    <ol>
      <li>
        Reestructura la acción para que aparezca como un campo de un recurso. Esto funciona si la acción no toma parámetros. Por ejemplo, un acción &#8220;activate&#8221; puede ser asignada a un campo booleano <em>activated</em> y actualizado vía PATCH al recurso.
      </li>
      <li>
        Tratalo como un sub-recurso con principios REST. Por ejemplo, la API de GitHub te permite &#8220;<a href="http://developer.github.com/v3/gists/#star-a-gist" target="_blank">star a gist</a>&#8220;(marcar como importante) con <em>PUT /gists/:id/star</em> y &#8220;<a href="http://developer.github.com/v3/gists/#unstar-a-gist" target="_blank">unstar</a>&#8221; (desmarcar) con DELETE /gists/:id/star.
      </li>
      <li>
        A veces realmente no tienes forma de mapear la acción a una estructura REST apropiada. Por ejemplo, una búsqueda multi-recurso no tiene sentido ser asignada a un endpoint de un recurso específico. En este caso,<em> /search</em> podría tener más sentido incluso si no es un sustantivo. Esto está BIEN &#8211; sólo realiza lo que sea correcto desde la perspectiva del consumidor de la API y asegúrate de que esté claramente documentado para evitar confusiones.
      </li>
    </ol>
  </div>
  
  <div>
  </div>
  
  <p>
    <a name="3"></a>
  </p>
  
  <h2>
    3. SSL en todos lados &#8211; todo el tiempo
  </h2>
  
  <div>
    Usa siempre SSL. Sin excepciones. Hoy, tus APIs web pueden ser accedidas desde cualquier lado donde haya internet (como librerías, cafeterías, aeropuertos, entre otros). No todos son seguros. Muchos no encriptan las comunicaciones, permitiendo facilmente ser espiados o falsificados si son interceptadas las credenciales de autenticación.
  </div>
  
  <div>
    Otra ventaja de usar siempre SSL es que garantiza que las comunicaciones encriptadas simplifiquen los esfuerzos de autenticación &#8211; puedes salir simplemente con los tokens de acceso en vez de tener que firmar cada petición a la API.
  </div>
  
  <div>
    Hay que tener cuidado con los accesos no-SSL a las URLs de la API. <span style="text-decoration: underline;"><em><strong>NO</strong></em></span> las redirecciones a sus homólogas SSL. Es recomendable que lances un error. La última cosa que quieres para tus clientes pobremente configurados es enviar peticiones a un endpoint sin encriptar, sólo para ser redireccionados silenciosamente al verdadero endpoint encriptado.
  </div>
  
  <div>
  </div>
  
  <p>
    <a name="4"></a>
  </p>
  
  <h2>
    4. Documentación
  </h2>
  
  <div>
    Una API es buena tanto como lo sea su documentación. Los docs deberían ser fáciles de encontrar y de acceso público. Muchos desarrolladores revisarán la documentación antes de realizar cualquier esfuerzo para integrarla. Cuando los docs están escondidos dentro de un archivo PDF o están permitido sólo para usuarios identificados, no son entonces sólo difíciles de encontrar sino que también dificultan la búsqueda.
  </div>
  
  <div>
    Los documentos deberían mostrar ejemplos de ciclos completos de petición/respuesta. Preferentemente, las peticiones deberían poder ser &#8220;pegadas&#8221; &#8211; tanto los hipervínculos deberían poder ser pegados en un navegador como los ejemplos de código deberían poder ser pegados en una consola. <a href="http://developer.github.com/v3/gists/#list-gists" target="_blank">GitHub</a> y <a href="https://stripe.com/docs/api" target="_blank">Strip</a> hacen un muy buen trabajo en este aspecto.
  </div>
  
  <div>
    Una vez que liberes una API pública, te comprometes a no romper cosas sin previo aviso. La documentación debe incluir información y detalles sobre futuras actualizaciones a la API que sean visibles al exterior. Las actualizaciones deben ser entregadas a través de un blog (es decir, una lista de cambios) o una lista de correo (preferiblemente ambos).
  </div>
  
  <div>
  </div>
  
  <p>
    <a name="5"></a>
  </p>
  
  <h2>
    5. Versionado
  </h2>
  
  <div>
    Siempre versiona tu API. El versionado te ayuda a iterar más rápido y evitar peticiones inválidas desde endpoints actualizados. Además te ayuda a resolver cualquier transición importante de versión de la API mientras continúas ofreciendo viejas versiones de la API por un período de tiempo.
  </div>
  
  <div>
    Hay opiniones cruzadas respecto si <a href="http://stackoverflow.com/questions/389169/best-practices-for-api-versioning" target="_blank">la versión de la API debería ser incluida en la URL o en el encabezado</a>. Académicamente hablando, debería probablemente estar en el encabezado. Sin embargo, la versión necesita estar en la URL para asegurar la posibilidad de explorar en el navegador los recursos a través de las versiones (recuerda los requerimientos de la API especificados al inicio del artículo).
  </div>
  
  <div>
    Soy un gran fanático del <a href="https://stripe.com/docs/api#versioning" target="_blank">alcance que Stripe ha tomado respecto al versionado de la API </a>- la URL tiene un número de versión principal (v1), pero la API tiene las sub-versiones basadas en fechas que pueden ser elegidas mediante un encabezado de petición HTTP personalizado. En este caso, la versión principal proporciona la estabilidad estructural de la API en su conjunto, mientras que las sub-versiones representan cambios más pequeños (campos inhabilitados, cambios en el endpoint, etc).
  </div>
  
  <div>
    Una API nunca va a ser completamente estable. El cambio es inevitable. Lo importante es cómo se gestiona el cambio. Anuncios de fechas y planificaciones bien documentados puede ser una buena práctica para muchas APIs. Todo se reduce a lo que es razonable teniendo en cuenta la industria y los posibles consumidores de la API.
  </div>
  
  <div>
  </div>
  
  <p>
    <a name="6"></a>
  </p>
  
  <h2>
    6. Filtrado, ordenación y búsqueda en los resultados
  </h2>
  
  <div>
    Lo mejor es mantener la URL base de recursos tan simple como sea posible. Filtros de resultados complejos, requisitos de ordenamiento y búsqueda avanzada (cuando se limita a un solo tipo de recurso) pueden ser implementados fácilmente como parámetros de consulta en la parte superior de la URL base. Veamos esto en más detalle:
  </div>
  
  <div>
    <strong>Filtrado: </strong>Usa un único parámetro de consulta por cada campo que implemente el filtro. Por ejemplo, cuando se pide una lista de tickets del endpoint <em>/tickets</em>, podrías querer limitarla a sólo los que están en estado abierto. Esto puede ser logrado con una petición como <em>GET /tickets?state=open</em>. En este caso, state es el parámetro de la consulta que implementa el filtro.
  </div>
  
  <div>
    <strong>Ordenación: </strong>Similar al filtrado, un parámetro genérico <em>sort</em> puede ser usado para describir las reglas de ordenamiento. Organiza los requerimientos de ordenamiento complejos permitiendo que el parámetro de ordenación sea tomado de una lista de campos separados por coma, cada uno con un posible negativo unario para implicar orden descendiente. Veamos algunos ejemplos:
  </div>
  
  <div>
    <ul>
      <li>
        <em>GET /tickets?sort=-priority</em> &#8211; Devuelve una lista de tickets en orden de prioridad descendiente
      </li>
      <li>
        <em>GET /tickets?sort=-priority,<wbr />created_at </em>- Devuelve una lista de tickets en orden de prioridad descendiente. Con una prioridad específica, los tickets más viejos son ordenados primero.
      </li>
    </ul>
    
    <p>
      <b>Búsqueda: </b>A veces los filtros básicos no son suficientes y se necesita la posibilidad de realizar una búsqueda completa sobre el texto. Tal vez ya estés usando <a href="http://www.elasticsearch.org/" target="_blank">ElasticSearch</a> u otra búsqueda basada en la tecnología <a href="http://lucene.apache.org/" target="_blank">Lucene</a>. Cuando una búsqueda completa sobre el texto es usada como un mecanismo de devolución de instancias de recurso para un tipo de recurso específico, puede ser expuesto en la API como un parámetro de consulta al endpoint del recurso. Digamos <em>q</em>. Las consultas de búsqueda deberían ser pasadas directamente al motor de búsqueda y la salida de la API deberían estar en el mismo formato que un lista de resultado normal.<br /> Combinando todo esto, podemos construir consultas como:
    </p>
    
    <ul>
      <li>
        <em>GET /tickets?sort=-updated_at</em> &#8211; Devuelve los tickets recientemente actualizados
      </li>
      <li>
        <em>GET /tickets?state=closed&sort=-updated_at -</em> Devuelve los tickets recientemente cerrados
      </li>
      <li>
        <em>GET /tickets?q=return&state=open&sort=-priority,created_at</em> &#8211; Devuelve el ticket abierto de mayor prioridad que menciona la palabra &#8216;return&#8217;
      </li>
    </ul>
  </div>
  
  <div>
    <p>
      <strong>Alias para las consultas comunes</strong>
    </p>
    
    <p>
      Para hacer que la experiencia con la API sea más agradable para el consumidor promedio, considera empaquetar sets de condiciones dentro de una ruta REST facilmente accesible. Por ejemplo, la consulta de tickets cerrados recientemente puede ser empaquetada como <em>GET /tickets/recently_closed.</em><br /> <a name="7"></a>
    </p>
    
    <h2>
      7. Limitando los campos que son devueltos por la API
    </h2>
    
    <p>
      El consumidor de la API no siempre necesita la representación completa de un recurso. La habilidad de seleccionar y elegir los campos devueltos permite el doble beneficio de dejar que el consumidor de la API minimice el tráfico de red y acelere su propio uso de la API.<br /> Usa el parámetro de consulta <em>fields</em> que tome una lista de campos separados con coma. Por ejemplo, la siguiente petición debería traer sólo la información suficiente para mostrar una lista ordenada de tickets abiertos:
    </p>
    
    <pre>GET /tickets?fields=id,subject,customer_name,updated_at&state=open&sort=-updated_at</pre>
    
    <p>
      <a name="8"></a>
    </p>
    
    <h2>
      8. Update & Creation deberían devolver una representación de un recurso
    </h2>
    
    <p>
      Una llamada PUT, POST o PATCH puede hacer modificaciones a los campos del recurso subyacente que no fueron parte de los parámetros provistos (por ejemplo: los campos timestamp created_at o updated_at ). Para evitarle al consumidor de la API tener que consultar nuevamente a la API por un recurso actualizado, agrega el retorno de la actualización (o creación) como parte de la respuesta.<br /> En el caso de un POST que sea un resultado de una creación, usa el <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.5" target="_blank">código de status HTTP 201 </a>e incluye un encabezado <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30" target="_blank">Location</a> que apunte a la URL del nuevo recurso.<br /> <a name="9"></a>
    </p>
    
    <h2>
      9. ¿Deberías HATEOAS?
    </h2>
    
    <p>
      Hay muchas opiniones variadas sobre si el consumidor de la API debería crear hipervínculos o si los hipervínculos deberían ser provistos por la API. Los principios de diseño RESTful especifican <a href="https://blog.apigee.com/detail/hateoas_101_introduction_to_a_rest_api_style_video_slides" target="_blank">HATEOAS</a>, el cual aproximadamente declara que esa interacción con un <em>endpoit</em> debería definirse en la metadata que viene con la respuesta, y no basada en información que va por fuera de la banda (<em>out-of-band</em>).<br /> A pesar de que la web generalmente trabaja con los principios HATEOAS (ej, cuando vamos a una portada y seguimos hipervínculos basados en lo que vemos en la página), no creo que estemos listos para HATEOAS en la API todavía. Cuando navegamos en un sitio, las decisiones sobre qué hipervínculos van a ser clickeados se hacen durante la ejecución. Sin embargo, con una API, las decisiones como qué peticiones van a ser enviadas son tomadas cuando el código de integración de la API es escrito, no en tiempo de ejecución. ¿Podrían las decisiones ser aplazadas al tiempo de ejecución? Seguro, de todas maneras, no hay mucho que ganar bajando esa ruta al código ya que el código no estaría disponible para manejar cambios significantes en la API sin romperse. Esto significa que HATEOAS es prometedor pero no está listo para ser protagonista todavía. Algún esfuerzo más tiene que ser realizado para definir los estándars y herramientas al rededor de estos principios para que su potencial sea completamente aprovechado.<br /> Por ahora es mejor asumir que el usuario tiene acceso a la documentación e incluir los identificadores de recursos en la respuesta, la cual el consumidor de la API usará cuando crea hipervínculos. Hay un par de ventajas en utilizar los identificadores &#8211; los datos que viajan sobre la red son minimizados y los datos almacenados por los consumidores de la API también son minimizados (ya que son guardados los identificadores cortos, en vez de las URLs que contienen los identificadores).<br /> Además, dado que este post es partidario de incluir los números de versión en la URL, tiene más sentido a largo plazo para el consumidor de la API almacenar los identificadores y no las URLs. Después de todo, el identificador es estable versión por versión pero la URL que representa no lo es!<br /> <a name="10"></a>
    </p>
    
    <h2>
      10. Sólo respuestas JSON
    </h2>
    
    <p>
      Es tiempo de dejar XML atras en las APIs. Es verborrágico, es difícil de parsear, dificil de leer, su modelo de datos es incompatible con la mayoría de los modelos de datos de los lenguajes de programación y sus ventajas son irrelevantes cuando tus necesidades primarias de respuesta son serializaciones de una representación de datos interna.<br /> No voy a poner mucho esfuerzo en explicar las razones de lo dicho arriba si se puede ver cómo otros (<a href="http://apiblog.youtube.com/2012/12/the-simpler-yet-more-powerful-new.html" target="_blank">Youtube</a>, <a href="https://dev.twitter.com/docs/api/1.1/overview#JSON_support_only" target="_blank">Twitter</a> & <a href="http://developers.blog.box.com/2012/12/14/v2_api/" target="_blank">Box</a>) ya han comenzado el éxodo XML.<br /> Simplemente te dejaré que veas las gráficas de Google Trends (<a href="http://www.google.com/trends/explore?q=xml+api#q=xml%20api%2C%20json%20api&cmpt=q" target="_blank">XML API vs JSON API</a>) para que medites:
    </p>
    
    <h4>
      <a href="http://elbauldelprogramador.com/content/uploads/2014/01/201305-xml-vs-json-api.png"><img class="alignleft size-full wp-image-2241" alt="201305-xml-vs-json-api" src="http://elbauldelprogramador.com/content/uploads/2014/01/201305-xml-vs-json-api.png" width="817" height="237" /></a>
    </h4>
    
    <p>
      No obstante, si tu base de clientes consiste en un gran número de clientes empresariales, puedes tener que dar soporte XML de todas maneras. Si debes hacerlo, te surgirá una nueva pregunta:
    </p>
    
    <p>
      <strong>¿Debería cambiar el tipo del contenido basado en encabezados Accept o basado en la URL?</strong> Para garantizar la explorabilidad del navegador, debería basarse en la URL. La opción más razonable debería ser agregar una extensión <em>.xml</em> o <em>.json</em> al endpoint de la URL .
    </p>
    
    <p>
      <a name="11"></a>
    </p>
    
    <h2>
      11. snake_case vs camelCase para el nombre de los campos
    </h2>
    
    <p>
      Si estás usando JSON (JavaScript Object Notation) como tu principal formato de representación, la forma &#8220;correcta&#8221; de hacer las cosas es seguir la convención de nombres de JavaScript &#8211; y esto sinifica camelCase para el nombre de los campos! Si entonces optas por el camino de construir librerias cliente en varios lenguajes, lo mejor es usar la convención de nombres correspondiente al idioma &#8211; camelCase para C# y Java, snake_case para python y ruby.
    </p>
    
    <p>
      Para pensar: Siempre sentí que <a href="http://en.wikipedia.org/wiki/Snake_case" target="_blank">snake_case</a> es más fácil para leer que la convención <a href="http://en.wikipedia.org/wiki/CamelCase" target="_blank">camelCase</a> de JavaScript. Pero no tenía ninguna evidencia para respaldar esta &#8220;sensación&#8221;, hasta ahora. Basado en un <a href="http://ieeexplore.ieee.org/xpl/articleDetails.jsp?tp=&arnumber=5521745" target="_blank">estudio visual sobre camelCase y snake_case</a> (<a href="http://www.cs.kent.edu/~jmaletic/papers/ICPC2010-CamelCaseUnderScoreClouds.pdf" target="_blank">PDF</a>) del 2010, <strong>snake_case es un 20% más facil de leer que camelCase</strong>! Este impacto en legibilidad puede afectar la explorabilidad de la API y los ejemplos de la documentación.<br /> Muchas JSON APIs populares usan snake_case. Sospecho que esto se debe a la serialización de librerías que siguen las convenciones de nombres de los lenguajes subyacentes que utilizan. Tal vez necesitamos tener librerías de serialización JSON que manejen las transformaciones de convenciones de nombres.<br /> <a name="12"></a>
    </p>
    
    <h2>
      12. Pretty print por default y asegura que gzip sea soportado
    </h2>
    
    <p>
      Una API que provee salida con compresión de espacios en blanco no es muy divertida de ver desde un navegador. Aunque algún tipo de parámetro de consulta (como<em> ?pretty=true</em>) puede ser provisto para activar pretty printing, una API que utiliza pretty print por default es mucho más accesible. El costo de transferencia de datos extra es insignificante, especialmente cuando lo comparas con el costo de no implementar gzip.
    </p>
    
    <p>
      Considera algunos casos de uso: ¿Qué pasa si un consumidor de la API está debuggeando y en su código imprime los datos recibidos de la API? &#8211; Serán legibles por default. O si el consumidor graba en la URL el código que fue generando y lo interpreta directamente desde el navegador &#8211; Será legible por default. Éstos son pequeños detalles. Pequeños detalles que hacen a una API agradable de usar!
    </p>
    
    <p>
      <strong>Pero, ¿qué pasa con toda la transferencia extra de datos?</strong><br /> Veamos esto con un ejemplo del mundo real. He bajado un poco de datos de la <a href="https://api.github.com/users/veesahni" target="_blank">API de GitHub</a>, la cual usa pretty print por default. También estuve haciendo algunas comparaciones con gzip:
    </p>
    
    <pre lang="bash">$ curl https://api.github.com/users/veesahni > with-whitespace.txt
$ ruby -r json -e 'puts JSON JSON.parse(STDIN.read)' &lt; with-whitespace.txt > without-whitespace.txt
$ gzip -c with-whitespace.txt > with-whitespace.txt.gz
$ gzip -c without-whitespace.txt > without-whitespace.txt.gz</pre>
    
    <p>
      Los archivos de salida tienen los siguientes tamaños:
    </p>
    
    <ul>
      <li>
        <em>without-whitespace.txt</em> &#8211; 1252 bytes
      </li>
      <li>
        <em>with-whitespace.txt</em> &#8211; 1369 bytes
      </li>
      <li>
        <em>without-whitespace.txt.gz</em> &#8211; 496 bytes
      </li>
      <li>
        <em>with-whitespace.txt.gz</em> &#8211; 509 bytes
      </li>
    </ul>
    
    <p>
      En este ejemplo, el caracter en blanco incrementó el tamaño de la salida en un 8.5% cuando gzip no entró en juego y un 2.6% cuando utilizamos gzip. Por otro lado, el acto de comprimir con<strong> gzip en sí mismo provee un 60% de ahorro de ancho de banda</strong>. Debido a que el costo del pretty print es relativamente pequeño, es mejor utilizar pretty print por default y asegurar que la compresión con gzip esté soportada.
    </p>
    
    <p>
      Para enfatizar este punto, Twitter descubrió que hay un <a href="https://dev.twitter.com/blog/announcing-gzip-compression-streaming-apis" target="_blank">80% de ahorro (en algunos casos) </a>cuando habilita la compresión gzip en su API Streaming. Stack Exchange fue más lejos, nunca devuelve una respuesta que no esté comprimida!<br /> <a name="13"></a>
    </p>
    
    <h2>
      13. No uses un envoltorio por default, pero posibilitalo cuando sea necesario
    </h2>
    
    <p>
      Muchas APIs empaquetan sus respuestas en envoltorios como este:
    </p>
    
    <pre lang="python">{
   "data" : {
      "id" : 123,
      "name" : "John"
   }
}</pre>
    
    <p>
      Hay un par de justificaciones para hacer esto &#8211; facilita incluir metadata adicional o información de paginación, algunos clientes REST no permiten fácil acceso a los encabezados HTTP y las peticiones <a href="http://en.wikipedia.org/wiki/JSONP" target="_blank">JSONP</a> no tienen acceso a sus encabezados. Sin embargo con standards que están siendo rápidamente adoptados como <a href="http://www.w3.org/TR/cors/" target="_blank">CORS</a> y <a href="http://tools.ietf.org/html/rfc5988#page-6" target="_blank">Link header from RFC5988</a>, empaquetar se está volviendo innecesario.<br /> Podemos profundizar a futuro la API manteniéndola sin empaquetamiento por default y empaquetando sólo en casos excepcionales.<br /> <strong>¿Cómo debería usarse un envoltorio en casos excepcionales?</strong><br /> Hay 2 situaciones donde un envoltorio es realmente necesario &#8211; si la API necesita soportar peticiones cross domain sobre JSONP o si el cliente es incapaz de trabajar con encabezados HTTP.<br /> Las peticiones JSONP vienen con un parámetro adicional de consulta (usualmente llamado <em>callback</em> o <em>jsonp</em>) representando el nombre de la función callback. Si este parámetro está presente, la API debería cambiarse a un modo completo de empaquetamiento donde siempre responda con un código de status HTTP 200 y pase el código de status real dentro de la respuesta JSON. Cualquier encabezado HTTP adicional que debería pasar a través de la respuesta debería ser mapeado a los campos JSON, como se ve a continuación:
    </p>
    
    <pre lang="javascript">callback_function({
    status_code: 200,
    next_page: "https://..",
    response: {
        ... actual JSON response body ... 
    }
})</pre>
    
    <p>
      De forma similar, para soportar clientes con HTTP limitado, habilita un parámetro especial de consulta ?envelope=true, el cual debería disparar un empaquetamiento full (sin la función callback JSONP).
    </p>
    
    <p>
      <a name="14"></a>
    </p>
    
    <h2>
      14. Cuerpos HTML POST, PUT & PATCH codificados en JSON
    </h2>
    
    <p>
      Si estás siguiendo el objetivo de este artículo, entonces has adoptado JSON para todas las salidas de la API. Ahora consideremos JSON para la entrada de la API.<br /> Muchas APIs usan URL cifradas en sus cuerpos de las peticiones de la API. El cifrado de URL es exactamente lo que suena &#8211; los cuerpos de la petición donde los pares clave-valor están cifrados usando las mismas convenciones que uno usaría para cifrar datos en los parámetros de consulta de URL. Esto es simple, ampliamente soportado y deja el trabajo hecho.
    </p>
    
    <p>
      Sin embargo, el cifrado de URL tiene algunos inconvenientes que lo hacen problemático. No tiene el concepto de tipos de dato. Esto obliga a la API a interpretar cadenas de caracteres y transformarlas en tipos numéricos (por ej integer) o booleanos. Además, no tiene un concepto real de estructura jerárquica.<br /> Aunque hay algunas convenciones que pueden construir estructuras que no siguen el par clave-valor (como agregar [] a una clave para representar un arreglo), esto no tiene comparación con la estructura nativa jerárquica de JSON.<br /> Si la API es simple, cifrar la URL puede ser suficiente. Sin embargo, APIs complejas deberían apegarse a JSON para sus entradas a la API. De cualquier manera, elige una y se consistente en toda la API.<br /> Una API que acepta peticiones POST, PUT y PATCH con cifrado JSON debería también requerir en el encabezado <em>Content-Type</em> seteado con <em>application/json</em> o lanzar un código de status HTTP: 415 Unsopported Media Type.
    </p>
    
    <p>
      <a name="15"></a>
    </p>
    
    <h2>
      15. Paginación
    </h2>
    
    <p>
      Las APIs con preferencia &#8220;envelope&#8221; (envoltorio) típicamente incluyen los datos de paginación dentro del mismo envoltorio. Y no los culpo &#8211; hasta hace poco, no había mejores opciones. La forma correcta de incluir los detalles de paginación hoy en día es utilizando el <a href="http://tools.ietf.org/html/rfc5988#page-6" target="_blank">encabezado Link introducido por RFC 5988</a>.
    </p>
    
    <p>
      Una API que usa el encabezado Link puede devolver un set de hipervínculos listos para que el consumidor de la API no tenga que construir los hipervínculos por su propia cuenta. Esto es especialmente importante cuando la paginación está<a href="https://developers.facebook.com/docs/reference/api/pagination/" target="_blank"> basada en el cursor</a>. Aquí hay un ejemplo de un encabezado Link utilizado correctamente, obtenido de la documentación de <a href="http://developer.github.com/v3/#pagination" target="_blank">GitHub</a>:
    </p>
    
    <pre>Link: &lt;https://api.github.com/user/repos?page=3&per_page=100&gt;; rel="next", &lt;https://api.github.com/user/repos?page=50&per_page=100&gt;; rel="last"</pre>
    
    <p>
      Pero esto no es una solución completa para muchas APIs que quieren devolver información adicional de paginación, por ejemplo el conteo del total de resultados disponibles. Una API que requiere enviar un contador puede usar un encabezado HTTP personalizado como <em>X-Total-Count</em>.<br /> <a name="16"></a>
    </p>
    
    <h2>
      <strong>16. Representaciones de recursos relacionados a los datos solicitados mediante carga automática</strong>
    </h2>
    
    <p>
      Hay muchos casos donde un consumidor de la API necesita cargar datos relacionados (o referenciados) con el recurso que se está solicitando. En vez de pedir que el consumidor haga una solicitud a la API reiteradas veces por esta información, sería mucho más eficiente permitir que los datos relacionados sean devueltos y cargados a través del recurso original en demanda.
    </p>
    
    <p>
      De todos modos, como <a href="http://idbentley.com/blog/2013/03/14/should-restful-apis-include-relationships/" target="_blank">esto va contra algunos principios RESTful</a>, podemos minimizar nuestras desviaciones haciendo entonces el parámetro de consulta <em>embed</em> (o <em>expand</em>).
    </p>
    
    <p>
      En este caso, <em>embed</em> podría ser una lista separada por comas de campos a ser embebidos. La notación con punto puede ser usada para referir sub-campos. Por ejemplo:
    </p>
    
    <pre>GET /ticket/12?embed=customer.name,assigned_user</pre>
    
    <p>
      Esto debería devolver un ticket con detalles adicionales embebidos, como:
    </p>
    
    <pre lang="python">{
 "id" : 12,
 "subject" : "I have a question!",
 "summary" : "Hi, ....",
 "customer" : {
 "name" : "Bob"
 },
 assigned_user: {
 "id" : 42,
 "name" : "Jim",
 }
}</pre>
    
    <p>
      Por supuesto, la habilidad de implementar algo así realmente depende de la complejidad interna. Este tipo de embebido puede facilmente resultar en un problema de <a href="http://stackoverflow.com/questions/97197/what-is-the-n1-selects-issue" target="_blank">N+1 select</a>.
    </p>
    
    <p>
      <a name="17"></a>
    </p>
    
    <h2>
      17. Sobreescribiendo el método HTTP
    </h2>
    
    <p>
      Algunos clientes HTTP pueden trabajar solo con peticiones simples GET y POST. Para mejorar la accesibilidad a estos clientes limitados, la API necesita proveer una forma de sobreescribir el método HTTP.
    </p>
    
    <p>
      Aunque no hay ningún estandard fuerte aquí, la convención popular es aceptar un encabezado de petición <em>X-HTTP-Method-Override </em>con un valor de cadena que contenga PUT, PATCH o DELETE.
    </p>
    
    <p>
      Nota que sobreescribir el encabezado debería ser aceptado en peticiones POST. Las peticiones GET nunca deberían <a href="http://programmers.stackexchange.com/questions/188860/why-shouldnt-a-get-request-change-data-on-the-server" target="_blank">cambiar datos en el servidor</a>!<br /> <a name="18"></a>
    </p>
    
    <h2>
      18. Limitación de tráfico por ratio (Rate limiting)
    </h2>
    
    <p>
      Para prevenir abusos, una práctica estandard es agregar algún tipo de límite de tráfico a la API. <a href="http://tools.ietf.org/html/rfc6585" target="_blank">RFC 6585</a> introduce el código de status HTTP <a href="http://tools.ietf.org/html/rfc6585#section-4" target="_blank">429 Too Many Requests</a> para controlar esto.<br /> Sin embargo, puede ser muy útil notificar al consumidor de sus límites antes de que se encuentre con ellos. Este es un área en la que actualmente faltan los standards pero existe una cantidad de<a href="http://stackoverflow.com/questions/16022624/examples-of-http-api-rate-limiting-http-response-headers" target="_blank"> convenciones populares usando encabezados de respuesta HTTP.</a><br /> Minimamente, incluye los siguientes encabezados (usando las <a href="https://dev.twitter.com/docs/rate-limiting/1.1" target="_blank">convenciones de nombres </a>de Twitter ya que los encabezados tipicamente no tienen capitalizacion de las palabras del medio):
    </p>
    
    <ul>
      <li>
        <em>X-Rate-Limit-Limit</em> &#8211; El numero de peticiones permitidas en el período actual
      </li>
      <li>
        <em>X-Rate-Limit-Remaining</em> &#8211; El número de peticiones que faltan en el período actual
      </li>
      <li>
        <em>X-Rate-Limit-Reset</em> &#8211; El número de segundos restantes en el período actual
      </li>
    </ul>
    
    <p>
      <strong>¿Por qué se usa el número de segundos restantes en vez de un time stamp para X-Rate-Limit-Reset?</strong>
    </p>
    
    <p>
      Un timestamp contiene una cantidad de información útil pero innecesaria como la fecha y probablemente el time-zone. Un consumidor de la API realmente quiere saber cuándo puede enviar la petición nuevamente, y el número de segundos responde a esta pregunta con el mínimo procesamiento adicional al final. Además escapa a problemas relacionados con<a href="http://en.wikipedia.org/wiki/Clock_skew" target="_blank"> desvíos de reloj</a>.
    </p>
    
    <p>
      Algunas APIs usan un timestamp de UNIX (segundos desde la fecha standard 1/1/1970) para X-Rate-Limit-Reset. ¡No hagas lo mismo!
    </p>
    
    <p>
      <strong>¿Por qué es una mala práctica usar el timestamp UNIX para X-Rate-Limit-Reset?</strong>
    </p>
    
    <p>
      La <a href="http://www.w3.org/Protocols/rfc2616/rfc2616.txt" target="_blank">spec de HTTP</a> ya <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3" target="_blank">especifica</a> el uso del<a href="http://www.ietf.org/rfc/rfc1123.txt" target="_blank"> formato de fecha RFC 1123 </a>(actualmente usado en los encabezados HTTP <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.18" target="_blank">Date</a>,<a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.25" target="_blank"> If-Modified-Since </a>y <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.29" target="_blank">Last-Modified</a>). Si fuéramos a especificar un nuevo encabezado HTTP que tome un timestamp de algún tipo, debería seguir las convenciones RFC 1123 en vez de usar timestamps UNIX.<br /> <a name="19"></a>
    </p>
    
    <h2>
      19. Autenticación
    </h2>
    
    <p>
      Una API RESTful debería ser stateless (sin estado). Esto significa que la petición de autenticación no debería depender de cookies o sesiones. En lugar de ello, cada petición debería venir con algún tipo de credencial de autorización.
    </p>
    
    <p>
      Siempre que se use SSL, las credenciales de autenticación pueden ser simplificadas a un token de acceso generado de forma aleatoria, que es entregado en el campo de nombre de usuario de HTTP Basic Auth.<br /> Lo grandioso de esto es que es completamente navegable con un explorador &#8211; éste simplemente abriría un popup pidiéndote que ingreses las credenciales si recibe un código de status <em>401 Unauthorized</em> desde el servidor.
    </p>
    
    <p>
      De todos modos, este método de autenticación token-over-basic-auth (token sobre autenticación basica) es sólo aceptable en los casos en que sea práctico tener la posibilidad de que el usuario copie un token de una interface de administración del entorno del consumidor de la API.
    </p>
    
    <p>
      En los casos donde no sea posible, <a href="http://oauth.net/2/" target="_blank">OAuth 2 </a>debería ser usado para facilitar la transferencia del token seguro a terceros. OAuth 2 usa <a href="http://tools.ietf.org/html/rfc6750" target="_blank">tokens Bearer </a>y además depende de SSL para su encriptación de transporte subyacente.
    </p>
    
    <p>
      Una API que necesita soporte JSONP necesitará un tercer método de autenticación, ya que las peticiones JSONP no pueden enviar credenciales HTTP Basic Auth ni Bearer tokens. En este caso, puede utilizarse un parámetro especial de consulta &#8220;access_token&#8221;. Nota: hay un problema de seguridad inherente si se usa un parametro de consulta para el token ya que la mayoría de los servidores web almacenan los parámetros de consulta en sus logs.<br /> Para lo que nos interesa, los tres métodos de arriba son sólo formas de transportar el token a través de la frontera de la API. El verdadero token subyacente mismo podría ser idéntico.<br /> <a name="20"></a>
    </p>
    
    <h2>
      20. Cacheo
    </h2>
    
    <p>
      HTTP provee un framework de cacheo incluido! Todo lo que tienes que hacer es incluir algunos encabezados adicionales en la respuesta de salida y hacer una pequeña validación cuando recibes algún encabezado de petición de entrada.
    </p>
    
    <p>
      Hay 2 alcances: <a href="http://en.wikipedia.org/wiki/HTTP_ETag" target="_blank">ETag</a> y<a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.29" target="_blank"> Last-Modified</a><br /> <strong>ETag</strong>: Cuando generas una petición, incluye un encabezado HTTP ETag conteniendo un hash o checksum de la representación. Este valor debería cambiar cada vez que la salida cambia. Ahora, si una petición de entrada HTTP contiene un encabezado<em> If-None-Match</em> con un valor ETag, la API debería devolver un código de status <em>304 Not Modified</em> en lugar de la salida del recurso.
    </p>
    
    <p>
      <strong>Last-Modified</strong> (Último modificado): Básicamente funciona como ETag, excepto en que usa timestamps. El encabezado de respuesta <em>Last-Modified</em> contiene un timestamp en formato <a href="http://www.ietf.org/rfc/rfc1123.txt" target="_blank">RFC 1123</a> el cual es validado contra<em> If-Modified-Since.</em> Nótese que la especificación de HTTP ha tenido <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3" target="_blank">3 formatos de fecha diferentes aceptables </a>y el servidor debería estar preparado para aceptar cualquiera de ellos.<br /> <a name="21"></a>
    </p>
    
    <h2>
      21. Errores
    </h2>
    
    <p>
      Sencillamente como una página HTML de error muestra un mensaje de error útil a un visitante, una API debería proveer un mensaje de error útil en un formato conocido. La representación de un error debería no ser diferente a la representación de cualquier recurso, con su propio set de campos.
    </p>
    
    <p>
      La API debería devolver siempre códigos de status HTTP prácticos. Los errores de la API generalmente caen dentro de 2 tipos: la serie 400 de códigos de status para problemas en el cliente y la serie 500 de códigos de status para problemas en el servidor. Como mínimo, la API debería estandarizar que todos los errores de la serie 400 vengan en formato de error JSON. Si es posible (por ejemplo si los balanceadores de carga y proxies reversos pueden crear cuerpos de error personalizables), este debería extender la serie de códigos de error 500.
    </p>
    
    <p>
      El cuerpo de un error JSON debería proveer algunas cosas para el desarrollador &#8211; un mensaje de error útil, un código de error único (que pueda ser buscado para más detalles en la documentación) y una descripción detallada. Una representación de salida JSON de esta forma podría ser:
    </p>
    
    <pre lang="python">{
  "code" : 1234,
  "message" : "Algo malo ocurrió :(",
  "description" : "Mas detalles del error aqui"
 }</pre>
    
    <p>
      Los errores de validación para peticiones PUT, PATCH y POST necesitarán un breakdown en el campo. Esto se modela mejor utilizando un código de error de alto nivel arreglado para fallas de validación que proveen detalles del error en el campo adicional <em>error</em>, como por ejemplo:
    </p>
    
    <pre lang="python">{
  "code" : 1024,
  "message" : "Validacion fallida",
  "errors" : [
    {
      "code" : 5432,
      "field" : "nombre",
      "message" : "El campo nombre no puede tener caracteres numericos"
    },
    {
      "code" : 5622,
      "field" : "password",
      "message" : "Password cannot be blank"
    }
  ]
 }</pre>
    
    <p>
      <a name="22"></a>
    </p>
    
    <h2>
      22. Códigos de estado HTTP
    </h2>
    
    <p>
      HTTP define un <a href="http://en.wikipedia.org/wiki/List_of_HTTP_status_codes" target="_blank">set de significativos códigos de status</a> que pueden ser devueltos por la API. Éstos pueden ser nivelados para ayudar a los consumidores de la API dirigir sus respuestas apropiadamente. A continuación les dejo una lista de los que definitivamente deberías utilizar:
    </p>
    
    <ul>
      <li>
        <em>200 OK -</em> Respuesta a un exitoso GET, PUT, PATCH o DELETE. Puede ser usado también para un POST que no resulta en una creación.
      </li>
      <li>
        <em>201 Created</em> &#8211; [Creada] Respuesta a un POST que resulta en una creación. Debería ser combinado con un <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30" target="_blank">encabezado Location</a>, apuntando a la ubicación del nuevo recurso.
      </li>
      <li>
        <em>204 No Content</em> &#8211; [Sin Contenido] Respuesta a una petición exitosa que no devuelve un body (como una petición DELETE)
      </li>
      <li>
        <em>304 Not Modified</em> &#8211; [No Modificada] Usado cuando el cacheo de encabezados HTTP está activo
      </li>
      <li>
        <em>400 Bad Request</em> &#8211; [Petición Errónea] La petición está malformada, como por ejemplo, si el contenido no fue bien parseado.
      </li>
      <li>
        <em>401 Unauthorized</em> &#8211; [Desautorizada] Cuando los detalles de autenticación son inválidos o no son otorgados. También útil para disparar un popup de autorización si la API es usada desde un navegador.
      </li>
      <li>
        <em>403 Forbidden</em> &#8211; [Prohibida] Cuando la autenticación es exitosa pero el usuario no tiene permiso al recurso en cuestión.
      </li>
      <li>
        <em>404 Not Found</em> &#8211; [No encontrada] Cuando un recurso no existente es solicitado.
      </li>
      <li>
        <em>405 Method Not Allowed</em> &#8211; [Método no permitido] Cuando un método HTTP que está siendo pedido no está permitido para el usuario autenticado.
      </li>
      <li>
        <em>410 Gone</em> &#8211; [Retirado] Indica que el recurso en ese endpoint ya no está disponible. Útil como una respuesta en blanco para viejas versiones de la API
      </li>
      <li>
        <em>415 Unsupported Media Type</em> &#8211; [Tipo de contenido no soportado] Si el tipo de contenido que solicita la petición es incorrecto
      </li>
      <li>
        <em>422 Unprocessable Entity</em> &#8211; [Entidad improcesable] Utilizada para errores de validación
      </li>
      <li>
        <em>429 Too Many Requests</em> &#8211; [Demasiadas peticiones] Cuando una petición es rechazada debido a la tasa límite .
      </li>
    </ul>
    
    <h2>
      En conclusión
    </h2>
    
    <p>
      Una API es una interfaz de usuario para desarrolladores. Enfoca tu esfuerzo en asegurar que no sea sólo usable a nivel funcional sino también amigable.
    </p>
    
    <h4>
      Referencias
    </h4>
    
    <em>Vinay Sahni</em> <strong>|</strong> <a href="http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api" target="_blank">Best Practices for Designing a Pragmatic RESTful API</a>
  </div>
</div>

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Buenas prácticas para el Diseño de una API RESTful Pragmática+http://elbauldelprogramador.com/buenas-practicas-para-el-diseno-de-una-api-restful-pragmatica/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/buenas-practicas-para-el-diseno-de-una-api-restful-pragmatica/&t=Buenas prácticas para el Diseño de una API RESTful Pragmática+http://elbauldelprogramador.com/buenas-practicas-para-el-diseno-de-una-api-restful-pragmatica/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Buenas prácticas para el Diseño de una API RESTful Pragmática+http://elbauldelprogramador.com/buenas-practicas-para-el-diseno-de-una-api-restful-pragmatica/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
---
id: 2558
title: Cómo mapear json a objetos Java con Jackson ObjectMapper
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=2558
permalink: /como-mapear-json-a-objetos-java-con-jackson-objectmapper/
categories:
  - Java
tags:
  - desserializar objetos json java
  - ejemplo jackson json java
  - fasterxml
  - jackson
  - jackson json example
  - jackson json example java
  - mapear json
  - mapear objetos java
  - objectmapper
  - serializar objetos json java
---
Hoy vamos a hablar de cómo usar la librería *Jackson* para mapear fácilmente un *Json* a objetos Java.

## Declarar dependencia

El primer paso es declarar la dependencia en el proyecto, en éste caso usando *maven*, en el fichero `pom.xml` añadimos:

<pre lang="xml">&lt;dependency>
    &lt;groupId>com.fasterxml.jackson.core&lt;/groupId>
    &lt;artifactId>jackson-databind&lt;/artifactId>
    &lt;version>2.4.4&lt;/version>
  &lt;/dependency>
</pre>

Hecho esto, ya es posible usar la librería en el proyecto.

## Introducción a Jackson

Veamos una guía de uso rápido de jackson. Para los siguientes ejemplos supondremos la siguiente clase:

<!--more-->

<pre lang="java">// Nota: Para atributos públicos, no es necesario usar getters y setters.
public class MiClase {
  public String nombre;
  public int edad;
  // Nota: Si los campos son private o protected, es obligatorio usar getters y setters.
  // Es recomendable crear el constructor por defecto
}
</pre>

Supongamos también el siguiente json, almacenado en un fichero `mijson.json`:

<pre lang="json">{
   "nombre":"Alicia", 
   "edad":13
}
</pre>

Es necesario crear un `ObjectMapper`, y lo típico es hacerlo estático para re-utilizarlo a lo largo de la aplicación. Un buen lugar para él sería un clase `Constant` y declarar el `ObjectMapper` así:

<pre lang="java">public static final ObjectMapper JSON_MAPPER = new ObjectMapper();
</pre>

### Json a Objeto Java (Des-Serializar)

Para des-serializar el `json` y crear el objeto en Java:

<pre lang="java">MiClase objeto = JSON_MAPPER.readValue(new File("mijson.json", MiClase.class);
// o 
MiClase objeto = JSON_MAPPER.readValue(new URL("http://ruta/a/mijson.json", MiClase.class);
</pre>

### Objeto Java a Json (Serializar)

Para realizar el proceso inverso, basta con:

<pre lang="java">JSON_MAPPER.writeValue(new File("mijson.json"), objeto);
// ó:
byte[] jsonBytes = JSON_MAPPER.writeValueAsBytes(objeto);
// ó:
String jsonString = JSON_MAPPER.writeValueAsString(objeto);
</pre>

### Generalizar el tipo de objeto a des-serializar

Al trabajar con una [API][1], serializar y des-serializar objetos es una tarea común, una forma de generalizar el proceso puede ser la siguiente.

Supongamos que nuestra api devuelve arrays de objetos, por ejemplo una lista de Personas, una lista de productos etc. El modelo en Java sería el siguiente:

<pre lang="java">public class Persona {

    private String Nombre;
    private String Apellidos;
    private int DNI;

    public Persona() {}
    
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }
}
</pre>

<pre lang="java">public class Producto {
    private String Nombre;
    private String Modelo;
    private int precio;
    private float valoracion;

    public Producto() {}
    
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public float getValoracion() {
        return valoracion;
    }

    public void setValoracion(float valoracion) {
        this.valoracion = valoracion;
    }
}
</pre>

Los arrays en json:

<pre lang="json">// Personas
[
   {
      "Nombre":"Bob",
      "Apellidos":"BobBob",
      "DNI": 123456789
   },
   {
      "Nombre":"Alice",
      "Apellidos":"Alice",
      "DNI": 123456789
   },
   {
      "Nombre":"Foo",
      "Apellidos":"bar",
      "DNI": 123456789
   }
]
// Productos
[
   {
      "Nombre":"Tele",
      "Modelo":"modelo1",
      "Precio": 120,
      "Valoracion": 2.5
   },
   {
      "Nombre":"Tele2",
      "Modelo":"Modelo2",
      "Precio": 150,
      "Valoracion": 5
   },
   {
      "Nombre":"Tele3",
      "Modelo":"Modelo3",
      "Precio": 520,
      "Valoracion": 5
   }
]
</pre>

Con estos datos, queremos des-serializar el `json` en un `ArrayList` del tipo de clase que sea, en éste caso `ArrayList<Personas` y `ArrayList<Producto>`. La forma **NO** genérica de hacerlo sería:

<pre lang="java">ArrayList&lt;Persona> personas = JSON_MAPPER.readValue(new File("personas.json"),
                    JSON_MAPPER.getTypeFactory().constructCollectionType(ArrayList.class, Persona.class));

// Para productos

ArrayList&lt;Producto> productos = JSON_MAPPER.readValue(new File("productos.json"),
                    JSON_MAPPER.getTypeFactory().constructCollectionType(ArrayList.class, Producto.class));
</pre>

Ahora bien, si tenemos más modelos, a parte de `Personas` y `Productos`, y normalmente, los `json` se obtienen mediante la *API*, vamos a repetir un montón de código. Podríamos crear un método genérico para mapear `json` a objetos java, como el siguiente:

<pre lang="java">public static &lt;T> List&lt;T> getList(String url, Class&lt;T> clazz) {

   HttpClient client = HttpClientBuilder.create().build();
   HttpGet getRequest = new HttpGet(url);
   getRequest.setHeader(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON);

   List&lt;T> data = null;

   HttpResponse response;
   try {
      response = client.execute(getRequest);
      data = Constants.JSON_MAPPER.readValue(response.getEntity().getContent(),
             JSON_MAPPER.getTypeFactory().constructCollectionType(ArrayList.class, clazz));
   } catch (IOException ex) {
      logger.error("Error retrieving  " + clazz.getName() + " " + ex.toString());
   }
   return data;
}
</pre>

Éste método se usaría así:

<pre lang="java">// Para personas
ArrayList&lt;Persona> personas = getList(URL DE LA API PARA OBTENER PERSONAS, Persona.class);
// Para productos
ArrayList&lt;Producto> personas = getList(URL DE LA API PARA OBTENER PRODUCTOS, Producto.class);
</pre>

## Conclusión

La librería *Jackson* de *fasterXML* ofrece muchísimas más cosas de las vistas aquí. El uso de anotaciones por ejemplo permite ignorar ciertos valores de un modelo, no permitir nulos etc, para más información visita las referencias.

#### Referencias

*Jackson databind* **|** <a href="https://github.com/FasterXML/jackson-databind/" target="_blank">github.com</a> 

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Cómo mapear json a objetos Java con Jackson ObjectMapper+http://elbauldelprogramador.com/como-mapear-json-a-objetos-java-con-jackson-objectmapper/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/como-mapear-json-a-objetos-java-con-jackson-objectmapper/&t=Cómo mapear json a objetos Java con Jackson ObjectMapper+http://elbauldelprogramador.com/como-mapear-json-a-objetos-java-con-jackson-objectmapper/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Cómo mapear json a objetos Java con Jackson ObjectMapper+http://elbauldelprogramador.com/como-mapear-json-a-objetos-java-con-jackson-objectmapper/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/buenas-practicas-para-el-diseno-de-una-api-restful-pragmatica/ "Buenas prácticas para el Diseño de una API RESTful Pragmática"
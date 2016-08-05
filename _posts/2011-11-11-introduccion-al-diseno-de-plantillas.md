---
title: Introducción al diseño de plantillas personalizadas para móviles en Blogger

layout: post.amp
permalink: /introduccion-al-diseno-de-plantillas/
categories:
  - curiosidades
  - internet
  - noticias
main-class: "articulos"
color: "#F57C00"
---
He visto en el blog de blogger que dan la posibilidad de crear una plantilla personalizada de nuestro blog para moviles.

Para empezar a trabajar tenemos que ir a la la sección plantilla:

<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-kEQMaYxebJs/Tq-eMEEQTPI/AAAAAAAAARk/OtL411nW0l8/s1600/Screen%2Bshot%2B2011-10-20%2Bat%2B11.14.31%2BAM.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="248" width="429" src="https://2.bp.blogspot.com/-kEQMaYxebJs/Tq-eMEEQTPI/AAAAAAAAARk/OtL411nW0l8/s1600/Screen%2Bshot%2B2011-10-20%2Bat%2B11.14.31%2BAM.png" /></a>
</div>

Le damos al engranaje que aparece debajo de las plantillas para móviles, donde escogeremos el tipo de plantilla que queremos, nosotros le damos a personalizado:

<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-dyyH6l2heQI/Tp5hR4sdzdI/AAAAAAAAAPs/HkYfZ8kpAwQ/s320/mobile_template_picker_pulldown.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  height="287" width="320" src="https://1.bp.blogspot.com/-dyyH6l2heQI/Tp5hR4sdzdI/AAAAAAAAAPs/HkYfZ8kpAwQ/s320/mobile_template_picker_pulldown.png" /></a>
</div>

HEcho esto, podemos empezar a diseñar nuestra plantilla para móviles. Editando la plantilla normal del blog. Por ejemplo, si tenemos gadgets en el blog, podemos elegir si se mostrarán en la versión móvil o no. Esto lo conseguimos mediante un nuevo atributo llamado *mobile*, que pertenece a la la etiqueta *<b:widget>, y puede tomar los valores &#8216;default&#8217; &#8216;yes&#8217;, &#8216;no&#8217; ó &#8216;only&#8217;.
<p>
  Vamos a ver un ejemplo con el gadget Archivo del blog:
</p>
<p>
<br /><!--ad-->
</p>
<p>
  Por defecto no se mostrará en la versión movil:
</p>

```xml

</b:widget><b:widget id="BlogArchive1" title="Blog Archive" type="BlogArchive">

```


<p>
  Si queremos que se muestre añadimos el atributo mobile:
</p>


```xml

</b:widget><b:widget id="BlogArchive1" mobile="yes" title="Blog Archive" type="BlogArchive">

```


<p>
  Para que no se muestre:
</p>


```xml

</b:widget><b:widget id="BlogArchive1" mobile="no" title="Blog Archive" type="BlogArchive">

```


<p>
  Para que solo se muestre en la versión móvil:
</p>


```xml

</b:widget><b:widget id="BlogArchive1" mobile="only" title="Blog Archive" type="BlogArchive">

```


<p>
  También es posible modificar el aspecto de un widget con la variable <i>data:blog.isMobile:</i>
</p>


```xml



<div class="widget-content">
<b:if cond="data:blog.isMobile">
<!-- Show a text link in mobile view.-->
<a href="http://www.blogger.com">
        Powered By Blogger
      </a>
<b:else>
<!-- Show an image link in desktop view.-->
<a href="http://www.blogger.com">
<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive" expr:src="data:fullButton" alt="Powered By Blogger" />
</a>
</b:else></b:if>
</div>

```


  <p>
    El código de arriba muestra contenidos diferentes en función de si estamos en un móvil o un pc.
  </p>
<p>
    Por último, podemos crear distintas reglas CSS a una misma clase, y, dependiendo de si estamos en móvil o pc se usará una u otra. Para ello, es necesario colocar en la etiqueta <i>body</i> lo siguiente:
  </p>


  ```xml



```


<p>
  Hecho esto, podremos definir propiedades CSS distintas así:
</p>


```bash

/* For desktop view */
.date-posts {
  margin: 0 -$(separator.outdent);
  padding: 0 $(separator.outdent);
}

/* For mobile view */
.mobile .date-posts {
  margin: 0;
  padding: 0;
}

```


<p>
  He estado configurando una plantilla personalizada para el blog, que podéis ver <a target="_blank" href="/?m=1">aquí</a>. Pero no consigo que se muestre solamente una entrada a la vez, como hacen las plantillas que proporciona blogger.
</p>
<p>
  Si alguien consigue hacer una plantilla para móviles y sabe resolver el problema que tengo, le agradecería que me lo explicara.
</p>
<p>
  Fuente: <a target="_blank" href="http://code.blogger.com/2011/11/introducing-custom-mobile-templates.html">code.blogger</a>
</p>




{% include toc.html %}
</b:widget>

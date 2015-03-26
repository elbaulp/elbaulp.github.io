---
id: 274
title: Introducción al diseño de plantillas personalizadas para móviles en Blogger
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/introduccion-al-diseno-de-plantillas-personalizadas-para-moviles-en-blogger/
permalink: /introduccion-al-diseno-de-plantillas/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/11/introduccion-al-diseno-de-plantillas.html
  - /2011/11/introduccion-al-diseno-de-plantillas.html
share_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333549451}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333549451}'
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333549451}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333549451}'
share_count:
  - 0
  - 0
categories:
  - curiosidades
  - internet
  - noticias
---
He visto en el blog de blogger que dan la posibilidad de crear una plantilla personalizada de nuestro blog para moviles.

Para empezar a trabajar tenemos que ir a la la sección plantilla:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://2.bp.blogspot.com/-kEQMaYxebJs/Tq-eMEEQTPI/AAAAAAAAARk/OtL411nW0l8/s1600/Screen%2Bshot%2B2011-10-20%2Bat%2B11.14.31%2BAM.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="248" width="429" src="http://2.bp.blogspot.com/-kEQMaYxebJs/Tq-eMEEQTPI/AAAAAAAAARk/OtL411nW0l8/s1600/Screen%2Bshot%2B2011-10-20%2Bat%2B11.14.31%2BAM.png" /></a>
</div>

Le damos al engranaje que aparece debajo de las plantillas para móviles, donde escogeremos el tipo de plantilla que queremos, nosotros le damos a personalizado:

<div class="separator" style="clear: both; text-align: center;">
  <a href="http://1.bp.blogspot.com/-dyyH6l2heQI/Tp5hR4sdzdI/AAAAAAAAAPs/HkYfZ8kpAwQ/s320/mobile_template_picker_pulldown.png" imageanchor="1" style="margin-left:1em; margin-right:1em"><img border="0" height="287" width="320" src="http://1.bp.blogspot.com/-dyyH6l2heQI/Tp5hR4sdzdI/AAAAAAAAAPs/HkYfZ8kpAwQ/s320/mobile_template_picker_pulldown.png" /></a>
</div>

HEcho esto, podemos empezar a diseñar nuestra plantilla para móviles. Editando la plantilla normal del blog. Por ejemplo, si tenemos gadgets en el blog, podemos elegir si se mostrarán en la versión móvil o no. Esto lo conseguimos mediante un nuevo atributo llamado *mobile*, que pertenece a la la etiqueta *<b:widget></i>, y puede tomar los valores &#8216;default&#8217; &#8216;yes&#8217;, &#8216;no&#8217; ó &#8216;only&#8217;.</p> 

<p>
  Vamos a ver un ejemplo con el gadget Archivo del blog:
</p>

<p>
  <br /><!--more-->
</p>

<p>
  Por defecto no se mostrará en la versión movil:
</p>

<pre lang="xml">
<b:widget id='BlogArchive1' title='Blog Archive' type='BlogArchive'>
</pre>


<p>
  Si queremos que se muestre añadimos el atributo mobile:
</p>


<pre lang="xml">
<b:widget id='BlogArchive1' mobile='yes' title='Blog Archive' type='BlogArchive'>
</pre>


<p>
  Para que no se muestre:
</p>


<pre lang="xml">
<b:widget id='BlogArchive1' mobile='no' title='Blog Archive' type='BlogArchive'>
</pre>


<p>
  Para que solo se muestre en la versión móvil:
</p>


<pre lang="xml">
<b:widget id='BlogArchive1' mobile='only' title='Blog Archive' type='BlogArchive'>
</pre>


<p>
  También es posible modificar el aspecto de un widget con la variable <i>data:blog.isMobile:</i>
</p>


<pre lang="xml">


<div class="widget-content">
  <b:if cond="data:blog.isMobile">
      <!-- Show a text link in mobile view.-->
      
  
  <a href="http://www.blogger.com">
        Powered By Blogger
      </a>
    <b:else />
      <!-- Show an image link in desktop view.-->
      
  
  <a href="http://www.blogger.com">
        <img expr:src="data:fullButton" alt="Powered By Blogger" />
      </a>
    </b:if>
  </div>
  </pre>
  
  
  <p>
    El código de arriba muestra contenidos diferentes en función de si estamos en un móvil o un pc.
  </p>
  
  
  <p>
    Por último, podemos crear distintas reglas CSS a una misma clase, y, dependiendo de si estamos en móvil o pc se usará una u otra. Para ello, es necesario colocar en la etiqueta <i>body</i> lo siguiente:
  </p>
  
  
  <pre lang="xml">

</pre>


<p>
  Hecho esto, podremos definir propiedades CSS distintas así:
</p>


<pre>
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
</pre>


<p>
  He estado configurando una plantilla personalizada para el blog, que podéis ver <a target="_blank" href="/?m=1">aquí</a>. Pero no consigo que se muestre solamente una entrada a la vez, como hacen las plantillas que proporciona blogger.
</p>


<p>
  Si alguien consigue hacer una plantilla para móviles y sabe resolver el problema que tengo, le agradecería que me lo explicara.
</p>


<p>
  Fuente: <a target="_blank" href="http://code.blogger.com/2011/11/introducing-custom-mobile-templates.html">code.blogger</a>
</p>


<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Introducción al diseño de plantillas personalizadas para móviles en Blogger+http://elbauldelprogramador.com/introduccion-al-diseno-de-plantillas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/introduccion-al-diseno-de-plantillas/&t=Introducción al diseño de plantillas personalizadas para móviles en Blogger+http://elbauldelprogramador.com/introduccion-al-diseno-de-plantillas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Introducción al diseño de plantillas personalizadas para móviles en Blogger+http://elbauldelprogramador.com/introduccion-al-diseno-de-plantillas/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
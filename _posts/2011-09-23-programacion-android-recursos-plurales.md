---
id: 255
title: 'Programación Android: Recursos &#8211; Plurales'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/programacion-android-recursos-plurales/
permalink: /programacion-android-recursos-plurales/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/09/programacion-android-recursos-plurales.html
  - /2011/09/programacion-android-recursos-plurales.html
categories:
  - android
  - opensource
tags:
  - curso android pdf
---
<img border="0" src="http://elbauldelprogramador.com/content/uploads/2013/07/iconoAndroid.png" style="clear:left; float:left;margin-right:1em; margin-bottom:1em" />

Los recursos Plurals son un conjunto de strings. Estos strings representan una forma de escribir cantidades numéricas, por ejemplo, cuantos huevos hay en una cesta. Vamos a ver un ejemplo:

Hay 1 huevo   
Hay 2 huevos  
Hay 10 huevos

Como puedes notar, las frases son iguales para los números 2 y 10. Sin embargo, la frase para 1 huevo es diferente. Android permite representar esta variación con el recurso llamado plurals. En el siguiente ejemplo vemos como se representan estas dos variaciones.

  
<!--more-->

<pre lang="xml">&lt;resources>
&lt;plurals name="huevos_en_una_cesta">
   &lt;item quantity="one">Hay 1 huevo&lt;/item>
   &lt;item quantity="other">Hay %d huevos&lt;/item>
&lt;/plurals>
&lt;/resources>
</pre>

Las dos variaciones se representan como dos cadenas de texto diferentes bajo el mismo plural. Ahora, podemos usarlo desde el código Java para mostrar correctamente la cadena correspondiente a la cantidad de huevos. El primer parámetro de ***getQuantityString()*** es el ID del plural. El segundo selecciona la cadena a usar. Cuando el valor de la cantidad es 1, usamos la cadena tal como es. Cuando el valor es distinto a 1, debemos pasar un tercer parámetro que será el valor a colocar en el lugar de %d. Siempre deberá haber al menos 3 parámetros si usamos cadenas formateadas en los plurales.

<pre lang="java">Resources res = tu_actividad.getResources();
String s1 = res.getQuantityString(R.plurals.huevos_en_una_cesta, 0, 0);
String s2 = res.getQuantityString(R.plurals.huevos_en_una_cesta, 1, 1);
String s3 = res.getQuantityString(R.plurals.huevos_en_una_cesta, 2, 2);
String s4 = res.getQuantityString(R.plurals.huevos_en_una_cesta, 10, 10);
</pre>

Con este código, cada cantidad se mostrará con su correcta cadena de texto.

Existen otras posibilidades que podemos aplicar al atributo *quantity* del elemento item. Para ello, recomiendo que lean el código fuente de Resources.java y PluralsRules.java para entenderlo correctamente. Aún así, dejo lo fundamental de estas dos ficheros para que entiendan bien el funcionamiento:

### PluralRules.java

<pre lang="java">abstract class PluralRules {

    static final int QUANTITY_OTHER = 0x0000;
    static final int QUANTITY_ZERO  = 0x0001;
    static final int QUANTITY_ONE   = 0x0002;
    static final int QUANTITY_TWO   = 0x0004;
    static final int QUANTITY_FEW   = 0x0008;
    static final int QUANTITY_MANY  = 0x0010;

    static final int ID_OTHER = 0x01000004;

    abstract int quantityForNumber(int n);

    final int attrForNumber(int n) {
        return PluralRules.attrForQuantity(quantityForNumber(n));
    }

    static final int attrForQuantity(int quantity) {
        // see include/utils/ResourceTypes.h
        switch (quantity) {
            case QUANTITY_ZERO: return 0x01000005;
            case QUANTITY_ONE:  return 0x01000006;
            case QUANTITY_TWO:  return 0x01000007;
            case QUANTITY_FEW:  return 0x01000008;
            case QUANTITY_MANY: return 0x01000009;
            default:            return ID_OTHER;
        }
    }

    static final String stringForQuantity(int quantity) {
        switch (quantity) {
            case QUANTITY_ZERO:
                return "zero";
            case QUANTITY_ONE:
                return "one";
            case QUANTITY_TWO:
                return "two";
            case QUANTITY_FEW:
                return "few";
            case QUANTITY_MANY:
                return "many";
            default:
                return "other";
        }
    }

    static final PluralRules ruleForLocale(Locale locale) {
        String lang = locale.getLanguage();
        if ("cs".equals(lang)) {
            if (cs == null) cs = new cs();
            return cs;
        }
        else {
            if (en == null) en = new en();
            return en;
        }
    }

    private static PluralRules cs;
    private static class cs extends PluralRules {
        int quantityForNumber(int n) {
            if (n == 1) {
                return QUANTITY_ONE;
            }
            else if (n >= 2 &#038;&#038; n &lt; = 4) {
                return QUANTITY_FEW;
            }
            else {
                return QUANTITY_OTHER;
            }
        }
    }

    private static PluralRules en;
    private static class en extends PluralRules {
        int quantityForNumber(int n) {
            if (n == 1) {
                return QUANTITY_ONE;
            }
            else {
                return QUANTITY_OTHER;
            }
        }
    }
}
</pre>

### Resources.java

<pre lang="java">public CharSequence getQuantityText(int id, int quantity) throws NotFoundException {
        PluralRules rule = getPluralRule();
        CharSequence res = mAssets.getResourceBagText(id, rule.attrForNumber(quantity));
        if (res != null) {
            return res;
        }
        res = mAssets.getResourceBagText(id, PluralRules.ID_OTHER);
        if (res != null) {
            return res;
        }
        throw new NotFoundException("Plural resource ID #0x" + Integer.toHexString(id)
                + " quantity=" + quantity
                + " item=" + PluralRules.stringForQuantity(rule.quantityForNumber(quantity)));
    }

    private PluralRules getPluralRule() {
        synchronized (mSync) {
            if (mPluralRule == null) {
                mPluralRule = PluralRules.ruleForLocale(mConfiguration.locale);
            }
            return mPluralRule;
        }
    }
</pre>

En la mayoria de los idiomas normalmente hay dos posibles valores, &#8220;one&#8221; y &#8220;other&#8221;, pero para el Checo, los valores son &#8220;one&#8221; para 1, &#8220;few&#8221; del 2 al 4 y &#8220;other&#8221; para el resto.

* * *

#### Siguiente Tema: [Programación Android: Recursos &#8211; Trabajar con recursos XML arbitrarios][1] {.referencia}



<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Programación Android: Recursos &#8211; Plurales+http://elbauldelprogramador.com/programacion-android-recursos-plurales/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/programacion-android-recursos-plurales/&t=Programación Android: Recursos &#8211; Plurales+http://elbauldelprogramador.com/programacion-android-recursos-plurales/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Programación Android: Recursos &#8211; Plurales+http://elbauldelprogramador.com/programacion-android-recursos-plurales/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: /programacion-android-recursos-trabajar/
---
id: 299
title: 'Los desarrolladores de GNOME crean &#8220;Boxes&#8221; para la virtualización'

layout: post
guid: http://elbauldelprogramador.org/los-desarrolladores-de-gnome-crean-boxes-para-la-virtualizacion/
permalink: /los-desarrolladores-de-gnome-crean/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com

  
  
share_count:
  - 0
  - 0
share_all_data:
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551782}'
  - '{"like_count":"0","share_count":"0","twitter":0,"plusone":0,"stumble":0,"pinit":0,"count":0,"time":1333551782}'
share_data:
  - '[]'
  - '[]'
categories:
  - linux
  - noticias
  - opensource
main-class: 'dev'
---
<div class="separator" style="clear: both; text-align: center;">
  <a href="https://2.bp.blogspot.com/-oTy__i3px1g/TtKbNmGPIBI/AAAAAAAAB1k/Y6daIcbwi5k/s1600/Boxes-d7ad4bbc04e8d56d.png" imageanchor="1" style="clear:left; float:left;margin-right:1em; margin-bottom:1em"><img style="border:none;" border="0" height="200" width="149" src="https://2.bp.blogspot.com/-oTy__i3px1g/TtKbNmGPIBI/AAAAAAAAB1k/Y6daIcbwi5k/s320/Boxes-d7ad4bbc04e8d56d.png" /></a>
</div>

Con el aumento en el uso de máquinas virtuales y conexiones remotas, los desarrolladores de GNOME están trabajando en una nueva integración para el entorno de escritorio que llaman &#8220;<a target="_blank" href="http://zee-nix.blogspot.com/2011/11/behold-boxes.html">Boxes</a>&#8220;. El <a target="_blank" href="https://live.gnome.org/Design/Apps/Boxes">diseño</a> de estos boxes ofrece un entorno único para crear boxes que pueden ser máquinas virtuales remotas, locales o sesiones de control remoto para otras máquinas virtuales (<a target="_blank" href="http://www.h-online.com/open/news/item/Red-Hat-open-sources-Qumranet-SPICE-protocol-882801.html">SPICE protocol</a>). Los desarrolladores han estado trabajando en una implementación para los Boxes basada en <a target="_blank" href="https://live.gnome.org/Vala">Vala</a>. Ahora han anunciado su <a target="_blank" href="http://ftp.gnome.org/pub/GNOME/sources/gnome-boxes/3.3/">primer lanzamiento</a> junto con un screencast mostrando las capacidades de la aplicación:

  
<!--ad-->



El desarrollador Zeeshan Ali Khattak (aka Zeenix) explica en una <a target="_blank" href="http://zee-nix.blogspot.com/2011/11/behold-boxes.html">entrada del blog</a> que, aunque los desarrolladores ya usan <a target="_blank" href="http://virt-manager.org/">virt-manager</a>, que cubre las necesidades de un administrador de sistemas a nivel empresarial, había una necesidad de crear una virtualización y una aplicación de control remoto para los usuarios más comunes, y que esa necesidad podría solucionarse con la creación de Boxes. Debido a que el proyecto está todavía en una fase muy primaria de desarrollo, hay muchos errores &#8211; el más grave actualmente el la falta de soporte para disquetes en Qemu. Por otra parte, con la nueva interfaz gráfica, los usuarios pueden crear y eliminar máquinas virtuales o sistemas de conexión remota de una manera simple. Los desarrolladores están buscando ayuda para trabajar en la interfaz y para mejorar las librerías de C, libosinfo y libvirt-glib, que son en las librerías en las que se basa el proyecto. A ellos les gustaría, por ejemplo, ayudar en la creación de una API para configurar mediante XML libvirt

Traducción de : <a target="_blank" href="http://www.h-online.com/open/news/item/GNOME-developers-create-Boxes-for-virtualisation-1383765.html">h-online.com</a>



{% include _toc.html %}

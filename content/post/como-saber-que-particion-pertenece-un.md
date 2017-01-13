---
title: Cómo saber a qué partición pertenece un archivo en GNU/Linux
lastmod: 2016-10-22
layout: post.amp
permalink: /como-saber-que-particion-pertenece-un/
categories:
  - How To
  - linux
mainclass: "linux"
color: "#2196F3"
---

¿Cómo podemos saber que el archivo */home/hkr/Desktop/combinaciones.cpp* pertenece a una partición específica?¿O cómo podemos saber en qué partición existe un archivo?

Para eso podemos usar el comando df, que informa del uso del espacio en disco del sistema incluyendo nombres de archivos y directorios. La sintaxis es así:

<!--more-->

```bash
df
df /ruta/a un/directorio
df /ruta/a un/archivo
```

En el siguiente ejemplo se busca el nombre de la partición donde se encuentra el fichero llamado */home/hkr/Desktop/combinaciones.cpp*

```bash
df -T /home/hkr/Desktop/combinaciones.cpp
```

Que tiene como salida:

```bash
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda6     ext4   186362292 140452228  36443368  80% /home
```

Como vemos, el resultado es que el archivo *combinaciones.cpp* pertenece a la partición */dev/sda6*. Con el siguiente comando mostramos solo el nombre de la partición:

```bash
df /home/hkr/Desktop/combinaciones.cpp | awk '/^/dev/ {print $1}'
```

O con este otro:

```bash
awk '/^/dev/ {print $1}' <<<"$(df /home/hkr/Desktop/combinaciones.cpp)"
```

La salida para los dos comandos anteriores es la misma:

```bash
/dev/sda6
```

Es recomendable colocar la siguiente función bash en nuestro archivo *~/.bashrc*

```bash
# find partition name for a given filename
findpart() {
   [ -e "$1" ] && df -P "$1"  | awk '/^/dev/ {print $1}' || echo "$1 not found";
}
```

Ejemplos de uso:

```bash
findpart /foo/bar
findpart /etc
findpart /home/vivek/test.txt
```

<figure>
	<amp-img on="tap:lightbox1" role="button" tabindex="0" layout="responsive"  width="640" height="108"  src="https://1.bp.blogspot.com/-F2sPR477GsI/TvsYjhPFVgI/AAAAAAAAB_8/olid11qqdXw/s400/Screenshot.png"></amp-img>
</figure>

Vía <a target="_blank" href="http://www.cyberciti.biz/faq/linux-unix-command-findout-on-which-partition-file-directory-exits/">cyberciti</a>

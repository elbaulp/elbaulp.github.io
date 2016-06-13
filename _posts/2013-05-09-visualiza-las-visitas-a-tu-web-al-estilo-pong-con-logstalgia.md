---
title: Visualiza las visitas a tu web al estilo Pong con Logstalgia

layout: post
permalink: /visualiza-las-visitas-a-tu-web-al-estilo-pong-con-logstalgia/
categories:
  - Administracion de Servidores
  - aplicaciones
  - opensource
tags:
  - grabar video logstalgia
  - instalar logstalgia
  - tutorial logstalgia
modified: 2015-12-13T19:40:12+01:00
main-class: "servidores"
color: #0097A7
---
Hace poco he descubierto un programa muy curioso, **Logstalgia**, que a partir del fichero de log de acceso a una web crea una pantalla del juego Pong en la que cada línea del log representa una bola en el juego. Es una buena representación gráfica de lo que está pasando en el servidor web. Y su uso es bastante simple. Empecemos instalándolo:

```bash

# aptitude install logstalgia

```

Para usarlo localmente, basta con ejecutar el siguiente comando:  

```bash

tail -f /var/www/mySitio/log/access.log | logstalgia -1280x720 --sync

```

Por contra, si el servidor no es local, nos conectamos mediante ssh:

```bash

ssh usuario@dominio.com tail -f /var/www/mySitio/log/access.log | logstalgia -1280x720 --sync

```

Es posible guardar el un fichero la pantalla de logstalgia pasándole los siguientes parámetros:

```bash

logstalgia -1280x720 --output-ppm-stream output.ppm --sync

```

Y luego lo convertimos al formato de vídeo mp4:

```bash

ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i output.ppm -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 server.log.mp4

```

Os dejo un vídeo del tráfico de mi modesto blog:

<figure>
  <iframe  src="https://www.youtube-nocookie.com/embed/5pzMBg_vvo8" frameborder="0" allowfullscreen></iframe>
</figure>

#### Referencias

*Web oficial* »» <a href="https://code.google.com/p/logstalgia/" target="_blank">Visitar sitio</a>


{% include _toc.html %}

---
title: 'Ejemplos en HTML5: Almacenamiento Web, SQL y WebSocket'
layout: post.amp
modified: 2016-09-03T22:50
permalink: /ejemplos-en-html5-almacenamiento-web/
categories:
  - internet
tags:
  - example websocket html5
  - html5 ejemplos
  - html5 websocket
main-class: "articulos"
color: "#F57C00"
---

<script type="text/javascript>
// Usar localStorage Para almacenamiento permanente
// Usar sessionStorage para almacenamiento por pestañas
saveButton.addEventListener('click', function () {
  window.localStorage.setItem('value', area.value);
  window.localStorage.setItem('timestamp', (new Date()).getTime());
}, false);
textarea.value = window.localStorage.getItem('value');

var db = window.openDatabase("DBName", "1.0", "description", 5*1024*1024); //5MB
db.transaction(function(tx) {
  tx.executeSql("SELECT * FROM test", [], successCallback, errorCallback);
  
var socket = new WebSocket('ws://html5rocks.websocket.org/echo');
socket.onopen = function(event) {
  socket.send('Hello, WebSocket');
};
socket.onmessage = function(event) { alert(event.data); }
socket.onclose = function(event) { alert('closed'); } 
</script>

{% include toc.html %}

## Introducción

Ayer os hablé de [15 webs][1] en las que se podia ver el potencial de HTML 5, y una de ellas era una presentación de sus características, he traducido algunas que me han interesado y las dejo para que las useis. Si lo preferís, podéis hacerlo directamente [en su Web][2].

<!--ad-->

## Alacenamiento Web

```javascript
// Usar localStorage Para almacenamiento permanente
// Usar sessionStorage para almacenamiento por pestañas
saveButton.addEventListener('click', function () {
  window.localStorage.setItem('value', area.value);
  window.localStorage.setItem('timestamp', (new Date()).getTime());
}, false);
textarea.value = window.localStorage.getItem('value');
```

<p id="localstorage-message">
  Guardar un texto en el lado cliente.
</p>
<textarea id="ta" placeholder="Escribe tu texto aquí..."></textarea>
<button id="save-ta">Guardar</button>
<p id="ta-log">
</p><p>
</p>
<hr />
<div>

## Web SQL Database

```javascript
var db = window.openDatabase("DBName", "1.0", "description", 5*1024*1024); //5MB
db.transaction(function(tx) {
  tx.executeSql("SELECT * FROM test", [], successCallback, errorCallback);
});
```

<div class="center" id="websqldb-example">
<input type="text" id="todoitem" /><br /> <button onclick="webSqlSample.newRecord()">Nuevo elemento</button><br /> <button onclick="webSqlSample.createTable()">Crear tabla</button><br /> <button onclick="webSqlSample.dropTable()">Borrar tabla</button>
<p>
Vea la base de datos generada en: Developer > Developer Tools > Storage
</p>
<ul class="record-list" id="db-results">
</ul>
<div id="db-log">
</div>
</div>
<p>
</p></div>
<hr />

## WebSocket

```javascript
var socket = new WebSocket('ws://html5rocks.websocket.org/echo');
socket.onopen = function(event) {
  socket.send('Hello, WebSocket');
};
socket.onmessage = function(event) { alert(event.data); }
socket.onclose = function(event) { alert('closed'); }
```

<p id="websockets-message">
        Comunicación Full-duplex, bi-direccional sobre la Web:<br /> Tanto el servidor como el cliente pueden enviar datos en cualquier momento, o incluso al mismo tiempo.<br /> Sólo se envian los datos en sí, sin la sobrecarga de cabeceras HTTP, lo que reduce<br /> el consumo de ancho de banda.
      </p>
<div id="ws-left">
        Utilice el echo de demostración a continuación para probar una conexión WebSocket en su navegador.<br /> Tanto el mensaje que se envía y la respuesta que reciba son sobre la misma conexión WebSocket.
<div id="ws-config-location">
<h4>
            Location:
          </h4>
<p>
<input type="text" id="wsUri" disabled="disabled" /><br /> <br /> <br /> <input type="checkbox" id="wsSecureCb" onclick="wsToggleTls();" disabled="disabled" /><br /> <label id="wsSecureCbLabel" for="wsSecureCb">Use secure WebSocket (TLS/SSL)</label><br /> <br /> <br /> <button id="wsConnectBut" disabled="disabled">Conectar</button><br /> <button id="wsDisconnectBut" disabled="disabled">Desconectar</button> </p></div>
<div id="ws-config-message">

<h4>Message:</h4>
<p>
<input type="text" id="wsMessage" value="Hello, WebSocket" disabled="disabled" /><br /> <button id="wsSendBut" disabled="disabled">Send</button> </p></div>

</div>
<div id="ws-right">
<div id="ws-log">
<strong>Output:</strong>
<div id="wsConsoleLog">
</div>
<p>
<button id="wsClearLogBut">Clear log</button> </p></div>
</div>
<p>
</p>

 [1]: /15-demostraciones-del-potencial-de/
 [2]: http://slides.html5rocks.com/#landing-slide



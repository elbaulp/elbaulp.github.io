---
id: 142
title: 'Ejemplos en HTML5: Almacenamiento Web, SQL y WebSocket'
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.org/ejemplos-en-html5-almacenamiento-web-sql-y-websocket/
permalink: /ejemplos-en-html5-almacenamiento-web/
blogger_blog:
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
  - www.elbauldelprogramador.org
blogger_author:
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
  - Alejandro Alcaldehttps://profiles.google.com/117030001562039350135noreply@blogger.com
blogger_permalink:
  - /2011/02/ejemplos-en-html5-almacenamiento-web.html
  - /2011/02/ejemplos-en-html5-almacenamiento-web.html
  - /2011/02/ejemplos-en-html5-almacenamiento-web.html
categories:
  - internet
tags:
  - example websocket html5
  - html5 ejemplos
  - html5 websocket
---
Ayer os hablé de [15 webs][1] en las que se podia ver el potencial de HTML 5, y una de ellas era una presentación de sus características, he traducido algunas que me han interesado y las dejo para que las useis. Si lo preferís, podéis hacerlo directamente [en su Web][2].  
<!--more-->

## Alacenamiento Web

<pre>// Usar localStorage Para almacenamiento permanente
// Usar sessionStorage para almacenamiento por pestañas
saveButton.addEventListener('click', function () {
  window.<b>localStorage</b>.<b>setItem</b>('value', area.value);
  window.<b>localStorage</b>.<b>setItem</b>('timestamp', (new Date()).getTime());
}, false);
textarea.value = window.<b>localStorage</b>.<b>getItem</b>('value');
</pre>

<p id="localstorage-message">
  Guardar un texto en el lado cliente.
</p>

<textarea id="ta" placeholder="Escribe tu texto aquí..."></textarea>  
<button id="save-ta">Guardar</button> 

<p id="ta-log">
  <p>
  </p>
  
  <hr />
  
  <div>
    <h2>
      Web SQL Database
    </h2>
    
    <pre>var db = window.<b>openDatabase</b>("DBName", "1.0", "description", 5*1024*1024); //5MB
db.<b>transaction</b>(function(tx) {
  tx.<b>executeSql</b>(<em>"SELECT * FROM test"</em>, [], successCallback, errorCallback);
});
</pre>
    
    <div class="center" id="websqldb-example">
      <input type="text" id="todoitem" /><br /> <button onclick="webSqlSample.newRecord()">Nuevo elemento</button><br /> <button onclick="webSqlSample.createTable()">Crear tabla</button><br /> <button onclick="webSqlSample.dropTable()">Borrar tabla</button> </p> 
      
      <p>
        Vea la base de datos generada en: Developer > Developer Tools > Storage
      </p>
      
      <ul class="record-list" id="db-results">
      </ul>
      
      <div id="db-log">
      </div></p>
    </div>
    
    <p>
      </div> 
      
      <hr />
      
      <h2>
        WebSocket
      </h2>
      
      <pre>var socket = new <b>WebSocket</b>('ws://html5rocks.websocket.org/echo');
socket.<b>onopen</b> = function(event) {
  socket.<b>send</b>('Hello, WebSocket');
};
socket.<b>onmessage</b> = function(event) { alert(event.data); }
socket.<b>onclose</b> = function(event) { alert('closed'); }
</pre>
      
      <p id="websockets-message">
        Comunicación Full-duplex, bi-direccional sobre la Web:<br /> Tanto el servidor como el cliente pueden enviar datos en cualquier momento, o incluso al mismo tiempo.<br /> Sólo se envian los datos en sí, sin la sobrecarga de cabeceras HTTP, lo que reduce<br /> el consumo de ancho de banda.
      </p>
      
      <div id="ws-left">
        Utilice el echo de demostración a continuación para probar una conexión WebSocket en su navegador.<br /> Tanto el mensaje que se envía y la respuesta que reciba son sobre la misma conexión WebSocket.</p> 
        
        <div id="ws-config-location">
          <h4>
            Location:
          </h4>
          
          <p>
            <input type="text" id="wsUri" disabled /><br /> <br /> <br /> <input type="checkbox" id="wsSecureCb" onclick="wsToggleTls();" disabled /><br /> <label id="wsSecureCbLabel" for="wsSecureCb">Use secure WebSocket (TLS/SSL)</label><br /> <br /> <br /> <button id="wsConnectBut" disabled>Conectar</button><br /> <button id="wsDisconnectBut" disabled>Desconectar</button> </div> 
            
            <div id="ws-config-message">
              <h4>
                Message:
              </h4>
              
              <p>
                <input  type="text" id="wsMessage" value="Hello, WebSocket" disabled /><br /> <button id="wsSendBut" disabled>Send</button> </div>
              </p>
            </div>
            
            <div id="ws-right">
              <div id="ws-log">
                <strong>Output:</strong> </p> 
                
                <div id="wsConsoleLog">
                </div>
                
                <p>
                  <button id="wsClearLogBut">Clear log</button> </div>
                </p>
              </div></section> 
              
              <p>
              </p>
              
              <div class="sharedaddy">
                <div class="sd-content">
                  <ul>
                    <li>
                      <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Ejemplos en HTML5: Almacenamiento Web, SQL y WebSocket+http://elbauldelprogramador.com/ejemplos-en-html5-almacenamiento-web/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
                    </li>
                    <li>
                      <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/ejemplos-en-html5-almacenamiento-web/&t=Ejemplos en HTML5: Almacenamiento Web, SQL y WebSocket+http://elbauldelprogramador.com/ejemplos-en-html5-almacenamiento-web/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
                    </li>
                    <li>
                      <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Ejemplos en HTML5: Almacenamiento Web, SQL y WebSocket+http://elbauldelprogramador.com/ejemplos-en-html5-almacenamiento-web/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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

 [1]: http://elbauldelprogramador.com/15-demostraciones-del-potencial-de/
 [2]: http://slides.html5rocks.com/#landing-slide
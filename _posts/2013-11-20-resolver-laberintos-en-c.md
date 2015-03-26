---
id: 1955
title: Resolver laberintos en C++
author: Alejandro Alcalde
layout: post
guid: http://elbauldelprogramador.com/?p=1955
permalink: /resolver-laberintos-en-c/
categories:
  - C
tags:
  - practica laberintos fp
  - resolver laberinto fp
---
<img src="http://elbauldelprogramador.com/content/uploads/2013/11/cpp.png" alt="Resolver laberintos en C++" width="128" height="128" class="thumbnail alignleft size-full wp-image-1984" />  
Cuando estaba en el primer curso de la facultad, hicimos una práctica en la asignatura Fundamentos de la Programación que consistía en resolver un laberinto almacenado en un fichero. Me gustó bastante hacer ese programa y lo comparto en el blog para los curiosos que quieran ver cómo funciona.

<!--more-->

### Formato del laberinto en el fichero

Los ficheros que almacenan el laberinto tienen el siguiente formato:

<pre lang="bash">7 7
ppppppp
pellllp
plplppp
plplllp
plplppp
pllllsp
ppppppp
</pre>

Donde:

  * Los dos primeros números representan el tamaño del laberinto, en este caso 7&#215;7.
  * p representa una pared.
  * l representa una celda libre, por la que se puede pasar.
  * e representa la entrada al laberinto.
  * s representa la salida.

### Programa principal

Dado esto, es posible implementar un programa que lea el fichero, cree una matriz representando el laberinto e intente resolverlo. Esto se podría hacer con:

<pre lang="cpp">#include &lt;iostream>
#include &lt;vector>

#include "Laberinto.h"

using namespace std;

int main()
{
    unsigned int FIL, COL;
    cin >> FIL >> COL;

    Laberinto lab('+',' ','#',FIL,COL);
    lab.printLab();
    lab.resolverLaberinto();
    lab.printLabResuelto();
    return 0;
}
</pre>

### Ejemplo de uso

La clase *Laberinto* la veremos en breve. Básicamente, se lee el fichero, almacenando el tamaño que tiene y se construye un laberinto de dicho tamaño y cambiando la representación del laberinto, es decir `Laberinto lab('+',' ','#',FIL,COL);` crea un laberinto de tamaño *FILxCOL*, cuya representación será un *#* para el camino que conduce a la salida, </em>+</em> para las paredes y un espacio en blanco para las celdas libres. La siguiente línea imprime el laberinto sin resolver, quedando así:

<pre lang="bash">./bin/laberinto &lt; labs/lab_peque.txt 
+++++++
+e    +
+ + +++
+ +   +
+ + +++
+    s+
+++++++
</pre>

Las dos siguientes líneas resuelven e imprimen el laberinto con el camino hacia la salida:

<pre lang="cpp">LABERINTO RESUELTO: 
+++++++
+e##  +
+ +#+++
+ +#  +
+ +#+++
+  ##s+
+++++++
</pre>

En caso de que el laberinto no tenga solución se informa de ello:

<pre lang="bash">./bin/laberinto &lt; labs/lab_sinsolucion.txt 
+++++++
+e  +s+
+++++++
El laberinto no tiene salida
</pre>

### Clase Laberinto

La definición del Laberinto es la siguiente:

<pre lang="cpp">#include &lt;vector>

class Laberinto{

private:
    std::vector&lt;std::vector&lt;int> > path;
    std::vector&lt;std::vector&lt;char> > laberinto;
    char shapeP,
         shapeL,
         shapeC;

    void addPathToLab(unsigned int,unsigned int);
    std::vector&lt;int> findEnter() const;
    void cargarLaberinto(unsigned int,unsigned int);

public:
    Laberinto(char p, char l, char c, int x, int y){
        setShapeC(c);
        setShapeP(p);
        setShapeL(l);
        cargarLaberinto(x,y);
    }

    void resolverLaberinto();
    void printLab() const;
    void printLabResuelto() const;

    //Getters y setters
    void setShapeP(char p)    { (*this).shapeP = p; }
    void setShapeL(char l)    { (*this).shapeL = l; }
    void setShapeC(char c)    { (*this).shapeC = c; }

    char getShapeP() const    { return (*this).shapeP; }
    char getShapeL() const    { return (*this).shapeL; }
    char getShapeC() const    { return (*this).shapeC; }
};
</pre>

En `path` se almacena el camino recorrido hasta el momento. Internamente, se crea una matriz de igual tamaño que el laberinto, pero *booleana* que irá llevando la cuenta de los lugares por los que ha pasado.

La implementación:

<pre lang="cpp">#include &lt;iostream>

#include "Laberinto.h"

using namespace std;

void Laberinto::cargarLaberinto(unsigned int FIL,unsigned int COL){
    (*this).laberinto.assign(FIL,vector&lt;char>(COL));
        for(unsigned int i=0; i &lt; FIL; i++)
            for(unsigned int j=0; j &lt; COL; j++){
                char car;
                cin >> car;
                if (car != 'e' &#038;&#038; car != 's')
                   (*this).laberinto[i][j] = (car == 'p' ? getShapeP() : getShapeL());
                else
                    (*this).laberinto[i][j] = car;
            }
}

void Laberinto::printLab() const{
    for(unsigned int i=0; i &lt; (*this).laberinto.size(); i++){
        for(unsigned int j=0; j &lt; (*this).laberinto[i].size(); j++)
            cout &lt;&lt; (*this).laberinto[i][j];
        cout &lt;&lt; endl;
    }
}

void Laberinto::printLabResuelto() const{
    if(!(*this).path.empty()){
        //Añadir el camino al laberinto
        cout &lt;&lt; "LABERINTO RESUELTO: "&lt;&lt; endl;
        printLab();
    }
    else
        cout &lt;&lt; "El laberinto no tiene salida" &lt;&lt; endl;
}


void Laberinto::resolverLaberinto(){

    vector&lt;vector&lt;bool> > recorrido((*this).laberinto.size(), vector&lt;bool>((*this).laberinto[0].size(),false));


    (*this).path.push_back(findEnter());
    recorrido[path[0][0]][path[0][1]] = true;

    vector&lt;int> ultimoPath;
    while(!(*this).path.empty() &#038;&#038;
          (*this).laberinto[(*this).path[(*this).path.size()-1][0]][(*this).path[(*this).path.size()-1][1]] != 's'){
        ultimoPath.clear();
        ultimoPath.push_back((*this).path[(*this).path.size()-1][0]);
        ultimoPath.push_back((*this).path[(*this).path.size()-1][1]);

        //Elemento a la izquierda de la ultima posicion de (*this).path
        if(((*this).laberinto[ultimoPath[0]][ultimoPath[1]-1] != getShapeP())
           &#038;&#038; (!recorrido[ultimoPath[0]][ultimoPath[1]-1])){
            ultimoPath[1] = ultimoPath[1]-1;
            (*this).path.push_back(ultimoPath);
            recorrido[ultimoPath[0]][ultimoPath[1]] = true;
        }
        //Elemento a la derecha
        else if ((*this).laberinto[ultimoPath[0]][ultimoPath[1]+1] != getShapeP()
           &#038;&#038; !recorrido[ultimoPath[0]][ultimoPath[1]+1]){
            ultimoPath[1] = ultimoPath[1]+1;
            (*this).path.push_back(ultimoPath);
            recorrido[ultimoPath[0]][ultimoPath[1]] = true;
        }
        //Elemento de arriba
        else if ((*this).laberinto[ultimoPath[0]-1][ultimoPath[1]] != getShapeP()
           &#038;&#038; !recorrido[ultimoPath[0]-1][ultimoPath[1]]){
            ultimoPath[0] = ultimoPath[0]-1;
            (*this).path.push_back(ultimoPath);
            recorrido[ultimoPath[0]][ultimoPath[1]] = true;
        }//Elemento de abajo
        else if ((*this).laberinto[ultimoPath[0]+1][ultimoPath[1]] != getShapeP()
           &#038;&#038; !recorrido[ultimoPath[0]+1][ultimoPath[1]]){
            ultimoPath[0] = ultimoPath[0]+1;
            (*this).path.push_back(ultimoPath);
            recorrido[ultimoPath[0]][ultimoPath[1]] = true;
        }else
            (*this).path.pop_back();
    }

    if(!(*this).path.empty()){
        //Añadir el camino al laberinto
        for(unsigned int i=0; i &lt; (*this).laberinto.size(); i++)
            for(unsigned int j=0; j &lt; (*this).laberinto[i].size(); j++)
                addPathToLab(i,j);
    }
}

vector&lt;int> Laberinto::findEnter() const{
    //Buscamos la entrada
    bool encontrada = false;
    vector&lt;int> pos;
    for(unsigned int i=0; i &lt; (*this).laberinto.size() &#038;&#038; !encontrada; i++)
        for(unsigned int j=0; j &lt; (*this).laberinto[i].size() &#038;&#038; !encontrada; j++)
            if((*this).laberinto[i][j] == 'e'){
                pos.push_back(i);
                pos.push_back(j);
                encontrada = true;
            }
    return pos;
}

void Laberinto::addPathToLab(unsigned int i, unsigned int j){
    for (unsigned int k=0; k &lt; (*this).path.size(); k++)
        if((*this).path[k][0] == i &#038;&#038; (*this).path[k][1] == j
           &#038;&#038; (*this).laberinto[i][j] != 'e' &#038;&#038; (*this).laberinto[i][j] != 's')
            (*this).laberinto[i][j] = getShapeC();
}
</pre>

### Más ejemplos

<pre lang="latex">./bin/laberinto &lt; labs/laberinto1.txt 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+e  +     +       +               +     +               +             +   +   + +
+ +++ + +++ +++ +++ +++++++++++ +++ +++ + +++ +++++++++ + +++++ +++++ + + + + + +
+     + +     + +   + +       +       + + +   +     +   + +     +   + + +   +   +
+++++++ + +++++ + +++ + +++++ +++++++++ + + +++ +++ +++ +++ +++++ + + + +++++++ +
+       + + +   +   + + +   + +         + +   + + +   +   +       + +   + +     +
+ +++++++ + + +++++ + + +++ + + +++++++ + +++ + + +++ +++ +++++++++ +++++ + +++++
+       + + +       + +   +     + +     + + +       + + +   +   +   +     + +   +
+ +++++ + + +++++++++ +++ +++++++ + +++++ + +++++++++ + +++ + + + +++ + + + + + +
+     + + +         +   +   + +   + +   + +     +   + +   +   + +   + + + + + + +
+++++ + + + +++ +++ +++ +++ + + + + +++ + + + +++ + + + +++++++ +++ + + +++ +++ +
+ +   +   + + + +       +   + + + +     + + +   + +   + +   +   +   + +   +     +
+ + +++++++ + + +++++++++ +++ + + +++++ + +++++ + +++++ + + + +++ +++ +++ +++++ +
+ + +         + +         +     +     + +     + +   + +   +   +   + +   +       +
+ + + +++++++++ + +++++++ +++++++ + +++ +++++ + +++ + + +++++++++ + +++ +++++++++
+ + +   +   +   + +       +     + +       +   +   + + +   +       +     +     + +
+ + +++++ + + + + +++++++++ +++ +++++++++ + +++ +++ + +++ +++ +++++ +++++ +++ + +
+   +     + + + +         +   + +       + +   +   + +         +   +     +   + + +
+ +++ +++++ + + +++++++++ +++ + + +++++ +++++ +++ + +++++++++++ + +++++ +++ + + +
+     +       +         +     +       +           +         +   +           +  s+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
LABERINTO RESUELTO: 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+e  +###  +#####  +#############  +#####+###############+      #######+###+###+ +
+#+++#+#+++#+++#+++#+++++++++++#+++#+++#+#+++ +++++++++#+ +++++#+++++#+#+#+#+#+ +
+#####+#+###  +#+###+ +#######+#####  +#+#+   +     +  #+ +#####+###+#+#+###+###+
+++++++#+#+++++#+#+++ +#+++++#+++++++++#+#+ +++ +++ +++#+++#+++++#+#+#+#+++++++#+
+#######+#+ +###+###+ +#+   +#+#########+#+   + + +   +###+#######+#+###+ +#####+
+#+++++++#+ +#+++++#+ +#+++ +#+#+++++++ +#+++ + + +++ +++#+++++++++#+++++ +#+++++
+#######+#+ +#######+ +###+  ###+ +     +#+ +       + + +###+###+###+###  +#+   +
+ +++++#+#+ +++++++++ +++#+++++++ + +++++#+ +++++++++ + +++#+#+#+#+++#+#+ +#+ + +
+     +#+#+         +   +###+ +   + +   +#+     +   + +   +###+#+###+#+#+ +#+ + +
+++++ +#+#+ +++ +++ +++ +++#+ + + + +++ +#+ + +++ + + + +++++++#+++#+#+#+++#+++ +
+ +   +###+ + + +       +###+ + + +     +#+ +   + +   + +###+###+###+#+###+#####+
+ + +++++++ + + +++++++++#+++ + + +++++ +#+++++ + +++++ +#+#+#+++#+++#+++#+++++#+
+ + +         + +#########+     +     + +#####+ +   + +###+###+  #+ +###+#######+
+ + + +++++++++ +#+++++++ +++++++ + +++ +++++#+ +++ + +#+++++++++#+ +++#+++++++++
+ + +   +   +   +#+       +#####+ +       +###+   + + +###+  #####+#####+#####+ +
+ + +++++ + + + +#+++++++++#+++#+++++++++ +#+++ +++ + +++#+++#+++++#+++++#+++#+ +
+   +     + + + +#########+###+#+#######+ +###+   + +    #####+   +#####+###+#+ +
+ +++ +++++ + + +++++++++#+++#+#+#+++++#+++++#+++ + +++++++++++ + +++++#+++#+#+ +
+     +       +         +#####+###    +#######    +         +   +      #####+##s+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


./bin/laberinto &lt; labs/laberinto2.txt 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+e    +                     +       +   +           +           +             +     +               +
+ +++ +++++ +++++ +++++++++ + +++++ + + + +++ +++++++ + + +++++ +++++++ +++++++ +++ + +++++ +++++++ +
+   + +   +   +   +     +   +     + + +   + +         + + +   +   +     +       +   + +     +     + +
+++ + + + +++++ +++ +++ + +++++++++ + +++++ +++++++++++ +++ + +++ + +++ + +++++++ +++ + +++++ +++ + +
+   +   + +   +     + + +           + +           +     +   +   +   +   + +   + + + + +     +   + + +
+ +++++++ + + +++ +++ + +++++++++++ + + +++ +++++ + +++++ +++++ +++++ +++ + + + + + + +++++ +++ + + +
+     +   + +   + +   +           + + + +   +   + +       +     +   +   +   + + + +     +   +   + + +
+ +++ + +++ +++ + +++ +++++++ +++ +++ +++ +++ + +++++++++++ +++++ +++++ +++++ + + +++++++ +++ +++ + +
+ + + + +   + + +     + +   +   +   +   + +   +         + +   +       + +     + +     +   + +   + + +
+ + + + +++ + + +++++ + + + +++ +++ +++ + + +++++++ +++ + +++ +++++++ + + +++++ +++++ + +++ + + +++ +
+ + + + +   + +   +     + +   + +     + +   +   +   + +   + +   +     + + + +       +   +   + +     +
+ + + + + +++ +++ + +++++ +++ +++ +++ + +++++ + + +++ +++ + +++ + +++++ + + + +++++ +++++ + + +++++++
+ + + + +   +     + +   + +   +   +   +       + + +           + +   +   + +       +       + + +   + +
+ + + + +++ + +++++ + + + +++ + +++ +++++++++++ + +++++++++++++ + + + +++ +++++++++ +++++++ + + + + +
+   + +     +     + + + +   + +   +       +     + +   +         + + + + +         + +   +   +   +   +
+++ + +++++++++++ +++ + + + + + + +++++++++ +++++ + + + + +++++++++ + + +++++++++ + + + + + +++++++ +
+   + +   +           + + + + + +         +   +   + +   + + + +     + +         + + + +   + + +     +
+++++ + + + +++++++++++ +++ + +++++++++ + +++ + +++ +++++ + + + + +++ + +++ +++++ +++ +++++ + + +++++
+     + +   + +     + +     +   +     + +   + +   + +     + +   +     + +   +     +   +   + + +   + +
+ +++++ +++++ + +++ + +++++++++ + +++ +++++ + +++ + + +++++ +++++++ +++++ +++ +++++ +++ + + + +++ + +
+   +   +     +   + +       +     +       +       + + +   +       +       +   +     +   + +   +   + +
+ + + +++ +++ +++ + + +++ +++ +++++++++++ +++++++ + + + +++++++++ +++ +++++ +++++++ + + +++++ + +++ +
+ + +   + +   +   + +   + +   + +     +   +     + + +   +       +   + +     +   +   + +     + +   + +
+ + +++ +++ +++ +++ + + +++ +++ + +++ +++ + +++ +++ + +++ +++++ +++ +++ +++++ + + +++ +++++ + +++ + +
+ +   +     +   + + + +     +   + + +   +   +       + +   +   +   +     +     +   +       +     + + +
+ +++ +++++++ +++ + +++++++ +++ + + +++ +++++++++++++ + +++ +++ +++++++++++++ +++++ +++++++ +++++ + +
+   + +     + +   + +     +     + +   +   +         + + +     +     +         +   +   +   + +   + + +
+++ + + +++ + + + + + +++ +++++++ +++ +++ + +++++++ +++ +++++ +++++ + + +++++++ + +++++ + +++ + + + +
+   +     +     + +     +               +         +               +   +         +       +     +    s+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
LABERINTO RESUELTO: 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+e    +                     +       +   +           +           +             +     +               +
+#+++ +++++ +++++ +++++++++ + +++++ + + + +++ +++++++ + + +++++ +++++++ +++++++ +++ + +++++ +++++++ +
+###+ +   +   +   +     +   +     + + +   + +         + + +   +   +     +       +   + +     +     + +
+++#+ + + +++++ +++ +++ + +++++++++ + +++++ +++++++++++ +++ + +++ + +++ + +++++++ +++ + +++++ +++ + +
+###+   + +   +     + + +           + +           +     +   +   +   +   + +   + + + + +     +   + + +
+#+++++++ + + +++ +++ + +++++++++++ + + +++ +++++ + +++++ +++++ +++++ +++ + + + + + + +++++ +++ + + +
+#####+   + +   + +   +           + + + +   +   + +       +     +   +   +   + + + +     +   +   + + +
+ +++#+ +++ +++ + +++ +++++++ +++ +++ +++ +++ + +++++++++++ +++++ +++++ +++++ + + +++++++ +++ +++ + +
+ + +#+ +   + + +     + +   +   +   +   + +   +         + +   +       + +     + +     +   + +   + + +
+ + +#+ +++ + + +++++ + + + +++ +++ +++ + + +++++++ +++ + +++ +++++++ + + +++++ +++++ + +++ + + +++ +
+ + +#+ +   + +   +     + +   + +     + +   +   +   + +   + +   +     + + + +       +   +   + +     +
+ + +#+ + +++ +++ + +++++ +++ +++ +++ + +++++ + + +++ +++ + +++ + +++++ + + + +++++ +++++ + + +++++++
+ + +#+ +   +     + +   + +   +   +   +       + + +           + +   +   + +       +       + + +   + +
+ + +#+ +++ + +++++ + + + +++ + +++ +++++++++++ + +++++++++++++ + + + +++ +++++++++ +++++++ + + + + +
+   +#+     +     + + + +   + +   +       +     + +   +         + + + + +         + +   +   +   +   +
+++ +#+++++++++++ +++ + + + + + + +++++++++ +++++ + + + + +++++++++ + + +++++++++ + + + + + +++++++ +
+   +#+   +           + + + + + +         +   +   + +   + + + +     + +         + + + +   + + +     +
+++++#+ + + +++++++++++ +++ + +++++++++ + +++ + +++ +++++ + + + + +++ + +++ +++++ +++ +++++ + + +++++
+#####+ +   + +#####+ +     +   +     + +   + +   + +     + +   +     + +   +     +   +   + + +   + +
+#+++++ +++++ +#+++#+ +++++++++ + +++ +++++ + +++ + + +++++ +++++++ +++++ +++ +++++ +++ + + + +++ + +
+###+   +     +###+#+       +     +       +       + + +   +       +       +   +     +   + +   +   + +
+ +#+ +++ +++ +++#+#+ +++ +++ +++++++++++ +++++++ + + + +++++++++ +++ +++++ +++++++ + + +++++ + +++ +
+ +#+   + +   +###+#+   + +   + +#####+   +     + + +   +#######+   + +     +   +   + +     + +   + +
+ +#+++ +++ +++#+++#+ + +++ +++ +#+++#+++ + +++ +++ + +++#+++++#+++ +++ +++++ + + +++ +++++ + +++ + +
+ +###+     +###+ +#+ +     +   +#+ +###+   +       + +###+   +#  +     +     +   +       +     + + +
+ +++#+++++++#+++ +#+++++++ +++ +#+ +++#+++++++++++++ +#+++ +++#+++++++++++++ +++++ +++++++ +++++ + +
+   +#+#####+#+   +#+#####+     +#+   +###+#########+ +#+     +#####+###      +###+   +###+ +###+ + +
+++ +#+#+++#+#+ + +#+#+++#+++++++#+++ +++#+#+++++++#+++#+++++ +++++#+#+#+++++++#+#+++++#+#+++#+#+ + +
+   +###  +###  + +###  +#########      +###      +#####          +###+#########+#######+#####+####s+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

</pre>

#### Referencias

Asignatura fundamentos de la programación de la Universidad de Granada.

<div class="sharedaddy">
  <div class="sd-content">
    <ul>
      <li>
        <a class="hastip" rel="nofollow" href="http://twitter.com/home?status=Resolver laberintos en C+++http://elbauldelprogramador.com/resolver-laberintos-en-c/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Twitter" target="_blank"><span class="iconbox-title"><i class="icon-twitter icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="http://www.facebook.com/sharer.php?u=http://elbauldelprogramador.com/resolver-laberintos-en-c/&t=Resolver laberintos en C+++http://elbauldelprogramador.com/resolver-laberintos-en-c/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en Facebook" target="_blank"><span class="iconbox-title"><i class="icon-facebook icon-2x"></i></span></a>
      </li>
      <li>
        <a class="hastip" rel="nofollow" href="https://plus.google.com/share?url=Resolver laberintos en C+++http://elbauldelprogramador.com/resolver-laberintos-en-c/+V%C3%ADa+%40elbaulp" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" title="Compartir en G+" target="_blank"><span class="iconbox-title"><i class="icon-google-plus icon-2x"></i></span></a>
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
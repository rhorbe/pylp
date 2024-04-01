:- include(cartas).
:- include(escala).
:- include(gana_ronda).

% OBJETIVOS PRELIMINARES

% valor(carta(Numero, Palo), Valor)
% Dada una carta, indica la posición de la misma en la escala de valores.
% (Queda resuelto con los hechos que asignan valor a cada una de las cartas)

% resultado(Carta1, Carta2, Resultado) 
% Indica el resultado de enfrentar Carta1 y Carta2.
% Los resultados son gana, pierde o parda.

resultado(Carta1, Carta2, Resultado) :-
  valor(Carta1, Valor1),
  valor(Carta2, Valor2),
  (
    Valor1 > Valor2, Resultado = gana;
    Valor1 < Valor2, Resultado = pierde;
    Valor1 == Valor2, Resultado = parda
    ).

% OBJETIVOS INTERMEDIOS

% envido(Mano, Valor)
% Dada una mano indique su valor de envido. 
% Si se poseen dos o más cartas del mismo palo, se suman sus valores y luego se 
% suman 20.
% Con las siguientes excepciones:
%  - 10, 11, 12 valen 20 pero no se suman los otros 20.
%  – Si las tres cartas son del mismo palo, vamos a tomar la suma de mayor valor

envido(Mano, Valor) :-
 cartasValidas(Mano), 
 hayEnvido(Mano),
 seleccionarCartasEnvido(Mano, CartaEnvido1, CartaEnvido2),
 obtenerValorEnvido(CartaEnvido1, CartaEnvido2, Valor),
 !.


cartasValidas([Carta1, Carta2, Carta3]) :- 
    Carta1, Carta2, Carta3, 
    sonCartasDistintas(Carta1, Carta2, Carta3).


sonCartasDistintas(Carta1, Carta2, Carta3) :-
    Carta1 \= Carta2,
    Carta2 \= Carta3,
    Carta3 \= Carta1.


hayEnvido([Carta1, Carta2, Carta3]) :-
    sonMismoPalo(Carta1, Carta2);
    sonMismoPalo(Carta2, Carta3);
    sonMismoPalo(Carta3, Carta1).


sonMismoPalo(Carta1, Carta2, Carta3) :-
    sonMismoPalo(Carta1, Carta2),
    sonMismoPalo(Carta1, Carta3).


sonMismoPalo(carta(_, Palo1), carta(_, Palo2)) :-
    Palo1 == Palo2.


seleccionarCartasEnvido([Carta1, Carta2, Carta3], CartaEnvido1, CartaEnvido2) :-
    (
        sonMismoPalo(Carta1, Carta2, Carta3),
        obtenerMejoresCartasEnvidoDe3([Carta1, Carta2, Carta3], CartaEnvido1, CartaEnvido2)
    );
    (sonMismoPalo(Carta1, Carta2),  CartaEnvido1 = Carta1, CartaEnvido2 = Carta2);
    (sonMismoPalo(Carta2, Carta3),  CartaEnvido1 = Carta2, CartaEnvido2 = Carta3);
    (sonMismoPalo(Carta3, Carta1),  CartaEnvido1 = Carta3, CartaEnvido2 = Carta1).


obtenerMejoresCartasEnvidoDe3([Carta1, Carta2, Carta3], CartaEnvido1, CartaEnvido2) :-
    valorCartaEnvido(Carta1, ValorEnvidoCarta1),
    valorCartaEnvido(Carta2, ValorEnvidoCarta2),
    valorCartaEnvido(Carta3, ValorEnvidoCarta3),
    min_list([ValorEnvidoCarta1,ValorEnvidoCarta2,ValorEnvidoCarta3], ValorMinimo),
    (
        (ValorMinimo is ValorEnvidoCarta1, CartaEnvido1 = Carta2, CartaEnvido2 = Carta3);
        (ValorMinimo is ValorEnvidoCarta2, CartaEnvido1 = Carta1, CartaEnvido2 = Carta3);
        (ValorMinimo is ValorEnvidoCarta3, CartaEnvido1 = Carta1, CartaEnvido2 = Carta1) 
    ).


obtenerValorEnvido(Carta1, Carta2, Valor) :-
  valorCartaEnvido(Carta1, ValorEnvidoCarta1),
  valorCartaEnvido(Carta2, ValorEnvidoCarta2),
  Valor is 20 +  ValorEnvidoCarta1 + ValorEnvidoCarta2.


valorCartaEnvido(carta(Numero, _), ValorEnvido) :-
    7 >= Numero, 
    ValorEnvido = Numero.

valorCartaEnvido(carta(Numero, _), ValorEnvido) :-
    7 < Numero,
    ValorEnvido = 0.


% gana(Mano1, Mano2) 
% Recibe las dos listas de cartas, siendo las manos de los jugadores en el orden
% en que se juegan. 
% La regla indica si Mano1 le gana a Mano2.
gana(Mano1, Mano2) :- 
    resultadosParciales(Mano1, Mano2, ListaResultadosParciales),
    ganaRonda(ListaResultadosParciales).


resultadosParciales(Mano1, Mano2, ListaResultadosParciales):-
    parcialesAux(Mano1, Mano2, [], ListaResultadosParciales).


parcialesAux([], _, Aux, Aux).

parcialesAux([Carta1 | Resto1], [Carta2 | Resto2],Aux, ListaResultadosParciales) :-
    resultado(Carta1, Carta2, Resultado),
    append(Aux, [Resultado], ConcatenacionListas),    
    parcialesAux(Resto1, Resto2, ConcatenacionListas, ListaResultadosParciales).


% mejorJugado(Mano1, Mano2, Orden)
% Esta regla recibe las mismas listas que la regla gana, pero en último lugar 
% indica el nuevo orden en el que jugar Mano1 para para ganarle a Mano2. 
% Tengan en cuenta que puede haber más de un orden posible para ganarle.
mejorJugado(Mano1, Mano2, Orden) :- 
    posibleJugada(Mano1, Orden),
    gana(Orden, Mano2).


posibleJugada(Mano, [Carta1, Carta2, Carta3]) :-
    member(Carta1, Mano),
    member(Carta2, Mano),
    member(Carta3, Mano),
    sonCartasDistintas(Carta1, Carta2, Carta3).


% OBJETIVO PRINCIPAL
% aceptarEnvido(ManoPropia, CartasEnMesa)
aceptarEnvido(ManoPropia, CartasEnMesa):- 
    envido(ManoPropia, ValorEnvidoPropio),
    promedioPosiblesEnvidosAdversario(ManoPropia, CartasEnMesa, PromedioEnvidoAdversario),
    ValorEnvidoPropio > PromedioEnvidoAdversario.
 

promedioPosiblesEnvidosAdversario(ManoPropia, CartasEnMesa, Promedio) :-
    listaCartasConocidas(ManoPropia, CartasEnMesa, ListaCartasConocidas),
    findall(PosibleMano, posibleMano(ListaCartasConocidas, CartasEnMesa, PosibleMano), ListaPosiblesManos),
    promedioEnvidosListaManos(ListaPosiblesManos, Promedio).


promedioEnvidosListaManos(ListaPosiblesManos, Promedio):-
    promedioEnvidosListaManosAux(ListaPosiblesManos, 0, 0, Promedio).

promedioEnvidosListaManosAux([], Suma, Cantidad, Promedio):-
    Promedio is Suma / Cantidad.
promedioEnvidosListaManosAux([Mano|Resto], Suma, Cantidad, Promedio):-
    envido(Mano, Valor),
    Suma1 = Suma + Valor,
    Cantidad1 = Cantidad + 1,
    promedioEnvidosListaManosAux( Resto, Suma1, Cantidad1, Promedio).


listaValoresEnvido(ListaPosiblesManos, ListaValoresEnvido):-
    member(Mano, ListaPosiblesManos),
    findall(Valor, envido(Mano, Valor), ListaValoresEnvido).


promedioLista(Lista, Promedio) :- 
    length(Lista, Cantidad), sumlist(Lista, Suma), 
    Promedio is Suma / Cantidad.


posibleMano(_, ManoParcial, PosibleMano) :-
    manoCompleta(ManoParcial), 
    PosibleMano = ManoParcial.
posibleMano(CartasExcluidas, ManoParcial, PosibleMano) :-
    not(manoCompleta(ManoParcial)),
    posibleCarta(CartasExcluidas, NuevaCarta),
    posibleMano([NuevaCarta | CartasExcluidas], [NuevaCarta | ManoParcial], PosibleMano).


manoCompleta(Mano):- length(Mano, 3).


posibleCarta(Excluidas, carta(N, P)) :- 
    carta(N, P),   
    not(member(carta(N, P), Excluidas)).


listaCartasConocidas(ManoPropia, CartasEnMesa, ListaCartasConocidas):-
    append(ManoPropia, CartasEnMesa, ListaCartasConocidas).
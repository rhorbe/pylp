:- include(cartas).
posible(Excluidas, carta(X,Y)) :- 
    carta(X,Y),   
    not(member(carta(X,Y),Excluidas)).

promedioLista(Lista, Promedio) :- 
    length(Lista, Cantidad), sumlist(Lista, Suma), 
    Promedio is Suma / Cantidad.



% Predicado para calcular la suma de los valores de las cartas
suma_cartas(Suma) :-
    findall(Valor, carta(Valor, _), Cartas),
    sum_list(Cartas, Suma).

% Hecho para calcular la suma de una lista de números
sum_list([], 0).
sum_list([X|Xs], Sum) :-
    sum_list(Xs, Sum1),
    Sum is Sum1 + X.



manoCompleta(Mano):- length(Mano, 3).

/* 
borrarElementosLista([], _, []).

borrarElementosLista([X|Resto1], ListaAEliminar, Resultado) :-
    member(X, ListaAEliminar), !, 
    borrarElementosLista(Resto1, ListaAEliminar, Resultado).


borrarElementosLista([X|Resto1], ListaAEliminar, [X|Resultado]) :-
    \+ member(X, ListaAEliminar), 
    borrarElementosLista(Resto1, ListaAEliminar, Resultado).



posibleSecuencia(_, SecuenciaParcial, SecuenciaPosible) :-
    manoCompleta(SecuenciaParcial), 
    SecuenciaPosible = SecuenciaParcial.
posibleSecuencia(CartasPosibles, SecuenciaParcial, SecuenciaPosible) :-
    not(manoCompleta(SecuenciaParcial)),
    posibleCartaDeLista(CartasPosibles, NuevaCarta),
    posibleSecuencia([NuevaCarta | CartasPosibles], [NuevaCarta | SecuenciaParcial], SecuenciaPosible). */
    

/*
posibleManoAdversario(ManoPropia, CartasEnMesa, PosibleManoAdversario) :-
    listaCompletaCartas(ListaCompletaCartas),
    listaCartasConocidas(ManoPropia, CartasEnMesa, ListaCartasConocidas),
    restaListas(ListaCompletaCartas, ListaCartasConocidas, ListaCartasNoConocidas),
    completarMano(
        ListaCartasNoConocidas, 
        CartasEnMesa, %Adversario
        PosibleManoAdversario
        ).

listaCartasNoConocidas(ListaCompletaCartas, ListaCartasConocidas, ListaCartasNoConocidas).

completarMano(_, [Carta1 , Carta2, Carta3], PosibleMano):-
    PosibleMano = [Carta1 , Carta2, Carta3].

completarMano(ListaCartasNoConocidas, ManoParcial, PosibleMano):-
    agregarCartaNoJugada(LListaCartasNoConocidas, ManoParcial, PosibleMano),
    completarMano(ListaCartasNoConocidas, ManoParcial, PosibleMano).

agregarCartaNoJugada(ListaCartasNoConocidas, ListaCartasConocidas, ManoParcial):-
    cartaNoJugada(ListaCartasNoConocidas, PosibleCarta),
    append(ManoParcial,[PosibleCarta]).
    

cartaNoJugada(ListaCartasNoConocidas, PosibleCarta) :-    
    member(PosibleCarta, ListaCompletaCartas),
    \+ member(PosibleCarta, ListaCartasConocidas).




listaCompletaCartas(ListaCompletaCartas):-
    findall(carta(Numero, Palo), carta(Numero, Palo), ListaCompletaCartas).



% aceptarTruco(ManoPropia, [CartasPropiasJugadas, CartasDelOponenteJugadas])


% En base a las cartas jugadas saber si se 

% que deben deducir lógicamente si aceptar o no.
% ManoPropia contiene la mano propia y luego una lista con dos listas más, las 
% cartas propias y las cartas del oponente en el orden que fueron jugadas



% Caso base
restaListas([], _, []).

% Restar elementos de la lista Sustraendo de la lista Original, resultando en Diferencia
restaListas([X|ColaOriginal], Sustraendo, Diferencia ) :-
    member(X, Sustraendo),
    restaListas(ColaOriginal, Sustraendo, Diferencia).

% Si el elemento X no está en Sustraendo, lo incluimos en Diferencia
restaListas([X|ColaOriginal], Sustraendo, [X|Diferencia]) :-
    not(member(X, Sustraendo)),
    restaListas(ColaOriginal, Sustraendo, Diferencia).
*/

listaPosiblesSecuencias(CartasPosibles, CartasJugadas, ListaPosiblesSecuencias) :-
    findall(Secuencia, posibleSecuencia(CartasPosibles, CartasJugadas, Secuencia), ListaPosiblesSecuencias).

posibleSecuencia(_, CartasJugadas, Secuencia):-
    manoCompleta(CartasJugadas),
    Secuencia = CartasJugadas.

posibleSecuencia(CartasPosibles, CartasJugadas, Secuencia):-
    \+(manoCompleta(CartasJugadas)),
    member(NuevaCarta, CartasPosibles),
    \+(member(NuevaCarta, CartasJugadas)),
    append(CartasJugadas, [NuevaCarta], CartasJugadasConNuevaCarta),
    delete(CartasPosibles, NuevaCarta, CartasPosiblesSinNuevaCarta),
    posibleSecuencia(CartasPosiblesSinNuevaCarta, CartasJugadasConNuevaCarta, Secuencia).

% Predicado para comparar todos los elementos de la lista 1 contra todos los elementos de la lista 2
comparar_elementos(_, [], Triunfos, Derrotas, Triunfos, Derrotas).
comparar_elementos(X, [Y|Ys], TriunfosParciales, DerrotasParciales, Triunfos, Derrotas) :-
    X >= Y,
    TriunfosTemp is TriunfosParciales + 1,
    comparar_elementos(X, Ys, TriunfosTemp, DerrotasParciales, Triunfos, Derrotas).
comparar_elementos(X, [Y|Ys], TriunfosParciales, DerrotasParciales, Triunfos, Derrotas) :-
    X < Y,
    DerrotasTemp is DerrotasParciales + 1,
    comparar_elementos(X, Ys, TriunfosParciales, DerrotasTemp, Triunfos, Derrotas).

% Predicado para comparar todos los elementos de la lista 1 contra todos los elementos de la lista 2
comparar_listas([], _, Triunfos, Derrotas, Triunfos, Derrotas).
comparar_listas([X|Xs], Lista2, TriunfosParciales, DerrotasParciales, Triunfos, Derrotas) :-
    comparar_elementos(X, Lista2, 0, 0, TriunfosTemp, DerrotasTemp),
    comparar_listas(Xs, Lista2, TriunfosTemp, DerrotasTemp, Triunfos, Derrotas).

% Predicado para inicializar la comparación de las listas
iniciar_comparacion(Lista1, Lista2, Triunfos, Derrotas) :-
    comparar_listas(Lista1, Lista2, 0, 0, Triunfos, Derrotas).

% Ejemplo de uso:
% ?- iniciar_comparacion([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], Triunfos, Derrotas).
% Triunfos = 5,
% Derrotas = 95.

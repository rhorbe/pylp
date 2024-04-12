% Codificar las reglas:

% Pertenece/ member / está

pertenece(Elemento,Lista) :- 
    [Encabezado | Cola] = Lista, 
    (Elemento is Encabezado; pertenece(Elemento, Cola)). 

miembro(E, [E|_]).
miembro(E, [_|R]):- miembro(E, R).

esta(E,L):- member(E,L).

miembro1([X|_], X):-!.
miembro1([_|Xs], X):- miembro1(Xs,X).

miembro2([X|_], X).
miembro2([_|Xs], X):- miembro2(Xs,X).

miembro3([X|_], X).
miembro3([_|Xs], X):- miembro3(Xs,X).
%
% Longitud
longitud([], 0).
longitud([_|R], L) :- 
    longitud(R, LR), 
    L is LR + 1 .

longitud2(Lista, Longitud) :- 
    length(Lista, Longitud).

% Agregar un elemento a la cabeza
% agregarPrimero(Elemento, Lista, ElementoLista).

agregarPrimero(Elemento, Lista, ListaConcatenada) :- 
    ListaConcatenada = [Elemento|Lista].
% Agregar un elemento en una posición determinada


% Concatenar dos listas
concatenar([], Lista, Lista).

concatenar([_|[]], _, [Pepe]):- Pepe is 1,!.

concatenar([X|Lista1], Lista2, [X|ListaConcatenada]) :-
    concatenar(Lista1, Lista2, ListaConcatenada).

% concatenar2(Lista1,Lista2,ListaConcatenada) :- ListaConcatenada = [_|Lista1|Lista2].

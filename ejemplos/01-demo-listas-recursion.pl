% Proposiciones simples.
padre(juan, pedro).
padre(juan, santiago).
padre(luis, juan).

% Proposiciones que utilizan otras para poder determinar su valor de verdad
hijo(X, Y) :- padre(Y, X).

% Observar que el operador "," indica un `and` lógico
nieto(Nieto, Abuelo) :- hijo(Padre, Abuelo), hijo(Nieto, Padre).

% Ejemplos de recursión utilizando listas
longitud([], 0).
longitud([_ | Resto], Longitud) :- % El "_" significa ignorar dicha variable
    longitud(Resto, LongitudResto), Longitud is LongitudResto+1.

sumalista([], 0).
sumalista([Primero | Resto], Suma) :-
    sumalista(Resto, X), Suma is Primero + X.

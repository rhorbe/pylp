digitos([4,3,2,1]).
bla([X,Y,Z]):- digitos(DS), member(X, DS), !, member(Y, DS), member(Z, DS).

miembro(E, [E|_]).
miembro(E, [_|R]):- miembro(E, R).

qs([],[]).
qs([E|R], Ordenada):-
    mayores(E, R, Mys),
    menores(E, R, Mns),
    qs(Mys, OMys),
    qs(Mns, OMns),
    append(OMns, [E], T),
    append(T, OMys, Ordenada).

mayores(_, [], []).
mayores(E, [C|R], [C|Mys]):- C>E,!, mayores(E, R, Mys).
mayores(E, [_|R], Mys):- mayores(E,R, Mys).

menores(_, [], []).
menores(E, [C|R], [C|Mns]):- C =< E, !, menores(E, R, Mns).
menores(E, [_|R], Mns):- menores(E,R, Mns).



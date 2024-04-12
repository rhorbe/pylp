anteultimo([A,B|Resto],X):- anteultimoAux(Resto, A,B,X).
anteultimoAux([],A,_,A).
anteultimoAux([_],_,B,B):-!.
anteultimoAux([A,B| Resto],_,_,X) :- anteultimoAux(Resto, A, B, X).


penultimo([P,_],P):-!.
penultimo([_|Resto],R):- penultimo(Resto,R).

ultimo([E], E):-!.
ultimo([_|Resto], E):- ultimo(Resto, E).

/* 
element_at(Lista, Posicion, Elemento) :- 
    length(Lista, Largo), 
    Largo = Posicion,
    [Elemento| _ ] = Lista.
 */

miembro([E|_], E).
miembro([_|R], E):- miembro(R, E).

miembro2(L,E) :- \+ var(E), es_miembro(L,E), !.
miembro2(L,E) :- var(E), elementos_lista(L,E).

elementos_lista([E], E):-!.
elementos_lista([E|_], E).
elementos_lista([_|R], E):- elementos_lista(R, E).

es_miembro([E|_], E).
es_miembro([_|R], E):- es_miembro(R, E).

posiciones_impares([],[]):- !.
posiciones_impares([E],[E]):- !.
posiciones_impares([Impar, _| Resto], [Impar| Impares]):- posiciones_impares(Resto, Impares).

posiciones_pares([_],[]):- !.
posiciones_pares([],[]):- !.
posiciones_pares([_, Par| Resto], [Par| Pares]):- posiciones_pares(Resto, Pares).

sumatoria([], 0).
sumatoria([E|R], S):- sumatoria(R, SR), S is E + SR.

productoria([], 0).
productoria([E], E):-!.
productoria([E|R], P):- productoria(R, PR), P is E * PR.

invertir_lista([],[]):-!.
invertir_lista([E|R], ListaInvertida):- 
    invertir_lista(R, ListaAux), 
    append(ListaAux ,[E], ListaInvertida).

insertar_adelante(L, E, [E|L]).

concatenar_listas([],L2,L2).
concatenar_listas([E|R], L2, ListaResultante):-
    concatenar_listas(R, L2, ListaAux),
    ListaResultante = [E|ListaAux].


largo_lista([],0).
largo_lista([_|R],Largo):-
    largo_lista(R,LargoAux),
    Largo is LargoAux + 1.


%lista_valor_pos_x(L, Pos, Valor)

lista_valor_pos_x(L, Pos, E):- 
    largo_lista(L, Largo), 
    Largo == Pos, 
    [E|_] = L.



largo_lista2(L,Largo):- 
    largo_lista2(L,0,Largo).

largo_lista2([], Largo, Largo).
largo_lista2([_|R], Acumulador, Largo):-
    Acumulador2 is Acumulador + 1,
    largo_lista2(R, Acumulador2, Largo).

    
m([E], E).
m([E,F|Resto], Resultado):-
    E < F, !, m([E|Resto], Resultado).

m([_|Resto], Resultado):-
    m(Resto, Resultado).


menor([E], E):-!.
menor([E, F|R], Menor) :-
    E < F,!,
    menor([E|R], Menor).
menor([_, R], Menor) :-
    menor(R, Menor).

% Representarcada sentencia como una sola cláusula en Prolog:
% 1. Carlos estudia “Paradigmas y Lenguajes”

estudia(carlos, paradigmas).

% 2. La población de Argentina es de 45 millones de personas.

poblacion(argentina, 145).

% 3. Italia es un país europeo.

pais(italia).
continente(italia, europa).

es_pais_europeo(Pais) :-
    pais(Pais),
    continente(Pais, europa).

% 4. Julia es alta.

altura(julia, 1.7).

es_alta(X) :- altura(X, Y), Y > 1.65.

% 5. 2 es un número primo

primo(2).

% 6. Los porteños son de CABA

son_de(porteños, caba).

% 7. Alguien escribió “Hamlet”

escribio(alguien, hamlet).

% 8. Todos los humanos son mortales

humano(socrates).
humano(platon). 

mortal(X) :- humano(X).

% 9. Todas las personas respiran.
persona(rafael).
respira(X) :- persona(X).

% 10. Juan lleva paraguas si llueve.

llueve.
lleva_paraguas(juan) :- llueve.

% 11. Si te portás mal no vas a tener postre.

conducta(juan, buena).
tener_postre(X) :- conducta(X, buena).

% 12. Los bomberos tienen más de 1,8 m. de altura. 
:- discontiguous altura/2.
altura(bombero1, 1.85).
altura(bombero2, 1.9).
%altura(bombero3, 1.75).

altura_suficiente(Bombero) :-
    altura(Bombero, Altura),
    Altura > 1.8.


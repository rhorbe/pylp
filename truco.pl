:- include(cartas).
:- include(escala).

% OBJETIVOS PRELIMINARES 
% Dada una carta, indica la posición de la misma en la escala de valores.
% valor(carta(Numero, Palo), Valor) 

% Indica el resultado de enfrentar Carta1 y Carta2. Los resultados son gana, pierde o parda.

resultado(Carta1, Carta2, Resultado) :-
  valor(Carta1, Valor1), 
  valor(Carta2, Valor2), 
  (Valor1 > Valor2, Resultado = gana;
  Valor1 < Valor2, Resultado = pierde;
  Valor1 == Valor2, Resultado = parda).


% OBJETIVOS INTERMEDIOS 
% Dada una mano indique su valor de envido

envido(Mano, Valor) :-
 hayEnvido(Mano),
 mejoresCartasEnvido(Mano, MejorCarta1, MejorCarta2),
 valorEnvido(MejorCarta1, MejorCarta2, Valor).

hayEnvido([carta(_, Palo1), carta(_, Palo2), carta(_, Palo3)]) :- 
  Palo1 == Palo2;
  Palo2 == Palo3;
  Palo3 == Palo1.

mejoresCartasEnvido([carta(Numero1, Palo1), carta(Numero2, Palo2), carta(Numero3, Palo3)], MejorCarta1, MejorCarta2) :-
    MejorCarta1 = carta(Numero1, Palo1), 
    MejorCarta2 = carta(Numero2, Palo2).

% valorEnvido(Carta1, Carta3, Valor) :- Valor = 20.
valorEnvido(_, _, Valor) :-
    Valor = 20.

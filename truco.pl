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
 %validar cartas ingresadas
 hayEnvido(Mano),
 cartasEnvido(Mano, CartaEnvido1, CartaEnvido2),
 valorEnvido(CartaEnvido1, CartaEnvido2, Valor).

hayEnvido([carta(_, Palo1), carta(_, Palo2), carta(_, Palo3)]) :- 
  Palo1 == Palo2;
  Palo2 == Palo3;
  Palo3 == Palo1.

hayFlor([carta(_, Palo1), carta(_, Palo2), carta(_, Palo3)]) :- 
  Palo1 == Palo2,
  Palo1 == Palo3.

mismoPalo(carta(_, Palo1), carta(_, Palo2)) :- Palo1 == Palo2.

cartasEnvido([Carta1, Carta2, Carta3], CartaEnvido1, CartaEnvido2) :-
    hayFlor([Carta1, Carta2, Carta3]), 
    mismoPalo(Carta1, Carta2),  CartaEnvido1 = Carta1, CartaEnvido2 = Carta2, 
    mismoPalo(Carta2, Carta3),  CartaEnvido1 = Carta2, CartaEnvido2 = Carta3, 
    mismoPalo(Carta3, Carta1),  CartaEnvido1 = Carta3, CartaEnvido2 = Carta1, 

valorEnvido(carta(Numero1, _), carta(Numero2, _), Valor) :-
    (7 >= Numero1, 7 >= Numero2, Valor is Numero1 + Numero2 + 20); 
    (7 <  Numero1, 7 >= Numero2, Valor is Numero2 + 20);
    (7 >= Numero1, 7 <  Numero2, Valor is Numero1 + 20);
    Valor is 20.

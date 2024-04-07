/*
Dado un programa con hechos del tipo primario(Color) y formadoPor(Color, Color, Color), 
Construir las siguientes reglas:
• secundario(X):
    determina si X es secundario, es decir está formado por dos colores primarios.
• complementarios(X,Y):
    un color X es complementario de un color primario Y, cuando X se forma con dos colores 
    primarios entre los cuales Y no se encuentra. Debe utilizar la regla anterior.
*/

%Hechos
primario(rojo).
primario(azul).
primario(amarillo).

formadoPor(naranja, rojo, amarillo).
formadoPor(violeta, rojo, azul).
formadoPor(verde, azul, amarillo).

%Reglas
secundario(ColorFinal) :- 
    formadoPor(ColorFinal, Color1, Color2), 
    primario(Color1), 
    primario(Color2).

complementarios(Color1, Color2) :- 
    secundario(Color1),
    primario(Color2),
    \+ formadoPor(Color1, _, Color2),
    \+ formadoPor(Color1, Color2, _).

/*
Reglas
El jugador que gana 2 manos, gana la rondad

Casos especiales:
Si se empata la primera mano ganará aquel jugador o pareja que gane cualquiera de las dos manos restantes.
Si se gana una mano, se pierde otra y se empata la 3ª, gana el jugador o pareja que ha ganado la primera mano.
Si se empatan las 3 manos seguidas, ganará la ronda el jugador mano.
*/
ganaRonda([gana, gana, _]).
ganaRonda([gana, pierde, gana]).
ganaRonda([gana, pierde, parda]).
ganaRonda([gana, parda, gana]).
ganaRonda([gana, parda, parda]).
ganaRonda([pierde, gana, gana]).
ganaRonda([pierde, parda, gana]).
ganaRonda([parda, gana, _]).
ganaRonda([parda, parda, gana]).
ganaRonda([parda, parda, parda]).

/*
ganaRonda(ronda([gana, gana, _]), gana).
ganaRonda(ronda([gana, pierde, gana]), gana).
ganaRonda(ronda([gana, pierde, parda]), gana).
ganaRonda(ronda([gana, parda, gana]), gana).
ganaRonda(ronda([gana, parda, parda]), gana).
ganaRonda(ronda([pierde, gana, gana]), gana).
ganaRonda(ronda([pierde, parda, gana]), gana).
ganaRonda(ronda([parda, gana, _]), gana).
ganaRonda(ronda([parda, parda, gana]), gana).
ganaRonda(ronda([parda, parda, parda]), gana).

*/


% ganaRonda(ronda([gana,pierde,pierde]),pierde).
% ganaRonda(ronda([gana,parda,pierde]),pierde).
% ganaRonda(ronda([pierde,gana,pierde]),pierde).
% ganaRonda(ronda([pierde,gana,parda]),pierde).
% ganaRonda(ronda([pierde,pierde,_]),pierde).
% ganaRonda(ronda([pierde,parda,pierde]),pierde).
% ganaRonda(ronda([pierde,parda,parda]),pierde).
% ganaRonda(ronda([parda,parda,pierde]),pierde).

/*
Reglas
El jugador que gana 2 manos, gana la rondad

Casos especiales:
Si se empata la primera mano ganará aquel jugador o pareja que gane cualquiera de las dos manos restantes.
Si se gana una mano, se pierde otra y se empata la 3ª, gana el jugador o pareja que ha ganado la primera mano.
Si se empatan las 3 manos seguidas, ganará la ronda el jugador mano.

A continuación se detallan el resultado de cada jugada que terminan en el trinfo
en esa ronda.
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

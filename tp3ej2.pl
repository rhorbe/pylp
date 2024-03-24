/*
Dado un conjunto de hechos de la forma va_hasta(origen, destino), implementar el predicado
puedo_llegar(origen,destino) que indique si hay un camino que conecte origen y destino. Considerar que no hay bucles en los posibles caminos, y que los caminos tienen un sólo sentido (el que está estipulado en
los hechos de la BC).
*/
va_hasta(trelew,gaiman).
va_hasta(trelew,rawson).
va_hasta(gaiman,dolavon).
va_hasta(madryn,trelew).
va_hasta(camarones,trelew).

% ESTOS SON EJEMPLOS DE CONSULTAS A REALIZAR
% puedo_llegar(trelew,rawson).
% puedo_llegar(madryn,dolavon).
% puedo_llegar(trelew,comodoro).


puedo_llegar(Origen, Destino) :- va_hasta(Origen, Destino).
puedo_llegar(Origen, Destino) :- 
    va_hasta(Origen, Intermedio), 
    puedo_llegar(Intermedio, Destino).

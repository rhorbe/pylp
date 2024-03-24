% Hechos
padrede(martin, luis).
padrede(luis, jose).
padrede(luis, pedro).
espadre(martin).
espadre(luis).

% Reglas
hijode(Hijo, Padre) :- padrede(Padre, Hijo).

% Reglas AND 
abuelode(Abuelo, Hijo) :-  padrede(Abuelo, Padre ),padrede(Padre,Hijo). 
hermanode(Hijo1, Hijo2) :- espadre(Padre), padrede(Padre,Hijo1), padrede(Padre, Hijo2).

% Reglas OR
familiarde(Persona1, Persona2) :- 
    padrede(Persona1, Persona2); 
    hijode(Persona1, Persona2); 
    hermanode(Persona1, Persona2); 
    abuelode(Persona1,Persona2). 

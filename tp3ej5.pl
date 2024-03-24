% Codificar las reglas:
%
% Pertenece/ member / está

pertenece(Elemento,Lista) :- 
    [Encabezado | Cola] = Lista, 
    (Elemento is Encabezado; pertenece(Elemento, Cola)). 

% Longitud
longitud(Lista, Longitud) :-
    Lista is []
    [Encabezado | Cola] = Lista,
    
longitud([], 0).
longitud([_ | Resto], Longitud) :- % El "_" significa ignorar dicha variable
    longitud(Resto, LongitudResto), Longitud is LongitudResto+1.


% Agregar un elemento a la cabeza
% agregarPrimero(Elemento, Lista, ElementoLista).

% Agregar un elemento en una posición determinada


% Concatenar dos listas

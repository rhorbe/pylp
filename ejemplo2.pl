%
%
%
%

masgrande(elefante,caballo).
masgrande(caballo,perro).
masgrande(perro,raton).
masgrande(oso,perro,gato).


muchomasgrande(A,C) :- masgrande(A,B), masgrande(B,C).

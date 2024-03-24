male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).
female(alice).
female(betsy).
female(diana).

loves(romeo,juliet).
loves(juliet,romeo):- loves(romeo,juliet).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(bob, carl).
parent(bob, charlie).

related(X,Y) :- parent(X,Y); parent(X,Z), related(Z,Y).

get_grandparent  :-
    parent(X, carl),
    parent(X, charlie),
    format('~w ~s grandparent ~n', [X, "is the"]).

brother(bob, bill).

grand_parent(X,Y) :-
    parent(Z,X),
    parent(Y,Z).

blushes(X) :- human(X).
human(derek).

owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

vertical(line(point(X,Y), point(X,Y2))).
horizontal(line(point(X,Y), point(X2,Y))).

count_to_10(10) :- write(10), nl.

count_to_10(X) :- 
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).

count_down(Low, High) :-
    between(Low, High, Y),
    Z is High - Y,
    write(Z), nl.
